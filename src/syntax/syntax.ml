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