
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WITH
    | TRUE
    | THEN
    | STRING_LITERAL of (
# 12 "src/parser.mly"
       (string)
# 18 "src/parser.ml"
  )
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
    | ID of (
# 11 "src/parser.mly"
       (Syntax.id)
# 34 "src/parser.ml"
  )
    | HANDLER
    | HANDLE
    | FUN
    | FALSE
    | EOF
    | ELSE
    | DOT
    | DO
    | COMMA
    | CARET
  
end

include MenhirBasics

# 1 "src/parser.mly"
  
  open Syntax

# 55 "src/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState01 : (('s, _menhir_box_main) _menhir_cell1_WITH, _menhir_box_main) _menhir_state
    (** State 01.
        Stack shape : WITH.
        Start symbol: main. *)

  | MenhirState04 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 04.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState10 : (('s, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 10.
        Stack shape : HANDLER ID.
        Start symbol: main. *)

  | MenhirState11 : (('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_state
    (** State 11.
        Stack shape : RETURN.
        Start symbol: main. *)

  | MenhirState14 : (('s, _menhir_box_main) _menhir_cell1_FUN _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 14.
        Stack shape : FUN ID.
        Start symbol: main. *)

  | MenhirState15 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 15.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState16 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 16.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState18 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_state
    (** State 18.
        Stack shape : IF VExpr.
        Start symbol: main. *)

  | MenhirState19 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_THEN, _menhir_box_main) _menhir_state
    (** State 19.
        Stack shape : IF VExpr THEN.
        Start symbol: main. *)

  | MenhirState21 : (('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_state
    (** State 21.
        Stack shape : ID.
        Start symbol: main. *)

  | MenhirState22 : ((('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_state
    (** State 22.
        Stack shape : ID VExpr.
        Start symbol: main. *)

  | MenhirState25 : (((('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_SEMICOLON _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 25.
        Stack shape : ID VExpr SEMICOLON ID.
        Start symbol: main. *)

  | MenhirState28 : (('s, _menhir_box_main) _menhir_cell1_DO _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 28.
        Stack shape : DO ID.
        Start symbol: main. *)

  | MenhirState29 : (('s, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_state
    (** State 29.
        Stack shape : VExpr.
        Start symbol: main. *)

  | MenhirState30 : ((('s, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_CARET, _menhir_box_main) _menhir_state
    (** State 30.
        Stack shape : VExpr CARET.
        Start symbol: main. *)

  | MenhirState31 : (((('s, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_CARET, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_state
    (** State 31.
        Stack shape : VExpr CARET VExpr.
        Start symbol: main. *)

  | MenhirState32 : ((('s, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_state
    (** State 32.
        Stack shape : VExpr VExpr.
        Start symbol: main. *)

  | MenhirState34 : ((('s, _menhir_box_main) _menhir_cell1_DO _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr, _menhir_box_main) _menhir_state
    (** State 34.
        Stack shape : DO ID Expr.
        Start symbol: main. *)

  | MenhirState39 : ((((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_THEN, _menhir_box_main) _menhir_cell1_Expr, _menhir_box_main) _menhir_state
    (** State 39.
        Stack shape : IF VExpr THEN Expr.
        Start symbol: main. *)

  | MenhirState41 : ((('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_state
    (** State 41.
        Stack shape : LPAREN VExpr.
        Start symbol: main. *)

  | MenhirState46 : ((('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_state
    (** State 46.
        Stack shape : RETURN VExpr.
        Start symbol: main. *)

  | MenhirState55 : ((('s, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr _menhir_cell0_ID _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 55.
        Stack shape : HANDLER ID Expr ID ID ID.
        Start symbol: main. *)

  | MenhirState65 : ((('s, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr _menhir_cell0_Op_clauses _menhir_cell0_ID _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 65.
        Stack shape : HANDLER ID Expr Op_clauses ID ID ID.
        Start symbol: main. *)

  | MenhirState68 : ((('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_state
    (** State 68.
        Stack shape : LPAREN VExpr.
        Start symbol: main. *)

  | MenhirState69 : ((('s, _menhir_box_main) _menhir_cell1_WITH, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_state
    (** State 69.
        Stack shape : WITH VExpr.
        Start symbol: main. *)

  | MenhirState70 : (((('s, _menhir_box_main) _menhir_cell1_WITH, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_HANDLE, _menhir_box_main) _menhir_state
    (** State 70.
        Stack shape : WITH VExpr HANDLE.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_Expr = 
  | MenhirCell1_Expr of 's * ('s, 'r) _menhir_state * (
# 17 "src/parser.mly"
      (Syntax.computation)
# 198 "src/parser.ml"
)

and 's _menhir_cell0_Op_clauses = 
  | MenhirCell0_Op_clauses of 's * (
# 19 "src/parser.mly"
      ((string * (Syntax.id * Syntax.id * Syntax.computation)) list)
# 205 "src/parser.ml"
)

and ('s, 'r) _menhir_cell1_VExpr = 
  | MenhirCell1_VExpr of 's * ('s, 'r) _menhir_state * (
# 18 "src/parser.mly"
      (Syntax.value)
# 212 "src/parser.ml"
)

and ('s, 'r) _menhir_cell1_CARET = 
  | MenhirCell1_CARET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DO = 
  | MenhirCell1_DO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FUN = 
  | MenhirCell1_FUN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_HANDLE = 
  | MenhirCell1_HANDLE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_HANDLER = 
  | MenhirCell1_HANDLER of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 11 "src/parser.mly"
       (Syntax.id)
# 234 "src/parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 11 "src/parser.mly"
       (Syntax.id)
# 241 "src/parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RETURN = 
  | MenhirCell1_RETURN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SEMICOLON = 
  | MenhirCell1_SEMICOLON of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_THEN = 
  | MenhirCell1_THEN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_WITH = 
  | MenhirCell1_WITH of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (
# 16 "src/parser.mly"
      (Syntax.program)
# 266 "src/parser.ml"
) [@@unboxed]

let _menhir_action_01 =
  fun v ->
    (
# 29 "src/parser.mly"
                   ( Return v )
# 274 "src/parser.ml"
     : (
# 17 "src/parser.mly"
      (Syntax.computation)
# 278 "src/parser.ml"
    ))

let _menhir_action_02 =
  fun e i1 i2 v ->
    (
# 30 "src/parser.mly"
                                                           ( Op(i1, (v, i2, e)) )
# 286 "src/parser.ml"
     : (
# 17 "src/parser.mly"
      (Syntax.computation)
# 290 "src/parser.ml"
    ))

let _menhir_action_03 =
  fun e1 e2 i ->
    (
# 31 "src/parser.mly"
                                      ( Do(i, e1, e2) )
# 298 "src/parser.ml"
     : (
# 17 "src/parser.mly"
      (Syntax.computation)
# 302 "src/parser.ml"
    ))

let _menhir_action_04 =
  fun e1 e2 v ->
    (
# 32 "src/parser.mly"
                                         ( If(v, e1, e2) )
# 310 "src/parser.ml"
     : (
# 17 "src/parser.mly"
      (Syntax.computation)
# 314 "src/parser.ml"
    ))

let _menhir_action_05 =
  fun v1 v2 ->
    (
# 33 "src/parser.mly"
                      ( Apply(v1, v2) )
# 322 "src/parser.ml"
     : (
# 17 "src/parser.mly"
      (Syntax.computation)
# 326 "src/parser.ml"
    ))

let _menhir_action_06 =
  fun e v ->
    (
# 34 "src/parser.mly"
                               ( Handle(v, e) )
# 334 "src/parser.ml"
     : (
# 17 "src/parser.mly"
      (Syntax.computation)
# 338 "src/parser.ml"
    ))

let _menhir_action_07 =
  fun v ->
    (
# 35 "src/parser.mly"
            ( Return v )
# 346 "src/parser.ml"
     : (
# 17 "src/parser.mly"
      (Syntax.computation)
# 350 "src/parser.ml"
    ))

let _menhir_action_08 =
  fun e ->
    (
# 36 "src/parser.mly"
                         ( e )
# 358 "src/parser.ml"
     : (
# 17 "src/parser.mly"
      (Syntax.computation)
# 362 "src/parser.ml"
    ))

let _menhir_action_09 =
  fun e i1 i2 i3 ->
    (
# 51 "src/parser.mly"
                                                            ( [(i1, (i2, i3, e))] )
# 370 "src/parser.ml"
     : (
# 19 "src/parser.mly"
      ((string * (Syntax.id * Syntax.id * Syntax.computation)) list)
# 374 "src/parser.ml"
    ))

let _menhir_action_10 =
  fun e i1 i2 i3 op ->
    (
# 52 "src/parser.mly"
                                                                                    (
      (i1, (i2, i3, e)) :: op
    )
# 384 "src/parser.ml"
     : (
# 19 "src/parser.mly"
      ((string * (Syntax.id * Syntax.id * Syntax.computation)) list)
# 388 "src/parser.ml"
    ))

let _menhir_action_11 =
  fun () ->
    (
# 39 "src/parser.mly"
         ( Bool true )
# 396 "src/parser.ml"
     : (
# 18 "src/parser.mly"
      (Syntax.value)
# 400 "src/parser.ml"
    ))

let _menhir_action_12 =
  fun () ->
    (
# 40 "src/parser.mly"
          ( Bool false )
# 408 "src/parser.ml"
     : (
# 18 "src/parser.mly"
      (Syntax.value)
# 412 "src/parser.ml"
    ))

let _menhir_action_13 =
  fun s ->
    (
# 41 "src/parser.mly"
                     ( String s )
# 420 "src/parser.ml"
     : (
# 18 "src/parser.mly"
      (Syntax.value)
# 424 "src/parser.ml"
    ))

let _menhir_action_14 =
  fun v1 v2 ->
    (
# 42 "src/parser.mly"
                            ( Concat(v1, v2) )
# 432 "src/parser.ml"
     : (
# 18 "src/parser.mly"
      (Syntax.value)
# 436 "src/parser.ml"
    ))

let _menhir_action_15 =
  fun i ->
    (
# 43 "src/parser.mly"
         ( Var i )
# 444 "src/parser.ml"
     : (
# 18 "src/parser.mly"
      (Syntax.value)
# 448 "src/parser.ml"
    ))

let _menhir_action_16 =
  fun e i ->
    (
# 44 "src/parser.mly"
                           ( Fun(i, e) )
# 456 "src/parser.ml"
     : (
# 18 "src/parser.mly"
      (Syntax.value)
# 460 "src/parser.ml"
    ))

let _menhir_action_17 =
  fun e i op ->
    (
# 45 "src/parser.mly"
                                                                        (
      Handler { return_clause = (i, e); op_clauses = op }
    )
# 470 "src/parser.ml"
     : (
# 18 "src/parser.mly"
      (Syntax.value)
# 474 "src/parser.ml"
    ))

let _menhir_action_18 =
  fun v ->
    (
# 48 "src/parser.mly"
                          ( v )
# 482 "src/parser.ml"
     : (
# 18 "src/parser.mly"
      (Syntax.value)
# 486 "src/parser.ml"
    ))

let _menhir_action_19 =
  fun e ->
    (
# 25 "src/parser.mly"
                  ( Exp e )
# 494 "src/parser.ml"
     : (
# 16 "src/parser.mly"
      (Syntax.program)
# 498 "src/parser.ml"
    ))

let _menhir_action_20 =
  fun e ->
    (
# 26 "src/parser.mly"
               ( Exp e )
# 506 "src/parser.ml"
     : (
# 16 "src/parser.mly"
      (Syntax.program)
# 510 "src/parser.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | CARET ->
        "CARET"
    | COMMA ->
        "COMMA"
    | DO ->
        "DO"
    | DOT ->
        "DOT"
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | FALSE ->
        "FALSE"
    | FUN ->
        "FUN"
    | HANDLE ->
        "HANDLE"
    | HANDLER ->
        "HANDLER"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | IN ->
        "IN"
    | LARROW ->
        "LARROW"
    | LBRACE ->
        "LBRACE"
    | LPAREN ->
        "LPAREN"
    | RARROW ->
        "RARROW"
    | RBRACE ->
        "RBRACE"
    | RETURN ->
        "RETURN"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | SEMISEMI ->
        "SEMISEMI"
    | STRING_LITERAL _ ->
        "STRING_LITERAL"
    | THEN ->
        "THEN"
    | TRUE ->
        "TRUE"
    | WITH ->
        "WITH"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_goto_main : type  ttv_stack. ttv_stack -> _ -> _menhir_box_main =
    fun _menhir_stack _v ->
      MenhirBox_main _v
  
  let rec _menhir_run_73 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMISEMI ->
          let e = _v in
          let _v = _menhir_action_19 e in
          _menhir_goto_main _menhir_stack _v
      | EOF ->
          let e = _v in
          let _v = _menhir_action_20 e in
          _menhir_goto_main _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WITH (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState01 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LITERAL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | HANDLER ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUN ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_11 () in
      _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_VExpr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState01 ->
          _menhir_run_69 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState04 ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState11 ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState15 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState41 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState29 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState30 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState70 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState65 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState55 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState10 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState14 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState39 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState19 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState25 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState34 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState21 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_69 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WITH as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | HANDLE ->
          let _menhir_stack = MenhirCell1_HANDLE (_menhir_stack, MenhirState69) in
          let _menhir_s = MenhirState70 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WITH ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LITERAL _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | HANDLER ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUN ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DO ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | CARET ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState69
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let s = _v in
      let _v = _menhir_action_13 s in
      _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState11 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LITERAL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | HANDLER ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUN ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState04 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LITERAL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | HANDLER ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUN ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let i = _v in
      let _v = _menhir_action_15 i in
      _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_HANDLER (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RETURN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v ->
                  let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | RARROW ->
                      let _menhir_s = MenhirState10 in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | WITH ->
                          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | TRUE ->
                          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | STRING_LITERAL _v ->
                          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                      | RETURN ->
                          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | LPAREN ->
                          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | IF ->
                          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | ID _v ->
                          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                      | HANDLER ->
                          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | FUN ->
                          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | FALSE ->
                          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | DO ->
                          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState15 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WITH ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LITERAL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | HANDLER ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUN ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DO ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState16 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LITERAL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | HANDLER ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUN ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FUN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RARROW ->
              let _menhir_s = MenhirState14 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | WITH ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TRUE ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING_LITERAL _v ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | RETURN ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IF ->
                  _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ID _v ->
                  _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | HANDLER ->
                  _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FUN ->
                  _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | DO ->
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState21 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LITERAL _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | HANDLER ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUN ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | CARET | COMMA | ELSE | EOF | FALSE | FUN | HANDLE | HANDLER | ID _ | IN | RBRACE | RPAREN | SEMICOLON | SEMISEMI | STRING_LITERAL _ | THEN | TRUE ->
          let i = _v in
          let _v = _menhir_action_15 i in
          _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_12 () in
      _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_26 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LARROW ->
              let _menhir_s = MenhirState28 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | WITH ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TRUE ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING_LITERAL _v ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | RETURN ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IF ->
                  _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ID _v ->
                  _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | HANDLER ->
                  _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FUN ->
                  _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | DO ->
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_VExpr as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CARET (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState30 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LITERAL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | HANDLER ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUN ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_68 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CARET ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState68
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_cell1_VExpr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_VExpr (_menhir_stack, _, v) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_18 v in
      _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_46 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_RETURN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | CARET ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | COMMA | ELSE | EOF | FALSE | FUN | HANDLE | HANDLER | ID _ | IN | LPAREN | RBRACE | RPAREN | SEMICOLON | SEMISEMI | STRING_LITERAL _ | THEN | TRUE ->
          let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
          let v = _v in
          let _v = _menhir_action_01 v in
          _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_Expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_73 _menhir_stack _v _tok
      | MenhirState70 ->
          _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState65 ->
          _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState55 ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState10 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState14 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState15 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState39 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState19 ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState25 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState34 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState28 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_71 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_WITH, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_HANDLE -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_HANDLE (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_VExpr (_menhir_stack, _, v) = _menhir_stack in
      let MenhirCell1_WITH (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_06 e v in
      _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_66 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr _menhir_cell0_Op_clauses _menhir_cell0_ID _menhir_cell0_ID _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_ID (_menhir_stack, i3) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, i2) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, i1) = _menhir_stack in
      let MenhirCell0_Op_clauses (_menhir_stack, op) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_10 e i1 i2 i3 op in
      _menhir_goto_Op_clauses _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_Op_clauses : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell0_Op_clauses (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | ID _v ->
                      let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | SEMICOLON ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | ID _v ->
                              let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              (match (_tok : MenhirBasics.token) with
                              | RPAREN ->
                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                  (match (_tok : MenhirBasics.token) with
                                  | RARROW ->
                                      let _menhir_s = MenhirState65 in
                                      let _tok = _menhir_lexer _menhir_lexbuf in
                                      (match (_tok : MenhirBasics.token) with
                                      | WITH ->
                                          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | TRUE ->
                                          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | STRING_LITERAL _v ->
                                          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                                      | RETURN ->
                                          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | LPAREN ->
                                          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | IF ->
                                          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | ID _v ->
                                          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                                      | HANDLER ->
                                          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | FUN ->
                                          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | FALSE ->
                                          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | DO ->
                                          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | _ ->
                                          _eRR ())
                                  | _ ->
                                      _eRR ())
                              | _ ->
                                  _eRR ())
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_Expr (_menhir_stack, _, e) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, i) = _menhir_stack in
          let MenhirCell1_HANDLER (_menhir_stack, _menhir_s) = _menhir_stack in
          let op = _v in
          let _v = _menhir_action_17 e i op in
          _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_56 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr _menhir_cell0_ID _menhir_cell0_ID _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_ID (_menhir_stack, i3) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, i2) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, i1) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_09 e i1 i2 i3 in
      _menhir_goto_Op_clauses _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_47 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | ID _v ->
                      let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | SEMICOLON ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | ID _v ->
                              let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              (match (_tok : MenhirBasics.token) with
                              | RPAREN ->
                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                  (match (_tok : MenhirBasics.token) with
                                  | RARROW ->
                                      let _menhir_s = MenhirState55 in
                                      let _tok = _menhir_lexer _menhir_lexbuf in
                                      (match (_tok : MenhirBasics.token) with
                                      | WITH ->
                                          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | TRUE ->
                                          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | STRING_LITERAL _v ->
                                          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                                      | RETURN ->
                                          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | LPAREN ->
                                          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | IF ->
                                          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | ID _v ->
                                          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                                      | HANDLER ->
                                          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | FUN ->
                                          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | FALSE ->
                                          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | DO ->
                                          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | _ ->
                                          _eRR ())
                                  | _ ->
                                      _eRR ())
                              | _ ->
                                  _eRR ())
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_45 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_FUN _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_ID (_menhir_stack, i) = _menhir_stack in
      let MenhirCell1_FUN (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_16 e i in
      _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_43 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_THEN, _menhir_box_main) _menhir_cell1_Expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_Expr (_menhir_stack, _, e1) = _menhir_stack in
      let MenhirCell1_THEN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_VExpr (_menhir_stack, _, v) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_04 e1 e2 v in
      _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_38 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_THEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_s = MenhirState39 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WITH ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LITERAL _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | HANDLER ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUN ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DO ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_36 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_SEMICOLON _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_ID (_menhir_stack, i2) = _menhir_stack in
          let MenhirCell1_SEMICOLON (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_VExpr (_menhir_stack, _, v) = _menhir_stack in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, i1) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_02 e i1 i2 v in
          _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_35 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_DO _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_Expr (_menhir_stack, _, e1) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, i) = _menhir_stack in
      let MenhirCell1_DO (_menhir_stack, _menhir_s) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_03 e1 e2 i in
      _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_33 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_DO _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _menhir_s = MenhirState34 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WITH ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LITERAL _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | HANDLER ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUN ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DO ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_41 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
      | STRING_LITERAL _v_0 ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState41
      | RPAREN ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
      | ID _v_1 ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState41
      | HANDLER ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
      | FUN ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
      | FALSE ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
      | CARET ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_VExpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | CARET ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | COMMA | ELSE | EOF | FALSE | FUN | HANDLE | HANDLER | ID _ | IN | LPAREN | RBRACE | RPAREN | SEMICOLON | SEMISEMI | STRING_LITERAL _ | THEN | TRUE ->
          let MenhirCell1_VExpr (_menhir_stack, _menhir_s, v1) = _menhir_stack in
          let v2 = _v in
          let _v = _menhir_action_05 v1 v2 in
          _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_CARET as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | CARET ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
      | COMMA | ELSE | EOF | FALSE | FUN | HANDLE | HANDLER | ID _ | IN | LPAREN | RBRACE | RPAREN | SEMICOLON | SEMISEMI | STRING_LITERAL _ | THEN | TRUE ->
          let MenhirCell1_CARET (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_VExpr (_menhir_stack, _menhir_s, v1) = _menhir_stack in
          let v2 = _v in
          let _v = _menhir_action_14 v1 v2 in
          _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | STRING_LITERAL _v_0 ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState29
      | LPAREN ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | ID _v_1 ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState29
      | HANDLER ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | FUN ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | FALSE ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | CARET ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | COMMA | ELSE | EOF | HANDLE | IN | RBRACE | RPAREN | SEMICOLON | SEMISEMI | THEN ->
          let v = _v in
          let _v = _menhir_action_07 v in
          _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_SEMICOLON (_menhir_stack, MenhirState22) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | DOT ->
                  let _menhir_s = MenhirState25 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | WITH ->
                      _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | TRUE ->
                      _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | STRING_LITERAL _v ->
                      _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | RETURN ->
                      _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LPAREN ->
                      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | IF ->
                      _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ID _v ->
                      _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | HANDLER ->
                      _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FUN ->
                      _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FALSE ->
                      _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | DO ->
                      _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | CARET ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_stack = MenhirCell1_THEN (_menhir_stack, MenhirState18) in
          let _menhir_s = MenhirState19 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WITH ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING_LITERAL _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | HANDLER ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUN ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DO ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | CARET ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WITH ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING_LITERAL _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | HANDLER ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUN ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DO ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
