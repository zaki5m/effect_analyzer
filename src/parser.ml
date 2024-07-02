
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | ID of (
# 11 "parser.mly"
       (Syntax.id)
# 29 "parser.ml"
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
  
end

include MenhirBasics

# 1 "parser.mly"
  
  open Syntax

# 49 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState01 : (('s, _menhir_box_main) _menhir_cell1_WITH, _menhir_box_main) _menhir_state
    (** State 01.
        Stack shape : WITH.
        Start symbol: main. *)

  | MenhirState08 : (('s, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 08.
        Stack shape : HANDLER ID.
        Start symbol: main. *)

  | MenhirState09 : (('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_state
    (** State 09.
        Stack shape : RETURN.
        Start symbol: main. *)

  | MenhirState12 : (('s, _menhir_box_main) _menhir_cell1_FUN _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 12.
        Stack shape : FUN ID.
        Start symbol: main. *)

  | MenhirState13 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 13.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState16 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_state
    (** State 16.
        Stack shape : IF VExpr.
        Start symbol: main. *)

  | MenhirState18 : (('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_state
    (** State 18.
        Stack shape : ID.
        Start symbol: main. *)

  | MenhirState22 : ((('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_cell1_VExpr _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 22.
        Stack shape : ID VExpr ID.
        Start symbol: main. *)

  | MenhirState25 : (('s, _menhir_box_main) _menhir_cell1_DO _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 25.
        Stack shape : DO ID.
        Start symbol: main. *)

  | MenhirState26 : (('s, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_state
    (** State 26.
        Stack shape : VExpr.
        Start symbol: main. *)

  | MenhirState29 : ((('s, _menhir_box_main) _menhir_cell1_DO _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr, _menhir_box_main) _menhir_state
    (** State 29.
        Stack shape : DO ID Expr.
        Start symbol: main. *)

  | MenhirState34 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_Expr, _menhir_box_main) _menhir_state
    (** State 34.
        Stack shape : IF VExpr Expr.
        Start symbol: main. *)

  | MenhirState46 : ((('s, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr _menhir_cell0_ID _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 46.
        Stack shape : HANDLER ID Expr ID ID ID.
        Start symbol: main. *)

  | MenhirState56 : ((('s, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr _menhir_cell0_Op_clauses _menhir_cell0_ID _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 56.
        Stack shape : HANDLER ID Expr Op_clauses ID ID ID.
        Start symbol: main. *)

  | MenhirState60 : ((('s, _menhir_box_main) _menhir_cell1_WITH, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_state
    (** State 60.
        Stack shape : WITH VExpr.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_Expr = 
  | MenhirCell1_Expr of 's * ('s, 'r) _menhir_state * (
# 16 "parser.mly"
      (Syntax.computation)
# 137 "parser.ml"
)

and 's _menhir_cell0_Op_clauses = 
  | MenhirCell0_Op_clauses of 's * (
# 18 "parser.mly"
      ((string * (Syntax.id * Syntax.id * Syntax.computation)) list)
# 144 "parser.ml"
)

and ('s, 'r) _menhir_cell1_VExpr = 
  | MenhirCell1_VExpr of 's * ('s, 'r) _menhir_state * (
# 17 "parser.mly"
      (Syntax.value)
# 151 "parser.ml"
)

and ('s, 'r) _menhir_cell1_DO = 
  | MenhirCell1_DO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FUN = 
  | MenhirCell1_FUN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_HANDLER = 
  | MenhirCell1_HANDLER of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 11 "parser.mly"
       (Syntax.id)
# 167 "parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 11 "parser.mly"
       (Syntax.id)
# 174 "parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RETURN = 
  | MenhirCell1_RETURN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_WITH = 
  | MenhirCell1_WITH of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (
# 15 "parser.mly"
      (Syntax.program)
# 190 "parser.ml"
) [@@unboxed]

let _menhir_action_01 =
  fun v ->
    (
# 27 "parser.mly"
                   ( Return v )
# 198 "parser.ml"
     : (
# 16 "parser.mly"
      (Syntax.computation)
# 202 "parser.ml"
    ))

let _menhir_action_02 =
  fun e i1 i2 v ->
    (
# 28 "parser.mly"
                                                           ( Op(i1, (v, i2, e)) )
# 210 "parser.ml"
     : (
# 16 "parser.mly"
      (Syntax.computation)
# 214 "parser.ml"
    ))

let _menhir_action_03 =
  fun e1 e2 i ->
    (
# 29 "parser.mly"
                                      ( Do(i, e1, e2) )
# 222 "parser.ml"
     : (
# 16 "parser.mly"
      (Syntax.computation)
# 226 "parser.ml"
    ))

let _menhir_action_04 =
  fun e1 e2 v ->
    (
# 30 "parser.mly"
                                         ( If(v, e1, e2) )
# 234 "parser.ml"
     : (
# 16 "parser.mly"
      (Syntax.computation)
# 238 "parser.ml"
    ))

let _menhir_action_05 =
  fun v1 v2 ->
    (
# 31 "parser.mly"
                      ( Apply(v1, v2) )
# 246 "parser.ml"
     : (
# 16 "parser.mly"
      (Syntax.computation)
# 250 "parser.ml"
    ))

let _menhir_action_06 =
  fun e v ->
    (
# 32 "parser.mly"
                               ( Handle(v, e) )
# 258 "parser.ml"
     : (
# 16 "parser.mly"
      (Syntax.computation)
# 262 "parser.ml"
    ))

let _menhir_action_07 =
  fun v ->
    (
# 33 "parser.mly"
            ( Return v )
# 270 "parser.ml"
     : (
# 16 "parser.mly"
      (Syntax.computation)
# 274 "parser.ml"
    ))

let _menhir_action_08 =
  fun e i1 i2 i3 ->
    (
# 45 "parser.mly"
                                                            ( [(i1, (i2, i3, e))] )
# 282 "parser.ml"
     : (
# 18 "parser.mly"
      ((string * (Syntax.id * Syntax.id * Syntax.computation)) list)
# 286 "parser.ml"
    ))

let _menhir_action_09 =
  fun e i1 i2 i3 op ->
    (
# 46 "parser.mly"
                                                                                    (
      (i1, (i2, i3, e)) :: op
    )
# 296 "parser.ml"
     : (
# 18 "parser.mly"
      ((string * (Syntax.id * Syntax.id * Syntax.computation)) list)
# 300 "parser.ml"
    ))

let _menhir_action_10 =
  fun () ->
    (
# 36 "parser.mly"
         ( Bool true )
# 308 "parser.ml"
     : (
# 17 "parser.mly"
      (Syntax.value)
# 312 "parser.ml"
    ))

let _menhir_action_11 =
  fun () ->
    (
# 37 "parser.mly"
          ( Bool false )
# 320 "parser.ml"
     : (
# 17 "parser.mly"
      (Syntax.value)
# 324 "parser.ml"
    ))

let _menhir_action_12 =
  fun i ->
    (
# 38 "parser.mly"
         ( Var i )
# 332 "parser.ml"
     : (
# 17 "parser.mly"
      (Syntax.value)
# 336 "parser.ml"
    ))

let _menhir_action_13 =
  fun e i ->
    (
# 39 "parser.mly"
                           ( Fun(i, e) )
# 344 "parser.ml"
     : (
# 17 "parser.mly"
      (Syntax.value)
# 348 "parser.ml"
    ))

let _menhir_action_14 =
  fun e i op ->
    (
# 40 "parser.mly"
                                                                        (
      Handler { return_clause = (i, e); op_clauses = op }
    )
# 358 "parser.ml"
     : (
# 17 "parser.mly"
      (Syntax.value)
# 362 "parser.ml"
    ))

let _menhir_action_15 =
  fun e ->
    (
# 24 "parser.mly"
                  ( Exp e )
# 370 "parser.ml"
     : (
# 15 "parser.mly"
      (Syntax.program)
# 374 "parser.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
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
  
  let rec _menhir_run_63 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMISEMI ->
          let e = _v in
          let _v = _menhir_action_15 e in
          MenhirBox_main _v
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
      | ID _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | HANDLER ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_10 () in
      _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_VExpr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState01 ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState26 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState60 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState56 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState08 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState12 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState34 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState29 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState25 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState18 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_59 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WITH as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | HANDLE ->
          let _menhir_s = MenhirState60 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WITH ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RETURN ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | HANDLER ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUN ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DO ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState09 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | HANDLER ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let i = _v in
      let _v = _menhir_action_12 i in
      _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
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
                      let _menhir_s = MenhirState08 in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | WITH ->
                          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | TRUE ->
                          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | RETURN ->
                          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | IF ->
                          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | ID _v ->
                          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                      | HANDLER ->
                          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | FUN ->
                          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | FALSE ->
                          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | DO ->
                          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState13 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | HANDLER ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FUN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RARROW ->
              let _menhir_s = MenhirState12 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | WITH ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TRUE ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | RETURN ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IF ->
                  _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ID _v ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | HANDLER ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FUN ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | DO ->
                  _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState18 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | HANDLER ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUN ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | COMMA | ELSE | FALSE | FUN | HANDLE | HANDLER | ID _ | IN | RBRACE | RPAREN | SEMICOLON | SEMISEMI | THEN | TRUE ->
          let i = _v in
          let _v = _menhir_action_12 i in
          _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_11 () in
      _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_23 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LARROW ->
              let _menhir_s = MenhirState25 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | WITH ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TRUE ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | RETURN ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IF ->
                  _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ID _v ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | HANDLER ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FUN ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | DO ->
                  _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_37 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
      let v = _v in
      let _v = _menhir_action_01 v in
      _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_Expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_63 _menhir_stack _v _tok
      | MenhirState60 ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState56 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState46 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState08 ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState12 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState34 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState16 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState29 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState25 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_61 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WITH, _menhir_box_main) _menhir_cell1_VExpr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_VExpr (_menhir_stack, _, v) = _menhir_stack in
      let MenhirCell1_WITH (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_06 e v in
      _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_57 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr _menhir_cell0_Op_clauses _menhir_cell0_ID _menhir_cell0_ID _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_ID (_menhir_stack, i3) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, i2) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, i1) = _menhir_stack in
      let MenhirCell0_Op_clauses (_menhir_stack, op) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_09 e i1 i2 i3 op in
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
                                      let _menhir_s = MenhirState56 in
                                      let _tok = _menhir_lexer _menhir_lexbuf in
                                      (match (_tok : MenhirBasics.token) with
                                      | WITH ->
                                          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | TRUE ->
                                          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | RETURN ->
                                          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | IF ->
                                          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | ID _v ->
                                          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                                      | HANDLER ->
                                          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | FUN ->
                                          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | FALSE ->
                                          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | DO ->
                                          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
          let _v = _menhir_action_14 e i op in
          _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_47 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr _menhir_cell0_ID _menhir_cell0_ID _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_ID (_menhir_stack, i3) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, i2) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, i1) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_08 e i1 i2 i3 in
      _menhir_goto_Op_clauses _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_38 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_HANDLER _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
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
                                      let _menhir_s = MenhirState46 in
                                      let _tok = _menhir_lexer _menhir_lexbuf in
                                      (match (_tok : MenhirBasics.token) with
                                      | WITH ->
                                          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | TRUE ->
                                          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | RETURN ->
                                          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | IF ->
                                          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | ID _v ->
                                          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                                      | HANDLER ->
                                          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | FUN ->
                                          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | FALSE ->
                                          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                                      | DO ->
                                          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
  
  and _menhir_run_36 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_FUN _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_ID (_menhir_stack, i) = _menhir_stack in
      let MenhirCell1_FUN (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_13 e i in
      _menhir_goto_VExpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_35 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_VExpr, _menhir_box_main) _menhir_cell1_Expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_Expr (_menhir_stack, _, e1) = _menhir_stack in
      let MenhirCell1_VExpr (_menhir_stack, _, v) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_04 e1 e2 v in
      _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_33 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_VExpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_s = MenhirState34 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WITH ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RETURN ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | HANDLER ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUN ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DO ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_cell1_VExpr _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_ID (_menhir_stack, i2) = _menhir_stack in
          let MenhirCell1_VExpr (_menhir_stack, _, v) = _menhir_stack in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, i1) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_02 e i1 i2 v in
          _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_DO _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_Expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_Expr (_menhir_stack, _, e1) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, i) = _menhir_stack in
      let MenhirCell1_DO (_menhir_stack, _menhir_s) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_03 e1 e2 i in
      _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_28 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_DO _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _menhir_s = MenhirState29 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WITH ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RETURN ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | HANDLER ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUN ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DO ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_27 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VExpr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_VExpr (_menhir_stack, _menhir_s, v1) = _menhir_stack in
      let v2 = _v in
      let _v = _menhir_action_05 v1 v2 in
      _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_26 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState26
      | HANDLER ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | FUN ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | FALSE ->
          let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | COMMA | ELSE | HANDLE | IN | RBRACE | RPAREN | SEMICOLON | SEMISEMI | THEN ->
          let v = _v in
          let _v = _menhir_action_07 v in
          _menhir_goto_Expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | DOT ->
                  let _menhir_s = MenhirState22 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | WITH ->
                      _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | TRUE ->
                      _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RETURN ->
                      _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | IF ->
                      _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ID _v ->
                      _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | HANDLER ->
                      _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FUN ->
                      _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FALSE ->
                      _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | DO ->
                      _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_VExpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_s = MenhirState16 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WITH ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RETURN ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | HANDLER ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUN ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DO ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
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
      | RETURN ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | HANDLER ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DO ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
