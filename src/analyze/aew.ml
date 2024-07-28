open Eval
open Syntax
open Trace_syntax
open Trace_util

type trace_env = {
  environment : trace_syntax Trace_environment.t;
}

let initial_trace_env = {
  environment = Trace_environment.empty;
}

let update_trace_env x v env = {
  environment = Trace_environment.extend x v env.environment;
}

let lookup_trace_env x env = Trace_environment.lookup x env.environment

let op_id = ref 0

let rec check_computation_trace (env: trace_env) = function
  | Return v -> create_trace_state TrEmpty (check_value_trace env v) []
  | Op (op, (v, x, c)) -> (* Handle operation calls *)
    let v_trace = check_value_trace env v in
    let trace_state = check_computation_trace (update_trace_env x (TrVar x) env) c in
    let new_trace_set = (!op_id, (v_trace, TrArrow (TrVar x, trace_state)))::trace_state.trace_set in
    let op_trace = TrOp (!op_id, op) in
    op_id := !op_id + 1;
    create_trace_state (TrSeq (op_trace, trace_state.trace))  trace_state.return_trace  new_trace_set
  | Do (x, c1, c2) ->(
    match c1 with
      | Op (op, (v, y, c')) -> 
        check_computation_trace env (Op (op, (v, y, Do (x, c', c2))))
      | _ -> 
        let trace_state1 = check_computation_trace env c1 in
        let trace_state2 = check_computation_trace (update_trace_env x trace_state1.return_trace env) c2 in
        create_trace_state (TrSeq (trace_state1.trace, trace_state2.trace)) trace_state2.return_trace (trace_state1.trace_set @ trace_state2.trace_set)
  )
  | If (_, c1, c2) ->
    let trace_state1 = check_computation_trace env c1 in
    let trace_state2 = check_computation_trace env c2 in
    create_trace_state (TrNonDet (trace_state1.trace, trace_state2.trace)) (TrNonDet (trace_state1.return_trace, trace_state2.return_trace)) (trace_state1.trace_set @ trace_state2.trace_set)
  | Apply (v1, v2) ->
    let trace_state1 = check_value_trace env v1 in
    let (t, s) = pick_arrow trace_state1 in
    let trace_state2 = check_value_trace env v2 in
    let new_s = substitution_trace_state t trace_state2 s in
    create_trace_state new_s.trace new_s.return_trace new_s.trace_set
  | Handle (v, c) -> 
    let trace_state = check_computation_trace env c in
    let v_trace = check_value_trace env v in
    (match v_trace with
      | TrHandler h -> 
        handler_in_trace_analysis trace_state.trace_set (Some h) (trace_state.trace, trace_state.return_trace)
      | _ -> handler_in_trace_analysis trace_state.trace_set None (trace_state.trace, trace_state.return_trace))

and check_value_trace (env: trace_env) = function
  | Bool _ -> TrEmpty
  | String _ -> TrEmpty
  | Fun (x, c) -> TrArrow (TrVar x, check_computation_trace (update_trace_env x (TrVar x) env) c)
  | Handler h -> check_handler_trace h env
  | Var x -> (try lookup_trace_env x env with 
        Trace_environment.Not_found -> failwith ("Variable not bound: " ^ x))
  | Concat _ -> TrEmpty

and check_handler_trace (h: handler) env =
  let x = fst h.return_clause in
  let return_trace = check_computation_trace (update_trace_env x (TrVar "return") env) (snd h.return_clause) in
  let op_clauses_trace = 
    List.map (fun (op, (x, k, c)) -> 
      (op, check_computation_trace (update_trace_env x (TrVar "op_a") (update_trace_env k (TrArrow (TrVar "op_b", (create_trace_state (TrVar "k_t") (TrVar "k_r") []))) env)) c)) h.op_clauses in
  let ops = List.map fst h.op_clauses in
  TrHandler { return = return_trace; op = op_clauses_trace; ops = ops }
  



let check_trace c = check_computation_trace initial_trace_env c

let test () = 
  let comp = read () in 
  let trace = check_trace comp in
  print_endline (string_of_trace_syntax trace.trace)