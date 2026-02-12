(*
  Pure functions for the String module.

  Defines mlstring as a separate type from string in HOL's standard library (a
  synonym for char list).
*)
Theory mlstring
Ancestors
  misc toto mllist
Libs
  preamble

val cpn_distinct = TypeBase.distinct_of ``:ordering``
val cpn_nchotomy = TypeBase.nchotomy_of ``:ordering``

(* Defines strings as a separate type from char list. This theory should be
   moved into HOL, either as its own theory, or as an addendum to stringTheory *)

Datatype:
  mlstring = strlit string
End
val _ = add_strliteral_form{inj=``strlit``, ldelim = "«"};

Definition implode_def:
  implode = strlit
End

Definition strlen_def[simp]:
  strlen (strlit s) = LENGTH s
End

Definition strsub_def[simp]:
  strsub (strlit s) n = EL n s
End

(* the test here is because underspecification is annoying (and SEG is underspecified) *)
(* the underlying primitive (CopyStrStr) raises an exception if the test is false *)
Definition substring_def:
  substring (strlit s) off len = strlit (if off + len ≤ LENGTH s then SEG len off s
                                         else if off <= LENGTH s then DROP off s
                                         else "")
End

Definition concat_def:
  concat l = strlit (FLAT (MAP (λs. case s of strlit x => x) l))
End

Definition explode_aux_def[simp]:
  (explode_aux s n 0 = []) ∧
  (explode_aux s n (SUC len) =
    strsub s n :: (explode_aux s (n + 1) len))
End

Theorem explode_aux_thm:
   ∀max n ls.
    (n + max = LENGTH ls) ⇒
    (explode_aux (strlit ls) n max = DROP n ls)
Proof
  Induct \\ rw[] \\ fs[LENGTH_NIL_SYM,DROP_LENGTH_TOO_LONG]
  \\ match_mp_tac (GSYM rich_listTheory.DROP_EL_CONS)
  \\ simp[]
QED

Definition explode_def:
  explode s = explode_aux s 0 (strlen s)
End

Theorem explode_thm[simp]:
   explode (strlit ls) = ls
Proof
  rw[explode_def,SIMP_RULE std_ss [] explode_aux_thm]
QED

Theorem explode_implode[simp]:
   ∀x. explode (implode x) = x
Proof
  rw[implode_def]
QED

Theorem implode_explode[simp]:
   ∀x. implode (explode x) = x
Proof
  Cases >> rw[implode_def]
QED

Theorem explode_11[simp]:
   ∀s1 s2. (explode s1 = explode s2) ⇔ (s1 = s2)
Proof
  Cases >> Cases >> simp[]
QED

Theorem explode_BIJ:
   BIJ explode UNIV UNIV
Proof
  rw[BIJ_IFF_INV] >>
  qexists_tac`implode` >>
  rw[implode_explode,
     explode_implode]
QED

Definition extract_def:
  extract s i opt =
    if strlen s <= i
      then implode []
    else case opt of
        SOME x => substring s i (MIN (strlen s - i) x)
      | NONE => substring s i (strlen s - i)
End

Definition strcat_def:
  strcat s1 s2 = concat [s1; s2]
End
val _ = Parse.add_infix("^",480,Parse.LEFT)
Overload "^" = ``λx y. strcat x y``

Theorem concat_cons:
   concat (h::t) = strcat h (concat t)
Proof
  rw[strcat_def,concat_def]
QED

Theorem strcat_thm:
   strcat s1 s2 = implode (explode s1 ++ explode s2)
Proof
  rw[strcat_def,concat_def]
  \\ CASE_TAC \\ rw[] \\ CASE_TAC \\ rw[implode_def]
QED

Definition concatWith_aux_def:
  (concatWith_aux s [] bool = implode []) /\
  (concatWith_aux s (h::t) T = strcat h (concatWith_aux s t F)) /\
  (concatWith_aux s (h::t) F = strcat s (concatWith_aux s (h::t) T))
Termination
  wf_rel_tac `inv_image ($< LEX $<) (\(s,l,b). (LENGTH l, if b then 0n else 1))` \\
  rw[]
End

Definition concatWith_def:
  concatWith s l = concatWith_aux s l T
End

Definition str_def:
  str (c: char) = implode [c]
End

Definition translate_aux_def:
  (translate_aux f s n 0 = []) /\
  (translate_aux f s n (SUC len) = f (strsub s n)::translate_aux f s (n + 1) len)
End

Definition translate_def:
  translate f s = implode (translate_aux f s 0 (strlen s))
End

Definition splitl_aux_def:
  splitl_aux P s i =
    if i < strlen s ∧ P (strsub s i) then
        splitl_aux P s (i+1)
    else (extract s 0 (SOME i), extract s i NONE)
Termination
  WF_REL_TAC`inv_image $< (λ(x,s,i). strlen s - i)`
End

val splitl_aux_ind = theorem"splitl_aux_ind";

Definition splitl_def:
  splitl P s = splitl_aux P s 0
End

Definition tokens_aux_def:
  (tokens_aux f s [] n 0 = []) /\
  (tokens_aux f s (h::t) n 0 = [implode (REVERSE (h::t))]) /\
  (tokens_aux f s [] n (SUC len) =
    if f (strsub s n)
      then tokens_aux f s [] (n + 1) len
    else tokens_aux f s [strsub s n] (n + 1) len) /\
  (tokens_aux f s (h::t) n (SUC len) =
    if f (strsub s n)
      then (implode (REVERSE (h::t)))::(tokens_aux f s [] (n + 1) len)
    else tokens_aux f s (strsub s n::(h::t)) (n + 1) len)
End

val tokens_aux_ind = theorem"tokens_aux_ind";

Definition tokens_def:
 tokens f s = tokens_aux f s [] 0 (strlen s)
End

Theorem TOKENS_eq_tokens_aux:
   !P ls ss n len. (n + len = LENGTH (explode ls)) ==>
      (MAP explode (tokens_aux P ls ss n len) = case ss of
        | (h::t) => if (len <> 0) /\ ($~ (P (EL n (explode ls)))) then
          (REVERSE (h::t) ++ HD (TOKENS P (DROP n (explode ls))))::TL (TOKENS P (DROP n (explode ls)))
           else if (len <> 0) then
              REVERSE (h::t)::(TOKENS P (DROP n (explode ls)))
           else [REVERSE(h::t)]
        | [] => (TOKENS P (DROP n (explode ls))))
Proof
    ho_match_mp_tac tokens_aux_ind \\ rw[] \\ Cases_on `s`
    \\ rw[explode_thm, tokens_aux_def, TOKENS_def, implode_def, strlen_def, strsub_def]
    \\ fs[strsub_def, DROP_LENGTH_TOO_LONG, TOKENS_def]
    >-(rw[EQ_SYM_EQ, Once DROP_EL_CONS] \\ rw[TOKENS_def]
      \\ pairarg_tac  \\ fs[NULL_EQ] \\ rw[]
      \\ imp_res_tac SPLITP_NIL_FST_IMP \\ fs[SPLITP] \\ rfs[])
     >-(rw[EQ_SYM_EQ, Once DROP_EL_CONS]
      \\ rw[TOKENS_def]
      \\ pairarg_tac  \\ fs[NULL_EQ] \\ rw[]
      >-(fs[SPLITP] \\ rfs[] \\ Cases_on `DROP (n + 1) s'`)
      >-(fs[SPLITP] \\ rfs[] \\ Cases_on `DROP (n + 1) s'`
        >-(imp_res_tac DROP_EMPTY \\ fs[ADD1])
        \\ Cases_on `f h` \\ rw[]
        >-(`n + 1 < LENGTH s'` by fs[]
          \\ `h = EL (n + 1) s'` by metis_tac[HD_DROP, HD] \\ fs[])
        \\ rw[TOKENS_def, SPLITP]
      ) (*this is a copy*)
      >-(fs[SPLITP] \\ rfs[] \\ Cases_on `DROP (n + 1) s'`
        >-(imp_res_tac DROP_EMPTY \\ fs[ADD1])
        \\ Cases_on `f h` \\ rw[]
        >-(`n + 1 < LENGTH s'` by fs[]
          \\ `h = EL (n + 1) s'` by metis_tac[HD_DROP, HD] \\ fs[])
        \\ rw[TOKENS_def, SPLITP]))
    >-(rw[DROP_EL_CONS, TOKENS_def]
      \\ pairarg_tac  \\ fs[NULL_EQ] \\ rw[] \\ fs[SPLITP] \\ rfs[]
      \\ rw[TOKENS_def]
      \\ pairarg_tac \\ fs[NULL_EQ] \\ rw[] \\ fs[SPLITP] \\ rfs[] \\ metis_tac[TL])
    (*This is a copy *)
    >-(rw[DROP_EL_CONS, TOKENS_def]
      \\ pairarg_tac  \\ fs[NULL_EQ] \\ rw[] \\ fs[SPLITP] \\ rfs[]
      \\ rw[TOKENS_def]
      \\ pairarg_tac \\ fs[NULL_EQ] \\ rw[] \\ fs[SPLITP] \\ rfs[] \\ metis_tac[TL])
    >-(`n = LENGTH s' - 1` by DECIDE_TAC
      \\ rw[DROP_EL_CONS, DROP_LENGTH_TOO_LONG, TOKENS_def]
      \\ pairarg_tac  \\ fs[NULL_EQ] \\ rw[] \\ fs[SPLITP] \\ rfs[]
      \\ `LENGTH r = 1` by rw[]
      \\ Cases_on `TL r` >-(rw[TOKENS_def])
      \\ rw[] \\ fs[])
    >-(fs[ADD1]
      \\ `x0 = implode [EL n s']` by fs[implode_explode] \\ rw[explode_implode]
      \\ rw[DROP_EL_CONS, DROP_LENGTH_TOO_LONG, TOKENS_def]
      \\ pairarg_tac  \\ fs[NULL_EQ] \\ rw[] \\ fs[SPLITP] \\ rfs[] \\ rw[TOKENS_def])
    \\(rw[DROP_EL_CONS, DROP_LENGTH_TOO_LONG, TOKENS_def]
      \\ pairarg_tac  \\ fs[NULL_EQ] \\ rw[] \\ fs[SPLITP] \\ rfs[] \\ rw[TOKENS_def]
      \\ pairarg_tac \\ fs[NULL_EQ] \\ rw[] \\ fs[SPLITP] \\ rfs[] \\ metis_tac[TL])
QED
(*
  >> TRY (
  recogniser (e.g., rename1_tac or qmatch_goalsub_rename_tac ...) >>
  ... >> NO_TAC)
  >> TRY (
  ... >> NO_TAC)
  >> TRY (
  ... >> NO_TAC)
*)


Theorem TOKENS_eq_tokens:
   !P ls.(MAP explode (tokens P ls) = TOKENS P (explode ls))
Proof
  Cases_on `ls` \\ rw[tokens_def, TOKENS_eq_tokens_aux]
QED

(*
Theorem TOKENS_eq_tokens_sym
  `!P ls. tokens P ls = MAP implode (TOKENS P (explode ls))`
  (rw[]
  \\ Q.ISPEC_THEN`explode`match_mp_tac INJ_MAP_EQ
  \\ simp[MAP_MAP_o,INJ_DEF,explode_11,o_DEF,explode_implode,TOKENS_eq_tokens]
*)

Theorem TOKENS_eq_tokens_sym =
  TOKENS_eq_tokens
        |> SPEC_ALL
        |> Q.AP_TERM`MAP implode`
        |> SIMP_RULE(srw_ss())[MAP_MAP_o,implode_explode,o_DEF]

Definition fields_aux_def:
  (fields_aux f s ss n 0 = [implode (REVERSE ss)]) /\
  (fields_aux f s ss n (SUC len) =
    if f (strsub s n)
      then implode (REVERSE ss)::(fields_aux f s [] (n + 1) len)
    else fields_aux f s (strsub s n::ss) (n + 1) len)
End



Definition fields_def:
  fields f s = fields_aux f s [] 0 (strlen s)
End

Definition isStringThere_aux_def:
  (isStringThere_aux s1 s2 s1i s2i 0 = T) /\
  (isStringThere_aux s1 s2 s1i s2i (SUC len) =
    if strsub s1 s1i = strsub s2 s2i
      then isStringThere_aux s1 s2 (s1i + 1) (s2i + 1) len
    else F)
End


(*

val isStringThere_thm = Q.prove (
  `!s1 s2 s1i s2i len. (s2i + len <= strlen s2) /\ (s1i + len = strlen s1) /\
  (strlen s1 <= strlen s2) /\ (s1i <= s2i) /\ (isStringThere_aux s1 s2 0 s2i (strlen s1)) ==>
  (SEG len s2i (explode s2) = TAKE len (explode s1))`
  Cases_on `s1` \\ Cases_on `s2` \\
  rw [strlen_def, explode_thm, SEG, SEG_TAKE_DROP] \\
  Cases_on `len` \\ rw [SEG] \\ `s2i < STRLEN s'` by DECIDE_TAC \\
);
*)

Definition isPrefix_def:
  isPrefix s1 s2 =
    if strlen s1 <= strlen s2
      then isStringThere_aux s1 s2 0 0 (strlen s1)
    else F
End

Definition isSuffix_def:
  isSuffix s1 s2 =
    if strlen s1 <= strlen s2
      then isStringThere_aux s1 s2 0 (strlen s2 - strlen s1) (strlen s1)
    else F
End

Definition isSubstring_aux_def:
  (isSubstring_aux s1 s2 lens1 n 0 = F) /\
  (isSubstring_aux s1 s2 lens1 n (SUC len) =
    if (isStringThere_aux s1 s2 0 n lens1)
      then T
    else isSubstring_aux s1 s2 lens1 (n + 1) len)
End

Definition isSubstring_def:
  isSubstring s1 s2 =
  if strlen s1 <= strlen s2
    then isSubstring_aux s1 s2 (strlen s1) 0 ((strlen s2) - (strlen s1) + 1)
  else F
End

(* proof that isSubstring has the right sort of properties *)

(* String orderings *)
Definition compare_aux_def:
  compare_aux (s1: mlstring) s2 ord start len =
    if len = 0n then
      ord
    else if strsub s2 start < strsub s1 start
      then GREATER
    else if strsub s1 start < strsub s2 start
      then LESS
    else compare_aux s1 s2 ord (start + 1) (len - 1)
End

Definition compare_def:
  compare s1 s2 = if (strlen s1) < (strlen s2)
    then compare_aux s1 s2 LESS 0 (strlen s1)
  else if (strlen s2) < (strlen s1)
    then compare_aux s1 s2 GREATER 0 (strlen s2)
  else compare_aux s1 s2 EQUAL 0 (strlen s2)
End

Definition mlstring_lt_def:
  mlstring_lt s1 s2 ⇔ (compare s1 s2 = LESS)
End

Definition mlstring_le_def:
  mlstring_le s1 s2 ⇔ (compare s1 s2 ≠ GREATER)
End

Definition mlstring_gt_def:
  mlstring_gt s1 s2 ⇔ (compare s1 s2 = GREATER)
End

Definition mlstring_ge_def:
  mlstring_ge s1 s2 ⇔ (compare s1 s2 <> LESS)
End

Overload "<" = ``λx y. mlstring_lt x y``
Overload "<=" = ``λx y. mlstring_le x y``
Overload ">" = ``λx y. mlstring_gt x y``
Overload ">=" = ``λx y. mlstring_ge x y``

(* Properties of string orderings *)

val flip_ord_def = ternaryComparisonsTheory.invert_comparison_def
Overload flip_ord = ``invert_comparison``

Theorem compare_aux_spec[local]:
  !s1 s2 ord_in start len.
    len + start ≤ strlen s1 ∧ len + start ≤ strlen s2 ⇒
    (compare_aux s1 s2 ord_in start len =
      if TAKE len (DROP start (explode s1)) = TAKE len (DROP start (explode s2)) then
        ord_in
      else if string_lt (TAKE len (DROP start (explode s1))) (TAKE len (DROP start (explode s2))) then
        LESS
      else
        GREATER)
Proof
  Induct_on `len` >>
  rw [] >>
  ONCE_REWRITE_TAC [compare_aux_def] >>
  simp [] >>
  Cases_on `s1` >>
  Cases_on `s2` >>
  fs [] >>
  full_simp_tac (srw_ss()) [TAKE_SUM, DECIDE ``!n. SUC n = 1 + n``] >>
  fs [TAKE1_DROP, DROP_DROP_T, char_lt_def] >>
  fs [string_lt_def] >>
  simp [] >>
  rw [] >>
  fs [char_lt_def, CHAR_EQ_THM]
QED

Theorem string_lt_take_mono[local]:
  !s1 s2 x.
    s1 < s2 ⇒ TAKE x s1 < TAKE x s2 ∨ (TAKE x s1 = TAKE x s2)
Proof
  ho_match_mp_tac string_lt_ind >>
  rw [string_lt_def] >>
  Cases_on `x` >>
  fs [string_lt_def] >>
  metis_tac []
QED

Theorem string_lt_remove_take[local]:
  !s1 s2 x. TAKE x s1 < TAKE x s2 ⇒ s1 < s2
Proof
  ho_match_mp_tac string_lt_ind >>
  rw [string_lt_def] >>
  Cases_on `x` >>
  fs [string_lt_def] >>
  metis_tac []
QED

Theorem string_prefix_le[local]:
  !s1 s2. s1 ≼ s2 ⇒ s1 ≤ s2
Proof
  ho_match_mp_tac string_lt_ind >>
  rw [string_lt_def, string_le_def, isPREFIX_STRCAT] >>
  Cases_on `s3` >>
  fs []
QED

Theorem take_prefix[local]:
  !l s. TAKE l s ≼ s
Proof
  Induct_on `s` >>
  rw [] >>
  Cases_on `l` >>
  fs []
QED

Theorem mlstring_lt_inv_image:
   mlstring_lt = inv_image string_lt explode
Proof
  simp [inv_image_def, FUN_EQ_THM] >>
  Cases >>
  Cases >>
  simp [mlstring_lt_def, compare_def, compare_aux_spec] >>
  qmatch_goalsub_abbrev_tac ‘if x < x' then _ else _’ >>
  rw []
  >- (
    `TAKE x s' ≤ s'` by metis_tac [take_prefix, string_prefix_le] >>
    fs [string_le_def] >>
    `x ≠ x'` by decide_tac >>
    unabbrev_all_tac >> fs [])
  >- metis_tac [string_lt_remove_take, TAKE_LENGTH_ID]
  >- metis_tac [string_lt_take_mono, TAKE_LENGTH_ID]
  >- metis_tac [take_prefix, string_prefix_le, LENGTH_TAKE, LESS_OR_EQ, string_lt_antisym, string_le_def]
  >- metis_tac [string_lt_remove_take, TAKE_LENGTH_ID]
  >- metis_tac [string_lt_take_mono, TAKE_LENGTH_ID]
  >- metis_tac [take_prefix, string_prefix_le, string_lt_antisym, string_le_def]
  >- metis_tac [string_lt_remove_take, TAKE_LENGTH_ID]
  >- metis_tac [string_lt_take_mono, TAKE_LENGTH_ID]
QED

Definition collate_aux_def:
  (collate_aux f (s1: mlstring) s2 ord n 0 = ord) /\
  (collate_aux f s1 s2 ord n (SUC len) =
    if f (strsub s1 n) (strsub s2 n) = EQUAL
      then collate_aux f s1 s2 ord (n + 1) len
    else f (strsub s1 n) (strsub s2 n))
End

Definition collate_def:
  collate f s1 s2 =
  if (strlen s1) < (strlen s2)
    then collate_aux f s1 s2 LESS 0 (strlen s1)
  else if (strlen s2) < (strlen s1)
    then collate_aux f s1 s2 GREATER 0 (strlen s2)
  else collate_aux f s1 s2 EQUAL 0 (strlen s2)
End

Definition char_escape_seq_def:
  char_escape_seq c =
    if c = #"\t"
    then SOME (strlit "\\t")
    else if c = #"\n"
    then SOME (strlit "\\n")
    else if c = #"\\"
    then SOME (strlit "\\\\")
    else if c = #"\""
    then SOME (strlit "\\\"")
    else NONE
End

Definition char_escaped_def:
  char_escaped c = case char_escape_seq c of
    NONE => [c]
  | SOME s => explode s
End

Definition escape_str_def:
  escape_str s = implode ("\"" ++ FLAT (MAP char_escaped (explode s)) ++ "\"")
End

Definition escape_char_def:
  escape_char c = implode ("#\"" ++ char_escaped c ++ "\"")
End

(* optimising mlstring app_list *)

Datatype:
  app_list_ann = BigList ('a list)
               | BigAppend app_list_ann app_list_ann
               | Small ('a app_list)
End

Definition sum_sizes_def:
  sum_sizes [] k = k ∧
  sum_sizes (l::ls) k = sum_sizes ls (strlen l + k)
End

Overload size_limit[local] = “2048:num”

Definition make_app_list_ann_def:
  make_app_list_ann input =
    case input of
    | Nil => (Small input, 0)
    | Append l1 l2 =>
        (let (x1,n1) = make_app_list_ann l1 in
         let (x2,n2) = make_app_list_ann l2 in
         let n = n1+n2 in
           if n < size_limit then
             (Small input,n)
           else
             (BigAppend x1 x2,n))
    | List ls =>
        (let n = sum_sizes ls 0 in
           if n < size_limit then
             (Small input,n)
           else (BigList ls,n))
End

Definition shrink_def:
  shrink (Small t) = List [concat (append t)] ∧
  shrink (BigList ls) = List ls ∧
  shrink (BigAppend l1 l2) = Append (shrink l1) (shrink l2)
End

Definition str_app_list_opt_def:
  str_app_list_opt l =
    let (t,n) = make_app_list_ann l in
      shrink t
End

Definition char_to_word8_def[simp]:
  char_to_word8 (c:char) = n2w (ORD c) :word8
End

Definition word8_to_char_def[simp]:
  word8_to_char (w:word8) = CHR (w2n w) : char
End

(* The translator turns each `empty_ffi s` into a call to the FFI with
   an empty name and passing `s` as the argument. The empty FFI is
   used for logging/timing purposes. *)
Definition empty_ffi_def:
  empty_ffi (s:mlstring) = ()
End

