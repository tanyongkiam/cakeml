(*Generated by Lem from lib.lem.*)
open HolKernel Parse boolLib bossLib;
open lem_pervasivesTheory lem_list_extraTheory lem_stringTheory sptreeTheory wordsTheory alistTheory;

val _ = numLib.prefer_num();



val _ = new_theory "lib"

(*open import Pervasives*)
(*import List_extra*)
(*import String*)

(* TODO: look for these in the built-in library *)

(*val rtc : forall 'a. ('a -> 'a -> bool) -> ('a -> 'a -> bool)*)

(*val disjoint : forall 'a. set 'a -> set 'a -> bool*)

(*val all2 : forall 'a 'b. ('a -> 'b -> bool) -> list 'a -> list 'b -> bool*)

val _ = Define `
 (el_check n ls = (if n < LENGTH ls then SOME (EL n ls) else NONE))`;


(*val num_fold : forall 'a. ('a -> 'a) -> 'a -> nat -> 'a*)
 val _ = Define `
 (num_fold f a n = (if n = 0 then a else num_fold f (f a) (n -  1)))`;


 val _ = Define `
 (the _ (SOME x) = x) /\ (the x NONE = x)`;


(*val fapply : forall 'a 'b. MapKeyType 'b => 'a -> 'b -> Map.map 'b 'a -> 'a*)
val _ = Define `
 (fapply d x f = ((case FLOOKUP f x of SOME d => d | NONE => d )))`;


 val lunion_defn = Hol_defn "lunion" `

(lunion [] s = s)
/\
(lunion (x::xs) s =  
(if MEM x s
  then lunion xs s
  else x::(lunion xs s)))`;

val _ = Lib.with_flag (computeLib.auto_import_definitions, false) Defn.save_defn lunion_defn;

(* TODO: proper support for nat sets as sptrees... *)
(*open import {hol} `sptreeTheory`*)
(*type nat_set*)
(*val nat_set_empty : nat_set*)
(*val nat_set_insert : nat_set -> nat -> nat_set*)
(*val nat_set_to_set : nat_set -> set nat*)
(*val nat_set_elem : nat_set -> nat -> bool*)
(*val nat_set_from_list : list nat -> nat_set*)

(* TODO: proper support for words... *)
(*open import {hol} `wordsTheory`*)
(*type word8*)
(*val natFromWord8 : word8 -> nat*)
(*val word_to_hex_string : word8 -> string*)

(*open import {hol} `alistTheory`*)
val _ = type_abbrev((* ( 'a, 'b) *) "alist" , ``: ('a # 'b) list``);
(*val alistToFmap : forall 'k 'v. alist 'k 'v -> Map.map 'k 'v*)

(*val opt_bind : forall 'a 'b. maybe 'a -> 'b -> alist 'a 'b -> alist 'a 'b*)
val _ = Define `
 (opt_bind n v e =  
((case n of 
      NONE => e
    | SOME n' => (n',v)::e
  )))`;


(* Lists of indices *)

 val _ = Define `

(lshift (n : num) ls =  
(MAP (\ v .  v - n) (FILTER (\ v .  n <= v) ls)))`;

val _ = export_theory()

