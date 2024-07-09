open Syntax

type t = (string * (id * id * computation)) list

exception Not_bound

let empty = []
let extend op_cluser (env: t) = op_cluser::env

let lookup_eff eff (env: t) =
  try
    List.assoc eff env
  with Not_found -> raise Not_bound

(* let rec map f = function
    [] -> []
  | (id, v)::rest -> (id, f v) :: map f rest

let rec fold_right f env a =
  match env with
    [] -> a
  | (_, v)::rest -> f v (fold_right f rest a) *)