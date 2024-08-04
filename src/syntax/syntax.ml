type id = string

type value =
  | Var of id
  | Bool of bool
  | String of string
  | Concat of value * value
  | Fun of id * computation
  | Handler of handler

and handler = {
  return_clause : id * computation;
  op_clauses : (string * (id * id * computation)) list;
}

and computation =
  | Return of value
  | Op of string * (value * id * computation)
  | Do of id * computation * computation
  | If of value * computation * computation
  | Apply of value * value
  | Handle of value * computation

type program = 
  Exp of ((string * ( string * string)) list * computation)

let string_of_val = function
  | Bool b -> string_of_bool b
  | String s -> s
  | Fun _ -> "<fun>"
  | Handler _ -> "<handler>"
  | Var x -> "<var>" ^ x
  | Concat _ -> "<concat>"

let rec string_of_computation = function
  | Return v -> "Return " ^ string_of_val v
  | Op (op, (v, x, c)) -> "Op (" ^ op ^ ", " ^ string_of_val v ^ ", " ^ x ^ ". " ^ string_of_computation c ^ ")"
  | Do (x, c1, c2) -> "Do (" ^ x ^ ". " ^ string_of_computation c1 ^ ", " ^ string_of_computation c2 ^ ")"
  | If (v, c1, c2) -> "If (" ^ string_of_val v ^ ", " ^ string_of_computation c1 ^ ", " ^ string_of_computation c2 ^ ")"
  | Apply (v1, v2) -> "Apply (" ^ string_of_val v1 ^ ", " ^ string_of_val v2 ^ ")"
  | Handle (v, c) -> "Handle (" ^ string_of_val v ^ ", " ^ string_of_computation c ^ ")"

let  print_val v = print_string (string_of_val v)

let print_computation c = print_string (string_of_computation c)