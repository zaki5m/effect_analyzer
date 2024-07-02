%{
  open Syntax
%}

%token LPAREN RPAREN LBRACE RBRACE SEMICOLON COMMA DOT
%token LARROW RARROW
%token TRUE FALSE 
%token FUN HANDLER RETURN DO WITH HANDLE IN
%token IF THEN ELSE
%token SEMISEMI
%token <Syntax.id> ID
%token EOF

%start main
%type <Syntax.program> main
%type <Syntax.computation> Expr
%type <Syntax.value> VExpr
%type <(string * (Syntax.id * Syntax.id * Syntax.computation)) list> Op_clauses


%%

main:
  e=Expr SEMISEMI { Exp e }

Expr :
    RETURN v=VExpr { Return v }
  | i1=ID LPAREN v=VExpr SEMICOLON i2=ID DOT e=Expr RPAREN { Op(i1, (v, i2, e)) }
  | DO i=ID LARROW e1=Expr IN e2=Expr { Do(i, e1, e2) }
  | IF v=VExpr THEN e1=Expr ELSE e2=Expr { If(v, e1, e2) }
  | v1=VExpr v2=VExpr { Apply(v1, v2) }
  | WITH v=VExpr HANDLE e=Expr { Handle(v, e) }
  | v=VExpr { Return v }

VExpr :
  | TRUE { Bool true }
  | FALSE { Bool false }
  | i=ID { Var i }
  | FUN i=ID RARROW e=Expr { Fun(i, e) }
  | HANDLER LBRACE RETURN i=ID RARROW e=Expr COMMA op=Op_clauses RBRACE {
      Handler { return_clause = (i, e); op_clauses = op }
    }

Op_clauses:
  | i1=ID LPAREN i2=ID SEMICOLON i3=ID RPAREN RARROW e=Expr { [(i1, (i2, i3, e))] }
  | op=Op_clauses SEMICOLON i1=ID LPAREN i2=ID SEMICOLON i3=ID RPAREN RARROW e=Expr {
      (i1, (i2, i3, e)) :: op
    }
