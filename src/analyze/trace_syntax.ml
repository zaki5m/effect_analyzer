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

(* handlerは未実装 *)  

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