open Syntax

let rec substitute_computation id value = function
  | Return v -> Return (substitute_value id value v)
  | Op (op, (v, x, c)) -> Op (op, (substitute_value id value v, x, substitute_computation id value c))
  | Do (x, c1, c2) -> Do (x, substitute_computation id value c1, substitute_computation id value c2)
  | If (v, c1, c2) -> If (substitute_value id value v, substitute_computation id value c1, substitute_computation id value c2)
  | Apply (v1, v2) -> Apply (substitute_value id value v1, substitute_value id value v2)
  | Handle (v, c) -> Handle (substitute_value id value v, substitute_computation id value c)
and substitute_handler id value h = 
    let (return_id, return_clause) = h.return_clause in
    let (ops, op_clauses) = List.split h.op_clauses in
    let return_clause = (return_id, substitute_computation id value return_clause) in
    let op_clauses = List.map2 (fun op (in_id, out_id, c) -> (op, (in_id, out_id, substitute_computation id value c))) ops op_clauses in
    { return_clause; op_clauses }
and substitute_value id value = function
  | Var id' when id = id' -> value
  | Var id' -> Var id'
  | Bool b -> Bool b
  | String s -> String s
  | Concat (v1, v2) -> Concat (substitute_value id value v1, substitute_value id value v2)
  | Fun (id', c) -> Fun (id', substitute_computation id value c)
  | Handler h -> Handler (substitute_handler id value h)
