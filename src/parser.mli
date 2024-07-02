
(* The type of tokens. *)

type token = 
  | WITH
  | TRUE
  | THEN
  | SEMISEMI
  | SEMICOLON
  | RPAREN
  | RETURN
  | RBRACE
  | RARROW
  | LPAREN
  | LBRACE
  | LARROW
  | IN
  | IF
  | ID of (Syntax.id)
  | HANDLER
  | HANDLE
  | FUN
  | FALSE
  | EOF
  | ELSE
  | DOT
  | DO
  | COMMA

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.program)
