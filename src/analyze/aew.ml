open Eval
open Syntax
open Trace_syntax
open Trace_util
open Typed_ast

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
  | Return v -> 
    Log.log DEBUG (string_of_computation (Return v));
    create_trace_state TrEmpty (check_value_trace env v) []
  | Op (op, (v, x, c)) -> (* Handle operation calls *)
    Log.log DEBUG (string_of_computation (Op (op, (v, x, c))));
    let v_trace = check_value_trace env v in
    let trace_state = check_computation_trace (update_trace_env x (TrVar x) env) c in
    let new_trace_set = (!op_id, (v_trace, TrArrow (TrVar x, trace_state)))::trace_state.trace_set in
    let op_trace = TrOp (!op_id, op) in
    op_id := !op_id + 1;
    create_trace_state (TrSeq (op_trace, trace_state.trace))  trace_state.return_trace  new_trace_set
  | Do (x, c1, c2) ->(
    Log.log DEBUG (string_of_computation (Do (x, c1, c2)));
    match c1 with
      | Op (op, (v, y, c')) -> 
        check_computation_trace env (Op (op, (v, y, Do (x, c', c2))))
      | _ -> 
        let trace_state1 = check_computation_trace env c1 in
        let trace_state2 = check_computation_trace (update_trace_env x trace_state1.return_trace env) c2 in
        create_trace_state (TrSeq (trace_state1.trace, trace_state2.trace)) trace_state2.return_trace (trace_state1.trace_set @ trace_state2.trace_set)
  )
  | If (v, c1, c2) ->
    Log.log DEBUG (string_of_computation (If (v, c1, c2)));
    let trace_state1 = check_computation_trace env c1 in
    let trace_state2 = check_computation_trace env c2 in
    create_trace_state (TrParen (TrNonDet (trace_state1.trace, trace_state2.trace))) (TrNonDet (trace_state1.return_trace, trace_state2.return_trace)) (trace_state1.trace_set @ trace_state2.trace_set)
  | Apply (v1, v2) ->
    Log.log DEBUG (string_of_computation (Apply (v1, v2)));
    let trace_state1 = check_value_trace env v1 in
    let trace_state2 = check_value_trace env v2 in
    let arrow_lst = pick_arrow trace_state1 in
    if List.length arrow_lst = 1 then 
      let (t, s) = List.hd arrow_lst in
      let new_s = substitution_trace_state t trace_state2 s in
      create_trace_state new_s.trace new_s.return_trace new_s.trace_set
    else
      let (t1, s1) = List.hd arrow_lst in
      let new_s1 = substitution_trace_state t1 trace_state2 s1 in
      let (t2, s2) = List.hd (List.tl arrow_lst) in
      let new_s2 = substitution_trace_state t2 trace_state2 s2 in
      create_trace_state (TrNonDet (new_s1.trace, new_s2.trace)) (TrNonDet (new_s1.return_trace, new_s2.return_trace)) (new_s1.trace_set @ new_s2.trace_set)
  | Handle (v, c) -> 
    Log.log DEBUG (string_of_computation (Handle (v, c)));
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

let rec check_typed_computation_trace subst (env: trace_env) = function
  | TReturn (v, ty) -> 
    Log.log DEBUG (string_of_typed_computation (TReturn (v, ty)));
    create_trace_state TrEmpty (check_typed_value_trace subst env v) []
  | TOp ((id, (v, x, c)), ty) -> (* Handle operation calls *)
    Log.log DEBUG (string_of_typed_computation (TOp ((id, (v, x, c)), ty)));
    let v_trace = check_typed_value_trace subst env v in
    let trace_state = check_typed_computation_trace subst (update_trace_env x (TrVar x) env) c in
    let new_trace_set = (!op_id, (v_trace, TrArrow (TrVar x, trace_state)))::trace_state.trace_set in
    let op_trace = TrOp (!op_id, id) in
    op_id := !op_id + 1;
    create_trace_state (TrSeq (op_trace, trace_state.trace))  trace_state.return_trace  new_trace_set
  | TDo ((x, c1, c2), ty) ->(
    Log.log DEBUG (string_of_typed_computation (TDo ((x, c1, c2), ty)));
    match c1 with
      | TOp ((op, (v, y, c')), ty) -> 
        check_typed_computation_trace subst env (TOp ((op, (v, y, TDo ((x, c', c2), ty))), ty))
      | _ -> 
        let trace_state1 = check_typed_computation_trace subst env c1 in
        let trace_state2 = check_typed_computation_trace subst (update_trace_env x trace_state1.return_trace env) c2 in
        create_trace_state (TrSeq (trace_state1.trace, trace_state2.trace)) trace_state2.return_trace (trace_state1.trace_set @ trace_state2.trace_set)
  )
  | TIf ((v, c1, c2), ty) ->
    Log.log DEBUG (string_of_typed_computation (TIf ((v, c1, c2), ty)));
    let trace_state1 = check_typed_computation_trace subst env c1 in
    let trace_state2 = check_typed_computation_trace subst env c2 in
    create_trace_state (TrParen (TrNonDet (trace_state1.trace, trace_state2.trace))) (TrNonDet (trace_state1.return_trace, trace_state2.return_trace)) (trace_state1.trace_set @ trace_state2.trace_set)
  | TApply ((v1, v2), ty) ->
    Log.log DEBUG (string_of_typed_computation (TApply ((v1, v2), ty)));
    let trace_state1 = check_typed_value_trace subst env v1 in
    let arrow_lst = pick_arrow trace_state1 in
    let trace_state2 = check_typed_value_trace subst env v2 in
    if List.length arrow_lst = 1 then 
      let (t, s) = List.hd arrow_lst in
      (* trace_state2が関数型かどうか確認 *)
      (match trace_state2 with
        | TrArrow (x, s') -> 
          let new_s = substitution_trace_state t x s in
          let new_s = substitution_trace_state (t ^ "_t") s'.trace new_s in
          let new_s = substitution_trace_state (t ^ "_r") s'.return_trace new_s in
          create_trace_state new_s.trace new_s.return_trace (new_s.trace_set @ s'.trace_set)
        | _ -> 
          let new_s = substitution_trace_state t trace_state2 s in
          create_trace_state new_s.trace new_s.return_trace new_s.trace_set)
      else
        let (t1, s1) = List.hd arrow_lst in
        (* trace_state2が関数型かどうか確認 *)
        (match trace_state2 with
        | TrArrow (x, s') -> 
          let new_s = substitution_trace_state t1 x s1 in
          let new_s = substitution_trace_state (t1 ^ "_t") s'.trace new_s in
          let new_s = substitution_trace_state (t1 ^ "_r") s'.return_trace new_s in
          let (t2, s2) = List.hd (List.tl arrow_lst) in
          let new_s2 = substitution_trace_state t2 x s1 in
          let new_s2 = substitution_trace_state (t2 ^ "_t") s'.trace new_s2 in
          let new_s2 = substitution_trace_state (t2 ^ "_r") s'.return_trace new_s2 in
          create_trace_state (TrNonDet (new_s.trace, new_s2.trace)) (TrNonDet (new_s.return_trace, new_s2.return_trace)) (new_s.trace_set @ new_s2.trace_set @ s'.trace_set)
        | _ -> 
          let new_s = substitution_trace_state t1 trace_state2 s1 in
          let (t2, s2) = List.hd (List.tl arrow_lst) in
          let new_s2 = substitution_trace_state t2 trace_state2 s2 in
          create_trace_state (TrNonDet (new_s.trace, new_s2.trace)) (TrNonDet (new_s.return_trace, new_s2.return_trace)) (new_s.trace_set @ new_s2.trace_set))
  | THandle ((v, c), ty) ->
    Log.log DEBUG (string_of_typed_computation (THandle ((v, c), ty)));
    let trace_state = check_typed_computation_trace subst env c in
    let v_trace = check_typed_value_trace subst env v in
    (match v_trace with
      | TrHandler h -> 
        handler_in_trace_analysis trace_state.trace_set (Some h) (trace_state.trace, trace_state.return_trace)
      | _ -> handler_in_trace_analysis trace_state.trace_set None (trace_state.trace, trace_state.return_trace))
and check_typed_value_trace subst (env: trace_env) (value: typed_value) = match value with
  | TBool _ -> TrEmpty
  | TString _ -> TrEmpty
  | TFun((x, c), ty) -> 
    (* xが関数型かどうか確認する *)
    let ty = Type.find_primitive_type subst ty in
    let is_arg_fun = Type.check_fun_ty ty in
    if is_arg_fun then
      let arg = TrArrow (TrVar x, (create_trace_state (TrVar (x ^ "_t")) (TrVar (x ^ "_r")) [])) in
      TrArrow (arg, check_typed_computation_trace subst (update_trace_env x arg env) c)
    else
      TrArrow (TrVar x, check_typed_computation_trace subst (update_trace_env x (TrVar x) env) c)
  | THandler (h, _) -> check_typed_handler_trace subst h env
  | TVar (x, _) -> (try lookup_trace_env x env with 
        Trace_environment.Not_found -> failwith ("Variable not bound: " ^ x))
  | TConcat _ -> TrEmpty
and check_typed_handler_trace subst (h: typed_handler) env =
  let x = fst (fst h.return_clause) in
  let return_trace = check_typed_computation_trace subst (update_trace_env x (TrVar "return") env) (snd (fst h.return_clause)) in
  let op_clauses_trace = 
    List.map (fun ((op, (x, k, c)), _) -> 
      (op, check_typed_computation_trace subst (update_trace_env x (TrVar "op_a") (update_trace_env k (TrArrow (TrVar "op_b", (create_trace_state (TrVar "k_t") (TrVar "k_r") []))) env)) c)) h.op_clauses in
  let ops = List.map (fun ((id, _), _) -> id) h.op_clauses in
  TrHandler { return = return_trace; op = op_clauses_trace; ops = ops }


let test () = 
  Command.option ();
  let program = read () in 
  let Exp (signatures, comp) = program in
  let signatures = Type.signatures_of_string_list signatures in
  let set, typed_ast = typed_ast_computation signatures Type.initial_env comp in
  let subst = Type.unify set in
  (* let trace = check_trace comp in *)
  let trace = check_typed_computation_trace subst initial_trace_env typed_ast in
  let trace = 
    if !Command.trace_optimize then
      optimize_trace trace.trace
    else
      trace.trace in
  print_endline (string_of_trace_syntax trace)