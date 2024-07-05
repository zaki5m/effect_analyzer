{
  open Parser

  let reservedWords = [
    ("true", TRUE);
    ("false", FALSE);
    ("fun", FUN);
    ("handler", HANDLER);
    ("return", RETURN);
    ("do", DO);
    ("if", IF);
    ("then", THEN);
    ("else", ELSE);
    ("with", WITH);
    ("handle", HANDLE);
    ("in", IN);
  ]
}

rule read = parse
  | [' ' '\t' '\n'] { read lexbuf }
  | "true"          { TRUE }
  | "false"         { FALSE }
  | "fun"           { FUN }
  | "handler"       { HANDLER }
  | "return"        { RETURN }
  | "do"            { DO }
  | "if"            { IF }
  | "then"          { THEN }
  | "else"          { ELSE }
  | "with"          { WITH }
  | "handle"        { HANDLE }
  | "in"            { IN }
  | "<-"            { LARROW }
  | "->"            { RARROW }
  | "("             { LPAREN }
  | ")"             { RPAREN }
  | "{"             { LBRACE }
  | "}"             { RBRACE }
  | ";"             { SEMICOLON }
  | ";;"            { SEMISEMI }
  | ","             { COMMA }
  | "."             { DOT }
  | "^"             { CARET } 
  | "\"" [^ '"']* "\"" as lxm { STRING_LITERAL (String.sub lxm 1 (String.length lxm - 2)) }
  | ['a'-'z'] ['a'-'z' 'A'-'Z' '0'-'9' '_' '\'']*
    { let id = Lexing.lexeme lexbuf in
      try
        List.assoc id reservedWords
      with
      _ -> Parser.ID id
     }
  | eof { exit 0 }
