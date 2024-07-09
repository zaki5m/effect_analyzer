(* effectの環境 *)
type t

exception Not_bound

val empty : t
val extend : (string * (Syntax.id * Syntax.id * Syntax.computation)) -> t -> t
val lookup_eff : string -> t -> Syntax.id * Syntax.id * Syntax.computation
(* val map : ('a -> 'b) -> 'a t -> 'b 
val fold_right : ('a -> 'b -> 'b) -> 'a t -> 'b -> 'b *)