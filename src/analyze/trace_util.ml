open Trace_syntax

let rec remove_first_id id = function
  | [] -> []
  | (id', trace) :: rest -> if id = id' then rest else (id', trace) :: (remove_first_id id rest)

let pick_arrow = function
  | TrArrow (x, s) -> (match x with
    | TrVar x -> (x, s)
    | _ -> failwith "Not a variable")
  | _ -> failwith "Not an arrow"

let in_ops op ops = List.mem op ops

let is_handled h op = in_ops op h.ops

let algorithm_sigma id op (h: handler_syntax) sigma = 
  (* ハンドラ内のop句を抜き出す *)
  let c_op = List.assoc op h.op in
  (* sigma内のtrace_setを取り出す *)
  let (v_trace, continuation_trace) = List.assoc id sigma in
  (* c_op内のエフェクト変数op_aをv_traceで置き換える *)
  let c_op' = substitution_trace_state "op_a" v_trace c_op in
  (* continuation_traceを分解 *)
  let (b, continuation_state) = pick_arrow continuation_trace in
  (* continuation_stateのbをop_bで置き換える *)
  let continuation_state' = substitution_trace_state b (TrVar "op_b") continuation_state in
  c_op', continuation_state'

let algorithm_rho trace handler = match handler with
  | None -> None
  | Some h -> if trace = TrBottom then None
              else Some (substitution_trace_state "return" trace h.return)

let rec handler_in_trace_analysis sigma handler = function
  | (TrBottom, t) -> 
    Log.log DEBUG "TrBottom";
    create_trace_state TrBottom t sigma
  | (TrEmpty, t) -> 
    Log.log DEBUG "TrEmpty";
    let rho = algorithm_rho t handler in
    (match rho with
    | None -> create_trace_state TrEmpty t sigma
    | Some rho' -> create_trace_state (TrSeq (TrEmpty, rho'.trace)) rho'.return_trace (sigma @ rho'.trace_set))
  | (TrVar x, t) -> 
    Log.log DEBUG ("TrVar " ^ x);
    create_trace_state (TrVar x) t sigma
  | (TrOp (id, op), t) -> (
    Log.log DEBUG ("TrOp " ^ (string_of_int id) ^ "(" ^ op ^ ")");
    match handler with
          | None -> create_trace_state (TrOp (id, op)) t sigma
          | Some h -> if is_handled h op then
              let c_op, continuation_state = algorithm_sigma id op h sigma in
              let continuation_state' = handler_in_trace_analysis sigma handler (continuation_state.trace, continuation_state.return_trace) in
              (* c_op内のk_t,k_rを置き換え *)
              let c_op' = substitution_trace_state "k_t" continuation_state'.trace (substitution_trace_state "k_r" continuation_state'.return_trace c_op) in
              create_trace_state (TrSeq (TrOpCheck op, c_op'.trace)) c_op'.return_trace (sigma @ c_op'.trace_set)
            else let rho = algorithm_rho t handler in
            (match rho with
            | None -> create_trace_state (TrOp (id, op)) t sigma
            | Some rho' -> create_trace_state (TrSeq (TrOp (id, op), rho'.trace)) rho'.return_trace (sigma @ rho'.trace_set)))
  | (TrOpCheck op, t) -> 
    Log.log DEBUG ("TrOpCheck " ^ op);
    let rho = algorithm_rho t handler in
    (match rho with
    | None -> create_trace_state (TrOpCheck op) t sigma
    | Some rho' -> create_trace_state (TrSeq ((TrOpCheck op), rho'.trace)) rho'.return_trace (sigma @ rho'.trace_set))
  | (TrSeq (t1, t2), t) -> (
    Log.log DEBUG ("TrSeq" ^ (string_of_trace_syntax t1) ^ ";" ^ (string_of_trace_syntax t2));
    match t1 with
    | TrOp (id, op) -> (match handler with
      | None -> create_trace_state (TrSeq (t1, t2)) t sigma
      | Some h -> if is_handled h op then
          let c_op, continuation_state = algorithm_sigma id op h sigma in
          (* idが一致するものの一番最初の要素を取り除く *)
          let sigma = remove_first_id id sigma in
          let continuation_state' = handler_in_trace_analysis sigma handler (continuation_state.trace, continuation_state.return_trace) in
          (* c_op内のk_t,k_rを置き換え *)
          let c_op' = substitution_trace_state "k_t" continuation_state'.trace (substitution_trace_state "k_r" continuation_state'.return_trace c_op) in
          create_trace_state (TrSeq (TrOpCheck op, c_op'.trace)) c_op'.return_trace (sigma @ c_op'.trace_set @ continuation_state'.trace_set)
        else 
          handler_in_trace_analysis sigma handler (t2, t))
    | _ -> 
      let trace_state1 = handler_in_trace_analysis sigma handler (t1, TrBottom) in
      let trace_state2 = handler_in_trace_analysis sigma handler (t2, t) in (* ここのsigmaは合ってるか怪しい *)
      create_trace_state (TrSeq (trace_state1.trace, trace_state2.trace)) trace_state2.return_trace (trace_state1.trace_set @ trace_state2.trace_set)
    )
  | (TrNonDet (t1, t2), t) -> (
    Log.log DEBUG "TrNonDet";
    match t with
    | TrNonDet (t1', t2') -> 
      let trace_state1 = handler_in_trace_analysis sigma handler (t1, t1') in
      let trace_state2 = handler_in_trace_analysis sigma handler (t2, t2') in
      create_trace_state (TrNonDet (trace_state1.trace, trace_state2.trace)) (TrNonDet (trace_state1.return_trace, trace_state2.return_trace)) (trace_state1.trace_set @ trace_state2.trace_set)
    | _ -> failwith "Not implemented")
  | (TrArrow (t, s), t') -> failwith "Not implemented"
  | (TrHandler h, t) -> failwith "Not implemented"
  | (TrParen t, t') -> 
    let trace_state = handler_in_trace_analysis sigma handler (t, t') in
    create_trace_state (TrParen trace_state.trace) trace_state.return_trace trace_state.trace_set
  
