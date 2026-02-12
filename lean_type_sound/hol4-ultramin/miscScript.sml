(*
   Miscellaneous definitions and minor lemmas used throughout the
   development.
*)

(* Misc. lemmas (without any compiler constants) *)
Theory misc
Ancestors
  alignment alist arithmetic blast[qualified] bitstring bag byte
  combin container list pred_set finite_map rich_list llist option
  pair sorting relation toto comparison bit sptree words
  indexedLists string machine_ieee integer_word
  path[qualified] res_quan[qualified] lprefix_lub[qualified]
Libs
  boolSimps mp_then dep_rewrite wordsLib BasicProvers
  ASCIInumbersLib bagLib[qualified] blastLib[qualified]

val _ = ParseExtras.tight_equality()

(* Total version of THE *)
Definition the_def:
  the _ (SOME x) = x ∧
  the x NONE =  x
End

Definition opt_bind_def:
 opt_bind n v e =
   case n of
   | NONE => e
   | SOME n' => (n',v)::e
End

(* Note: This globally hides constants over the reals that gets imported through machine_ieeeTheory *)

val _ = remove_ovl_mapping "max" {Name="max", Thy="realax"}
val _ = remove_ovl_mapping "min" {Name="min", Thy="realax"}
val _ = remove_ovl_mapping "pos" {Name="pos", Thy="real"}
val _ = remove_ovl_mapping "abs" {Name="abs", Thy="realax"}
val _ = remove_ovl_mapping "inf" {Name="inf", Thy="real"}

(* this is copied in preamble.sml, but needed here to avoid cyclic dep *)
fun drule th =
  first_assum(mp_tac o MATCH_MP (ONCE_REWRITE_RULE[GSYM AND_IMP_INTRO] th))
val rveq = rpt BasicProvers.VAR_EQ_TAC
val match_exists_tac = part_match_exists_tac (hd o strip_conj)
val asm_exists_tac = first_assum(match_exists_tac o concl)
(* -- *)

(* TODO: move/categorize *)

val _ = numLib.temp_prefer_num();

(* theorem behind impl_tac *)

(* used elsewhere in cakeml *)

(* this is
     read_bytearray a c gb = OPT_MMAP gb (GENLIST (λi. a + n2w i) c)
*)

(* HOL to have OPT_MMAP f l1 = SOME l2 ==> (LENGTH l2 = LENGTH l1) *)

Definition shift_seq_def:
  shift_seq k s = \i. s (i + k:num)
End

(* TODO: Used once in all of CakeML: could probably be pushed back to use-site*)

(* only used in proof of tlookup_bij_iff *)
Theorem CARD_IMAGE_ID_BIJ:
   ∀s. FINITE s ⇒ (∀x. x ∈ s ⇒ f x ∈ s) ∧ CARD (IMAGE f s) = CARD s ⇒ BIJ f s s
Proof
  rw[]
  \\ `SURJ f s s` suffices_by metis_tac[FINITE_SURJ_BIJ]
  \\ rw[IMAGE_SURJ]
  \\ `IMAGE f s ⊆ s` by metis_tac[SUBSET_DEF,IN_IMAGE]
  \\ metis_tac[SUBSET_EQ_CARD,IMAGE_FINITE]
QED

(* never used *)

(* used only in clos_callProof -
   HOL has DISJOINT_IMAGE:
     |- (!x y. f x = f y <=> x = y) ==>
        (DISJOINT (IMAGE f x) (IMAGE f y) <=> DISJOINT x y
*)

(* disgusting and used only in clos_callProof *)

Overload LLOOKUP = “λl n. oEL n l”

(* app_list stuff should be in an app_list theory *)
Datatype:
  app_list = List ('a list) | Append app_list app_list | Nil
End

Definition append_aux_def:
  (append_aux Nil aux = aux) /\
  (append_aux (List xs) aux = xs ++ aux) /\
  (append_aux (Append l1 l2) aux = append_aux l1 (append_aux l2 aux))
End

Definition append_def:
  append l = append_aux l []
End

(* instant derivation from LIST_EQ_REWRITE *)

(* TODO - already in HOL as ZIP_GENLIST *)

(* MAP3 never used *)
Definition MAP3_def[simp]:
  (MAP3 f [] [] [] = []) /\
  (MAP3 f (h1::t1) (h2::t2) (h3::t3) = f h1 h2 h3::MAP3 f t1 t2 t3)
End

val MAP3_ind = theorem"MAP3_ind";

(* used once *)

(* used three times, once with MIN_DEF alongside, which turns it into
   LENGTH_TAKE_EQ
*)

(* should be switched in orientation; looks like an attempt to get congruence
   rule *)

(* only used in theorem immediately below *)

(* only used in bvi_to_dataProof *)

(* only used in examples/stackProg; oriented badly *)

Theorem lemmas[local]:
  (2 + 2 * n - 1 = 2 * n + 1:num) /\
    (2 + 2 * n' = 2 * n'' + 2 <=> n' = n'':num) /\
    (2 * m = 2 * n <=> (m = n)) /\
    ((2 * n'' + 1) DIV 2 = n'') /\
    ((2 * n) DIV 2 = n) /\
    (2 + 2 * n' <> 2 * n'' + 1) /\
    (2 * m + 1 <> 2 * n' + 2)
Proof
  intLib.ARITH_TAC
QED

Definition lookup_any_def:
  lookup_any x sp d =
    case lookup x sp of
    | NONE => d
    | SOME m => m
End

(* used in only one place: stack_to_labProof *)

Definition zlookup_def:
  zlookup m k = case lookup k m of NONE => 0n | SOME k => k
End

Definition tlookup_def:
  tlookup m k = case lookup k m of NONE => k | SOME k => k
End

Theorem tlookup_bij_suff:
   set (toList names) = domain names ⇒
   BIJ (tlookup names) UNIV UNIV
Proof
  strip_tac
  \\ match_mp_tac BIJ_support
  \\ qexists_tac`domain names`
  \\ reverse conj_tac
  >- (
    simp[]
    \\ rw[tlookup_def]
    \\ CASE_TAC \\ fs[domain_lookup])
  \\ `set (toList names) = IMAGE (tlookup names) (domain names)`
  by (
    pop_assum kall_tac
    \\ simp[EXTENSION,tlookup_def,MEM_toList,domain_lookup]
    \\ rw[EQ_IMP_THM] \\ fs[]
    >- (qexists_tac`k` \\ fs[])
    \\ metis_tac[] )
  \\ match_mp_tac (MP_CANON CARD_IMAGE_ID_BIJ)
  \\ fs[] \\ rw[] \\ fs[EXTENSION]
  \\ metis_tac[]
QED

Theorem tlookup_bij_iff:
   BIJ (tlookup names) UNIV UNIV ⇔
   set (toList names) = domain names
Proof
  rw[EQ_IMP_THM,tlookup_bij_suff]
  \\ fs[BIJ_IFF_INV]
  \\ rw[EXTENSION,domain_lookup,MEM_toList]
  \\ rw[EQ_IMP_THM]
  >- (
    Cases_on`k=x` >- metis_tac[]
    \\ spose_not_then strip_assume_tac
    \\ `tlookup names x = x`
    by (
      simp[tlookup_def]
      \\ CASE_TAC \\ fs[] )
    \\ `tlookup names k = x`
    by ( simp[tlookup_def] )
    \\ metis_tac[] )
  \\ Cases_on`x=v` >- metis_tac[]
  \\ spose_not_then strip_assume_tac
  \\ `tlookup names x = v`
  by ( simp[tlookup_def] )
  \\ `∀k. tlookup names k ≠ x`
  by (
    rw[tlookup_def]
    \\ CASE_TAC \\ fs[]
    \\ CCONTR_TAC \\ fs[]
    \\ metis_tac[])
  \\ metis_tac[]
QED

(* should be composition of oEL and as-yet-undefined "THE default" *)
Definition any_el_def:
  (any_el n [] d = d) /\
  (any_el n (x::xs) d = if n = 0 then x else any_el (n-1:num) xs d)
End

Definition update_resize_def:
  update_resize ls default v n =
    if n < LENGTH ls then
      LUPDATE v n ls
    else
      LUPDATE v n (ls ++ REPLICATE (n * 2 + 1 - LENGTH ls) default)
End

(*TODO upstream*)

(*Or should it be MAX x (MAX_LIST xs)*)

(* never used *)
Definition list_inter_def:
  list_inter xs ys = FILTER (\y. MEM y xs) ys
End

Definition max3_def[simp]:
  max3 (x:num) y z = if x > y then (if z > x then z else x)
                     else (if z > y then z else y)
End

(* TODO - candidate for move to HOL, but in simpler form without accumulator *)
(* only used in inferProg *)
Definition anub_def:
  (anub [] acc = []) ∧
  (anub ((k,v)::ls) acc =
   if MEM k acc then anub ls acc else
   (k,v)::(anub ls (k::acc)))
End

val anub_ind = theorem"anub_ind"

(* terrible rewrite *)

Type num_set = ``:unit spt``
Type num_map = ``:'a spt``

(* only used below in proof of theorem that is in turn used just twice *)

(* only used below in proof of theorem that is in turn used just twice *)

(* used only twice, both times in candle/set-theory *)

Definition least_from_def:
  least_from P n = if (∃x. P x ∧ n ≤ x) then $LEAST (λx. P x ∧ n ≤ x) else $LEAST P
End

(* used just once; better as
     transitive R ==> transitive (OPTREL R)
   or that with transitive expanded out *)

Definition UPDATE_LIST_def:
  UPDATE_LIST = FOLDL (combin$C (UNCURRY UPDATE))
End
val _ = Parse.add_infix("=++",500,Parse.LEFT)

Overload "=++" = ``UPDATE_LIST``

(* should be using indexedLists$findi, or INDEX_OF *)
Definition find_index_def:
  (find_index _ [] _ = NONE) ∧
  (find_index y (x::xs) n = if x = y then SOME n else find_index y xs (n+1))
End

Theorem find_index_LESS_LENGTH:
 ∀ls n m i. (find_index n ls m = SOME i) ⇒ (m <= i) ∧ (i < m + LENGTH ls)
Proof
Induct >> srw_tac[][find_index_def] >>
res_tac >>
srw_tac[ARITH_ss][arithmeticTheory.ADD1]
QED

val ALOOKUP_find_index_SOME = Q.prove(
  `∀env. (ALOOKUP env k = SOME v) ⇒
      ∀m. ∃i. (find_index k (MAP FST env) m = SOME (m+i)) ∧
          (v = EL i (MAP SND env))`,
  Induct >> simp[] >> Cases >>
  srw_tac[][find_index_def] >> full_simp_tac(srw_ss())[] >>
  first_x_assum(qspec_then`m+1`mp_tac)>>srw_tac[][]>>srw_tac[][]>>
  qexists_tac`SUC i`>>simp[])
|> SPEC_ALL |> UNDISCH_ALL |> Q.SPEC`0` |> DISCH_ALL |> SIMP_RULE (srw_ss())[]

Theorem ALOOKUP_find_index_SOME:
   (ALOOKUP env k = SOME v) ⇒
    ∃i. (find_index k (MAP FST env) 0 = SOME i) ∧
        i < LENGTH env ∧ (v = SND (EL i env))
Proof
  srw_tac[][] >> imp_res_tac ALOOKUP_find_index_SOME >>
  imp_res_tac find_index_LESS_LENGTH >> full_simp_tac(srw_ss())[EL_MAP]
QED

(* surely better with UNZIP rather than ZIP: i.e., UNZIP l1 = (a,b)...  *)

(* never used *)

(* never used *)

Theorem IS_PREFIX_THM:
  !l2 l1. IS_PREFIX l1 l2 <=> (LENGTH l2 <= LENGTH l1) /\ !n. n < LENGTH l2 ==> (EL n l2 = EL n l1)
Proof
 Induct THEN SRW_TAC[][IS_PREFIX] THEN
 Cases_on`l1`THEN SRW_TAC[][EQ_IMP_THM] THEN1 (
   Cases_on`n`THEN SRW_TAC[][EL_CONS] THEN
   FULL_SIMP_TAC(srw_ss()++ARITH_ss)[] )
 THEN1 (
   POP_ASSUM(Q.SPEC_THEN`0`MP_TAC)THEN SRW_TAC[][] )
 THEN1 (
   FIRST_X_ASSUM(Q.SPEC_THEN`SUC n`MP_TAC)THEN SRW_TAC[][] )
QED

(* used twice, and only in source_to_flatProof *)

(* never used *)

Definition between_def:
  between x y z ⇔ x:num ≤ z ∧ z < y
End

(* never used *)

(* never used *)
Definition fmap_linv_def:
  fmap_linv f1 f2 ⇔ (FDOM f2 = FRANGE f1) /\ (!x. x IN FDOM f1 ==> (FLOOKUP f2 (FAPPLY f1 x) = SOME x))
End

(* never used *)

(* never used *)

(* never used *)

(* never used *)

(* TODO - candidate for move to HOL *)

(* TODO: move elsewhere? export as rewrite? *)
(* never used *)

(* never used *)

(* Re-expressing folds *)

(* only used in flat_elimProof *)

(* never used *)

(* never used *)

(* Re-expressing curried lambdas *)

(* never used *)

(* never used *)

Theorem FST_pair:
 (λ(n,v). n) = FST
Proof
srw_tac[][FUN_EQ_THM,pairTheory.UNCURRY]
QED

(* never used *)

(* never used *)

(* never used *)

(* Specialisations to identity function *)

(* never used *)

(* Specialisations to FEMPTY *)

(* FUPDATE_LIST stuff *)

(* Misc. *)

Theorem LESS_1[simp]:
 x < 1 ⇔ (x = 0:num)
Proof
DECIDE_TAC
QED



  (* --------- SO additions --------- *)

(* use INJ_MAP_EQ_IFF and INJ_DEF *)
Theorem map_some_eq:
 !l1 l2. (MAP SOME l1 = MAP SOME l2) ⇔ (l1 = l2)
Proof
 Induct_on `l1` >>
 srw_tac[][] >>
 Cases_on `l2` >>
 srw_tac[][]
QED

(* never used *)
Theorem map_some_eq_append:
 !l1 l2 l3. (MAP SOME l1 ++ MAP SOME l2 = MAP SOME l3) ⇔ (l1 ++ l2 = l3)
Proof
metis_tac [map_some_eq, MAP_APPEND]
QED

val _ = augment_srw_ss [rewrites [map_some_eq,map_some_eq_append]];


(* list misc *)

Theorem MAP_EQ_MAP_IMP:
   !xs ys f.
      (!x y. MEM x xs /\ MEM y ys /\ (f x = f y) ==> (x = y)) ==>
      (MAP f xs = MAP f ys) ==> (xs = ys)
Proof
  Induct \\ Cases_on `ys` \\ FULL_SIMP_TAC (srw_ss()) [MAP] \\ METIS_TAC []
QED
(*
NB: this is weaker:
Theorem MAP_EQ_MAP_IMP =
  INJ_MAP_EQ |> SIMP_RULE (srw_ss()) [INJ_DEF]
*)

(* lookup_vars vs env = OPT_MMAP (\i. oEL i env) vs *)
Definition lookup_vars_def:
  (lookup_vars [] env = SOME []) /\
  (lookup_vars (v::vs) env =
     if v < LENGTH env then
       case lookup_vars vs env of
       | SOME xs => SOME (EL v env :: xs)
       | NONE => NONE
     else NONE)
End

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL - though
     enumerate i0 l = MAPi (λx i. (i + i0, x)) l
*)
Definition enumerate_def:
  (enumerate n [] = []) ∧
  (enumerate n (x::xs) = (n,x)::enumerate (n+1n) xs)
End

(* TODO - candidate for move to HOL *)

(* n.b. used in hol-reflection *)

Theorem FDOM_FLOOKUP:
   x ∈ FDOM f ⇔ ∃v. FLOOKUP f x = SOME v
Proof
  rw[FLOOKUP_DEF]
QED


(* TODO - candidate for move to HOL *)

Definition option_fold_def:
  (option_fold f x NONE = x) ∧
  (option_fold f x (SOME y) = f y x)
End


Theorem DROP_EMPTY:
   !ls n. (DROP n ls = []) ==> (n >= LENGTH ls)
Proof
    Induct \\ rw[DROP]
    \\ Cases_on `n > LENGTH ls` \\ fs[]
    \\ `n < LENGTH (h::ls)` by fs[]
    \\ fs[DROP_EL_CONS]
QED

Definition CONCAT_WITH_aux_def:
    (CONCAT_WITH_aux [] l fl = REVERSE fl ++ FLAT l) /\
    (CONCAT_WITH_aux (h::t) [] fl = REVERSE fl) /\
    (CONCAT_WITH_aux (h::t) ((h1::t1)::ls) fl = CONCAT_WITH_aux (h::t) (t1::ls) (h1::fl)) /\
    (CONCAT_WITH_aux (h::t) ([]::[]) fl = REVERSE fl) /\
    (CONCAT_WITH_aux (h::t) ([]::(h'::t')) fl = CONCAT_WITH_aux (h::t) (h'::t') (REVERSE(h::t) ++ fl))
End

val CONCAT_WITH_AUX_ind = theorem"CONCAT_WITH_aux_ind";

Definition CONCAT_WITH_def:
    CONCAT_WITH s l = CONCAT_WITH_aux s l []
End

Definition splitlines_def:
  splitlines ls =
  let lines = FIELDS ((=) #"\n") ls in
  (* discard trailing newline *)
  if NULL (LAST lines) then FRONT lines else lines
End

Theorem irreflexive_inv_image:
   !R f. irreflexive R ==> irreflexive (inv_image R f)
Proof
  SIMP_TAC std_ss [irreflexive_def,inv_image_def]
QED

Theorem trichotomous_inv_image:
   !R f. trichotomous R /\ (INJ f UNIV UNIV) ==> trichotomous (inv_image R f)
Proof
  SIMP_TAC std_ss [trichotomous,inv_image_def,INJ_DEF,IN_UNIV] THEN
  METIS_TAC[]
QED

Theorem plus_0_I[simp]:
   $+ 0n = I
Proof
rw[FUN_EQ_THM]
QED

(* used once *)

(* should be made an iff in conclusion *)

(* should be set l1 ⊆ set l2 *)
Definition list_subset_def:
  list_subset l1 l2 = EVERY (\x. MEM x l2) l1
End

Definition list_set_eq_def:
  list_set_eq l1 l2 ⇔ list_subset l1 l2 ∧ list_subset l2 l1
End

(* TODO: candidate for move to HOL;
         subspt_domain exists already but is specialised to unit *)

(* Some temporal logic definitions based on lazy lists *)
(* move into llistTheory? *)

(* computes the next position for which P holds *)
Definition Lnext_def:
  Lnext P ll = if eventually P ll then
                        if P ll then 0
                        else SUC(Lnext P (THE (LTL ll)))
                     else ARB
Termination
  exists_tac``\(P,ll') (P',ll).
    ((P = P') /\ eventually P ll /\ eventually P ll' /\
    (LTL ll = SOME ll') /\ ¬ P ll)`` >>
    reverse(rw[relationTheory.WF_DEF,eventually_thm])
  >-(Cases_on`ll` >> fs[])
  >-(Cases_on`ll` >> fs[]) >>
  Cases_on`w` >> rename[`B(P, ll)`] >> rename[`B(P, ll)`] >>
  reverse(Cases_on`eventually P ll`)
  >-(qexists_tac`(P,ll)` >> rw[] >> pairarg_tac >> fs[] >> res_tac >> rfs[]) >>
  rpt(LAST_X_ASSUM MP_TAC) >> qid_spec_tac `ll` >>
  HO_MATCH_MP_TAC eventually_ind >> rw[]
  >-(qexists_tac`(P,ll)` >> rw[] >> pairarg_tac >> fs[] >> res_tac >> rfs[]) >>
  Cases_on`B(P,ll)` >-(metis_tac[]) >>
  qexists_tac`(P,h:::ll)` >> fs[] >> rw[] >> pairarg_tac >> fs[]
End

Definition Lnext_pos_def:
  Lnext_pos (ll :num llist) = Lnext (λll. ∃k. LHD ll = SOME k ∧ k ≠ 0) ll
End

(* insert a string (l1) at specified index (n) in a list (l2) *)
Definition insert_atI_def:
  insert_atI l1 n l2 =
    TAKE n l2 ++ l1 ++ DROP (n + LENGTH l1) l2
End

(* TODO - candidate for move to HOL *)
(* N.B.: there is a different is_subsequence defined in lcsTheory; these should be merged *)
Definition is_subseq_def:
  (is_subseq ls [] ⇔ T) ∧
  (is_subseq [] (x::xs) ⇔ F) ∧
  (is_subseq (y::ys) (x::xs) ⇔
   (x = y ∧ is_subseq ys xs) ∨
   (is_subseq ys (x::xs)))
End

(* TODO - candidate for move to HOL *)
val is_subseq_ind = theorem"is_subseq_ind";

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

(* TODO - candidate for move to HOL *)

Definition make_even_def:
  make_even n = if EVEN n then n else n+1
End

Definition steps_def:
  (steps f x [] = []) ∧
  (steps f x (j::js) =
   let y = f x j in
   let tr = steps f y js in
     ((j,y)::tr))
End

Definition steps_rel_def:
  (steps_rel R x [] ⇔ T) ∧
  (steps_rel R x ((j,y)::tr) ⇔
    R x j y ∧
    steps_rel R y tr)
End

val steps_rel_ind = theorem"steps_rel_ind";

(* TODO: move to sptTheory *)

(* / TODO *)

(* BEGIN TODO: move to sptreeTheory *)

(* The range is the set of values taken on by an sptree.
  Not sure if these are worth moving. *)
Definition range_def:
  range s = {v | ∃n. lookup n s = SOME v}
End

(* END TODO *)

(* see #521 *)

val LESS4 = DECIDE ``n < 4 <=> (n = 0) \/ (n = 1) \/ (n = 2) \/ (n = 3:num)``
val LESS8 = DECIDE ``n < 8 <=> (n = 0) \/ (n = 1) \/ (n = 2) \/ (n = 3:num) \/
                               (n = 4) \/ (n = 5) \/ (n = 6) \/ (n = 7)``

(* helpful theorems for _size *)

