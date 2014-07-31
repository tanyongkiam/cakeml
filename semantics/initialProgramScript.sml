(*Generated by Lem from initialProgram.lem.*)
open HolKernel Parse boolLib bossLib;
open lem_pervasivesTheory astTheory semanticPrimitivesTheory bigStepTheory;

val _ = numLib.prefer_num();



val _ = new_theory "initialProgram"

(*open import Pervasives*)
(*open import Ast*)
(*open import SemanticPrimitives*)
(*open import BigStep*)

(*val mk_binop : string -> op -> dec*)
val _ = Define `
 (mk_binop name prim =  
(Dlet (Pvar name) (Fun "x" (Fun "y" (App prim [Var (Short "x"); Var (Short "y")])))))`;


(*val mk_unop : string -> op -> dec*)
val _ = Define `
 (mk_unop name prim =  
(Dlet (Pvar name) (Fun "x" (App prim [Var (Short "x")]))))`;


(*val prim_types_program : prog*)
val _ = Define `
 (prim_types_program =  
([Tdec (Dexn "Bind" []);
   Tdec (Dexn "Div" []);
   Tdec (Dexn "Eq" []);
   Tdec (Dexn "Subscript" []);
   Tdec (Dtype [(["'a"], "list", [("nil", []); ("::", [Tvar "'a"; Tapp [Tvar "'a"] (TC_name (Short "list"))]) ])]);
   Tdec (Dtype [(["'a"], "option", [("NONE", []);("SOME", [Tvar "'a"]) ])]) ]))`;


(*val basis_program : prog*)
val _ = Define `
 (basis_program =  
([Tdec (Dtabbrev [] "int" (Tapp [] TC_int));
   Tdec (Dtabbrev [] "string" (Tapp [] TC_string));
   Tdec (Dtabbrev [] "bool" (Tapp [] TC_bool));
   Tdec (Dtabbrev [] "unit" (Tapp [] TC_unit));
   Tdec (Dtabbrev [] "ref" (Tapp [] TC_ref));
   Tdec (Dtabbrev [] "exn" (Tapp [] TC_exn));
   Tdec (mk_binop "+" (Opn Plus));
   Tdec (mk_binop "-" (Opn Minus));
   Tdec (mk_binop "*" (Opn Times));
   Tdec (mk_binop "div" (Opn Divide));
   Tdec (mk_binop "mod" (Opn Modulo));
   Tdec (mk_binop "<" (Opb Lt));
   Tdec (mk_binop ">" (Opb Gt));
   Tdec (mk_binop "<=" (Opb Leq));
   Tdec (mk_binop ">=" (Opb Geq));
   Tdec (mk_binop "=" Equality);
   Tdec (mk_binop ":=" Opassign);
   Tdec (Dlet (Pvar "~") (Fun "x" (App (Opn Minus) [Lit (IntLit(( 0 : int))); Var(Short"x")])));
   Tdec (mk_unop "!" Opderef);
   Tdec (mk_unop "ref" Opref);
   Tmod "Word8" NONE 
     [Dtabbrev [] "word" (Tapp [] TC_word8)];
   Tmod "Word8Array" NONE 
     [Dtabbrev [] "array" (Tapp [] TC_word8array);
      Dtabbrev [] "elem" (Tapp [] TC_word8);
      mk_binop "array" Aalloc;
      mk_binop "sub" Asub;
      mk_unop "length" Alength;
      Dlet (Pvar "update") (Fun "x" (Fun "y" (Fun "z" (App Aupdate [Var (Short "x"); Var (Short "y"); Var (Short "z")])))) ] ]))`;


val _ = Hol_datatype `
 sem_environment = <| sem_envM : envM;
                          sem_envC : envC;
                          sem_envE : envE;
                          sem_store : v count_store # tid_or_exn set # modN set |>`;


(*val add_to_sem_env : sem_environment -> prog -> maybe sem_environment*)
val _ = Define `
 (add_to_sem_env se prog =  
(let res = ({ res | res | evaluate_whole_prog F (se.sem_envM,se.sem_envC,se.sem_envE)
                  se.sem_store prog res }) in
    if res = {} then
      NONE
    else 
      (case CHOICE res of
          (s,envC,Rval (envM,envE)) =>
           SOME <| sem_envM := (envM ++ se.sem_envM);
                   sem_envC := (merge_envC envC se.sem_envC);
                   sem_envE := (envE ++ se.sem_envE);
                   sem_store := s |>
        | _ => NONE
      )))`;


(*val prim_sem_env : maybe sem_environment*)
val _ = Define `
 (prim_sem_env =  
(add_to_sem_env <| sem_envM := []; sem_envC := ([],[]); sem_envE := []; sem_store := (( 0,[]),{},{}) |> prim_types_program))`;


(*val basis_sem_env : maybe sem_environment*)
val _ = Define `
 (basis_sem_env =  
(add_to_sem_env (THE prim_sem_env) basis_program))`;

val _ = export_theory()

