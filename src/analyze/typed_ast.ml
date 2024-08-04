open Syntax
open Type

type typed_value =
  | TVar of id * ty
  | TBool of bool * ty
  | TString of string * ty
  | TConcat of (typed_value * typed_value) * ty
  | TFun of (id * typed_computation) * ty
  | THandler of typed_handler * ty
and typed_handler = {
  return_clause : ((id * typed_computation) * ty);
  op_clauses : ((string * (id * id * typed_computation)) * ty) list;
}
and typed_computation =
  | TReturn of typed_value * ty
  | TOp of (string * (typed_value * id * typed_computation)) * ty
  | TDo of (id * typed_computation * typed_computation) * ty
  | TIf of (typed_value * typed_computation * typed_computation) * ty
  | TApply of (typed_value * typed_value) * ty
  | THandle of (typed_value * typed_computation) * ty


let rec string_of_typed_computation = function
  | TReturn (v, ty) -> "Return " ^ (string_of_typed_value v) ^ " : " ^ string_of_ty ty
  | TOp ((op, (v, x, c)), ty) -> "Op (" ^ op ^ ", " ^ (string_of_typed_value v) ^ ", " ^ x ^ ". " ^ (string_of_typed_computation c) ^ ")" ^ " : " ^ string_of_ty ty
  | TDo ((x, c1, c2), ty) -> "Do (" ^ x ^ ". " ^ (string_of_typed_computation c1) ^ ", " ^ (string_of_typed_computation c2) ^ ")" ^ " : " ^ string_of_ty ty
  | TIf ((v, c1, c2), ty) -> "If (" ^ (string_of_typed_value v) ^ ", " ^ (string_of_typed_computation c1) ^ ", " ^ (string_of_typed_computation c2) ^ ")" ^ " : " ^ string_of_ty ty
  | TApply ((v1, v2), ty) -> "Apply (" ^ (string_of_typed_value v1) ^ ", " ^ (string_of_typed_value v2) ^ ")" ^ " : " ^ string_of_ty ty
  | THandle ((v, c), ty) -> "Handle (" ^ (string_of_typed_value v) ^ ", " ^ (string_of_typed_computation c) ^ ")" ^ " : " ^ string_of_ty ty
and string_of_typed_value = function
  | TVar (x, ty) -> "<var>" ^ x ^ " : " ^ string_of_ty ty
  | TBool (b, ty) -> string_of_bool b ^ " : " ^ string_of_ty ty
  | TString (s, ty) -> s ^ " : " ^ string_of_ty ty
  | TConcat ((v1, v2), ty) -> "<concat>" ^ " : " ^ string_of_ty ty
  | TFun ((x, c), ty) -> "<fun>" ^ " : " ^ string_of_ty ty
  | THandler (_, ty) -> "<handler>" ^ " : " ^ string_of_ty ty


let extract_type_of_value = function
  | TVar (_, ty) -> ty
  | TBool (_, ty) -> ty
  | TString (_, ty) -> ty
  | TConcat (_, ty) -> ty
  | TFun (_, ty) -> ty
  | THandler (_, ty) -> ty

let extract_type_of_computation = function
  | TReturn (_, ty) -> ty
  | TOp (_, ty) -> ty
  | TDo (_, ty) -> ty
  | TIf (_, ty) -> ty
  | TApply (_, ty) -> ty
  | THandle (_, ty) -> ty

(* astをtyped_astに変換 *)
let rec typed_ast_val signatures ty_env = function
  | Bool b -> ([], TBool (b, TyBool)) 
  | String s -> ([], TString (s, TyString))
  | Var x -> ([], TVar (x, lookup_env x ty_env))
  | Fun (x, c) -> 
    let ty_x = TyVar (fresh_tyvar ()) in
    let ty_env' = update_env x ty_x ty_env in
    let set , new_c = typed_ast_computation signatures ty_env' c in
    let ty_c = extract_type_of_computation new_c in
    (set, TFun ((x, new_c), TyArrow (ty_x, (ty_c, []))))
  | Handler h -> typed_ast_handler signatures ty_env h
  | Concat (v1, v2) -> 
    let set1, new_v1 = typed_ast_val signatures ty_env v1 in
    let set2, new_v2 = typed_ast_val signatures ty_env v2 in
    let set = set1 @ set2 in
    let ty_v1 = extract_type_of_value new_v1 in
    let ty_v2 = extract_type_of_value new_v2 in
    ((ty_v1, TyString)::(ty_v2, TyString)::set, TConcat ((new_v1, new_v2), TyString))
and typed_ast_computation signatures ty_env = function
  | Return v -> 
    let set, ty_v = typed_ast_val signatures ty_env v in
    (set, TReturn (ty_v, extract_type_of_value ty_v))
  | Op (id, (v, x, c)) ->
    let input, output = List.assoc id signatures in
    let set1, new_v = typed_ast_val signatures ty_env v in
    let set2, new_c = typed_ast_computation signatures (update_env x output ty_env) c in
    let ty_v = extract_type_of_value new_v in
    let ty_c = extract_type_of_computation new_c in
    let set = set1 @ set2 in
    ((ty_v, input)::set, TOp ((id, (new_v, x, new_c)), ty_c))
  | Do (x, c1, c2) ->
    let set1, new_c1 = typed_ast_computation signatures ty_env c1 in
    let ty_c1 = extract_type_of_computation new_c1 in
    let set2, new_c2 = typed_ast_computation signatures (update_env x ty_c1 ty_env) c2 in
    let ty_c2 = extract_type_of_computation new_c2 in
    (set1 @ set2, TDo ((x, new_c1, new_c2), ty_c2))
  | If (v, c1, c2) ->
    let set1, new_v = typed_ast_val signatures ty_env v in
    let set2, new_c1 = typed_ast_computation signatures ty_env c1 in
    let set3, new_c2 = typed_ast_computation signatures ty_env c2 in
    let ty_v = extract_type_of_value new_v in
    let ty_c1 = extract_type_of_computation new_c1 in
    let ty_c2 = extract_type_of_computation new_c2 in
    let set = set1 @ set2 @ set3 in
    ((ty_v, TyBool)::(ty_c1, ty_c2)::set, TIf ((new_v, new_c1, new_c2), ty_c1))
  | Apply (v1, v2) ->
    let set1, new_v1 = typed_ast_val signatures ty_env v1 in
    let set2, new_v2 = typed_ast_val signatures ty_env v2 in
    let ty_v1 = extract_type_of_value new_v1 in
    let ty_v2 = extract_type_of_value new_v2 in
    let set = set1 @ set2 in
    let ty_v1_return_ty = TyVar (fresh_tyvar ()) in
    ((ty_v1, TyArrow (ty_v2, (ty_v1_return_ty, [])))::set, TApply ((new_v1, new_v2), ty_v1_return_ty))
  | Handle (v, c) ->
    let set1, new_v = typed_ast_val signatures ty_env v in
    let set2, new_c = typed_ast_computation signatures ty_env c in
    let ty_v = extract_type_of_value new_v in
    let ty_c = extract_type_of_computation new_c in
    let set = set1 @ set2 in
    let ty_v_first_ty = TyVar (fresh_tyvar ()) in
    let ty_v_second_ty = TyVar (fresh_tyvar ()) in
    ((ty_v, TyHandler ((ty_v_first_ty, []), (ty_v_second_ty, [])))::(ty_v_first_ty, ty_c)::set, THandle ((new_v, new_c), ty_v_second_ty))
and typed_ast_handler signatures ty_env = function
| {return_clause = (x, c); op_clauses = ops} -> 
  let ty_x = TyVar (fresh_tyvar ()) in
  let ty_env' = update_env x ty_x ty_env in
  let set, new_c = typed_ast_computation signatures ty_env' c in
  let ty_c = extract_type_of_computation new_c in
  let new_ops = List.map (fun (op, (x, y, c)) -> 
    let input, output = List.assoc op signatures in
    let ty_x = TyVar (fresh_tyvar ()) in
    let ty_y = TyVar (fresh_tyvar ()) in
    let ty_env'' = update_env x ty_x (update_env y ty_y ty_env) in
    let set, new_c' = typed_ast_computation signatures ty_env'' c in
    let ty_c' = extract_type_of_computation new_c' in
    ((ty_x, input)::(ty_y, TyArrow(output, (ty_c', [])))::set, new_c')) ops in
  let set' = 
    List.map (fun (set', new_c') -> 
      let ty_c' = extract_type_of_computation new_c' in
      (ty_c, ty_c')::set') new_ops in
  let set'' = set @ (List.flatten set') in
  let new_ops = List.map (fun ((op, (x, y, c)), (_, new_c')) -> ((op, (x, y, new_c')), ty_c)) (List.combine ops new_ops) in
  (set'', THandler ({return_clause = ((x, new_c), ty_c); op_clauses = new_ops}, TyHandler ((ty_x, []), (ty_c, []))))

