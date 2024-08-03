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
    ("effect", EFFECT);
  ]

  let nest = ref 0
}

rule read = parse
  | [' ' '\t' '\n'] { read lexbuf }
  | "(*"            { incr nest; comment lexbuf }
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
  | "effect"        { EFFECT }
  | "<-"            { LARROW }
  | "->"            { RARROW }
  | "("             { LPAREN }
  | ")"             { RPAREN }
  | "{"             { LBRACE }
  | "}"             { RBRACE }
  | ":"             { COLON }
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
  | eof { EOF }
and comment = parse
  | "*)"            { if !nest > 1 then (decr nest; comment lexbuf)  (* ネストされたコメントの終わり *)
                      else read lexbuf }  (* コメントの全体が終了 *)
  | "(*"            { incr nest; comment lexbuf }  (* ネストされたコメントの開始 *)
  | eof             { failwith "コメントが閉じられていません" }
  | _               { comment lexbuf }  (* コメント内の文字を読み飛ばす *)