open Syntax

type 'a t = (Syntax.id * 'a) list

exception Not_found

let empty = []
let extend x v row = (x, v)::row

let rec lookup x = function
  | [] -> raise Not_found
  | (y, v)::row -> if x = y then v else lookup x row

let rec map f = function
  [] -> []
  | (id, v)::rest -> (id, f v) :: map f rest

let rec fold_right f env a =
match env with
  [] -> a
| (_, v)::rest -> f v (fold_right f rest a)