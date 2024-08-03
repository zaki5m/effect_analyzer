%{
  open Syntax
%}

%token LPAREN RPAREN LBRACE RBRACE SEMICOLON COMMA DOT
%token LARROW RARROW
%token TRUE FALSE 
%token FUN HANDLER RETURN DO WITH HANDLE IN
%token IF THEN ELSE
%token SEMISEMI CARET
%token <Syntax.id> ID
%token <string>STRING_LITERAL
%token EFFECT COLON
%token EOF

%start main
%type <Syntax.program> main
%type <Syntax.computation> Expr
%type <Syntax.value> VExpr
%type <(string * (Syntax.id * Syntax.id * Syntax.computation)) list> Op_clauses


%%

main:
  effects=Effect_list e=Expr SEMISEMI { Exp (effects, e) }
  | effects=Effect_list e=Expr EOF { Exp (effects, e) }

Effect_list:
  | EFFECT i1=ID COLON i2=ID RARROW i3=ID { [(i1, (i2, i3))] }
  | effects=Effect_list SEMICOLON EFFECT i1=ID COLON i2=ID RARROW i3=ID { (i1, (i2, i3)) :: effects }

Expr :
    RETURN v=VExpr { Return v }
  | i1=ID LPAREN v=VExpr SEMICOLON i2=ID DOT e=Expr RPAREN { Op(i1, (v, i2, e)) }
  | DO i=ID LARROW e1=Expr IN e2=Expr { Do(i, e1, e2) }
  | IF v=VExpr THEN e1=Expr ELSE e2=Expr { If(v, e1, e2) }
  | v1=VExpr v2=VExpr { Apply(v1, v2) }
  | WITH v=VExpr HANDLE e=Expr { Handle(v, e) }
  | v=VExpr { Return v }
  | LPAREN e=Expr RPAREN { e }

VExpr :
  | TRUE { Bool true }
  | FALSE { Bool false }
  | s=STRING_LITERAL { String s }
  | v1=VExpr CARET v2=VExpr { Concat(v1, v2) }
  | i=ID { Var i }
  | FUN i=ID RARROW e=Expr { Fun(i, e) }
  | HANDLER LBRACE RETURN i=ID RARROW e=Expr COMMA op=Op_clauses RBRACE {
      Handler { return_clause = (i, e); op_clauses = op }
    }
  | LPAREN v=VExpr RPAREN { v }

Op_clauses:
  | i1=ID LPAREN i2=ID SEMICOLON i3=ID RPAREN RARROW e=Expr { [(i1, (i2, i3, e))] }
  | op=Op_clauses SEMICOLON i1=ID LPAREN i2=ID SEMICOLON i3=ID RPAREN RARROW e=Expr {
      (i1, (i2, i3, e)) :: op
    }
