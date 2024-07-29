type trace_syntax = 
  | TrBottom
  | TrEmpty
  | TrVar of string
  | TrOp of int * string 
  | TrOpCheck of string
  | TrSeq of trace_syntax * trace_syntax
  | TrNonDet of trace_syntax * trace_syntax
  | TrArrow of trace_syntax * trace_state
  | TrHandler of handler_syntax
  | TrParen of trace_syntax
and trace_state = {
    return_trace: trace_syntax;
    trace: trace_syntax;
    trace_set: ((int * (trace_syntax * trace_syntax)) list);
  }
and handler_syntax = {
    return: trace_state;
    op: (string * trace_state) list;
    ops : string list;
  } 

let string_of_trace_syntax trace = 
  let rec string_of_trace_syntax' = function
    | TrBottom -> "⊥"
    | TrEmpty -> "ε"
    | TrVar x -> x
    | TrOp (id, op) -> "Op" ^ (string_of_int id) ^ "(" ^ op ^ ")"
    | TrOpCheck op -> "OpCheck(" ^ op ^ ")"
    | TrSeq (t1, t2) -> (string_of_trace_syntax' t1) ^ ";" ^ (string_of_trace_syntax' t2)
    | TrNonDet (t1, t2) -> (string_of_trace_syntax' t1) ^ " | " ^ (string_of_trace_syntax' t2)
    | TrArrow (t, s) -> (string_of_trace_syntax' t) ^ " -> " ^ (string_of_trace_state s)
    | TrHandler h -> "Handler"
    | TrParen t -> "(" ^ (string_of_trace_syntax' t) ^ ")"
  and string_of_trace_state s =
    (string_of_trace_syntax' s.return_trace) ^ ";\n" ^ (string_of_trace_syntax' s.trace)
  in
  string_of_trace_syntax' trace

let rec substitution_trace_syntax x v = function
  | TrBottom -> TrBottom
  | TrEmpty -> TrEmpty
  | TrVar y -> if x = y then v else TrVar y
  | TrOp (id, op) -> TrOp (id, op)
  | TrOpCheck op -> TrOpCheck op
  | TrSeq (t1, t2) -> TrSeq (substitution_trace_syntax x v t1, substitution_trace_syntax x v t2)
  | TrNonDet (t1, t2) -> TrNonDet (substitution_trace_syntax x v t1, substitution_trace_syntax x v t2)
  | TrArrow (t, s) -> (match t with
    | TrVar y -> if x = y then TrArrow (t, s) else TrArrow (TrVar y, substitution_trace_state x v s)
    | _ -> TrArrow (substitution_trace_syntax x v t, substitution_trace_state x v s))
  | TrHandler h -> TrHandler h
  | TrParen t -> TrParen (substitution_trace_syntax x v t)
and substitution_trace_state x v s = {
    return_trace = substitution_trace_syntax x v s.return_trace;
    trace = substitution_trace_syntax x v s.trace;
    trace_set = List.map (fun (id, (t1, t2)) -> (id, (substitution_trace_syntax x v t1, substitution_trace_syntax x v t2))) s.trace_set;
  }

(* trace_stateの構築 *)
let create_trace_state trace return trace_set = {
  return_trace = return;
  trace = trace;
  trace_set = trace_set;
}

(* traceの簡略化(εの読み飛ばし) *)
let optimize_trace trace = 
  let rec optimize_trace' = function
    | TrSeq (TrEmpty, TrEmpty) -> TrEmpty
    | TrSeq (TrEmpty, t) -> optimize_trace' t
    | TrSeq (t, TrEmpty) -> optimize_trace' t
    | TrSeq (t1, t2) -> (
      let t1' = optimize_trace' t1 in
      let t2' = optimize_trace' t2 in
      match t1', t2' with
      | TrEmpty, t -> t
      | t, TrEmpty -> t
      | _ -> TrSeq (t1', t2'))
    | TrNonDet (t1, t2) -> TrNonDet (optimize_trace' t1, optimize_trace' t2)
    | TrArrow (t, s) -> TrArrow (optimize_trace' t, optimize_trace_state s)
    | TrParen t -> TrParen (optimize_trace' t)
    | t -> t
  and optimize_trace_state s = {
    return_trace = optimize_trace' s.return_trace;
    trace = optimize_trace' s.trace;
    trace_set = List.map (fun (id, (t1, t2)) -> (id, (optimize_trace' t1, optimize_trace' t2))) s.trace_set;
  }
  in
  optimize_trace' trace