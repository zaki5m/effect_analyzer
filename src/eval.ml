open Syntax
open Subst

type exval =
  BoolV of bool
 | FunV of id * computation
  | HandlerV of handler
and dnval = exval

exception Error of string

let err s = raise (Error s)

let string_of_val = function
  | Bool b -> string_of_bool b
  | String s -> s
  | Fun _ -> "<fun>"
  | Handler _ -> "<handler>"
  | Var x -> "<var>" ^ x
  | Concat _ -> "<concat>"

let  print_val v = print_string (string_of_val v)

type state = {
  environment: value Environment.t;
  runner: Runner.t;
}

let initial_state = {
  environment = Environment.empty;
  runner = Runner.empty;
}

let update x v state = {
  state with environment = Environment.extend x v state.environment;
}

let lookup x state = Environment.lookup x state.environment

let add_runner op_clousers state = {
  state with runner = Runner.extend op_clousers state.runner;
}

let reset_runner state = {
  state with runner = Runner.empty;
}

let find_op_clause op state = Runner.lookup_eff op state.runner




let rec eval_computation (state: state) = function
  | Return v -> Return (eval_value state v)
  | Op (op, (v, x, c)) -> (* Handle operation calls *)
    Op (op, ((eval_value state v), x, c))
  | Do (x, c1, c2) ->
      let c = eval_computation state c1 in
      (match c with
      | Return v -> 
        let comp = substitute_computation x v c2 in
        eval_computation (update x (eval_value state v) state) comp
      | _ -> failwith "Expected return in do")
  | If (v, c1, c2) -> (match eval_value state v with
      | Bool true -> eval_computation state c1
      | Bool false -> eval_computation state c2
      | _ -> failwith "Expected boolean in if condition")
  | Apply (v1, v2) -> (match eval_value state v1 with
      | Fun (x, c) ->
          let v = eval_value state v2 in
          let comp = substitute_computation x v c in
          eval_computation (update x v state) comp
      | _ -> failwith "Expected function in application")
  | Handle (v, c) -> (match eval_value state v with
      | Handler h -> eval_handle h state c
      | _ -> failwith "Expected handler in handle expression")

and eval_value state = function
  | Var x -> (try lookup x state with
        Environment.Not_bound -> failwith ("Variable not bound: " ^ x))
  | Bool b -> Bool b
  | String s -> String s
  | Concat (s1, s2) -> 
      (match eval_value state s1, eval_value state s2 with
      | String s1, String s2 -> String (s1 ^ s2)
      | _ -> failwith "Expected string in concatenation")
  | Fun (x, c) -> Fun (x, c)
  | Handler h -> Handler h

and eval_handle h state c =
  let state' = ref (reset_runner state) in 
  List.iter (fun op_c ->
    state' := add_runner op_c !state'
  ) h.op_clauses;
  match eval_computation !state' c with
    | Return v -> 
      let comp = substitute_computation (fst h.return_clause) v (snd h.return_clause) in
      eval_computation state comp
    | Op (op, (v, x, c)) ->
        (try
          let v_eval = eval_value !state' v in
          let (y, k, c') = find_op_clause op !state' in
          let state'' = update y v_eval state in
          eval_computation (update k (Fun (x, Handle (Handler h, c))) state'') c'
          with Not_found -> Op(op, ((eval_value !state' v), x, Handle (Handler h, c))))
    | _ -> failwith "Unhandled case in handle"

let rec eval env comp = 
  let evaled_comp = eval_computation env comp in
  match evaled_comp with
  | Return v -> print_val v
  | _ -> failwith "Expected return"

let _ =
  (* コマンドライン引数があればファイルのコードを読み込む *)
  let lexbuf = 
    if Array.length Sys.argv > 1 then
      let file = open_in Sys.argv.(1) in
      Lexing.from_channel file
    else
      (Printf.printf "Ready\n"; flush stdout;
      Lexing.from_channel stdin)
  in
  try
    let program = Parser.main Lexer.read lexbuf in
    let Exp comp = program in
    eval initial_state comp
  with
  | Parser.Error ->
    Printf.fprintf stderr "At offset %d: syntax error.\n%!" (Lexing.lexeme_start lexbuf)