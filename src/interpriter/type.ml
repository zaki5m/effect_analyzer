open Syntax
open Environment
type tyvar = int

type ty = 
  | TyBool
  | TyString
  | TyVar of tyvar
  | TyArrow of ty * tyc
  | TyHandler of tyc * tyc
and tyc = ty * string list

type signature = (id * (ty * ty)) list

type subst = (tyvar * ty) list

type environment = ty Environment.t

let initial_env = Environment.empty

let update_env x v env = Environment.extend x v env

let lookup_env x env = Environment.lookup x env

let err s = raise (Failure s)



let rec string_of_ty = function
  | TyBool -> "bool"
  | TyString -> "string"
  | TyVar x -> "t" ^ (string_of_int x)
  | TyArrow (ty1, (ty2, _)) -> (string_of_ty ty1) ^ " -> " ^ (string_of_ty ty2)
  | TyHandler ((ty1, _), (ty2, _)) -> "handler(" ^ (string_of_ty ty1) ^ ", " ^ (string_of_ty ty2) ^ ")"

let rec string_of_tyenv = function
  | [] -> ""
  | (x, ty)::rest -> x ^ " : " ^ (string_of_ty ty) ^ "\n" ^ (string_of_tyenv rest)

let rec string_of_signature = function
  | [] -> ""
  | (x, (ty1, ty2))::rest -> x ^ " : " ^ (string_of_ty ty1) ^ " -> " ^ (string_of_ty ty2) ^ "\n" ^ (string_of_signature rest)

let rec string_of_subst = function
  | [] -> ""
  | (x, ty)::rest -> "t" ^ (string_of_int x) ^ " -> " ^ (string_of_ty ty) ^ "\n" ^ (string_of_subst rest)

let rec subst_type (subst: subst) = function
  | TyBool -> TyBool
  | TyString -> TyString
  | TyVar x -> 
    (try List.assoc x subst 
    with Not_found -> TyVar x)
  | TyArrow (ty1, (ty2, ops)) -> TyArrow (subst_type subst ty1, (subst_type subst ty2, ops))
  | TyHandler ((ty1, ops1), (ty2, ops2)) -> TyHandler ((subst_type subst ty1, ops1), (subst_type subst ty2, ops2))

(* プリミティブ型に到達するまで探索 *)
let rec find_primitive_type subst = function
  | TyVar x -> 
    (try 
      let ty = List.assoc x subst in
      find_primitive_type subst ty
    with Not_found -> TyVar x)
  | ty -> ty


let fresh_tyvar =
  let counter = ref 0 in
  let new_var () = counter := !counter + 1; !counter in
  new_var

let rec freevar_ty = function
  | TyBool -> []
  | TyString -> []
  | TyVar x -> [x]
  | TyArrow (ty1, (ty2, _)) -> (freevar_ty ty1) @ (freevar_ty ty2)
  | TyHandler ((ty1, _), (ty2, _)) -> (freevar_ty ty1) @ (freevar_ty ty2)

let rec extract_val signatures ty_env = function
  | Bool _ -> ([], TyBool)
  | String _ -> ([], TyString)
  | Var x -> ([], lookup_env x ty_env)
  | Fun (x, c) -> 
    let ty_x = TyVar (fresh_tyvar ()) in
    let ty_env' = update_env x ty_x ty_env in
    let set, ty_c = extract_computation signatures ty_env' c in
    (set, TyArrow (ty_x, ty_c))
  | Handler h -> extract_handler signatures ty_env h
  | Concat (v1, v2) -> 
    let set1, ty_v1 = extract_val signatures ty_env v1 in
    let set2, ty_v2 = extract_val signatures ty_env v2 in
    let set = set1 @ set2 in
    ((ty_v1, TyString)::(ty_v2, TyString)::set, TyString) 
and extract_computation signatures ty_env = function
  | Return v -> 
    let set, ty_v = extract_val signatures ty_env v in
    (set, (ty_v, []))
  | Op (id, (v, x, c)) -> 
    let input, output = List.assoc id signatures in
    let set1, ty_v = extract_val signatures ty_env v in
    let set2, (ty_c, lst) = extract_computation signatures (update_env x output ty_env) c in
    let set = set1 @ set2 in
    ((ty_v, input)::set, (ty_c, id::lst))
  | Do (x, c1, c2) -> 
    let set1, (ty_c1, lst1) = extract_computation signatures ty_env c1 in
    let set2, (ty_c2, lst2) = extract_computation signatures (update_env x ty_c1 ty_env) c2 in
    (set1 @ set2, (ty_c2, lst1 @ lst2))
  | If (v, c1, c2) -> 
    let set1, ty_v = extract_val signatures ty_env v in
    let set2, (ty_c1, lst1) = extract_computation signatures ty_env c1 in
    let set3, (ty_c2, lst2) = extract_computation signatures ty_env c2 in
    let set = set1 @ set2 @ set3 in
    ((ty_v, TyBool)::(ty_c1, ty_c2)::set, (ty_c1, lst1 @ lst2))
  | Apply (v1, v2) -> 
    let set1, ty_v1 = extract_val signatures ty_env v1 in
    let set2, ty_v2 = extract_val signatures ty_env v2 in
    let set = set1 @ set2 in
    let ty_1_return_ty = TyVar (fresh_tyvar ()) in
    ((ty_v1, TyArrow (ty_v2, (ty_1_return_ty, [])))::set, (ty_1_return_ty, []))
  | Handle (v, c) -> 
    let set1, ty_v = extract_val signatures ty_env v in
    let set2, (ty_c, lst) = extract_computation signatures ty_env c in
    let set = set1 @ set2 in
    let ty_v_first_ty = TyVar (fresh_tyvar ()) in
    let ty_v_second_ty = TyVar (fresh_tyvar ()) in
    ((ty_v, TyHandler((ty_v_first_ty, []), (ty_v_second_ty, [])))::(ty_v_first_ty, ty_c)::set, (ty_v_second_ty, []))
and extract_handler signatures ty_env = function
  | {return_clause = (x, c); op_clauses = ops} -> 
    let ty_x = TyVar (fresh_tyvar ()) in
    let ty_env' = update_env x ty_x ty_env in
    let set, (ty_c, lst) = extract_computation signatures ty_env' c in
    let ty_ops = List.map (fun (op, (x, y, c)) -> 
      let input, output = List.assoc op signatures in
      let ty_x = TyVar (fresh_tyvar ()) in
      let ty_y = TyVar (fresh_tyvar ()) in
      let ty_env'' = update_env x ty_x (update_env y ty_y ty_env) in
      let set, ty_c = extract_computation signatures ty_env'' c in
      ((ty_x, input)::(ty_y, TyArrow(output, ty_c))::set, ty_c)) ops in
    let set' = List.map (fun (set', (ty_c', _)) -> (ty_c, ty_c')::set') ty_ops in
    let set'' = set @ (List.flatten set') in
    (set'', (TyHandler ((ty_x, []), (ty_c, []))))

let rec unify = function
  | [] -> []
  | (TyBool, TyBool)::rest -> unify rest
  | (TyString, TyString)::rest -> unify rest
  | (TyVar x, ty)::rest | (ty, TyVar x)::rest -> 
    if ty = TyVar x then unify rest
    else if List.mem x (freevar_ty ty) then err "occurs check"
    else 
      (x, ty)::(unify (List.map (fun (ty1, ty2) -> (subst_type [(x, ty)] ty1, subst_type [(x, ty)] ty2)) rest))
  | (TyArrow (ty1, (ty2, ops1)), TyArrow (ty1', (ty2', ops2)))::rest -> 
    unify ((ty1, ty1')::(ty2, ty2')::rest)
  | (TyHandler ((ty1, ops1), (ty2, ops2)), TyHandler ((ty1', ops1'), (ty2', ops2')))::rest -> 
    unify ((ty1, ty1')::(ty2, ty2')::rest)
  | _ -> err "type mismatch"
  

let type_of_program signatures program = 
  let set, (ty, _) = extract_computation signatures initial_env program in
  let subst = unify set in
  find_primitive_type subst ty


let ty_of_string = function
  | "bool" -> TyBool
  | "string" -> TyString
  | _ -> err "type error"

let rec signatures_of_string_list = function
  | [] -> []
  | (x, (ty1, ty2))::rest -> (x, (ty_of_string ty1, ty_of_string ty2))::(signatures_of_string_list rest)

  
