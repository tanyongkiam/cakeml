open HolKernel Parse boolLib bossLib lcsymtacs alistTheory listTheory arithmeticTheory combinTheory finite_mapTheory pairTheory monadsyntax
open miscLib miscTheory holKernelTheory holSyntaxLibTheory holSyntaxTheory holSyntaxExtraTheory

val _ = new_theory "holKernelProof";

val _ = temp_overload_on ("monad_bind", ``ex_bind``);
val _ = temp_overload_on ("return", ``ex_return``);

infix \\ val op \\ = op THEN;

val rev_assocd_thm = prove(
  ``rev_assocd = REV_ASSOCD``,
  SIMP_TAC std_ss [FUN_EQ_THM] \\ Induct_on `x'`
  \\ ONCE_REWRITE_TAC [rev_assocd_def] \\ SRW_TAC [] [REV_ASSOCD]
  \\ Cases_on `h` \\ SRW_TAC [] [REV_ASSOCD]);

val REPLICATE_GENLIST = rich_listTheory.REPLICATE_GENLIST

val REPLICATE_11 = prove(
  ``!m n x. (REPLICATE n x = REPLICATE m x) = (m = n)``,
  Induct \\ Cases \\ SRW_TAC [] [rich_listTheory.REPLICATE]);

val _ = temp_overload_on("impossible_term",``holSyntax$Comb (Var "x" Bool) (Var "x" Bool)``);

(* ------------------------------------------------------------------------- *)
(* Refinement invariants                                                     *)
(* ------------------------------------------------------------------------- *)

val TYPE_def = Define `
  TYPE ctxt ty = type_ok (tysof ctxt) ty`;

val TERM_def = Define `
  TERM ctxt tm = term_ok (sigof (ctxt:update list)) tm`;

val CONTEXT_def = Define `
  CONTEXT ctxt = ctxt extends init_ctxt`;

val THM_def = Define `
  THM ctxt (Sequent asl c) = ((thyof ctxt, asl) |- c)`;

val STATE_def = Define `
  STATE ctxt state =
      (ctxt = state.the_context) /\ CONTEXT ctxt /\
      (state.the_type_constants = type_list ctxt) /\
      (state.the_term_constants = const_list ctxt) /\
      TERM ctxt state.the_clash_var`;

(* ------------------------------------------------------------------------- *)
(* impossible term lemmas                                                    *)
(* ------------------------------------------------------------------------- *)

val term_ok_impossible_term = prove(
  ``~(term_ok defs impossible_term)``,
  simp[term_ok_def])

val impossible_term_thm = prove(
  ``TERM defs tm ==> tm <> impossible_term``,
  SIMP_TAC std_ss [TERM_def] \\ REPEAT STRIP_TAC
  \\ FULL_SIMP_TAC (srw_ss()) [term_ok_impossible_term])

val Abs_Var = prove(
  ``TERM defs (Abs v tm) ==> ?s ty. v = Var s ty``,
  simp[TERM_def,term_ok_def] >> rw[])

(* ------------------------------------------------------------------------- *)
(* invariant lemmas                                                          *)
(* ------------------------------------------------------------------------- *)

val CONTEXT_ALL_DISTINCT = prove(
  ``CONTEXT defs ⇒ ALL_DISTINCT (MAP FST (type_list defs)) ∧
                   ALL_DISTINCT (MAP FST (const_list defs))``,
  rw[CONTEXT_def] >>
  METIS_TAC[extends_ALL_DISTINCT,init_ALL_DISTINCT])

val STATE_ALL_DISTINCT = prove(
  ``STATE defs s ⇒ ALL_DISTINCT (MAP FST s.the_type_constants) ∧
                   ALL_DISTINCT (MAP FST s.the_term_constants)``,
  rw[STATE_def] >>
  imp_res_tac CONTEXT_ALL_DISTINCT >>
  qpat_assum`X = const_list Y`(assume_tac o SYM) >> fs[] >>
  fs[MAP_MAP_o,combinTheory.o_DEF,UNCURRY,ETA_AX])

val TYPE_Tyapp = prove(
  ``MEM (tyop,LENGTH args) r.the_type_constants /\
    STATE defs r /\ EVERY (TYPE defs) args ==>
    TYPE defs (Tyapp tyop args)``,
  rw[EVERY_MEM,TYPE_def] >>
  imp_res_tac STATE_ALL_DISTINCT >>
  rw[type_ok_def,EVERY_MAP,EVERY_MEM] >>
  imp_res_tac ALOOKUP_ALL_DISTINCT_MEM >>
  rfs[STATE_def])

val CONTEXT_std_sig = prove(
  ``CONTEXT defs ⇒ is_std_sig (sigof defs)``,
  rw[CONTEXT_def] >>
  imp_res_tac extends_theory_ok >> fs[init_theory_ok] >>
  imp_res_tac theory_ok_sig >> fs[is_std_sig_def])

val CONTEXT_fun = prove(
  ``CONTEXT defs ⇒
      ∀a. MEM ("fun",a) (type_list defs) ⇔ (a = 2)``,
  rw[] >> imp_res_tac CONTEXT_ALL_DISTINCT >>
  imp_res_tac CONTEXT_std_sig >>
  fs[is_std_sig_def] >>
  imp_res_tac ALOOKUP_ALL_DISTINCT_MEM >>
  EQ_TAC >> rw[] >> res_tac >> fs[] >>
  imp_res_tac ALOOKUP_MEM)

val TYPE = prove(
  ``(STATE defs state ==> TYPE defs (Tyvar v)) /\
    (TYPE defs (Tyapp op tys) ==> EVERY (TYPE defs) tys)``,
  conj_tac >- (
    simp[STATE_def,TYPE_def,EVERY_MEM] >>
    rw[] >> simp[type_ok_def] ) >>
  rw[EVERY_MEM,TYPE_def] >>
  fs[type_ok_def,EVERY_MAP,EVERY_MEM]);

val TERM = prove(
  ``(TERM defs (Var n ty) ==> TYPE defs ty) /\
    (TERM defs (Const n ty) ==> TYPE defs ty) /\
    (TERM defs (Abs (Var v ty) x) ==> TERM defs x /\ TYPE defs ty) /\
    (TERM defs (Comb x y) ==> TERM defs x /\ TERM defs y)``,
  rw[TERM_def,TYPE_def] >> fs[term_ok_def])

val TYPE_Fun = prove(
  ``CONTEXT defs ∧ TYPE defs ty1 /\ TYPE defs ty2 ==>
    TYPE defs (Tyapp "fun" [ty1;ty2])``,
  rw[TYPE_def,type_ok_def] >>
  imp_res_tac CONTEXT_fun >>
  METIS_TAC[ALOOKUP_ALL_DISTINCT_MEM,CONTEXT_ALL_DISTINCT]);

val TERM_Var_SIMP = prove(
  ``(TERM defs (Var n ty) = TYPE defs ty)``,
  rw[TERM_def,TYPE_def,term_ok_def]);

val TERM_Var = prove(
  ``TYPE defs ty ==> TERM defs (Var n ty)``,
  METIS_TAC [TERM_Var_SIMP]);

val IMP_TERM_Abs = prove(
  ``TERM defs (Var str ty) /\ TERM defs bod ==>
    TERM defs (Abs (Var str ty) bod)``,
  fs[TERM_def,term_ok_def]);

val IMP_TERM_Comb = prove(
  ``TERM defs f /\
    TERM defs a /\
    (typeof a = ty1) /\
    (typeof f = Fun ty1 ty2) ==>
    TERM defs (Comb f a)``,
  rw[TERM_def,term_ok_def] >>
  METIS_TAC[term_ok_welltyped])

val TERM_Abs = prove(
  ``TERM defs (Abs (Var v ty) tm) <=> TYPE defs ty /\ TERM defs tm``,
  rw[TERM_def,term_ok_def,TYPE_def]);

val INST_CORE_LEMMA =
  INST_CORE_HAS_TYPE |> Q.SPECL [`holSyntax$sizeof tm`,`tm`,`[]`,`tyin`]
  |> SIMP_RULE std_ss [MEM,REV_ASSOCD] |> Q.GENL [`tm`,`tyin`]

val INST_CORE_EMPTY = prove(
  ``!tm env.
      welltyped tm /\ EVERY (\(x,y). x = y) env ==>
      (holSyntax$INST_CORE env [] tm = Result tm)``,
  completeInduct_on `holSyntax$sizeof tm` \\ Cases \\ REPEAT STRIP_TAC
  THEN1 (ONCE_REWRITE_TAC [INST_CORE_def] \\ SIMP_TAC std_ss [TYPE_SUBST_NIL]
    \\ `REV_ASSOCD (Var s t) env (Var s t) = Var s t` by ALL_TAC THEN1
     (POP_ASSUM MP_TAC \\ REPEAT (POP_ASSUM (K ALL_TAC))
      \\ Induct_on `env` \\ FULL_SIMP_TAC std_ss [REV_ASSOCD]
      \\ Cases \\ FULL_SIMP_TAC std_ss [REV_ASSOCD,EVERY_DEF])
    \\ FULL_SIMP_TAC std_ss [LET_THM])
  THEN1 (ONCE_REWRITE_TAC [INST_CORE_def] \\ SIMP_TAC std_ss [TYPE_SUBST_NIL])
  THEN1
   (FULL_SIMP_TAC std_ss [sizeof_def,term_ok_def]
    \\ FULL_SIMP_TAC std_ss [PULL_FORALL]
    \\ ONCE_REWRITE_TAC [INST_CORE_def]
    \\ qmatch_assum_rename_tac`v = 1 + holSyntax$sizeof a0 + holSyntax$sizeof a1`[]
    \\ FIRST_X_ASSUM (fn th => MP_TAC (Q.SPECL [`a0`,`env`] th) THEN
                               MP_TAC (Q.SPECL [`a1`,`env`] th))
    \\ simp[] >> fs[] ) >>
  ONCE_REWRITE_TAC [INST_CORE_def]
  \\ FULL_SIMP_TAC std_ss [TYPE_SUBST_NIL,PULL_FORALL,sizeof_def]
  >> fs[]
  >> simp[])
  |> Q.SPECL [`tm`,`[]`] |> SIMP_RULE std_ss [EVERY_DEF] |> GEN_ALL;

val THM = prove(
  ``THM defs (Sequent asl c) ==> EVERY (TERM defs) asl /\ TERM defs c``,
  SIMP_TAC std_ss [THM_def] \\ SIMP_TAC std_ss [EVERY_MEM] >>
  strip_tac >> imp_res_tac proves_term_ok >>
  fs[EVERY_MEM,TERM_def,MEM_MAP,PULL_EXISTS])

val type_IND = type_induction
  |> Q.SPECL[`P`,`EVERY P`]
  |> SIMP_RULE (srw_ss())[]
  |> UNDISCH_ALL |> CONJUNCT1 |> DISCH_ALL
  |> Q.GEN`P`

val type_subst_EMPTY = prove(
  ``!ty. type_subst [] ty = ty``,
  HO_MATCH_MP_TAC type_IND
  \\ REPEAT STRIP_TAC \\ SIMP_TAC (srw_ss()) [Once type_subst_def]
  \\ SIMP_TAC std_ss [rev_assocd_thm,REV_ASSOCD,LET_DEF]
  \\ `MAP (\a. type_subst [] a) l = l` by ALL_TAC \\ FULL_SIMP_TAC std_ss []
  \\ Induct_on `l` \\ FULL_SIMP_TAC std_ss [MAP,EVERY_DEF]);

val MAP_EQ_2 = prove(
  ``(MAP f l = [x;y]) ⇔ ∃x0 y0. (l = [x0;y0]) ∧ (x = f x0) ∧ (y = f y0)``,
  Cases_on`l`>>simp[]>>Cases_on`t`>>simp[]>>METIS_TAC[])

val sequent_has_type_bool = prove(
  ``(d,h) |- c ⇒ EVERY (λt. t has_type Bool) (c::h)``,
  strip_tac >> imp_res_tac proves_term_ok >> fs[EVERY_MEM])

val THM_term_ok_bool = prove(
  ``THM defs (Sequent asl p) ⇒
    EVERY (λt. term_ok (sigof defs) t ∧ (typeof t = Bool)) (p::asl)``,
  REPEAT STRIP_TAC
  \\ IMP_RES_TAC THM
  \\ FULL_SIMP_TAC std_ss [THM_def]
  \\ IMP_RES_TAC sequent_has_type_bool
  \\ IMP_RES_TAC proves_term_ok
  \\ FULL_SIMP_TAC std_ss [TERM_def,EVERY_MEM,MEM_MAP,PULL_EXISTS,MEM]
  \\ NTAC 2 STRIP_TAC
  \\ FULL_SIMP_TAC std_ss []
  \\ METIS_TAC [WELLTYPED_LEMMA])

(* ------------------------------------------------------------------------- *)
(* Verification of type functions                                            *)
(* ------------------------------------------------------------------------- *)

val can_thm = prove(
  ``can f x s = case f x s of (HolRes _,s) => (HolRes T,s) |
                              (_,s) => (HolRes F,s)``,
  SIMP_TAC std_ss [can_def,ex_bind_def,otherwise_def]
  \\ Cases_on `f x s` \\ Cases_on `q`
  \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]);

val assoc_thm = prove(
  ``!xs y z s s'.
      (assoc y xs s = (z, s')) ==>
      (s' = s) /\ (!i. (z = HolRes i) ==> MEM (y,i) xs) /\
                  (!e. (z = HolErr e) ==> !i. ~MEM (y,i) xs)``,
  Induct \\ SIMP_TAC (srw_ss()) [Once assoc_def,failwith_def]
  \\ Cases \\ SIMP_TAC (srw_ss()) [] \\ STRIP_TAC
  \\ Cases_on `y = q` \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ METIS_TAC []);

val get_type_arity_thm = prove(
  ``!name s z s'.
      (get_type_arity name s = (z,s')) ==> (s' = s) /\
      (!i. (z = HolRes i) ==> MEM (name,i) s.the_type_constants) /\
      (!e. (z = HolErr e) ==> !i. ~MEM (name,i) s.the_type_constants)``,
  SIMP_TAC (srw_ss()) [get_type_arity_def,ex_bind_def,
    get_the_type_constants_def] \\ REPEAT STRIP_TAC
  \\ IMP_RES_TAC assoc_thm);

val mk_vartype_thm = store_thm("mk_vartype_thm",
  ``!name s.
      STATE s.the_context s ⇒
      TYPE s.the_context (mk_vartype name)``,
  SIMP_TAC (srw_ss()) [mk_vartype_def,TYPE_def,type_ok_def,STATE_def]);

val mk_type_thm = store_thm("mk_type_thm",
  ``!tyop args s z s'.
      STATE defs s /\ EVERY (TYPE defs) args /\
      (mk_type (tyop,args) s = (z,s')) ==> (s' = s) /\
      ((tyop = "fun") /\ (LENGTH args = 2) ==> ?i. z = HolRes i) /\
      !i. (z = HolRes i) ==> TYPE defs i /\ (i = Tyapp tyop args)``,
  SIMP_TAC std_ss [mk_type_def,try_def,ex_bind_def,otherwise_def]
  \\ NTAC 3 STRIP_TAC \\ Cases_on `get_type_arity tyop s`
  \\ IMP_RES_TAC get_type_arity_thm
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [failwith_def,ex_return_def]
  \\ SRW_TAC [] [ex_return_def]
  \\ IMP_RES_TAC TYPE_Tyapp
  \\ fs[STATE_def] >> METIS_TAC[CONTEXT_fun])

val dest_type_thm = store_thm("dest_type_thm",
  ``!ty s z s'.
      STATE defs s /\
      (dest_type ty s = (z,s')) /\ TYPE defs ty ==> (s' = s) /\
      !i. (z = HolRes i) ==> ?n tys. (ty = Tyapp n tys) /\ (i = (n,tys)) /\
                                     EVERY (TYPE defs) tys``,
  Cases \\ FULL_SIMP_TAC (srw_ss()) [dest_type_def,failwith_def,ex_return_def]
  \\ FULL_SIMP_TAC std_ss [TYPE_def,EVERY_MEM] \\ SRW_TAC [] []
  >> fs[type_ok_def,EVERY_MAP,EVERY_MEM])

val dest_vartype_thm = store_thm("dest_vartype_thm",
  ``!ty s z s'.
      (dest_vartype ty s = (z,s')) ==> (s' = s) /\
      !i. (z = HolRes i) ==> (ty = Tyvar i)``,
  Cases \\ FULL_SIMP_TAC (srw_ss())
    [dest_vartype_def,failwith_def,ex_return_def]);

val is_type_thm = store_thm("is_type_thm",
  ``!ty. is_type ty = ?s tys. ty = Tyapp s tys``,
  Cases \\ SIMP_TAC (srw_ss()) [is_type_def]);

val is_vartype_thm = store_thm("is_vartype_thm",
  ``!ty. is_vartype ty = ?s. ty = Tyvar s``,
  Cases \\ SIMP_TAC (srw_ss()) [is_vartype_def]);

val MEM_union = prove(
  ``!xs ys x. MEM x (union xs ys) <=> MEM x xs \/ MEM x ys``,
  Induct \\ FULL_SIMP_TAC std_ss [union_def]
  \\ ONCE_REWRITE_TAC [itlist_def] \\ SRW_TAC [] [insert_def]
  \\ METIS_TAC []);

val tyvars_thm = prove(
  ``!ty s. MEM s (holKernel$tyvars ty) = MEM s (holSyntax$tyvars ty)``,
  HO_MATCH_MP_TAC holKernelTheory.tyvars_ind \\ REPEAT STRIP_TAC
  \\ Cases_on `ty` \\ FULL_SIMP_TAC (srw_ss()) [type_11,type_distinct]
  \\ SIMP_TAC (srw_ss()) [Once holKernelTheory.tyvars_def,
       Once holSyntaxTheory.tyvars_def]
  \\ FULL_SIMP_TAC std_ss [rich_listTheory.FOLDR_MAP]
  \\ Induct_on `l`
  \\ SIMP_TAC (srw_ss()) [Once itlist_def,FOLDR,MEM_union,MEM_LIST_UNION]
  \\ METIS_TAC []);

val type_subst_thm = store_thm("type_subst",
  ``!i ty.
      (type_subst i ty = TYPE_SUBST i ty) /\
      (EVERY (\(x,y). TYPE s x /\ TYPE s y) i /\ TYPE s ty ==>
       TYPE s (type_subst i ty))``,
  HO_MATCH_MP_TAC type_subst_ind \\ STRIP_TAC \\ Cases THEN1
   (SIMP_TAC (srw_ss()) [Once type_subst_def] >>
    SIMP_TAC (srw_ss()) [Once type_subst_def]
    \\ Induct_on `i` \\ TRY Cases \\ ONCE_REWRITE_TAC [rev_assocd_def]
    \\ SIMP_TAC (srw_ss()) [REV_ASSOCD,MAP]
    \\ IF_CASES_TAC \\ FULL_SIMP_TAC std_ss []) >>
  rw[] >> rw[Once type_subst_def] >> rw[] >>
  TRY(
    fs[markerTheory.Abbrev_def] >>
    TRY (match_mp_tac EQ_TRANS >>
         first_assum(match_exists_tac o concl)) >>
    rw[MAP_EQ_f] ) >>
  fs[TYPE_def,type_ok_def,EVERY_MAP,EVERY_MEM])

val mk_fun_ty_thm = store_thm("mk_fun_ty_thm",
  ``!ty1 ty2 s z s'.
      STATE defs s /\ EVERY (TYPE defs) [ty1;ty2] /\
      (mk_fun_ty ty1 ty2 s = (z,s')) ==> (s' = s) /\
      ?i. (z = HolRes i) /\ (i = Tyapp "fun" [ty1;ty2]) /\ TYPE defs i``,
  SIMP_TAC std_ss [mk_fun_ty_def] \\ REPEAT STRIP_TAC
  \\ IMP_RES_TAC mk_type_thm \\ FULL_SIMP_TAC (srw_ss()) []);

(* ------------------------------------------------------------------------- *)
(* Verification of term functions                                            *)
(* ------------------------------------------------------------------------- *)

val _ = temp_overload_on("aty",``(Tyvar "A"):type``);

val get_const_type_thm = prove(
  ``!name s z s'.
      (get_const_type name s = (z,s')) ==> (s' = s) /\
      (!i. (z = HolRes i) ==> MEM (name,i) s.the_term_constants) /\
      (!e. (z = HolErr e) ==> !i. ~(MEM (name,i) s.the_term_constants))``,
  SIMP_TAC (srw_ss()) [get_const_type_def,ex_bind_def,
    get_the_term_constants_def] \\ REPEAT STRIP_TAC
  \\ IMP_RES_TAC assoc_thm);

val term_type_def = Define `
  term_type tm =
    case tm of
      Var _ ty => ty
    | Const _ ty => ty
    | Comb s _ => (case term_type s of Tyapp "fun" (_::ty1::_) => ty1
                                    | _ => Tyvar "")
    | Abs (Var _ ty) t => Tyapp "fun" [ty; term_type t]
    | _ => Tyvar ""`

val term_type = prove(
  ``!defs tm. CONTEXT defs ∧ TERM defs tm ==>
    (term_type tm = typeof tm) /\
    TYPE defs (term_type tm)``,
  ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ STRIP_TAC \\ Induct \\ ONCE_REWRITE_TAC [term_type_def]
  \\ SIMP_TAC (srw_ss()) [typeof_def]
  \\ rw[] >> imp_res_tac TERM >> fs[] >>
  fs[TERM_def,term_ok_def] >> rfs[] >>
  TRY(rw[Once term_type_def]>>NO_TAC)>>
  rw[]>>fs[term_ok_def]>>rw[]>>
  TRY(fs[TYPE_def,type_ok_def]>>NO_TAC)>>
  imp_res_tac CONTEXT_std_sig >>
  fs[TYPE_def,type_ok_def,is_std_sig_def])

val type_of_thm = prove(
  ``!tm. TERM defs tm /\ STATE defs s ==>
         (type_of tm s = (HolRes (term_type tm),s))``,
  HO_MATCH_MP_TAC type_of_ind \\ SIMP_TAC std_ss []
  \\ REPEAT STRIP_TAC \\ FULL_SIMP_TAC std_ss []
  \\ `CONTEXT defs` by fs[STATE_def]
  \\ Cases_on `tm` \\ ONCE_REWRITE_TAC [type_of_def]
  \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def,typeof_def]
  \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss []
  \\ TRY (FULL_SIMP_TAC (srw_ss()) [Once term_type_def] \\ NO_TAC)
  THEN1
   (ONCE_REWRITE_TAC [ex_bind_def]
    \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC (srw_ss()) []
    \\ ONCE_REWRITE_TAC [ex_bind_def]
    \\ FULL_SIMP_TAC (srw_ss()) [dest_type_def]
    \\ REVERSE (`?ty1 ty2. term_type t = Tyapp "fun" [ty1;ty2]` by ALL_TAC) THEN1
     (FULL_SIMP_TAC (srw_ss()) [ex_return_def,codomain_def]
      \\ IMP_RES_TAC TYPE \\ ASM_SIMP_TAC (srw_ss()) [EVERY_DEF,Once term_type_def])
    \\ fs[TERM_def,term_ok_def] >>
    imp_res_tac term_type >> fs[TERM_def])
  \\ IMP_RES_TAC Abs_Var \\ FULL_SIMP_TAC std_ss []
  \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss []
  \\ FULL_SIMP_TAC (srw_ss()) [] \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ ASM_SIMP_TAC (srw_ss()) [Once term_type_def]
  \\ rw[ex_bind_def]
  \\ Cases_on `mk_fun_ty ty (term_type t0) s`
  \\ FULL_SIMP_TAC std_ss []
  \\ `EVERY (TYPE defs) [ty; term_type t0]` by ALL_TAC
  THEN1 FULL_SIMP_TAC std_ss [EVERY_DEF,term_type]
  \\ IMP_RES_TAC mk_fun_ty_thm
  \\ FULL_SIMP_TAC (srw_ss()) [ex_bind_def]);

val alphavars_thm = prove(
  ``!env.
      STATE defs s /\ TERM defs tm1 /\ TERM defs tm2 /\
      EVERY (\(v1,v2). TERM defs v1 /\ TERM defs v2) env ==>
      (alphavars env tm1 tm2 = ALPHAVARS env (tm1, tm2))``,
  Induct \\ SIMP_TAC (srw_ss()) [Once alphavars_def,ALPHAVARS_def]
  \\ Cases \\ FULL_SIMP_TAC (srw_ss()) []
  \\ METIS_TAC []);

val raconv_thm = prove(
  ``!tm1 tm2 env.
      STATE defs s /\ TERM defs tm1 /\ TERM defs tm2 /\
      EVERY (\(v1,v2). TERM defs v1 /\ TERM defs v2) env ==>
      (raconv env tm1 tm2 = RACONV env (tm1, tm2))``,
  Induct THEN1
   (Cases_on `tm2` >> simp[raconv_def,RACONV] >> rw[] >>
    IMP_RES_TAC alphavars_thm)
  THEN1
   (Cases_on `tm2` \\ SIMP_TAC (srw_ss()) [Once raconv_def,RACONV]
    \\ SRW_TAC [] [RACONV,domain_def]
    \\ IMP_RES_TAC TERM
    \\ IMP_RES_TAC Abs_Var
    \\ FULL_SIMP_TAC (srw_ss()) [RACONV,domain_def])
  THEN1
   (Cases_on `tm2` \\ SIMP_TAC (srw_ss()) [Once raconv_def,RACONV]
    \\ SRW_TAC [] [RACONV] \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss []
    \\ imp_res_tac Abs_Var \\ simp[RACONV])
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC Abs_Var
  \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `tm2` \\ SIMP_TAC (srw_ss()) [Once raconv_def,RACONV]
  \\ IMP_RES_TAC Abs_Var
  \\ SRW_TAC [] [RACONV]
  \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss []
  \\ Q.MATCH_ASSUM_RENAME_TAC `TERM defs (Abs (Var s4 ty4) t4)` []
  \\ Q.PAT_ASSUM `!tm2.bbb` (MP_TAC o Q.SPECL
        [`t4`,`((Var s' ty,Var s4 ty4)::env)`])
  \\ FULL_SIMP_TAC std_ss [EVERY_DEF]
  \\ discharge_hyps
  THEN1 (REPEAT STRIP_TAC \\ MATCH_MP_TAC TERM_Var \\ FULL_SIMP_TAC std_ss [])
  \\ REPEAT STRIP_TAC \\ FULL_SIMP_TAC std_ss [])

val aconv_thm = store_thm("aconv_thm",
  ``!tm1 tm2 env.
      STATE defs s /\ TERM defs tm1 /\ TERM defs tm2 ==>
      (aconv tm1 tm2 = ACONV tm1 tm2)``,
  SIMP_TAC std_ss [aconv_def,ACONV_def] \\ REPEAT STRIP_TAC
  \\ IMP_RES_TAC (raconv_thm |> Q.SPECL [`t1`,`t2`,`[]`]
       |> SIMP_RULE std_ss [EVERY_DEF,MAP])
  \\ FULL_SIMP_TAC std_ss []);

val is_term_thm = store_thm("is_term_thm",
  ``(is_var tm = ?n ty. tm = Var n ty) /\
    (is_const tm = ?n ty. tm = Const n ty) /\
    (is_abs tm = ?v x. tm = Abs v x) /\
    (is_comb tm = ?x y. tm = Comb x y)``,
  Cases_on `tm` \\ EVAL_TAC \\ FULL_SIMP_TAC std_ss []);

val mk_var_thm = store_thm("mk_var_thm",
  ``STATE defs s /\ TYPE defs ty ==> TERM defs (mk_var(v,ty))``,
  SIMP_TAC std_ss [mk_var_def] \\ METIS_TAC [TERM_Var]);

val mk_abs_thm = store_thm("mk_abs_thm",
  ``!res.
      TERM defs bvar /\ TERM defs bod /\ (mk_abs(bvar,bod) s = (res,s1)) ==>
      (s1 = s) /\ !t. (res = HolRes t) ==> TERM defs t /\ (t = Abs bvar bod)``,
  FULL_SIMP_TAC std_ss [mk_abs_def] \\ Cases_on `bvar`
  \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def,failwith_def,IMP_TERM_Abs]);

val mk_comb_thm = prove(
  ``TERM defs f /\ TERM defs a /\ STATE defs s /\
    (mk_comb(f,a)s = (res,s1)) ==>
    (s1 = s) /\
    (!t. (res = HolErr t) ==> !ty. term_type f <> Fun (term_type a) ty) /\
    !t. (res = HolRes t) ==> TERM defs t /\ (t = Comb f a)``,
  SIMP_TAC std_ss [mk_comb_def,ex_bind_def] \\ STRIP_TAC
  \\ MP_TAC (type_of_thm |> SIMP_RULE std_ss [] |> Q.SPEC `f`)
  \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC \\ FULL_SIMP_TAC (srw_ss()) []
  \\ MP_TAC (type_of_thm |> SIMP_RULE std_ss [] |> Q.SPEC `a`)
  \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC \\ FULL_SIMP_TAC (srw_ss()) []
  \\ Q.PAT_ASSUM `xxx = (res,s1)` (ASSUME_TAC o GSYM)
  \\ Cases_on `term_type f` \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
  \\ BasicProvers.EVERY_CASE_TAC \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
  \\ FULL_SIMP_TAC (srw_ss()) [failwith_def,ex_return_def]
  \\ IMP_RES_TAC term_type
  \\ IMP_RES_TAC type_of_thm
  \\ FULL_SIMP_TAC (srw_ss()) [TYPE_def]
  \\ Q.PAT_ASSUM `term_type f = Fun h h'` ASSUME_TAC
  \\ Q.PAT_ASSUM `term_type a = h` ASSUME_TAC
  \\ FULL_SIMP_TAC std_ss [MAP]
  \\ METIS_TAC [IMP_TERM_Comb,STATE_def]);

val dest_var_thm = store_thm("dest_var_thm",
  ``TERM defs v /\ STATE defs s ==>
    (dest_var v s = (res,s')) ==>
    (s' = s) /\ !n ty. (res = HolRes (n,ty)) ==> TYPE defs ty``,
  Cases_on `v`
  \\ SIMP_TAC (srw_ss()) [holKernelTheory.dest_var_def,ex_return_def,Once EQ_SYM_EQ,failwith_def]
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM);

val dest_const_thm = store_thm("dest_const_thm",
  ``TERM defs v /\ STATE defs s ==>
    (dest_const v s = (res,s')) ==>
    (s' = s) /\ !n ty. (res = HolRes (n,ty)) ==> TYPE defs ty``,
  Cases_on `v`
  \\ SIMP_TAC (srw_ss()) [dest_const_def,ex_return_def,Once EQ_SYM_EQ,failwith_def]
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM);

val dest_comb_thm = store_thm("dest_comb_thm",
  ``TERM defs v /\ STATE defs s ==>
    (dest_comb v s = (res,s')) ==>
    (s' = s) /\ !x y. (res = HolRes (x,y)) ==> TERM defs x /\ TERM defs y``,
  Cases_on `v`
  \\ SIMP_TAC (srw_ss()) [dest_comb_def,ex_return_def,Once EQ_SYM_EQ,failwith_def]
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM);

val dest_abs_thm = store_thm("dest_abs_thm",
  ``TERM defs v /\ STATE defs s ==>
    (dest_abs v s = (res,s')) ==>
    (s' = s) /\ !x y. (res = HolRes (x,y)) ==> TERM defs x /\ TERM defs y``,
  Cases_on `v`
  \\ SIMP_TAC (srw_ss()) [dest_abs_def,ex_return_def,Once EQ_SYM_EQ,failwith_def]
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC Abs_Var
  \\ FULL_SIMP_TAC std_ss [] \\ IMP_RES_TAC TERM
  \\ IMP_RES_TAC TERM_Var \\ FULL_SIMP_TAC std_ss []);

val rator_thm = store_thm("rator_thm",
  ``TERM defs v /\ STATE defs s ==>
    (rator v s = (res,s')) ==>
    (s' = s) /\ !x. (res = HolRes x) ==> TERM defs x``,
  Cases_on `v`
  \\ SIMP_TAC (srw_ss()) [rator_def,ex_return_def,Once EQ_SYM_EQ,failwith_def]
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM);

val rand_thm = store_thm("rand_thm",
  ``TERM defs v /\ STATE defs s ==>
    (rand v s = (res,s')) ==>
    (s' = s) /\ !x. (res = HolRes x) ==> TERM defs x``,
  Cases_on `v`
  \\ SIMP_TAC (srw_ss()) [rand_def,ex_return_def,Once EQ_SYM_EQ,failwith_def]
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM);

val type_subst_bool = prove(
  ``type_subst i Bool = Bool``,
  SIMP_TAC (srw_ss()) [Once type_subst_def,LET_DEF]);

val type_subst_fun = prove(
  ``type_subst i (Fun ty1 ty2) = Fun (type_subst i ty1) (type_subst i ty2)``,
  SIMP_TAC (srw_ss()) [Once type_subst_def,LET_DEF] \\ SRW_TAC [] []);

val TERM_Const = prove(
  ``STATE defs r /\ MEM (name,a) r.the_term_constants ==>
    TERM defs (Const name a)``,
  rw[STATE_def,TERM_def,term_ok_def] >>
  imp_res_tac CONTEXT_ALL_DISTINCT >>
  qpat_assum`X = Y`(ASSUME_TAC o SYM) >>
  simp[ALOOKUP_MAP] >>
  qpat_assum`ALL_DISTINCT X`mp_tac >>
  simp[Once MAP_MAP_o,combinTheory.o_DEF,UNCURRY,ETA_AX] >>
  strip_tac >>
  imp_res_tac ALOOKUP_ALL_DISTINCT_MEM >>
  simp[] >>
  fs[CONTEXT_def] >>
  imp_res_tac extends_theory_ok >> fs[init_theory_ok] >>
  fs[theory_ok_def] >> first_x_assum MATCH_MP_TAC >>
  MATCH_MP_TAC ALOOKUP_IN_FRANGE >>
  simp[ALOOKUP_MAP] >> METIS_TAC[])

val TERM_Const_type_subst = prove(
  ``EVERY (\(x,y). TYPE defs x /\ TYPE defs y) theta /\
    TERM defs (Const name a) ==> TERM defs (Const name (type_subst theta a))``,
  REPEAT STRIP_TAC \\ IMP_RES_TAC TERM
  \\ IMP_RES_TAC type_subst_thm
  \\ FULL_SIMP_TAC std_ss [type_subst_thm,TERM_def,TYPE_def] >>
  fs[term_ok_def] >>
  conj_tac >- (
    match_mp_tac type_ok_TYPE_SUBST >>
    rfs[EVERY_MAP,EVERY_MEM,FORALL_PROD] >>
    METIS_TAC[] ) >>
  simp[TYPE_SUBST_compose] >>
  METIS_TAC[])

val mk_const_thm = store_thm("mk_const_thm",
  ``!name theta s z s'.
      STATE defs s /\ EVERY (\(x,y). TYPE defs x /\ TYPE defs y) theta /\
      (mk_const (name,theta) s = (z,s')) ==> (s' = s) /\
      !i. (z = HolRes i) ==> TERM defs i``,
  SIMP_TAC std_ss [mk_const_def,try_def,ex_bind_def,otherwise_def]
  \\ NTAC 3 STRIP_TAC \\ Cases_on `get_const_type name s`
  \\ IMP_RES_TAC get_const_type_thm
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [failwith_def,ex_return_def]
  \\ SRW_TAC [] [ex_return_def]
  \\ MATCH_MP_TAC TERM_Const_type_subst \\ FULL_SIMP_TAC std_ss []
  \\ IMP_RES_TAC get_const_type_thm \\ FULL_SIMP_TAC (srw_ss()) []
  \\ IMP_RES_TAC TERM_Const);

val get_const_type_Equal = prove(
  ``STATE defs s ==>
    (get_const_type "=" s = (HolRes (Fun aty (Fun aty Bool)),s))``,
  SIMP_TAC std_ss [STATE_def]
  \\ Cases_on `get_const_type "=" s`
  \\ IMP_RES_TAC get_const_type_thm \\ REPEAT STRIP_TAC >>
  imp_res_tac CONTEXT_std_sig >>
  imp_res_tac CONTEXT_ALL_DISTINCT >>
  qpat_assum`X = Y`(ASSUME_TAC o SYM) >>
  fs[is_std_sig_def] >>
  imp_res_tac ALOOKUP_MEM >>
  fs[MEM_MAP,EXISTS_PROD] >>
  reverse(Cases_on`q`)>>fs[]>-METIS_TAC[]>>
  imp_res_tac ALOOKUP_ALL_DISTINCT_MEM >>
  rfs[MAP_MAP_o,combinTheory.o_DEF,UNCURRY,ETA_AX])

val mk_const_eq = prove(
  ``STATE defs s ==>
    (mk_const ("=",[]) s =
     (HolRes (Const "=" (Fun aty (Fun aty Bool))),s))``,
  SIMP_TAC std_ss [mk_const_def,ex_bind_def,try_def,otherwise_def]
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC get_const_type_Equal
  \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ EVAL_TAC);

val mk_eq_lemma = prove(
  ``inst [(term_type x,aty)] (Const "=" (Fun aty (Fun aty Bool))) s =
    ex_return
        (Const "="
           (Fun (term_type x) (Fun (term_type x) Bool))) s``,
  SIMP_TAC (srw_ss()) [inst_def,inst_aux_def,LET_DEF]
  \\ NTAC 50 (SIMP_TAC (srw_ss()) [Once type_subst_def,LET_DEF,mk_vartype_def,
       rev_assocd_def]) \\ SRW_TAC [] [] \\ METIS_TAC []);

val mk_eq_thm = store_thm("mk_eq_thm",
  ``TERM defs x /\ TERM defs y /\ STATE defs s ==>
    (mk_eq(x,y)s = (res,s')) ==>
    (s' = s) /\
    (!t. (res = HolErr t) ==> ((term_type x) <> (term_type y))) /\
    !t. (res = HolRes t) ==>
    (t = Comb (Comb (Const "=" (Fun (term_type x)
                               (Fun (term_type x) Bool))) x) y) /\
    TERM defs t``,
  STRIP_TAC \\ SIMP_TAC std_ss [mk_eq_def,try_def,ex_bind_def,
    otherwise_def,mk_vartype_def]
  \\ `CONTEXT defs` by fs[STATE_def]
  \\ MP_TAC (type_of_thm |> SIMP_RULE std_ss [] |> Q.SPEC `x`)
  \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC \\ FULL_SIMP_TAC (srw_ss()) []
  \\ IMP_RES_TAC mk_const_eq \\ FULL_SIMP_TAC (srw_ss()) []
  \\ FULL_SIMP_TAC (srw_ss()) [mk_eq_lemma,ex_return_def]
  \\ Cases_on `mk_comb (Const "=" (Fun (term_type x)
                                  (Fun (term_type x) Bool)),x) s`
  \\ `TERM defs (Const "=" (Fun (term_type x)
                           (Fun (term_type x) Bool)))` by ALL_TAC THEN1
   (IMP_RES_TAC term_type >>
    IMP_RES_TAC CONTEXT_std_sig
    \\ FULL_SIMP_TAC (srw_ss()) [TERM_def] >>
    simp[term_ok_def] >> fs[is_std_sig_def,type_ok_def,TYPE_def] >>
    rfs[] >>
    qexists_tac`[(typeof x,Tyvar"A")]` >>
    simp[REV_ASSOCD] )
  \\ Q.ABBREV_TAC `eq = (Const "=" (Fun (term_type x) (Fun (term_type x) Bool)))`
  \\ MP_TAC (mk_comb_thm |> Q.INST [`f`|->`eq`,`a`|->`x`,`res`|->`q`,`s1`|->`r`])
  \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC
  \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ REVERSE (Cases_on `q`) \\ FULL_SIMP_TAC (srw_ss()) [failwith_def] THEN1
   (Q.UNABBREV_TAC `eq` \\ FULL_SIMP_TAC std_ss [mk_comb_def,ex_bind_def]
    \\ IMP_RES_TAC (Q.SPEC `y` type_of_thm)
    \\ Q.PAT_ASSUM `type_of x s = (HolRes (term_type x),s)` ASSUME_TAC
    \\ FULL_SIMP_TAC (srw_ss()) [EVAL ``term_type (Const "=" ty)``,ex_return_def])
  \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `mk_comb (Comb eq x,y) s`
  \\ MP_TAC (mk_comb_thm |> Q.INST [`f`|->`Comb eq x`,`a`|->`y`,
      `res`|->`q`,`s1`|->`r'`])
  \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
  \\ FULL_SIMP_TAC std_ss []
  \\ Q.UNABBREV_TAC `eq` \\ FULL_SIMP_TAC std_ss [mk_comb_def,ex_bind_def]
  \\ IMP_RES_TAC (Q.SPEC `y` type_of_thm)
  \\ Q.PAT_ASSUM `type_of x s = (HolRes (term_type x),s)` ASSUME_TAC
  \\ FULL_SIMP_TAC (srw_ss()) [EVAL ``term_type (Const "=" ty)``,ex_return_def,
         ``term_type (Comb x y)`` |> SIMP_CONV (srw_ss()) [Once term_type_def],
         ``type_of (Comb x y)`` |> SIMP_CONV (srw_ss()) [Once type_of_def],
         ``type_of (Const x y)`` |> SIMP_CONV (srw_ss()) [Once type_of_def],
         ex_bind_def,dest_type_def]);

val TERM_Eq_x = prove(
  ``STATE defs s /\ TERM defs (Comb (Const "=" ty) x) ==>
    (Fun (typeof x) (Fun (typeof x) Bool) = ty)``,
  rw[TERM_def,STATE_def] >>
  fs[term_ok_def] >>
  imp_res_tac CONTEXT_std_sig >>
  fs[is_std_sig_def] >> rw[] >>
  fs[TYPE_SUBST_def])

val TERM_Comb = prove(
  ``CONTEXT defs ⇒
    (TERM defs (Comb f a) <=>
     TERM defs f /\ TERM defs a /\
     ?ty. term_type f = Fun (term_type a) ty)``,
  REPEAT STRIP_TAC \\ EQ_TAC \\ REPEAT STRIP_TAC
  \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss []
  \\ IMP_RES_TAC term_type
  \\ FULL_SIMP_TAC std_ss [TERM_def,WELLTYPED_CLAUSES,term_ok_def]
  \\ METIS_TAC[term_ok_welltyped])

val MAP_EQ_2_SYM = prove(
  ``([x;y] = MAP f l) ⇔ (MAP f l = [x;y])``,METIS_TAC[])

val Equal_type = prove(
  ``STATE defs s ∧ TERM defs (Const "=" ty) ==> ?a. ty = Fun a (Fun a Bool)``,
  rw[STATE_def,TERM_def] >>
  imp_res_tac CONTEXT_std_sig >>
  fs[is_std_sig_def,term_ok_def])

val Equal_type_IMP = prove(
  ``STATE defs s ∧ TERM defs (Comb (Const "=" (Fun a' (Fun a' Bool))) ll) ==>
    (typeof ll = a')``,
  simp[TERM_Comb] >> strip_tac >>
  imp_res_tac TERM_Eq_x >>
  fs[Once term_type_def] >>
  rw[] >> imp_res_tac term_type >> simp[])

val dest_eq_thm = store_thm("dest_eq_thm",
  ``TERM defs tm /\ STATE defs s /\ (dest_eq tm s = (res, s')) ==>
    (s' = s) /\ !t1 t2. (res = HolRes (t1,t2)) ==> TERM defs t1 /\ TERM defs t2 /\
    (tm = Comb (Comb (Equal (typeof t1)) t1) t2)``,
  ONCE_REWRITE_TAC [EQ_SYM_EQ] \\ SIMP_TAC std_ss [dest_eq_def]
  \\ BasicProvers.EVERY_CASE_TAC
  \\ FULL_SIMP_TAC (srw_ss()) [failwith_def,ex_return_def]
  \\ SRW_TAC [] [] \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss []
  \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss []
  \\ IMP_RES_TAC TERM_Eq_x);

val MEM_term_union = prove(
  ``!l1 l2 x. MEM x (term_union l1 l2) ==> MEM x l1 \/ MEM x l2``,
  Induct \\ ONCE_REWRITE_TAC [term_union_def] \\ SIMP_TAC (srw_ss()) [LET_DEF]
  \\ SRW_TAC [] [] \\ RES_TAC \\ FULL_SIMP_TAC std_ss []);

val term_union_thm = prove(
  ``!l l'.
      EVERY (TERM defs) l /\ EVERY (TERM defs) l' /\ STATE defs s ==>
      (term_union l l' = TERM_UNION l l')``,
  Induct \\ SIMP_TAC (srw_ss()) [TERM_UNION_def,MAP,Once term_union_def,LET_DEF]
  \\ REPEAT STRIP_TAC
  \\ `EXISTS (aconv h) (term_union l l') =
      EXISTS (ACONV h) (TERM_UNION l l')` by
        ALL_TAC THEN1
   (RES_TAC \\ POP_ASSUM (K ALL_TAC)
    \\ POP_ASSUM (fn th => SIMP_TAC std_ss [Once (GSYM th)])
    \\ SIMP_TAC std_ss [EXISTS_MEM,MEM_MAP,PULL_EXISTS]
    \\ REPEAT STRIP_TAC \\ EQ_TAC \\ REPEAT STRIP_TAC
    \\ IMP_RES_TAC MEM_term_union
    \\ FULL_SIMP_TAC std_ss [EVERY_MEM] \\ RES_TAC
    \\ METIS_TAC [aconv_thm])
  \\ FULL_SIMP_TAC std_ss [] \\ SRW_TAC [] []);

val vfree_in_thm = prove(
  ``!y. TERM defs y /\ TYPE defs ty /\ STATE defs s ==>
        (VFREE_IN (Var name ty) y = vfree_in (Var name ty) y)``,
  Induct THEN1
   (FULL_SIMP_TAC std_ss [VFREE_IN_def,term_11]
    \\ ONCE_REWRITE_TAC [vfree_in_def] \\ SIMP_TAC (srw_ss()) []
    \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM
    \\ METIS_TAC [])
  THEN1
   (FULL_SIMP_TAC std_ss [VFREE_IN_def,term_11] \\ SRW_TAC [] []
    \\ FULL_SIMP_TAC std_ss [VFREE_IN_def,term_11,term_distinct]
    \\ ONCE_REWRITE_TAC [vfree_in_def] \\ SIMP_TAC (srw_ss()) [])
  THEN1
   (REPEAT STRIP_TAC \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss []
    \\ FULL_SIMP_TAC std_ss [VFREE_IN_def] \\ REPEAT STRIP_TAC
    \\ ONCE_REWRITE_TAC [EQ_SYM_EQ] \\ SIMP_TAC (srw_ss()) [Once vfree_in_def])
  THEN1
   (REPEAT STRIP_TAC \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss []
    \\ FULL_SIMP_TAC std_ss [VFREE_IN_def] \\ REPEAT STRIP_TAC
    \\ ONCE_REWRITE_TAC [EQ_SYM_EQ] \\ SIMP_TAC (srw_ss()) [Once vfree_in_def]
    \\ IMP_RES_TAC Abs_Var
    \\ FULL_SIMP_TAC (srw_ss()) [VFREE_IN_def]
    \\ IMP_RES_TAC TERM
    \\ FULL_SIMP_TAC std_ss []
    \\ METIS_TAC []));

val VFREE_IN_IMP = prove(
  ``!y. TERM defs y /\ TYPE defs ty /\ STATE defs s /\
        VFREE_IN (Var name ty) y ==>
        vfree_in (Var name ty) y``,
  METIS_TAC [vfree_in_thm]);

val SELECT_LEMMA = prove(
  ``(@f. !s s'. f (s',s) <=> s <> t) = (\(z,y). y <> t)``,
  Q.ABBREV_TAC `p = (@f. !s s'. f (s',s) <=> s <> t)`
  \\ `?f. !s s'. f (s',s) <=> s <> t` by ALL_TAC
  THEN1 (Q.EXISTS_TAC `(\(z,y). y <> t)` \\ FULL_SIMP_TAC std_ss [])
  \\ `!s s'. p (s',s) <=> s <> t` by METIS_TAC []
  \\ FULL_SIMP_TAC std_ss [FUN_EQ_THM,FORALL_PROD]);

val SELECT_LEMMA2 = prove(
  ``(@f.
       !s s''.
         f (s'',s) <=>
         VFREE_IN (Var s' ty) s'' /\ VFREE_IN s tm') =
    (\(x,y). VFREE_IN (Var s' ty) x /\ VFREE_IN y tm')``,
  Q.ABBREV_TAC `p = (@f. !s s''. f (s'',s) <=>
         VFREE_IN (Var s' ty) s'' /\ VFREE_IN s tm')`
  \\ `?f. !s s''. f (s'',s) <=>
         VFREE_IN (Var s' ty) s'' /\ VFREE_IN s tm'` by ALL_TAC
  THEN1 (Q.EXISTS_TAC `(\(s'',s). VFREE_IN (Var s' ty) s'' /\
                VFREE_IN s tm')` \\ FULL_SIMP_TAC std_ss [])
  \\ `!s s''. p (s'',s) <=> VFREE_IN (Var s' ty) s'' /\
                            VFREE_IN s tm'` by METIS_TAC []
  \\ FULL_SIMP_TAC std_ss [FUN_EQ_THM,FORALL_PROD]);

val is_var_thm = prove(
  ``!x. is_var x = ?v ty. x = Var v ty``,
  Cases \\ FULL_SIMP_TAC (srw_ss()) [is_var_def]);

val VSUBST_EMPTY = prove(
  ``(!tm. holSyntax$VSUBST [] tm = tm)``,
  Induct
  \\ FULL_SIMP_TAC (srw_ss()) [VSUBST_def,REV_ASSOCD,EVERY_DEF,FILTER,LET_THM]);

val variant_thm = prove(
  ``!xs v x name.
      TERM defs x /\ TYPE defs ty /\ STATE defs s /\
      (xs = [x]) /\ (v = (Var name ty)) ==>
      (variant xs (Var name ty) =
       Var (VARIANT x name ty) ty)``,
  REWRITE_TAC [VARIANT_def] \\ HO_MATCH_MP_TAC variant_ind
  \\ SIMP_TAC std_ss [] \\ REPEAT STRIP_TAC
  \\ ASM_SIMP_TAC (srw_ss()) [Once variant_def,EXISTS_DEF]
  \\ MP_TAC (Q.SPEC `x` vfree_in_thm) \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC
  \\ FULL_SIMP_TAC (srw_ss()) [EXISTS_DEF]
  \\ REVERSE (Cases_on `vfree_in (Var name ty) x`)
  \\ FULL_SIMP_TAC (srw_ss()) [] THEN1
   (MP_TAC (VARIANT_PRIMES_def |> Q.SPECL [`x`,`name`,`ty`])
    \\ Cases_on `VARIANT_PRIMES x name ty`
    THEN1 FULL_SIMP_TAC (srw_ss()) [rich_listTheory.REPLICATE]
    \\ REPEAT STRIP_TAC \\ POP_ASSUM (MP_TAC o Q.SPEC `0`)
    \\ FULL_SIMP_TAC (srw_ss()) [rich_listTheory.REPLICATE])
  \\ MP_TAC (VARIANT_PRIMES_def |> Q.SPECL [`x`,`name`,`ty`])
  \\ Cases_on `VARIANT_PRIMES x name ty`
  \\ FULL_SIMP_TAC (srw_ss()) [rich_listTheory.REPLICATE]
  \\ REPEAT STRIP_TAC
  \\ `!m. m < n ==>
         VFREE_IN (Var (STRCAT name (REPLICATE (SUC m) #"'")) ty) x` by ALL_TAC
  THEN1 (REPEAT STRIP_TAC \\ `SUC m < SUC n` by DECIDE_TAC \\ RES_TAC \\ FULL_SIMP_TAC std_ss [REPLICATE_GENLIST])
  \\ FULL_SIMP_TAC (srw_ss()) [REPLICATE_GENLIST,GENLIST_CONS]
  \\ MP_TAC (VARIANT_PRIMES_def |> Q.SPECL [`x`,`STRCAT name "'"`,`ty`])
  \\ FULL_SIMP_TAC std_ss [GSYM APPEND_ASSOC,APPEND]
  \\ Cases_on `VARIANT_PRIMES x (STRCAT name "'") (ty) = n`
  \\ FULL_SIMP_TAC std_ss []
  \\ REPEAT STRIP_TAC
  \\ `VARIANT_PRIMES x (STRCAT name "'") ty < n \/
      n < VARIANT_PRIMES x (STRCAT name "'") ty` by DECIDE_TAC
  \\ RES_TAC \\ FULL_SIMP_TAC std_ss [])
  |> SIMP_RULE std_ss [] |> SPEC_ALL;

val EXISTS_union = prove(
  ``!xs ys. EXISTS P (union xs ys) <=> EXISTS P xs \/ EXISTS P ys``,
  SIMP_TAC std_ss [EXISTS_MEM,MEM_MAP,MEM_union] \\ METIS_TAC []);

val VFREE_IN_TYPE = prove(
  ``!x. VFREE_IN (Var name oty) x /\ TERM defs x ==>
        ?ty. (oty = ty) /\ TYPE defs ty``,
  Induct
  THEN1 (SIMP_TAC std_ss [VFREE_IN_def,term_11] \\ METIS_TAC [TERM])
  THEN1 (SRW_TAC [] [VFREE_IN_def,term_11,term_distinct])
  THEN1 (SIMP_TAC std_ss [VFREE_IN_def,term_11]
         \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM \\ METIS_TAC [])
  \\ SIMP_TAC std_ss [VFREE_IN_def,term_11] \\ STRIP_TAC
  \\ IMP_RES_TAC Abs_Var \\ FULL_SIMP_TAC std_ss [] \\ POP_ASSUM (K ALL_TAC)
  \\ IMP_RES_TAC TERM
  \\ FULL_SIMP_TAC std_ss [VFREE_IN_def] \\ METIS_TAC []);

val VFREE_IN_IMP_MEM = prove(
  ``VFREE_IN (Var name oty) h0 /\ TERM defs h0 /\ STATE defs s ==>
    ?ty1. MEM (Var name ty1) (frees h0) /\ (oty = ty1) /\ TYPE defs ty1``,
  Induct_on `h0` THEN1 (Q.SPEC_TAC (`oty`,`oty`)
    \\ FULL_SIMP_TAC (srw_ss()) [VFREE_IN_def,term_11,Once frees_def]
    \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss [])
  THEN1 (SRW_TAC [] [VFREE_IN_def,term_11,Once frees_def,term_distinct])
  THEN1 (SIMP_TAC (srw_ss()) [Once frees_def,MEM_union,VFREE_IN_def]
         \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM \\ METIS_TAC [])
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC Abs_Var
  \\ FULL_SIMP_TAC std_ss [] \\ POP_ASSUM (K ALL_TAC) \\ IMP_RES_TAC TERM
  \\ FULL_SIMP_TAC std_ss [VFREE_IN_def]
  \\ SIMP_TAC (srw_ss()) [Once frees_def,MEM_union,VFREE_IN_def]
  \\ SIMP_TAC (srw_ss()) [subtract_def,MEM_FILTER]
  \\ IMP_RES_TAC VFREE_IN_TYPE \\ FULL_SIMP_TAC std_ss []
  \\ fs[])

val MEM_frees_EQ = prove(
  ``!a x. MEM x (frees a) = ?n ty. (x = Var n ty) /\ MEM (Var n ty) (frees a)``,
  Induct \\ SIMP_TAC (srw_ss()) [Once frees_def,MEM_union]
  THEN1 (SIMP_TAC (srw_ss()) [Once frees_def,MEM_union])
  THEN1 (SIMP_TAC (srw_ss()) [Once frees_def,MEM_union])
  \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ SIMP_TAC (srw_ss()) [Once frees_def,MEM_union] THEN1 (METIS_TAC [])
  \\ SIMP_TAC (srw_ss()) [subtract_def,MEM_FILTER]
  \\ REPEAT STRIP_TAC \\ EQ_TAC \\ REPEAT STRIP_TAC \\ METIS_TAC []);

val variant_alt = prove(
  ``!xs v x name a.
      TERM defs a /\ TYPE defs (type_subst theta ty) /\ STATE defs s /\
      (xs = frees a) /\
      (v = (Var name (type_subst theta ty))) ==>
      (variant (frees a) (Var name (type_subst theta ty)) =
       Var (VARIANT a name (type_subst theta ty))
              (type_subst theta ty))``,
  REWRITE_TAC [VARIANT_def] \\ HO_MATCH_MP_TAC variant_ind
  \\ SIMP_TAC std_ss [] \\ REPEAT STRIP_TAC
  \\ ASM_SIMP_TAC (srw_ss()) [Once variant_def,EXISTS_DEF]
  \\ Q.ABBREV_TAC `ty1 = type_subst theta ty` \\ POP_ASSUM (K ALL_TAC)
  \\ `EXISTS (vfree_in (Var name ty1)) (frees a) =
      VFREE_IN (Var name ty1) a` by ALL_TAC THEN1
   (Q.PAT_ASSUM `TERM defs a` MP_TAC \\ Q.PAT_ASSUM `TYPE defs ty1` MP_TAC
    \\ Q.MATCH_ASSUM_RENAME_TAC `STATE defs st` []
    \\ Q.PAT_ASSUM `STATE defs st ` MP_TAC \\ REPEAT (POP_ASSUM (K ALL_TAC))
    \\ Induct_on `a` \\ SIMP_TAC (srw_ss()) [Once frees_def,Once vfree_in_def]
    THEN1 (REPEAT STRIP_TAC \\ IMP_RES_TAC TERM
      \\ FULL_SIMP_TAC std_ss [EXISTS_union,VFREE_IN_def])
    \\ REPEAT STRIP_TAC \\ IMP_RES_TAC Abs_Var
    \\ FULL_SIMP_TAC std_ss [] \\ POP_ASSUM (K ALL_TAC)
    \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss [VFREE_IN_def]
    \\ FIRST_X_ASSUM (fn th => FULL_SIMP_TAC std_ss [SYM th])
    \\ FULL_SIMP_TAC (srw_ss()) [EXISTS_MEM,subtract_def,MEM_FILTER,PULL_EXISTS]
    \\ ONCE_REWRITE_TAC [MEM_frees_EQ]
    \\ FULL_SIMP_TAC std_ss [term_11,PULL_EXISTS]
    \\ ONCE_REWRITE_TAC [vfree_in_def] \\ FULL_SIMP_TAC (srw_ss()) []
    \\ METIS_TAC [])
  \\ FULL_SIMP_TAC std_ss []
  \\ REVERSE (Cases_on `VFREE_IN (Var name ty1) a`) THEN1
   (MP_TAC (VARIANT_PRIMES_def |> Q.SPECL [`a`,`name`,`ty1`])
    \\ Cases_on `VARIANT_PRIMES a name ty1`
    THEN1 FULL_SIMP_TAC (srw_ss()) [rich_listTheory.REPLICATE]
    \\ REPEAT STRIP_TAC \\ POP_ASSUM (MP_TAC o Q.SPEC `0`)
    \\ FULL_SIMP_TAC (srw_ss()) [rich_listTheory.REPLICATE])
  \\ MP_TAC (VARIANT_PRIMES_def |> Q.SPECL [`a`,`name`,`ty1`])
  \\ Cases_on `VARIANT_PRIMES a name ty1`
  \\ FULL_SIMP_TAC (srw_ss()) [rich_listTheory.REPLICATE]
  \\ REPEAT STRIP_TAC
  \\ POP_ASSUM (ASSUME_TAC o Q.GEN `m` o SIMP_RULE std_ss [] o Q.SPEC `SUC m`)
  \\ MP_TAC (VARIANT_PRIMES_def |> Q.SPECL [`a`,`STRCAT name "'"`,`ty1`])
  \\ FULL_SIMP_TAC std_ss [GSYM APPEND_ASSOC,APPEND]
  \\ Q.ABBREV_TAC `k = VARIANT_PRIMES a (STRCAT name "'") ty1`
  \\ FULL_SIMP_TAC (srw_ss()) [REPLICATE_GENLIST,GENLIST_CONS]
  \\ Cases_on `k = n` \\ FULL_SIMP_TAC std_ss []
  \\ REPEAT STRIP_TAC
  \\ `k < n \/ n < k` by DECIDE_TAC
  \\ RES_TAC \\ FULL_SIMP_TAC std_ss [])
  |> SIMP_RULE std_ss [] |> SPEC_ALL;

val term_type_Var = prove(
  ``term_type (Var v ty) = ty``,
  SIMP_TAC (srw_ss()) [Once term_type_def]);

val vsubst_aux_thm = prove(
  ``!t tm theta. EVERY (\(t1,t2). TERM defs t1 /\ TERM defs t2 /\
                     (term_type t1 = term_type t2) /\ is_var t2) theta /\
    TERM defs tm /\ STATE defs s /\
    (vsubst_aux theta tm = t) ==>
    TERM defs t /\
    (t = VSUBST theta tm)``,
  SIMP_TAC std_ss [] \\ Induct THEN1
   (NTAC 4 STRIP_TAC \\ SIMP_TAC (srw_ss()) [Once vsubst_aux_def]
    \\ SIMP_TAC (srw_ss()) [Once vsubst_aux_def,VSUBST_def]
    \\ Induct_on `theta` \\ FULL_SIMP_TAC std_ss []
    \\ ONCE_REWRITE_TAC [rev_assocd_def]
    \\ FULL_SIMP_TAC (srw_ss()) [EVERY_DEF,REV_ASSOCD]
    \\ Cases \\ FULL_SIMP_TAC (srw_ss()) [REV_ASSOCD_def]
    \\ Cases_on `r = Var s' h` \\ FULL_SIMP_TAC std_ss []
    \\ rw[] \\ fs[] \\ METIS_TAC[])
  THEN1
   (NTAC 4 STRIP_TAC \\ SIMP_TAC (srw_ss()) [Once vsubst_aux_def]
    \\ SIMP_TAC (srw_ss()) [Once vsubst_aux_def,VSUBST_def]
    \\ SRW_TAC [] [VSUBST_def])
  THEN1
   (STRIP_TAC \\ REPEAT (Q.PAT_ASSUM `!theta. bbb` (ASSUME_TAC o SPEC_ALL))
    \\ ONCE_REWRITE_TAC [vsubst_aux_def] \\ SIMP_TAC (srw_ss()) [LET_DEF]
    \\ FULL_SIMP_TAC std_ss [VSUBST_def,term_11]
    \\ REVERSE (REPEAT STRIP_TAC)
    \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss []
    \\ FULL_SIMP_TAC std_ss [TERM_def,term_ok_def]
    \\ SIMP_TAC std_ss [GSYM VSUBST_def]
    \\ MATCH_MP_TAC VSUBST_WELLTYPED
    \\ FULL_SIMP_TAC std_ss [MEM_MAP,PULL_EXISTS,FORALL_PROD,EVERY_MEM]
    \\ REPEAT STRIP_TAC \\ RES_TAC \\ FULL_SIMP_TAC std_ss [is_var_thm]
    \\ FULL_SIMP_TAC (srw_ss()) [term_11]
    \\ FULL_SIMP_TAC std_ss [EVAL ``term_type (Var v ty)``]
    \\ rw[]
    \\ fs[STATE_def]
    \\ IMP_RES_TAC (REWRITE_RULE [TERM_def] term_type)
    \\ METIS_TAC[WELLTYPED,term_ok_welltyped])
  \\ STRIP_TAC
  \\ ONCE_REWRITE_TAC [vsubst_aux_def] \\ SIMP_TAC (srw_ss()) [LET_DEF]
  \\ STRIP_TAC \\ IMP_RES_TAC Abs_Var
  \\ FULL_SIMP_TAC (srw_ss()) [is_var_def]
  \\ Cases_on `FILTER (\(t,x). x <> Var s' ty) theta = []`
  \\ FULL_SIMP_TAC std_ss [] THEN1
   (SIMP_TAC std_ss [REWRITE_RULE[SELECT_LEMMA]VSUBST_def,LET_THM]
    \\ `(FILTER (\(z,y). y <> Var s' ty) theta) = []` by ALL_TAC THEN1
     (POP_ASSUM MP_TAC \\ REPEAT (POP_ASSUM (K ALL_TAC))
      \\ Induct_on `theta` \\ FULL_SIMP_TAC std_ss [MAP,FILTER]
      \\ Cases \\ FULL_SIMP_TAC std_ss [MAP,FILTER]
      \\ Cases_on `r = Var s' ty` \\ FULL_SIMP_TAC std_ss []
      \\ FULL_SIMP_TAC (srw_ss()) [])
    \\ FULL_SIMP_TAC (srw_ss()) [VSUBST_EMPTY])
  \\ REVERSE (Cases_on `EXISTS (\(t,x). vfree_in (Var s' ty) t /\ vfree_in x tm')
       (FILTER (\(t,x). x <> Var s' ty) theta)`) THEN1
   (IMP_RES_TAC TERM \\ IMP_RES_TAC TERM_Var \\ FULL_SIMP_TAC std_ss [] >>
    simp[TERM_Abs] >>
    simp[VSUBST_def] >>
    BasicProvers.CASE_TAC >- (
      fs[EXISTS_MEM,EVERY_MEM,MEM_FILTER,FORALL_PROD,EXISTS_PROD,MEM_MAP] >>
      rpt BasicProvers.VAR_EQ_TAC >>
      qmatch_assum_rename_tac`VFREE_IN (Var x ty) pm`[] >>
      qmatch_assum_rename_tac`VFREE_IN qm pm2`[] >>
      first_x_assum(qspecl_then[`pm`,`qm`]mp_tac) >>
      discharge_hyps >- (
        simp[] >> spose_not_then STRIP_ASSUME_TAC >> fs[] ) >>
      strip_tac >- METIS_TAC[vfree_in_thm] >>
      first_x_assum(qspecl_then[`pm`,`qm`]mp_tac) >>
      Cases_on`qm`>>simp[]>>strip_tac>>fs[term_type_Var] >>
      METIS_TAC[vfree_in_thm,TERM] ) >>
    Q.PAT_ABBREV_TAC`thet = FILTER P theta` >>
    first_x_assum(qspec_then`thet`mp_tac)>>
    discharge_hyps >- (
      fs[EVERY_MEM,Abbr`thet`,MEM_FILTER,FORALL_PROD]>>
      rw[]>>METIS_TAC[])>>
    rw[Abbr`thet`] >>
    AP_THM_TAC >> AP_TERM_TAC >>
    simp[rich_listTheory.FILTER_MAP] >>
    AP_TERM_TAC >>
    simp[rich_listTheory.FILTER_EQ,FORALL_PROD] >>
    fs[EVERY_MEM,FORALL_PROD] >>
    strip_tac >> Cases >> strip_tac >> res_tac >> fs[] >>
    METIS_TAC[] ) >>
  simp[] >>
  `TERM defs (vsubst_aux (FILTER (\(t,x). x <> Var s' ty) theta) tm') /\
      TYPE defs ty` by
   (IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss []
    \\ FIRST_X_ASSUM (MP_TAC o Q.SPEC `FILTER (\(t,x). x <> Var s' ty) theta`)
    \\ FULL_SIMP_TAC std_ss [EVERY_MEM,MEM_FILTER])
  \\ IMP_RES_TAC variant_thm \\ FULL_SIMP_TAC std_ss []
  \\ POP_ASSUM (K ALL_TAC) \\ POP_ASSUM (K ALL_TAC)
  \\ FULL_SIMP_TAC std_ss []
  \\ `(vsubst_aux (FILTER (\ (t,x). x <> Var s' ty) theta) tm') =
      (VSUBST
       (FILTER ( \ (z,y). y <> Var s' ty) theta) tm')` by
   (Q.PAT_ASSUM `!theta.bbb` (MP_TAC o
        Q.SPEC `FILTER (\(t,x). x <> Var s' ty) theta`)
    \\ MATCH_MP_TAC IMP_IMP \\ STRIP_TAC THEN1
     (IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss []
      \\ FULL_SIMP_TAC std_ss [EVERY_MEM,MEM_FILTER,PULL_EXISTS])
    \\ REPEAT STRIP_TAC \\ FULL_SIMP_TAC std_ss []
    \\ AP_THM_TAC \\ AP_TERM_TAC
    \\ Q.PAT_ASSUM `EVERY PP xx` MP_TAC
    \\ Q.SPEC_TAC (`theta`,`xs`) \\ Induct
    \\ SIMP_TAC std_ss [MEM,FILTER,MAP] \\ Cases
    \\ FULL_SIMP_TAC std_ss [EVERY_DEF] \\ STRIP_TAC
    \\ SRW_TAC [] []
    \\ METIS_TAC [TERM_def])
  \\ FULL_SIMP_TAC std_ss [TERM_Abs]
  \\ Q.PAT_ABBREV_TAC `theta1 = (FOO::FILTER (\(t,x). x <> Var s' ty) theta)`
  \\ Q.PAT_ASSUM `!xx.bbb` (MP_TAC o Q.SPEC `theta1`)
  \\ MATCH_MP_TAC IMP_IMP \\ STRIP_TAC THEN1
   (Q.UNABBREV_TAC `theta1` \\ IMP_RES_TAC TERM_Var_SIMP
    \\ FULL_SIMP_TAC std_ss [EVERY_DEF]
    \\ FULL_SIMP_TAC (srw_ss()) [EVERY_MEM,MEM_FILTER,PULL_EXISTS]
    \\ ONCE_REWRITE_TAC [term_type_def] \\ SIMP_TAC (srw_ss()) [])
  \\ SIMP_TAC std_ss [VSUBST_def,LET_THM]
  \\ REPEAT STRIP_TAC \\ FULL_SIMP_TAC std_ss []
  \\ FULL_SIMP_TAC std_ss [SELECT_LEMMA2]
  \\ reverse BasicProvers.CASE_TAC >- (
      fs[EXISTS_MEM,EVERY_MEM,MEM_FILTER,FORALL_PROD,EXISTS_PROD,MEM_MAP] >>
      rpt BasicProvers.VAR_EQ_TAC >>
      qmatch_assum_rename_tac`vfree_in (Var x ty) pm`[] >>
      qmatch_assum_rename_tac`vfree_in qm pm2`[] >>
      last_x_assum(qspecl_then[`pm`,`qm`]mp_tac) >> simp[] >>
      strip_tac >>
      first_x_assum(qspecl_then[`pm`,`qm`]mp_tac) >>
      discharge_hyps >- (
        conj_tac >- (
          spose_not_then STRIP_ASSUME_TAC >>
          Cases_on`qm`>>fs[] >>
          METIS_TAC[] ) >>
        METIS_TAC[] ) >>
      Cases_on`qm`>>fs[] >>
      METIS_TAC[vfree_in_thm,TERM] ) >>
  qunabbrev_tac`theta1` >>
  Q.PAT_ABBREV_TAC`vv = holSyntax$VARIANT A B Z` >>
  simp[])

val forall_thm = prove(
  ``!f s (xs:(term # term) list). (forall f xs s = (res,s')) ==>
    (!x. ?r. f x s = (r,s)) ==>
    (s' = s) /\ ((res = HolRes T) ==> EVERY (\x. FST (f x s) = HolRes T) xs)``,
  STRIP_TAC \\ STRIP_TAC
  \\ Induct \\ ASM_SIMP_TAC (srw_ss()) [Once forall_def,ex_return_def,ex_bind_def]
  \\ STRIP_TAC \\ Cases_on `f h s` \\ SIMP_TAC std_ss [Once EQ_SYM_EQ]
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [] \\ STRIP_TAC \\ STRIP_TAC
  \\ `r = s` by METIS_TAC [PAIR,PAIR_EQ] \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `a` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ REPEAT STRIP_TAC \\ FULL_SIMP_TAC std_ss [] \\ METIS_TAC [FST,PAIR]);

val assoc_state = prove(
  ``!xs x. ?r. assoc x xs s = (r,s)``,
  Induct \\ ONCE_REWRITE_TAC [assoc_def] \\ TRY Cases
  \\ FULL_SIMP_TAC (srw_ss()) [failwith_def,ex_return_def] \\ SRW_TAC [] []);

val type_of_state = prove(
  ``!tm. ?r. type_of tm s = (r,s)``,
  HO_MATCH_MP_TAC type_of_ind \\ REPEAT STRIP_TAC
  \\ SIMP_TAC std_ss [Once type_of_def] \\ Cases_on `tm`
  \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def,failwith_def,ex_bind_def]
  THEN1
   (TRY (Cases_on `r`) \\ FULL_SIMP_TAC (srw_ss()) [dest_type_def]
    \\ TRY (Cases_on `a`)
    \\ FULL_SIMP_TAC (srw_ss()) [dest_type_def,failwith_def,ex_return_def]
    \\ Cases_on `l` \\ FULL_SIMP_TAC (srw_ss()) []
    \\ Cases_on `t` \\ FULL_SIMP_TAC (srw_ss()) []
    \\ Cases_on `t'` \\ FULL_SIMP_TAC (srw_ss()) [])
  \\ TRY (Cases_on `t`) \\ FULL_SIMP_TAC (srw_ss()) [dest_type_def]
  \\ TRY (Cases_on `r`) \\ FULL_SIMP_TAC (srw_ss()) [dest_type_def]
  \\ FULL_SIMP_TAC (srw_ss()) [mk_fun_ty_def,mk_type_def,ex_bind_def,
        try_def,otherwise_def,get_type_arity_def,
        get_the_type_constants_def,failwith_def,ex_return_def]
  \\ STRIP_ASSUME_TAC (assoc_state |> ISPEC ``s.the_type_constants``
        |> ISPEC ``"fun"``) \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `r` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ SRW_TAC [] []);

val vsubst_thm = store_thm("vsubst_thm",
  ``EVERY (\(t1,t2). TERM defs t1 /\ TERM defs t2) theta /\
    TERM defs tm /\ STATE defs s /\
    (vsubst theta tm s = (res, s')) ==>
    (s' = s) /\ !t. (res = HolRes t) ==> TERM defs t /\
    (t = VSUBST  theta tm) /\
    (EVERY (\(p_1,p_2). ?x ty. (p_2 = Var x ty) /\
                               (p_1) has_type ty) theta)``,
  ONCE_REWRITE_TAC [EQ_SYM_EQ] \\ SIMP_TAC std_ss [vsubst_def]
  \\ Cases_on `theta = []`
  \\ FULL_SIMP_TAC (srw_ss()) [MAP,VSUBST_EMPTY,ex_return_def,ex_bind_def]
  \\ Q.PAT_ABBREV_TAC `test = (\(t,x) state.
        case type_of t state of
          (HolRes ty,state) =>
            (case dest_var x state of
               (HolRes vty,state) => (HolRes (ty = SND vty),state)
             | (HolErr e,state) => (HolErr e,state))
        | (HolErr e,state) => (HolErr e,state))`
  \\ Cases_on `forall test theta s`
  \\ MP_TAC (forall_thm |> Q.SPECL [`test`,`s`,`theta`] |> Q.GENL [`res`,`s'`])
  \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `TERM defs tm /\ STATE defs s` \\ FULL_SIMP_TAC std_ss []
  \\ MATCH_MP_TAC IMP_IMP \\ STRIP_TAC THEN1
   (Q.UNABBREV_TAC `test` \\ FULL_SIMP_TAC std_ss [FORALL_PROD]
    \\ REPEAT STRIP_TAC \\ STRIP_ASSUME_TAC (Q.SPEC `p_1` type_of_state)
    \\ Cases_on `r'` \\ FULL_SIMP_TAC (srw_ss()) []
    \\ Cases_on `p_2`
    \\ FULL_SIMP_TAC (srw_ss()) [holKernelTheory.dest_var_def,ex_return_def,failwith_def])
  \\ STRIP_TAC
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ Cases_on `a` \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
  \\ STRIP_TAC \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ `EVERY
       (\(t1,t2).
          TERM defs t1 /\ TERM defs t2 /\
          (term_type t1 = term_type t2) /\ is_var t2) theta` by ALL_TAC THEN1
   (FULL_SIMP_TAC std_ss [EVERY_MEM,FORALL_PROD] \\ NTAC 3 STRIP_TAC \\ RES_TAC
    \\ FULL_SIMP_TAC std_ss []
    \\ Q.UNABBREV_TAC `test`
    \\ FULL_SIMP_TAC std_ss []
    \\ IMP_RES_TAC type_of_thm
    \\ FULL_SIMP_TAC (srw_ss()) [holKernelTheory.dest_var_def]
    \\ Cases_on `p_2`
    \\ FULL_SIMP_TAC (srw_ss()) [holKernelTheory.dest_var_def,ex_return_def,failwith_def,is_var_def]
    \\ SIMP_TAC (srw_ss()) [Once term_type_def])
  \\ IMP_RES_TAC (vsubst_aux_thm |> SIMP_RULE std_ss [])
  \\ FULL_SIMP_TAC std_ss []
  \\ FULL_SIMP_TAC std_ss [EVERY_MEM,FORALL_PROD] \\ REPEAT STRIP_TAC \\ RES_TAC
  \\ Cases_on `p_2` \\ FULL_SIMP_TAC (srw_ss()) [is_var_def,term_11]
  \\ IMP_RES_TAC term_type
  \\ FULL_SIMP_TAC std_ss [TERM_def,typeof_def]
  \\ FULL_SIMP_TAC std_ss [WELLTYPED,term_type_Var] >>
  rfs[STATE_def] >>
  rw[] >> METIS_TAC [WELLTYPED,term_ok_welltyped])

val inst_aux_Var = prove(
  ``inst_aux [] theta (Var v ty) state =
      (HolRes (Var v (type_subst theta ty)),state)``,
  SIMP_TAC (srw_ss()) [Once inst_aux_def,rev_assocd_thm,REV_ASSOCD,
       LET_DEF,ex_return_def] \\ METIS_TAC []);

val MEM_subtract = prove(
  ``!xs ys x. MEM x (subtract xs ys) <=> MEM x xs /\ ~MEM x ys``,
  FULL_SIMP_TAC std_ss [subtract_def,MEM_FILTER,MEM] \\ METIS_TAC []);

val MEM_frees = prove(
  ``!tm y. TERM defs tm /\ MEM y (frees tm) ==>
           ?v ty. (y = Var v ty) /\ TYPE defs ty``,
  Induct \\ SIMP_TAC (srw_ss()) [Once frees_def]
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC Abs_Var \\ FULL_SIMP_TAC std_ss []
  \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss [MEM_union,MEM_subtract]);

val inst_aux_thm = prove(
  ``!env theta tm s s' res.
      EVERY (\(t1,t2). TYPE defs t1 /\ TYPE defs t2) theta /\
      EVERY (\(t1,t2). TERM defs t1 /\ TERM defs t2) env /\
      TERM defs tm /\ STATE defs s /\
      (inst_aux env theta tm s = (res, s')) ==>
      STATE defs s' /\
      case res of
      | HolRes t => (INST_CORE env theta tm = Result t)
      | HolErr v => (INST_CORE env theta tm = Clash s'.the_clash_var)``,
  HO_MATCH_MP_TAC inst_aux_ind \\ NTAC 4 STRIP_TAC \\ Cases_on `tm`
  \\ FULL_SIMP_TAC (srw_ss()) []
  THEN1
   (simp[inst_aux_def,INST_CORE_def,rev_assocd_thm] >>
    `(if type_subst theta t = t then Var s t
      else Var s (type_subst theta t)) = Var s (type_subst theta t)` by METIS_TAC [] >>
    simp[] >> POP_ASSUM (K ALL_TAC)
    \\ FULL_SIMP_TAC (srw_ss()) [GSYM type_subst_thm,ex_return_def] >>
    rw[] >> rw[] >> fs[ex_bind_def,set_the_clash_var_def,failwith_def] >> rw[] >>
    fs[STATE_def]
    \\ MATCH_MP_TAC (TERM_Var |> GEN_ALL)
    \\ FULL_SIMP_TAC std_ss [TYPE_def,type_subst_thm]
    \\ MATCH_MP_TAC type_ok_TYPE_SUBST \\ IMP_RES_TAC TERM
    \\ FULL_SIMP_TAC std_ss [TYPE_def]
    \\ FULL_SIMP_TAC std_ss [TYPE_def,
             EVERY_MEM,FORALL_PROD,MEM_MAP,PULL_EXISTS] \\ METIS_TAC [])
  THEN1
   (ONCE_REWRITE_TAC [inst_aux_def] \\ SIMP_TAC (srw_ss()) [LET_DEF,ex_return_def]
    \\ NTAC 4 STRIP_TAC
    \\ `(res = HolRes (Const s (type_subst theta t))) /\ (s' = s'')` by ALL_TAC
    THEN1 (Cases_on `type_subst theta t = t` \\ FULL_SIMP_TAC std_ss [])
    \\ FULL_SIMP_TAC (srw_ss()) []
    \\ SIMP_TAC std_ss [INST_CORE_def,type_subst_thm])
  THEN1
   (ONCE_REWRITE_TAC [inst_aux_def]
    \\ FULL_SIMP_TAC (srw_ss()) [LET_DEF,ex_return_def,ex_bind_def]
    \\ NTAC 4 STRIP_TAC \\ Cases_on `inst_aux env theta t s`
    \\ REVERSE (Cases_on `q`) \\ FULL_SIMP_TAC (srw_ss()) [] THEN1
     (Q.PAT_ASSUM `HolErr xx = res` (ASSUME_TAC o GSYM)
      \\ FULL_SIMP_TAC (srw_ss()) []
      \\ ONCE_REWRITE_TAC [INST_CORE_def] \\ IMP_RES_TAC TERM
      \\ FULL_SIMP_TAC std_ss []
      \\ FIRST_X_ASSUM (MP_TAC o Q.SPEC `s`)
      \\ FULL_SIMP_TAC (srw_ss()) [IS_CLASH_def,LET_THM])
    \\ Cases_on `inst_aux env theta t0 r`
    \\ REVERSE (Cases_on `q`) \\ FULL_SIMP_TAC (srw_ss()) [] THEN1
     (Q.PAT_ASSUM `HolErr xx = res` (ASSUME_TAC o GSYM)
      \\ FULL_SIMP_TAC (srw_ss()) []
      \\ ONCE_REWRITE_TAC [INST_CORE_def] \\ IMP_RES_TAC TERM
      \\ FULL_SIMP_TAC std_ss []
      \\ FIRST_X_ASSUM (MP_TAC o Q.SPEC `s`)
      \\ FULL_SIMP_TAC (srw_ss()) [IS_CLASH_def]
      \\ FIRST_X_ASSUM (MP_TAC o Q.SPEC `r`)
      \\ FULL_SIMP_TAC (srw_ss()) [IS_CLASH_def,LET_THM])
    THEN1
     (Q.PAT_ASSUM `HolRes xx = res` (ASSUME_TAC o GSYM)
      \\ FULL_SIMP_TAC (srw_ss()) []
      \\ ONCE_REWRITE_TAC [INST_CORE_def] \\ IMP_RES_TAC TERM
      \\ FULL_SIMP_TAC std_ss []
      \\ FIRST_X_ASSUM (MP_TAC o Q.SPEC `s`)
      \\ FULL_SIMP_TAC (srw_ss()) [IS_CLASH_def]
      \\ FIRST_X_ASSUM (MP_TAC o Q.SPEC `r`)
      \\ FULL_SIMP_TAC (srw_ss()) [IS_CLASH_def,RESULT_def,LET_THM]))
  \\ SIMP_TAC (srw_ss()) [Once inst_aux_def]
  \\ SIMP_TAC std_ss [GSYM AND_IMP_INTRO] \\ NTAC 7 STRIP_TAC
  \\ IMP_RES_TAC Abs_Var
  \\ Q.MATCH_ASSUM_RENAME_TAC `h = Var v ty` []
  \\ FULL_SIMP_TAC std_ss []
  \\ SIMP_TAC (srw_ss()) [Once inst_aux_def]
  \\ `!ty'. (if ty' = ty then Var v ty else Var v ty') = Var v ty'` by METIS_TAC []
  \\ FULL_SIMP_TAC std_ss [rev_assocd_thm,REV_ASSOCD,LET_DEF,ex_return_def]
  \\ SIMP_TAC (srw_ss()) [ex_bind_def,otherwise_def]
  \\ Cases_on `inst_aux ((Var v ty,Var v (type_subst theta ty))::env) theta t0 s`
  \\ Q.PAT_ASSUM `!x yy.bbb` (K ALL_TAC)
  \\ first_x_assum(MP_TAC o Q.SPECL
       [`((Var v ty,Var v (type_subst theta ty))::env)`,`s`])
  \\ FULL_SIMP_TAC std_ss []
  \\ MATCH_MP_TAC IMP_IMP \\ STRIP_TAC THEN1
   (IMP_RES_TAC TERM \\ IMP_RES_TAC TERM_Var \\ FULL_SIMP_TAC std_ss [EVERY_DEF]
    \\ MATCH_MP_TAC TERM_Var \\ FULL_SIMP_TAC std_ss []
    \\ FULL_SIMP_TAC std_ss [TYPE_def,type_subst_thm]
    \\ MATCH_MP_TAC type_ok_TYPE_SUBST
    \\ FULL_SIMP_TAC std_ss [MEM_MAP,EXISTS_PROD,PULL_EXISTS,FORALL_PROD,
         EVERY_MEM] \\ METIS_TAC [])
  \\ STRIP_TAC
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [] THEN1
   (Q.SPEC_TAC (`res`,`res`) \\ FULL_SIMP_TAC (srw_ss()) []
    \\ SIMP_TAC std_ss [INST_CORE_def,LET_THM]
    \\ FULL_SIMP_TAC std_ss [type_subst_thm,IS_RESULT_def,RESULT_def]
    \\ REPEAT STRIP_TAC \\ FULL_SIMP_TAC std_ss [] >> simp[])
  \\ FULL_SIMP_TAC (srw_ss()) [get_the_clash_var_def,failwith_def]
  \\ Cases_on `r.the_clash_var <> Var v (type_subst theta ty)`
  \\ `(r.the_clash_var = Var v (type_subst theta ty)) =
      (r.the_clash_var = Var v (TYPE_SUBST theta ty))` by ALL_TAC THEN1
   (SIMP_TAC std_ss [GSYM type_subst_thm])
  \\ FULL_SIMP_TAC (srw_ss()) [] THEN1
   (Q.SPEC_TAC (`res`,`res`) \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
    \\ STRIP_TAC \\ FULL_SIMP_TAC std_ss []
    \\ SIMP_TAC std_ss [INST_CORE_def,LET_THM]
    \\ FULL_SIMP_TAC std_ss [type_subst_thm,IS_RESULT_def,CLASH_def] >> simp[])
  THEN1 (FULL_SIMP_TAC std_ss [type_subst_thm])
  \\ SIMP_TAC (srw_ss()) [inst_aux_Var,``dest_var (Var v ty) state``
        |> SIMP_CONV (srw_ss()) [holKernelTheory.dest_var_def,ex_return_def]]
  \\ Q.ABBREV_TAC `fresh_name = (VARIANT
                (RESULT (INST_CORE [] theta (t0))) v
                (TYPE_SUBST theta ty))`
  \\ Q.PAT_ASSUM `!x y. bbb` (MP_TAC o Q.SPEC `r`)
  \\ IMP_RES_TAC TERM
  \\ Cases_on `inst_aux [] theta t0 r` \\ FULL_SIMP_TAC std_ss []
  \\ STRIP_TAC \\ REVERSE (Cases_on `q`) THEN1
   (FULL_SIMP_TAC (srw_ss()) []
    \\ MP_TAC (INST_CORE_LEMMA |> Q.SPECL [`theta`,`t0`])
    \\ MATCH_MP_TAC IMP_IMP \\ STRIP_TAC
    THEN1 (FULL_SIMP_TAC std_ss [TERM_def] >> METIS_TAC[term_ok_welltyped])
    \\ STRIP_TAC \\ FULL_SIMP_TAC std_ss [result_distinct])
  \\ FULL_SIMP_TAC (srw_ss()) []
  \\ Q.MATCH_ASSUM_RENAME_TAC `inst_aux [] theta h0 r = (HolRes a,r1)` []
  \\ `(variant (frees a) (Var v (type_subst theta ty))) =
      Var fresh_name (type_subst theta ty)` by ALL_TAC THEN1
   (FULL_SIMP_TAC std_ss [GSYM type_subst_thm,RESULT_def]
    \\ Q.UNABBREV_TAC `fresh_name`
    \\ MATCH_MP_TAC variant_alt \\ FULL_SIMP_TAC std_ss []
    \\ REVERSE STRIP_TAC THEN1
     (IMP_RES_TAC TERM
      \\ FULL_SIMP_TAC std_ss [TYPE_def,type_subst_thm]
      \\ MATCH_MP_TAC type_ok_TYPE_SUBST
      \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss [TYPE_def,
             EVERY_MEM,FORALL_PROD,MEM_MAP,PULL_EXISTS] \\ METIS_TAC [])
    \\ FULL_SIMP_TAC std_ss [TERM_def]
    \\ qmatch_assum_abbrev_tac`INST_CORE [] tyin tm = Result rr`
    \\ `rr = RESULT (INST_CORE [] tyin tm)` by rw[] >> pop_assum SUBST1_TAC
    \\ MATCH_MP_TAC term_ok_INST_CORE
    \\ simp[Abbr`tyin`,EVERY_MAP,EVERY_MEM,FORALL_PROD] >>
       fs[EVERY_MEM,TYPE_def,FORALL_PROD]
    \\ REPEAT STRIP_TAC \\ RES_TAC)
  \\ FULL_SIMP_TAC std_ss []
  \\ SIMP_TAC (srw_ss()) [inst_aux_Var,``dest_var (Var v ty) state``
        |> SIMP_CONV (srw_ss()) [holKernelTheory.dest_var_def,ex_return_def]]
  \\ Q.PAT_ASSUM `!x y z.bbb` (MP_TAC o Q.SPECL
       [`fresh_name`,`ty`,`(type_subst theta ty)`,`r1`])
  \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `inst_aux ((Var fresh_name ty,
                  Var fresh_name (type_subst theta ty))::env) theta
       (vsubst_aux [(Var fresh_name ty,Var v ty)] h0) r1`
  \\ SIMP_TAC std_ss []
  \\ MATCH_MP_TAC IMP_IMP \\ STRIP_TAC THEN1
   (FULL_SIMP_TAC std_ss [EVERY_DEF] \\ REPEAT STRIP_TAC
    \\ TRY (MATCH_MP_TAC TERM_Var) \\ IMP_RES_TAC TERM
    \\ FULL_SIMP_TAC std_ss [] THEN1
     (FULL_SIMP_TAC std_ss [TYPE_def,type_subst_thm]
      \\ MATCH_MP_TAC type_ok_TYPE_SUBST
      \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss [TYPE_def,
             EVERY_MEM,FORALL_PROD,MEM_MAP,PULL_EXISTS] \\ METIS_TAC [])
    \\ (vsubst_aux_thm |> SIMP_RULE std_ss []
     |> Q.SPECL [`tm`,`[Var v ty,Var y ty]`]
     |> SIMP_RULE std_ss [EVERY_DEF,MAP]
     |> UNDISCH_ALL |> CONJUNCT1 |> DISCH_ALL |> MP_CANON |> MATCH_MP_TAC)
    \\ ONCE_REWRITE_TAC [term_type_def]
    \\ FULL_SIMP_TAC (srw_ss()) [is_var_def]
    \\ REPEAT STRIP_TAC
    \\ TRY (MATCH_MP_TAC TERM_Var) \\ IMP_RES_TAC TERM
    \\ FULL_SIMP_TAC std_ss [])
  \\ STRIP_TAC
  \\ FULL_SIMP_TAC std_ss [type_subst_thm]
  \\ SIMP_TAC std_ss [INST_CORE_def,LET_THM]
  \\ FULL_SIMP_TAC std_ss [type_subst_thm,IS_RESULT_def,CLASH_def]
  \\ FULL_SIMP_TAC std_ss [GSYM type_subst_thm]
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ Q.SPEC_TAC (`res`,`res`) \\ FULL_SIMP_TAC (srw_ss()) []
  \\ STRIP_TAC \\ FULL_SIMP_TAC std_ss []
  \\ `((vsubst_aux [(Var fresh_name ty,Var v ty)] h0)) =
      (VSUBST [(Var fresh_name (ty),Var v (ty))] (h0))` by
   ((vsubst_aux_thm |> SIMP_RULE std_ss []
     |> Q.SPECL [`tm`,`[Var v ty,Var y ty]`]
     |> SIMP_RULE std_ss [EVERY_DEF,MAP]
     |> UNDISCH_ALL |> CONJUNCT2 |> DISCH_ALL |> MP_CANON |> MATCH_MP_TAC)
    \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC (srw_ss()) [is_var_def]
    \\ ONCE_REWRITE_TAC [term_type_def] \\ SIMP_TAC (srw_ss()) []
    \\ REPEAT STRIP_TAC \\ MATCH_MP_TAC TERM_Var \\ FULL_SIMP_TAC std_ss [])
  \\ FULL_SIMP_TAC std_ss [IS_RESULT_def,RESULT_def])

val inst_lemma = prove(
  ``EVERY (\(t1,t2). TYPE defs t1 /\ TYPE defs t2) theta /\
    TERM defs tm /\ STATE defs s /\
    (inst theta tm s = (res, s')) ==>
    STATE defs s' /\ !t. (res = HolRes t) ==>
    (t = INST theta (tm))``,
  SIMP_TAC std_ss [INST_def,inst_def] \\ Cases_on `theta = []`
  \\ ASM_SIMP_TAC std_ss [MAP,EVERY_DEF,ex_return_def] THEN1
   (Q.SPEC_TAC (`res`,`res`) \\ SIMP_TAC (srw_ss()) []
    \\ FULL_SIMP_TAC std_ss [TERM_def]
    \\ REPEAT STRIP_TAC \\ FULL_SIMP_TAC std_ss []
    \\ imp_res_tac term_ok_welltyped
    \\ IMP_RES_TAC INST_CORE_HAS_TYPE
    \\ POP_ASSUM (MP_TAC o Q.SPECL [`[]`,`[]`])
    \\ FULL_SIMP_TAC std_ss [MEM,REV_ASSOCD]
    \\ REPEAT STRIP_TAC \\ FULL_SIMP_TAC std_ss [RESULT_def]
    \\ FULL_SIMP_TAC std_ss [INST_CORE_EMPTY,result_11,RESULT_def])
  \\ REPEAT STRIP_TAC
  \\ IMP_RES_TAC (inst_aux_thm |> Q.SPECL [`[]`,`theta`]
                  |> SIMP_RULE std_ss [EVERY_DEF,MAP])
  \\ REPEAT (Q.PAT_ASSUM `!x.bbb` (K ALL_TAC))
  \\ FULL_SIMP_TAC std_ss [TERM_def] >> imp_res_tac term_ok_welltyped
  \\ IMP_RES_TAC INST_CORE_HAS_TYPE
  \\ POP_ASSUM (MP_TAC o Q.SPECL
       [`(MAP (\(t1,t2). (hol_ty t1,hol_ty t2)) theta)`,`[]`])
  \\ FULL_SIMP_TAC std_ss [MEM,REV_ASSOCD] \\ REPEAT STRIP_TAC
  \\ FULL_SIMP_TAC std_ss [MAP,RESULT_def,result_distinct,result_11]
  \\ Cases_on `res` \\ FULL_SIMP_TAC (srw_ss()) [])

val inst_thm = store_thm("inst_thm",
  ``EVERY (\(t1,t2). TYPE defs t1 /\ TYPE defs t2) theta /\
    TERM defs tm /\ STATE defs s /\
    (inst theta tm s = (res, s')) ==>
    STATE defs s' /\ !t. (res = HolRes t) ==> TERM defs t /\
    (t = INST theta (tm))``,
  REPEAT STRIP_TAC \\ IMP_RES_TAC inst_lemma
  \\ FULL_SIMP_TAC std_ss [TERM_def] >> imp_res_tac term_ok_welltyped
  \\ IMP_RES_TAC INST_CORE_LEMMA
  \\ SIMP_TAC std_ss [INST_def]
  \\ POP_ASSUM (MP_TAC o Q.SPEC `theta`)
  \\ STRIP_TAC
  \\ MATCH_MP_TAC term_ok_INST_CORE
  \\ FULL_SIMP_TAC std_ss [MEM_MAP,PULL_EXISTS,FORALL_PROD,EVERY_MEM]
  \\ FULL_SIMP_TAC std_ss [EVERY_MEM,TYPE_def,FORALL_PROD,MEM,IS_RESULT_def]
  \\ METIS_TAC [])

val freesin_IMP = prove(
  ``!rhs vars.
       freesin vars rhs /\ TERM defs rhs /\ VFREE_IN (Var x ty) (rhs) ==>
       MEM (Var x ty) vars``,
  Induct \\ SIMP_TAC (srw_ss()) [Once freesin_def]
  THEN1 (REPEAT STRIP_TAC \\ IMP_RES_TAC TERM
         \\ FULL_SIMP_TAC std_ss [CLOSED_def,VFREE_IN_def])
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC Abs_Var
  \\ FULL_SIMP_TAC std_ss [] \\ POP_ASSUM (K ALL_TAC)
  \\ FULL_SIMP_TAC std_ss [CLOSED_def,VFREE_IN_def]
  \\ IMP_RES_TAC TERM
  \\ FIRST_X_ASSUM (MP_TAC o Q.SPEC `(Var s ty'::vars)`)
  \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC
  \\ FULL_SIMP_TAC std_ss [MEM]
  \\ FULL_SIMP_TAC (srw_ss()) [term_11]);

val ALL_DISTINCT_union = prove(
  ``!xs. ALL_DISTINCT (holKernel$union xs ys) = ALL_DISTINCT ys``,
  Induct \\ SIMP_TAC (srw_ss()) [union_def,Once itlist_def,insert_def]
  \\ SRW_TAC [] [] \\ FULL_SIMP_TAC std_ss [union_def]);

val ALL_DISTINCT_tyvars_ALT = prove(
  ``!h. ALL_DISTINCT (tyvars (h:type))``,
  HO_MATCH_MP_TAC type_IND \\ REPEAT STRIP_TAC
  \\ SIMP_TAC (srw_ss()) [Once holKernelTheory.tyvars_def]
  \\ Induct_on `l` \\ SIMP_TAC (srw_ss()) [Once itlist_def,MAP]
  \\ FULL_SIMP_TAC std_ss [ALL_DISTINCT_union]);

val ALL_DISTINCT_type_vars_in_term = prove(
  ``!P. ALL_DISTINCT (type_vars_in_term P)``,
  Induct \\ SIMP_TAC (srw_ss()) [Once type_vars_in_term_def]
  \\ FULL_SIMP_TAC std_ss [tyvars_ALL_DISTINCT,ALL_DISTINCT_union]
  \\ FULL_SIMP_TAC std_ss [ALL_DISTINCT_tyvars_ALT]);

val MEM_type_vars_in_term = prove(
  ``!rhs v. TERM defs rhs ==>
            (MEM v (type_vars_in_term rhs) = MEM v (tvars rhs))``,
  Induct
  \\ SIMP_TAC (srw_ss()) [Once type_vars_in_term_def,tvars_def,tyvars_thm]
  THEN1 (FULL_SIMP_TAC std_ss [MEM_union,MEM_LIST_UNION] \\ REPEAT STRIP_TAC
    \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss [])
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC Abs_Var
  \\ FULL_SIMP_TAC std_ss [] \\ POP_ASSUM (K ALL_TAC)
  \\ IMP_RES_TAC TERM \\ FULL_SIMP_TAC std_ss [MEM_union,
       tvars_def,MEM_LIST_UNION]
  \\ IMP_RES_TAC TERM_Var \\ FULL_SIMP_TAC std_ss [pred_setTheory.IN_UNION]);

val QSORT_type_vars_in_term = prove(
  ``TERM defs P ==>
    (QSORT $<= (type_vars_in_term P) = STRING_SORT (tvars P))``,
  REPEAT STRIP_TAC \\
  MATCH_MP_TAC (MP_CANON sortingTheory.SORTED_PERM_EQ) \\
  qexists_tac`$<=` >>
  conj_asm1_tac >- (
    simp[relationTheory.transitive_def,relationTheory.antisymmetric_def,stringTheory.string_le_def] >>
    METIS_TAC[stringTheory.string_lt_antisym,stringTheory.string_lt_trans] ) >>
  conj_tac >- (
    MATCH_MP_TAC sortingTheory.QSORT_SORTED >>
    simp[relationTheory.total_def,stringTheory.string_le_def] >>
    METIS_TAC[stringTheory.string_lt_cases] ) >>
  conj_tac >- (
    MATCH_MP_TAC sortingTheory.SORTED_weaken >>
    qexists_tac`$<` >>
    simp[STRING_SORT_SORTED,stringTheory.string_le_def] ) >>
  MATCH_MP_TAC (MP_CANON sortingTheory.PERM_ALL_DISTINCT) >>
  conj_tac >- (
    METIS_TAC[sortingTheory.ALL_DISTINCT_PERM
             ,sortingTheory.QSORT_PERM
             ,ALL_DISTINCT_type_vars_in_term] ) >>
  simp[ALL_DISTINCT_STRING_SORT] >>
  METIS_TAC[sortingTheory.QSORT_MEM,MEM_type_vars_in_term])

(* ------------------------------------------------------------------------- *)
(* Verification of thm functions                                             *)
(* ------------------------------------------------------------------------- *)

val dest_thm_thm = store_thm("dest_thm_thm",
  ``THM defs th /\ STATE defs s /\ (dest_thm th = (asl, c)) ==>
    EVERY (TERM defs) asl /\ TERM defs c``,
  REPEAT STRIP_TAC \\ Cases_on `th` \\ IMP_RES_TAC THM
  \\ FULL_SIMP_TAC std_ss [dest_thm_def] \\ METIS_TAC []);

val hyp_thm = store_thm("hyp_thm",
  ``THM defs th /\ STATE defs s /\ (hyp th = asl) ==>
    EVERY (TERM defs) asl``,
  REPEAT STRIP_TAC \\ Cases_on `th` \\ IMP_RES_TAC THM
  \\ FULL_SIMP_TAC std_ss [hyp_def] \\ METIS_TAC []);

val concl_thm = store_thm("concl_thm",
  ``THM defs th /\ STATE defs s /\ (concl th = c) ==>
    TERM defs c``,
  REPEAT STRIP_TAC \\ Cases_on `th` \\ IMP_RES_TAC THM
  \\ FULL_SIMP_TAC std_ss [concl_def] \\ METIS_TAC []);

val REFL_thm = store_thm("REFL_thm",
  ``TERM defs tm /\ STATE defs s /\ (REFL tm s = (res, s')) ==>
    (s' = s) /\ !th. (res = HolRes th) ==> THM defs th``,
  SIMP_TAC std_ss [REFL_def,ex_bind_def] \\ Cases_on `mk_eq(tm,tm) s`
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC mk_eq_thm
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ Q.PAT_ASSUM `xxx = th` (ASSUME_TAC o GSYM)
  \\ FULL_SIMP_TAC (srw_ss()) [THM_def,domain_def] >>
  rw[] >>
  fs[STATE_def] >> rw[] >> imp_res_tac term_type
  \\ simp[GSYM equation_def]
  \\ MATCH_MP_TAC(List.nth(CONJUNCTS proves_rules,8)) >>
  fs[CONTEXT_def,TERM_def] >>
  METIS_TAC[extends_theory_ok,init_theory_ok])

val TRANS_thm = store_thm("TRANS_thm",
  ``THM defs th1 /\ THM defs th2 /\ STATE defs s /\
    (TRANS th1 th2 s = (res, s')) ==>
    (s' = s) /\ !th. (res = HolRes th) ==> THM defs th``,
  Cases_on `th1` \\ Cases_on `th2` \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ SIMP_TAC std_ss [TRANS_def]
  \\ BasicProvers.EVERY_CASE_TAC
  \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
  \\ SRW_TAC [] [ex_bind_def] \\ IMP_RES_TAC THM
  \\ Q.MATCH_ASSUM_RENAME_TAC `TERM defs (Comb (Comb (Const "=" h1) ll) m1)` []
  \\ POP_ASSUM MP_TAC
  \\ Q.MATCH_ASSUM_RENAME_TAC `TERM defs (Comb (Comb (Const "=" h2) m2) rr)` []
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM \\ Cases_on `mk_eq (ll,rr) s`
  \\ MP_TAC (mk_eq_thm |> Q.INST [`x`|->`ll`,`y`|->`rr`,`res`|->`q`,`s'`|->`r`])
  \\ FULL_SIMP_TAC std_ss [] \\ IMP_RES_TAC TERM
  \\ FULL_SIMP_TAC std_ss [] \\ REPEAT STRIP_TAC
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ FULL_SIMP_TAC std_ss [THM_def]
  \\ MP_TAC (aconv_thm |> Q.SPECL [`m1`,`m2`] |> SIMP_RULE std_ss [])
  \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC >>
  rpt(qpat_assum`H |- C`mp_tac) >>
  imp_res_tac term_union_thm >> simp[] >>
  `CONTEXT defs` by fs[STATE_def] >>
  imp_res_tac term_type >>
  rpt (BasicProvers.VAR_EQ_TAC) >>
  fs[] >>
  imp_res_tac Equal_type >> fs[] >>
  imp_res_tac Equal_type_IMP >>
  ntac 2 (pop_assum(mp_tac o SYM)) >>
  simp[GSYM equation_def] >> rw[] >>
  MATCH_MP_TAC(List.nth(CONJUNCTS proves_rules,9)) >>
  METIS_TAC[])

val MK_COMB_thm = store_thm("MK_COMB_thm",
  ``THM defs th1 /\ THM defs th2 /\ STATE defs s /\
    (MK_COMB (th1,th2) s = (res, s')) ==>
    (s' = s) /\ !th. (res = HolRes th) ==> THM defs th``,
  Cases_on `th1` \\ Cases_on `th2` \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ SIMP_TAC std_ss [MK_COMB_def]
  \\ BasicProvers.EVERY_CASE_TAC
  \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
  \\ SRW_TAC [] [ex_bind_def] \\ IMP_RES_TAC THM
  \\ Q.MATCH_ASSUM_RENAME_TAC `TERM defs (Comb (Comb (Const "=" h1) f1) f2)` []
  \\ POP_ASSUM MP_TAC
  \\ Q.MATCH_ASSUM_RENAME_TAC `TERM defs (Comb (Comb (Const "=" h2) x1) x2)` []
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM
  \\ Cases_on `mk_comb (f1,x1) s`
  \\ MP_TAC (mk_comb_thm |> Q.INST [`f`|->`f1`,`a`|->`x1`,`res`|->`q`,`s1`|->`r`])
  \\ FULL_SIMP_TAC std_ss [] \\ IMP_RES_TAC TERM
  \\ FULL_SIMP_TAC std_ss [] \\ REPEAT STRIP_TAC
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ Cases_on `mk_comb (f2,x2) s`
  \\ MP_TAC (mk_comb_thm |> Q.INST [`f`|->`f2`,`a`|->`x2`,`res`|->`q`,`s1`|->`r'`])
  \\ FULL_SIMP_TAC std_ss [] \\ REPEAT STRIP_TAC
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ Cases_on `mk_eq (Comb f1 x1,Comb f2 x2) s`
  \\ MP_TAC (mk_eq_thm |> Q.INST [`x`|->`Comb f1 x1`,
         `y`|->`Comb f2 x2`,`res`|->`q`,`s'`|->`r''`])
  \\ FULL_SIMP_TAC std_ss [] \\ REPEAT STRIP_TAC
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ FULL_SIMP_TAC std_ss [THM_def] >>
  rpt(qpat_assum`H |- C`mp_tac) >>
  imp_res_tac term_union_thm >> simp[] >>
  `CONTEXT defs` by fs[STATE_def] >>
  imp_res_tac term_type >>
  rpt (BasicProvers.VAR_EQ_TAC) >>
  fs[] >>
  imp_res_tac Equal_type >> fs[] >>
  imp_res_tac Equal_type_IMP >>
  ntac 2 (pop_assum(mp_tac o SYM)) >>
  `codomain (typeof (f1)) = typeof (Comb (f1) (x1))` by simp[] >>
  pop_assum SUBST1_TAC >> simp_tac std_ss [GSYM equation_def] >>
  rw[] >>
  MATCH_MP_TAC(List.nth(CONJUNCTS proves_rules,7)) >>
  qpat_assum`TERM x (Comb f1 x1)`mp_tac >> simp[TERM_Comb] >> strip_tac >>
  fs[TERM_def] >> imp_res_tac term_ok_welltyped >> simp[])

val ABS_thm = store_thm("ABS_thm",
  ``TERM defs tm /\ THM defs th1 /\ STATE defs s /\
    (ABS tm th1 s = (res, s')) ==>
    (s' = s) /\ !th. (res = HolRes th) ==> THM defs th``,
  Cases_on `th1` \\ SIMP_TAC std_ss [ABS_def] \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ Cases_on `t` \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
  \\ Cases_on `t'` \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
  \\ Cases_on `t` \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
  \\ FULL_SIMP_TAC std_ss [ex_bind_def]
  \\ Cases_on `s'' = "="` \\ FULL_SIMP_TAC (srw_ss()) [] \\ SRW_TAC [] []
  \\ TRY (
      POP_ASSUM MP_TAC \\
      NTAC 3 BasicProvers.CASE_TAC \\
      STRIP_TAC \\
      FULL_SIMP_TAC std_ss [] \\
      NO_TAC)
  \\ Q.MATCH_ASSUM_RENAME_TAC
       `THM defs (Sequent l (Comb (Comb (Const "=" h) t1) t2))` []
  \\ Cases_on `mk_abs (tm,t1) s` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ MP_TAC (mk_abs_thm |> Q.SPECL [`q`] |> Q.INST [`bvar`|->`tm`,
       `bod`|->`t1`,`s1`|->`r`])
  \\ IMP_RES_TAC THM \\ IMP_RES_TAC TERM \\ IMP_RES_TAC TERM
  \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ Cases_on `mk_abs (tm,t2) s` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ MP_TAC (mk_abs_thm |> Q.SPECL [`q`] |> Q.INST [`bvar`|->`tm`,
       `bod`|->`t2`,`s1`|->`r'`])
  \\ FULL_SIMP_TAC std_ss [] \\ REPEAT STRIP_TAC \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM
  \\ Cases_on `mk_eq (Abs tm t1,Abs tm t2) s`
  \\ MP_TAC (mk_eq_thm |> Q.INST [`x`|->`Abs tm t1`,`y`|->`Abs tm t2`,
                                  `res`|->`q`,`s'`|->`r''`])
  \\ FULL_SIMP_TAC std_ss [] \\ REPEAT STRIP_TAC
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ FULL_SIMP_TAC std_ss [THM_def]
  >> rpt(qpat_assum`H |- C`mp_tac) >>
  imp_res_tac term_union_thm >> simp[] >>
  `CONTEXT defs` by fs[STATE_def] >>
  imp_res_tac term_type >>
  rpt (BasicProvers.VAR_EQ_TAC) >>
  fs[] >>
  imp_res_tac Equal_type >> fs[] >>
  `typeof (Abs tm t1) = Fun (typeof tm) (typeof t1)` by simp[] >>
  pop_assum(SUBST1_TAC o SYM) >>
  simp[GSYM equation_def] >>
  imp_res_tac Abs_Var >>
  rw[] >>
  MATCH_MP_TAC(List.nth(CONJUNCTS proves_rules,0)) >>
  fs[EVERY_MAP,EVERY_MEM,PULL_EXISTS,TYPE_def,term_type_Var] >>
  imp_res_tac Equal_type_IMP >>
  reverse conj_tac >- METIS_TAC[equation_def] >>
  REPEAT STRIP_TAC \\ RES_TAC
  \\ IMP_RES_TAC TERM \\ IMP_RES_TAC VFREE_IN_IMP)

val BETA_thm = store_thm("BETA_thm",
  ``TERM defs tm /\ STATE defs s /\
    (BETA tm s = (res, s')) ==>
    (s' = s) /\ !th. (res = HolRes th) ==> THM defs th``,
  SIMP_TAC std_ss [BETA_def] \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ Cases_on `tm` \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
  \\ Cases_on `t` \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
  \\ SRW_TAC [] [ex_bind_def,ex_return_def]
  \\ IMP_RES_TAC TERM \\ IMP_RES_TAC Abs_Var
  \\ FULL_SIMP_TAC std_ss []
  \\ Q.MATCH_ASSUM_RENAME_TAC `t2 = Var name ty` [] \\ POP_ASSUM (K ALL_TAC)
  \\ Q.MATCH_ASSUM_RENAME_TAC `TERM defs (Abs (Var name ty) bod)` []
  \\ Cases_on `mk_eq (Comb (Abs (Var name ty) bod) (Var name ty),bod) s`
  \\ IMP_RES_TAC TERM
  \\ MP_TAC (mk_eq_thm |> Q.INST [`x`|->`Comb (Abs (Var name ty) bod) (Var name ty)`,
         `y`|->`bod`,`res`|->`q`,`s'`|->`r`])
  \\ FULL_SIMP_TAC std_ss [] \\ REPEAT STRIP_TAC
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ FULL_SIMP_TAC std_ss [THM_def] >>
  `CONTEXT defs` by fs[STATE_def] >>
  imp_res_tac term_type >>
  rpt (BasicProvers.VAR_EQ_TAC) >>
  fs[] >>
  `typeof (bod) = typeof (Comb (Abs (Var name ty) (bod)) (Var name ty))` by simp[] >>
  pop_assum SUBST1_TAC >>
  simp_tac std_ss [GSYM equation_def] >>
  MATCH_MP_TAC(List.nth(CONJUNCTS proves_rules,2)) >>
  fs[CONTEXT_def,TERM_def,TYPE_def] >>
  METIS_TAC[extends_theory_ok,init_theory_ok])

val ASSUME_thm = store_thm("ASSUME_thm",
  ``TERM defs tm /\ STATE defs s /\
    (ASSUME tm s = (res, s')) ==>
    (s' = s) /\ !th. (res = HolRes th) ==> THM defs th``,
  SIMP_TAC std_ss [ASSUME_def] \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ STRIP_TAC \\ MP_TAC (type_of_thm |> Q.SPEC `tm`)
  \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC \\ FULL_SIMP_TAC std_ss []
  \\ FULL_SIMP_TAC (srw_ss()) [ex_bind_def]
  \\ MP_TAC (mk_type_thm |> Q.SPECL [`"bool"`,`[]`,`s`])
  \\ Cases_on `mk_type ("bool",[]) s`
  \\ FULL_SIMP_TAC (srw_ss()) [EVERY_DEF]
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ STRIP_TAC \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `term_type tm = Bool`
  \\ FULL_SIMP_TAC (srw_ss()) [failwith_def,ex_return_def]
  \\ FULL_SIMP_TAC std_ss [THM_def]
  >> simp[] >>
  MATCH_MP_TAC(List.nth(CONJUNCTS proves_rules,1)) >>
  rpt (BasicProvers.VAR_EQ_TAC) >>
  fs[STATE_def] >> imp_res_tac term_type >> rfs[] >>
  fs[TERM_def] >>
  imp_res_tac term_ok_welltyped >>
  FULL_SIMP_TAC std_ss [WELLTYPED]
  >> METIS_TAC[CONTEXT_def,extends_theory_ok,init_theory_ok])

val EQ_MP_thm = store_thm("EQ_MP_thm",
  ``THM defs th1 /\ THM defs th2 /\ STATE defs s /\
    (EQ_MP th1 th2 s = (res, s')) ==>
    (s' = s) /\ !th. (res = HolRes th) ==> THM defs th``,
  Cases_on `th1` \\ Cases_on `th2` \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ SIMP_TAC std_ss [EQ_MP_def]
  \\ BasicProvers.EVERY_CASE_TAC
  \\ FULL_SIMP_TAC (srw_ss()) [failwith_def]
  \\ SRW_TAC [] [ex_bind_def,ex_return_def] \\ IMP_RES_TAC THM
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC TERM
  \\ Q.MATCH_ASSUM_RENAME_TAC `THM defs (Sequent l
        (Comb (Comb (Const "=" h1) t1) t2))` []
  \\ FULL_SIMP_TAC std_ss [THM_def]
  >> rpt(qpat_assum`H |- C`mp_tac) >>
  imp_res_tac term_union_thm >> simp[] >>
  `CONTEXT defs` by fs[STATE_def] >>
  imp_res_tac term_type >>
  rpt (BasicProvers.VAR_EQ_TAC) >>
  fs[] >>
  imp_res_tac TERM_Eq_x >> pop_assum (assume_tac o SYM) >>
  simp[GSYM equation_def] >> rw[] >>
  MATCH_MP_TAC(List.nth(CONJUNCTS proves_rules,4)) >>
  fs[TERM_Comb] >>
  METIS_TAC[aconv_thm])

val FILTER_ACONV = prove(
  ``STATE defs s /\ TERM defs tm /\ EVERY (TERM defs) l ==>
    (FILTER (\t1. ~aconv tm t1) l = FILTER ($~ o ACONV tm) l)``,
  Induct_on `l` \\ FULL_SIMP_TAC std_ss [EVERY_DEF,FILTER,MAP]
  \\ REPEAT STRIP_TAC \\ IMP_RES_TAC aconv_thm
  \\ FULL_SIMP_TAC std_ss [] \\ SRW_TAC [] []);

val DEDUCT_ANTISYM_RULE_thm = store_thm("DEDUCT_ANTISYM_RULE_thm",
  ``THM defs th1 /\ THM defs th2 /\ STATE defs s /\
    (DEDUCT_ANTISYM_RULE th1 th2 s = (res, s')) ==>
    (s' = s) /\ !th. (res = HolRes th) ==> THM defs th``,
  Cases_on `th1` \\ Cases_on `th2` \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ SIMP_TAC std_ss [DEDUCT_ANTISYM_RULE_def,LET_DEF,ex_bind_def]
  \\ Cases_on `mk_eq (t,t') s` \\ STRIP_TAC
  \\ IMP_RES_TAC THM
  \\ MP_TAC (mk_eq_thm |> Q.INST [`x`|->`t`,
         `y`|->`t'`,`res`|->`q`,`s'`|->`r`])
  \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ FULL_SIMP_TAC std_ss [THM_def]
  >> simp[] >>
  rpt (BasicProvers.VAR_EQ_TAC) >>
  `EVERY (TERM defs) (term_remove t' l) ∧
   EVERY (TERM defs) (term_remove t l')` by (
    simp[term_remove_def,EVERY_FILTER] >>
    fs[EVERY_MEM]) >>
  `CONTEXT defs` by fs[STATE_def] >>
  imp_res_tac term_type >>
  simp[GSYM equation_def] >>
  imp_res_tac term_union_thm >>
  simp[] >>
  imp_res_tac FILTER_ACONV >>
  simp[term_remove_def] >>
  MATCH_MP_TAC(List.nth(CONJUNCTS proves_rules,3)) >>
  simp[])

val map_lemma = prove(
  ``!P l s res s'.
      (map (inst theta) l s = (res,s')) /\ STATE defs s ==>
      EVERY (\x. !s. STATE defs s ==>
                     ?r s'. (inst theta x s = (r,s')) /\ STATE defs s' /\
                        !t. (r = HolRes t) ==> P x t) l ==>
      STATE defs s' /\ !ts. (res = HolRes ts) ==> EVERY2 P l ts``,
  STRIP_TAC \\ Induct \\ SIMP_TAC (srw_ss()) [Once map_def,ex_return_def,ex_bind_def]
  \\ SIMP_TAC std_ss [Once EQ_SYM_EQ]
  \\ NTAC 5 STRIP_TAC \\ Cases_on `inst theta h s` \\ FULL_SIMP_TAC std_ss []
  \\ SIMP_TAC std_ss [Once EQ_SYM_EQ,GSYM AND_IMP_INTRO]
  \\ STRIP_TAC \\ POP_ASSUM (MP_TAC o Q.SPEC `s`)
  \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ Cases_on `map (inst theta) l r`
  \\ REVERSE (Cases_on `q`) \\ FULL_SIMP_TAC (srw_ss()) []
  \\ STRIP_TAC \\ RES_TAC \\ FULL_SIMP_TAC (srw_ss()) []);

val INST_TYPE_thm = store_thm("INST_TYPE_thm",
  ``EVERY (\(t1,t2). TYPE defs t1 /\ TYPE defs t2) theta /\
    THM defs th1 /\ STATE defs s /\
    (INST_TYPE theta th1 s = (res, s')) ==>
    STATE defs s' /\ !th. (res = HolRes th) ==> THM defs th``,
  Cases_on `th1` \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ SIMP_TAC std_ss [INST_TYPE_def,LET_DEF,ex_bind_def]
  \\ STRIP_TAC \\ IMP_RES_TAC THM
  \\ Cases_on `map (inst theta) l s`
  \\ MP_TAC (map_lemma |> Q.SPECL [`\tm t. (t = INST theta tm)`,`l`,`s`])
  \\ FULL_SIMP_TAC std_ss []
  \\ MATCH_MP_TAC IMP_IMP \\ STRIP_TAC THEN1
   (FULL_SIMP_TAC std_ss [EVERY_MEM] \\ REPEAT STRIP_TAC
    \\ Cases_on `inst theta x s'''` \\ FULL_SIMP_TAC std_ss [] \\ RES_TAC
    \\ IMP_RES_TAC (inst_thm |> SIMP_RULE std_ss [EVERY_MEM])
    \\ METIS_TAC [])
  \\ STRIP_TAC \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ Cases_on `inst theta t r`
  \\ MP_TAC (inst_thm |> Q.INST [`res`|->`q`,`s'`|->`r'`,`tm`|->`t`,`s`|->`r`])
  \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ FULL_SIMP_TAC std_ss [THM_def] >>
  `a = MAP (INST theta) l` by (
    fs[LIST_EQ_REWRITE,EVERY2_EVERY,EVERY_MEM] >>
    rfs[MEM_ZIP,PULL_EXISTS,EL_MAP] ) >>
  pop_assum SUBST1_TAC >>
  MATCH_MP_TAC(List.nth(CONJUNCTS proves_rules,6)) >>
  simp[EVERY_MAP] >>
  fs[EVERY_MEM,FORALL_PROD,TYPE_def] >>
  METIS_TAC[])

val map_lemma = prove(
  ``!l P s res s'.
      (map (vsubst theta) l s = (res,s')) ==>
      EVERY (\x. ?r. (vsubst theta x s = (r,s)) /\
                     !t. (r = HolRes t) ==> P x t) l ==>
      (s' = s) /\ !ts. (res = HolRes ts) ==> EVERY2 P l ts``,
  Induct \\ SIMP_TAC (srw_ss()) [Once map_def,ex_return_def,ex_bind_def]
  \\ NTAC 5 STRIP_TAC \\ Cases_on `vsubst theta h s` \\ FULL_SIMP_TAC std_ss []
  \\ SIMP_TAC std_ss [Once EQ_SYM_EQ]
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ Cases_on `r = s` \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `map (vsubst theta) l s`
  \\ NTAC 2 STRIP_TAC \\ RES_TAC
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) []);

val INST_thm = store_thm("INST_thm",
  ``EVERY (\(t1,t2). TERM defs t1 /\ TERM defs t2) theta /\
    THM defs th1 /\ STATE defs s /\
    (INST theta th1 s = (res, s')) ==>
    (s' = s) /\ !th. (res = HolRes th) ==> THM defs th``,
  Cases_on `th1` \\ ONCE_REWRITE_TAC [EQ_SYM_EQ]
  \\ SIMP_TAC std_ss [holKernelTheory.INST_def,LET_DEF,ex_bind_def]
  \\ STRIP_TAC \\ IMP_RES_TAC THM
  \\ Cases_on `map (vsubst theta) l s`
  \\ MP_TAC (map_lemma |> Q.SPECL [`l`,`\tm t. (t = VSUBST theta tm)`,`s`])
  \\ FULL_SIMP_TAC std_ss []
  \\ MATCH_MP_TAC IMP_IMP \\ STRIP_TAC THEN1
   (FULL_SIMP_TAC std_ss [EVERY_MEM] \\ REPEAT STRIP_TAC
    \\ Cases_on `vsubst theta x s` \\ FULL_SIMP_TAC std_ss [] \\ RES_TAC
    \\ IMP_RES_TAC (vsubst_thm |> SIMP_RULE std_ss [EVERY_MEM])
    \\ METIS_TAC [])
  \\ STRIP_TAC \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) [ex_return_def]
  \\ Cases_on `vsubst theta t s`
  \\ MP_TAC (vsubst_thm |> Q.INST [`res`|->`q`,`s'`|->`r'`,`tm`|->`t`])
  \\ FULL_SIMP_TAC std_ss [] \\ STRIP_TAC \\ FULL_SIMP_TAC std_ss []
  \\ Cases_on `q` \\ FULL_SIMP_TAC (srw_ss()) []
  \\ FULL_SIMP_TAC std_ss [THM_def] >>
  `a = MAP (VSUBST theta) l` by (
    fs[LIST_EQ_REWRITE,EVERY2_EVERY,EVERY_MEM] >>
    rfs[MEM_ZIP,PULL_EXISTS,EL_MAP] ) >>
  pop_assum SUBST1_TAC >>
  MATCH_MP_TAC(List.nth(CONJUNCTS proves_rules,5)) >>
  simp[EVERY_MAP,MEM_MAP,PULL_EXISTS] >>
  fs[EVERY_MEM,FORALL_PROD,TERM_def] >>
  METIS_TAC[])

(* ------------------------------------------------------------------------- *)
(* Verification of definition functions                                      *)
(* ------------------------------------------------------------------------- *)

val TYPE_CONS_EXTEND = store_thm("TYPE_CONS_EXTEND",
  ``STATE (d::defs) s /\ TYPE defs ty ==> TYPE (d::defs) ty``,
  simp[STATE_def,TYPE_def] >> strip_tac >>
  match_mp_tac type_ok_extend >>
  HINT_EXISTS_TAC >>
  imp_res_tac CONTEXT_ALL_DISTINCT >>
  Cases_on`d`>>fs[SUBMAP_FUNION])

val TERM_CONS_EXTEND = store_thm("TERM_CONS_EXTEND",
  ``STATE (d::defs) s /\ TERM defs tm ==> TERM (d::defs) tm``,
  simp[STATE_def,TERM_def] >> strip_tac >>
  match_mp_tac term_ok_extend >>
  map_every qexists_tac[`tysof(defs)`,`tmsof(defs)`] >>
  imp_res_tac CONTEXT_ALL_DISTINCT >>
  Cases_on`d`>>fs[SUBMAP_FUNION,LET_THM] >>
  match_mp_tac SUBMAP_FUNION >>
  fs[pred_setTheory.IN_DISJOINT] >>
  fs[ALL_DISTINCT_APPEND] >>
  METIS_TAC[])

val STRCAT_SHADOW_def = zDefine`
  STRCAT_SHADOW = STRCAT`

val first_dup_thm = prove(
  ``∀ls acc. (first_dup ls acc = NONE) ⇒ ALL_DISTINCT ls ∧ (∀x. MEM x ls ⇒ ¬MEM x acc)``,
  Induct >> simp[Once first_dup_def] >>
  rpt gen_tac >>
  BasicProvers.CASE_TAC >>
  strip_tac >> res_tac >>
  fs[MEM] >> METIS_TAC[])

val first_dup_SOME = prove(
  ``∀ls acc. (first_dup ls acc = SOME x) ⇒ ¬ALL_DISTINCT (ls++acc)``,
  Induct >> simp[Once first_dup_def] >>
  rw[] >> fs[ALL_DISTINCT_APPEND] >>
  res_tac >> rw[] >> fs[ALL_DISTINCT] >> fs[] >>
  METIS_TAC[])

val add_constants_thm = prove(
  ``∀ls s res s'. (add_constants ls s = (res,s')) ⇒
      (∀u. (res = HolRes u) ∧ ALL_DISTINCT (MAP FST s.the_term_constants) ⇒
           ALL_DISTINCT (MAP FST ls ++ MAP FST s.the_term_constants) ∧
           (s' = s with the_term_constants := ls++s.the_term_constants)) ∧
      (∀msg. (res = HolErr msg) ⇒ (s' = s) ∧ (¬ALL_DISTINCT (MAP FST ls ++ MAP FST s.the_term_constants)))``,
  simp_tac std_ss [add_constants_def,GSYM STRCAT_SHADOW_def] >>
  simp[ex_bind_def,get_the_term_constants_def] >>
  rpt gen_tac >>
  reverse BasicProvers.CASE_TAC >- (
    simp[failwith_def] >> rw[] >>
    imp_res_tac first_dup_SOME) >>
  imp_res_tac first_dup_thm >>
  strip_tac >>
  Cases_on`res`>>
  fs[set_the_term_constants_def] >>
  rpt BasicProvers.VAR_EQ_TAC >> simp[] >>
  simp[ALL_DISTINCT_APPEND])

val new_specification_thm = store_thm("new_specification_thm",
  ``THM defs th /\ STATE defs s ==>
    case new_specification th s of
    | (HolErr msg, s') => (s' = s)
    | (HolRes th, s') => (?d. THM (d::defs) th /\
                              STATE (d::defs) s')``,
  Cases_on`th` >>
  simp_tac std_ss [new_specification_def,GSYM STRCAT_SHADOW_def] >>
  simp[ex_bind_def,ex_return_def] >>
  rpt strip_tac >>
  Q.PAT_ABBREV_TAC`(f:term -> hol_refs -> (((string#type)#term) hol_result#hol_refs)) = X` >>
  `EVERY (λt. term_ok (sigof defs) t ∧ (typeof t = Bool)) (t::l)` by (
    match_mp_tac THM_term_ok_bool >> fs[STATE_def]) >>
  `∀l defs s s'.
    STATE defs s ∧ EVERY (λt. term_ok (sigof defs) t ∧ (typeof t = Bool)) l
    ⇒ (∀res. (map f l s = (HolRes res,s')) ⇒
     (s' = s) ∧
     LIST_REL
       (λe ((s,ty),t).
         (e = Var s ty === t) ∧ t has_type ty ∧
         CLOSED t ∧ (∀v. MEM v (tvars t) ⇒ MEM v (tyvars (typeof t))) ∧
         term_ok (sigof (defs)) t ∧ type_ok (tysof (defs)) ty)
       l res) ∧
     (∀msg. (map f l s = (HolErr msg,s')) ⇒ (s' = s))` by (
    pop_assum kall_tac >> pop_assum mp_tac >> ntac 2 (pop_assum kall_tac) >> strip_tac >>
    Induct >- simp[map_def,ex_return_def] >>
    simp[Once map_def,ex_bind_def] >>
    qx_genl_tac[`tm`,`defs`] >>
    rpt gen_tac >> strip_tac >>
    Cases_on`f tm s`>>fs[]>>
    `s = r` by (
      pop_assum mp_tac >>
      simp[Abbr`f`] >>
      mp_tac(Q.GENL[`res`,`s'`]dest_eq_thm) >>
      Cases_on`dest_eq tm s`>>simp[]>>
      `TERM defs tm` by simp[TERM_def] >>
      Cases_on`q'`>>simp[]>>
      qmatch_assum_rename_tac`dest_eq tm s = (HolRes q',X)`["X"] >>
      Cases_on`q'`>>simp[] >> strip_tac >>
      BasicProvers.VAR_EQ_TAC >>
      BasicProvers.VAR_EQ_TAC >>
      qmatch_assum_rename_tac`dest_eq tm s = (HolRes(v,t),s)`[] >>
      MP_TAC(Q.GENL[`res`,`s'`]dest_var_thm) >>
      Cases_on`dest_var v s`>>simp[]>>
      Cases_on`q'`>>simp[]>>
      qmatch_assum_rename_tac`dest_var v s = (HolRes q',X)`["X"]>>
      Cases_on`q'`>>simp[] >> strip_tac >>
      BasicProvers.CASE_TAC >>
      BasicProvers.CASE_TAC >>
      simp[failwith_def] ) >>
    reverse conj_tac >- (
      simp[Once map_def,ex_bind_def] >>
      Cases_on`q`>>fs[]>>
      Cases_on`map f l r`>>fs[]>>
      Cases_on`q`>>simp[ex_return_def] >>
      rw[] >>
      first_x_assum(qspecl_then[`defs`,`r`]mp_tac) >>
      simp[] ) >>
    Cases_on`q`>>simp[]>>
    Cases_on`map f l r`>>simp[]>>
    Cases_on`q`>>simp[ex_return_def]>>
    strip_tac >>
    qpat_assum`f tm s = X`mp_tac >>
    simp[Abbr`f`] >>
    mp_tac(Q.GENL[`res`,`s'`]dest_eq_thm) >>
    `TERM defs tm` by simp[TERM_def] >>
    Cases_on`dest_eq tm s`>>simp[]>>
    Cases_on`q`>>rfs[]>>
    rpt BasicProvers.VAR_EQ_TAC >>
    qmatch_assum_rename_tac`dest_eq tm s = (HolRes q,X)`["X"] >>
    Cases_on`q`>>simp[] >> strip_tac >>
    rpt BasicProvers.VAR_EQ_TAC >>
    qmatch_assum_rename_tac`dest_eq tm s = (HolRes(v,t),s)`[] >>
    MP_TAC(Q.GENL[`res`,`s'`]dest_var_thm) >>
    Cases_on`dest_var v s`>>simp[]>>
    Cases_on`q`>>simp[]>>
    qmatch_assum_rename_tac`dest_var v s = (HolRes q,X)`["X"]>>
    Cases_on`q`>>simp[] >> strip_tac >>
    rpt BasicProvers.VAR_EQ_TAC >>
    BasicProvers.CASE_TAC>>
    BasicProvers.CASE_TAC>>
    ntac 2 (pop_assum mp_tac ) >>
    simp_tac(srw_ss())[failwith_def] >>
    ntac 3 strip_tac >>
    rpt BasicProvers.VAR_EQ_TAC >>
    simp[] >>
    simp[Once CONJ_SYM,GSYM CONJ_ASSOC] >>
    Cases_on`v`>>TRY(
      fs[holKernelTheory.dest_var_def,failwith_def] >> NO_TAC) >>
    qpat_assum`dest_var Z X = Y`mp_tac >>
    simp[holKernelTheory.dest_var_def,ex_return_def] >> strip_tac >>
    rpt BasicProvers.VAR_EQ_TAC >>
    qpat_assum`dest_eq tm r = X`mp_tac >>
    Cases_on`tm`>>simp_tac(srw_ss())[dest_eq_def,failwith_def] >>
    BasicProvers.CASE_TAC >>
    BasicProvers.CASE_TAC >>
    BasicProvers.CASE_TAC >>
    BasicProvers.CASE_TAC >>
    BasicProvers.CASE_TAC >>
    simp_tac(srw_ss())[ex_return_def] >> strip_tac >>
    rpt BasicProvers.VAR_EQ_TAC >>
    qmatch_assum_abbrev_tac`TERM defs (Comb X Y)` >>
    `welltyped (Comb X Y)` by (
      metis_tac[TERM_def,term_ok_welltyped]) >>
    pop_assum mp_tac >>
    simp[Abbr`X`,Abbr`Y`] >> strip_tac >>
    rpt BasicProvers.VAR_EQ_TAC >> fs[] >>
    rpt BasicProvers.VAR_EQ_TAC >>
    `t has_type r''` by (
      `CONTEXT defs` by fs[STATE_def] >>
      imp_res_tac CONTEXT_std_sig >>
      fs[equation_def,term_ok_def,is_std_sig_def] >>
      rfs[WELLTYPED]) >>
    conj_tac >- (simp[equation_def] >> fs[WELLTYPED_LEMMA]) >> simp[] >>
    conj_tac >- (
      simp[CLOSED_def] >>
      PROVE_TAC[freesin_IMP,MEM] ) >>
    imp_res_tac WELLTYPED_LEMMA >>
    conj_tac >- (
      fs[subset_def,EVERY_MEM] >>
      METIS_TAC[MEM_type_vars_in_term,tyvars_thm] ) >>
    conj_asm1_tac >- (
      fs[term_ok_def] ) >>
    conj_tac >- (
      imp_res_tac term_ok_type_ok >>
      fs[STATE_def] >> imp_res_tac CONTEXT_std_sig >> fs[] >>
      METIS_TAC[]) >>
    first_x_assum(qspecl_then[`defs`,`r`]mp_tac) >>
    simp[] ) >>
  first_x_assum(qspecl_then[`l`,`defs`,`s`]mp_tac) >>
  Cases_on`map f l s` >> simp[]>>
  reverse(Cases_on`q`)>>simp[] >>
  (discharge_hyps >- fs[]) >> simp[] >>
  strip_tac >>
  BasicProvers.CASE_TAC >- (
    simp[failwith_def] ) >>
  BasicProvers.CASE_TAC >>
  qspecl_then[`MAP FST a`,`s`]mp_tac add_constants_thm >>
  simp[] >>
  `ALL_DISTINCT (MAP FST s.the_term_constants)` by
    imp_res_tac STATE_ALL_DISTINCT >>
  Cases_on`q`>>simp[] >>
  simp[oneTheory.one] >>
  strip_tac >>
  simp[add_def_def,ex_bind_def,get_the_context_def,set_the_context_def] >>
  qpat_assum`map f l r = X`kall_tac >>
  qunabbrev_tac`f` >>
  Q.PAT_ABBREV_TAC`theta:(term#term)list = MAP X (MAP FST a)` >>
  Q.PAT_ABBREV_TAC`d = ConstSpec X h` >>
  Q.PAT_ABBREV_TAC`s':hol_refs = X` >>
  qexists_tac`d` >>
  reverse conj_asm2_tac >- (
    fs[STATE_def,Abbr`s'`] >>
    simp[Abbr`d`] >>
    simp[MAP_MAP_o,combinTheory.o_DEF,UNCURRY] >>
    conj_asm1_tac >- (
      fs[CONTEXT_def] >>
      simp[extends_def] >>
      simp[Once relationTheory.RTC_CASES1] >> disj2_tac >>
      simp[GSYM extends_def] >> rfs[] >>
      simp[updates_cases] >>
      conj_tac >- (
        fs[THM_def] >>
        qmatch_abbrev_tac`(thy,hh) |- cc` >>
        qmatch_assum_abbrev_tac`(thy,hh1) |- cc` >>
        `hh = hh1` by (
          UNABBREV_ALL_TAC >>
          simp[MAP_MAP_o,combinTheory.o_DEF,UNCURRY] >>
          fs[EVERY2_EVERY] >>
          rfs[EVERY_MEM,MEM_ZIP,PULL_EXISTS,UNCURRY] >>
          simp[LIST_EQ_REWRITE,EL_MAP] >>
          simp[equation_def] >>
          METIS_TAC[WELLTYPED_LEMMA] ) >>
        rw[] ) >>
      simp[EVERY_MAP,MAP_MAP_o,combinTheory.o_DEF,UNCURRY] >>
      fs[EVERY2_EVERY] >>
      rfs[EVERY_MEM,MEM_ZIP,PULL_EXISTS,UNCURRY] >>
      simp[MEM_MAP,PULL_EXISTS] >>
      simp[Once MEM_EL,PULL_EXISTS] >>
      conj_tac >- (
        imp_res_tac freesin_IMP >> rw[] >>
        res_tac >>
        rfs[TERM_def,PULL_EXISTS,MEM_MAP] >>
        res_tac >>
        METIS_TAC[tyvars_thm]) >>
      simp[Once MEM_EL,PULL_EXISTS] >>
      fs[ALL_DISTINCT_APPEND,MAP_MAP_o,combinTheory.o_DEF] >>
      qpat_assum`X = FLAT Y`(assume_tac o SYM) >> fs[] >>
      fs[MEM_MAP,PULL_EXISTS,UNCURRY] >>
      rw[EXISTS_PROD] >>
      imp_res_tac THM >>
      imp_res_tac freesin_IMP >>
      fs[MEM_MAP,EXISTS_PROD] >>
      fs[MEM_EL] >>
      first_x_assum(qspec_then`n`mp_tac) >>
      simp[] >>
      qpat_assum`X = EL n a`(mp_tac o SYM) >> simp[] >>
      rw[] >>
      METIS_TAC[WELLTYPED_LEMMA]) >>
    reverse conj_asm1_tac >- (
      fs[TERM_def] >>
      match_mp_tac term_ok_extend >>
      map_every qexists_tac[`tysof defs`,`tmsof defs`] >>
      simp[] >>
      match_mp_tac SUBMAP_FUNION >>
      simp[pred_setTheory.IN_DISJOINT] >>
      fs[ALL_DISTINCT_APPEND] >>
      simp[MAP_MAP_o,combinTheory.o_DEF,UNCURRY] >>
      simp[MEM_MAP,PULL_EXISTS] >>
      fs[MEM_MAP,PULL_EXISTS] >>
      disj2_tac >> rw[] >>
      spose_not_then STRIP_ASSUME_TAC >>
      rpt BasicProvers.VAR_EQ_TAC >>
      res_tac >>
      fs[GSYM combinTheory.o_DEF,GSYM MAP_MAP_o] >>
      qpat_assum`X = FLAT Y`(assume_tac o SYM) >>
      fs[MEM_MAP,PULL_EXISTS,UNCURRY] >>
      METIS_TAC[FST] ) >>
    simp[MAP_EQ_f] >>
    fs[EVERY2_EVERY,EVERY_MEM] >>
    rfs[MEM_ZIP,UNCURRY,PULL_EXISTS] >>
    simp[MEM_EL,PULL_EXISTS] >>
    rw[] >>
    first_x_assum(qspec_then`n`mp_tac) >> simp[] >>
    Cases_on`EL n a`>>simp[]>>Cases_on`q`>>rw[]>>
    METIS_TAC[term_ok_welltyped,WELLTYPED_LEMMA] ) >>
  simp[THM_def] >>
  qspecl_then[`s'`,`d::defs`,`theta`,`t`]mp_tac
    (Q.GENL[`defs`,`s`](CONV_RULE (RESORT_FORALL_CONV List.rev) vsubst_aux_thm)) >>
  simp[] >>
  match_mp_tac IMP_IMP >>
  conj_asm1_tac >- (
    reverse conj_tac >- (
      match_mp_tac (GEN_ALL TERM_CONS_EXTEND) >>
      fs[TERM_def,THM_def] >>
      METIS_TAC[] ) >>
    simp[Abbr`theta`,EVERY_MAP] >>
    simp[EVERY_MEM,UNCURRY,Once term_type_def,is_var_def] >>
    simp[Once term_type_def,TERM_Var_SIMP] >>
    ntac 2 strip_tac >>
    conj_asm1_tac >- (
      match_mp_tac (GEN_ALL TERM_Const) >>
      HINT_EXISTS_TAC >>
      simp[Abbr`s'`,MEM_MAP] >>
      METIS_TAC[] ) >>
    simp[TYPE_def] >>
    fs[TERM_def,term_ok_def]) >>
  strip_tac >> simp[] >>
  match_mp_tac(List.nth(CONJUNCTS proves_rules,10)) >>
  conj_tac >- (
    fs[STATE_def,CONTEXT_def] >>
    imp_res_tac extends_theory_ok >>
    fs[init_theory_ok] >> rfs[] ) >>
  simp[Abbr`d`,conexts_of_upd_def] >>
  disj1_tac >> AP_THM_TAC >> AP_TERM_TAC >>
  simp[MAP_MAP_o,combinTheory.o_DEF,UNCURRY,Abbr`theta`] >>
  simp[MAP_EQ_f] >>
  fs[EVERY2_EVERY,EVERY_MEM,MEM_EL,PULL_EXISTS,UNCURRY] >>
  rfs[EL_ZIP,PULL_EXISTS] >>
  METIS_TAC[term_ok_welltyped,WELLTYPED_LEMMA])

val _ = delete_const"STRCAT_SHADOW"

val new_basic_definition_thm = store_thm("new_basic_definition_thm",
  ``TERM defs tm /\ STATE defs s ==>
    case new_basic_definition tm s of
    | (HolErr msg, s') => (s' = s)
    | (HolRes th, s') => (?d. THM (d::defs) th /\
                              STATE (d::defs) s')``,
  rw[] >>
  simp[new_basic_definition_def,ex_bind_def] >>
  Cases_on`ASSUME tm s` >>
  imp_res_tac ASSUME_thm >>
  Cases_on`q`>>fs[] >>
  imp_res_tac new_specification_thm )

val new_basic_type_definition_thm = store_thm("new_basic_type_definition_thm",
  ``THM defs th /\ STATE defs s ==>
    case new_basic_type_definition tyname absname repname th s of
    | (HolErr msg, s') => (s' = s)
    | (HolRes (th1,th2), s') =>
      (?ds. THM (ds++defs) th1 /\ THM (ds++defs) th2 /\
            STATE (ds++defs) s')``,
  Cases_on `th` \\ SIMP_TAC (srw_ss())
     [new_basic_type_definition_def,Once ex_bind_def,ex_return_def,failwith_def,
      can_def |> SIMP_RULE std_ss [otherwise_def,ex_bind_def,ex_return_def]] >>
  strip_tac >>
  qspecl_then[`tyname`,`s`]mp_tac get_type_arity_thm >>
  Cases_on`get_type_arity tyname s`>>simp[]>>strip_tac>>
  qspecl_then[`absname`,`s`]mp_tac get_const_type_thm >>
  qspecl_then[`repname`,`s`]mp_tac get_const_type_thm >>
  Cases_on`get_const_type absname s`>>simp[]>>strip_tac>>
  Cases_on`get_const_type repname s`>>simp[]>>strip_tac>>
  ntac 2 (simp[Once ex_bind_def]) >>
  Cases_on`q`>>fs[]>>
  BasicProvers.CASE_TAC >> simp[] >>
  BasicProvers.CASE_TAC >> simp[] >>
  Cases_on`absname = repname`>>simp[]>>
  Cases_on `l = []` \\ FULL_SIMP_TAC (srw_ss()) [Once ex_bind_def,try_def] >>
  Cases_on`t`>>simp[dest_comb_def,failwith_def,otherwise_def,ex_return_def] >>
  Q.MATCH_ASSUM_RENAME_TAC `THM defs (Sequent [] (Comb P x))` [] >>
  Cases_on `freesin [] P` \\ FULL_SIMP_TAC (srw_ss()) [LET_DEF] >>
  simp[Once ex_bind_def] >>
  qspec_then`x`mp_tac type_of_thm >>
  discharge_hyps >- METIS_TAC[STATE_def,TERM_Comb,THM] >>
  simp[] >> disch_then kall_tac >>
  simp[Once ex_bind_def] >>
  Q.PAT_ABBREV_TAC`vs:string list = QSORT R X` >>
  simp[add_type_def,can_def,otherwise_def,ex_return_def] >>
  ntac 2 (simp[Once ex_bind_def]) >>
  simp[Once ex_bind_def,get_the_type_constants_def] >>
  simp[Once ex_bind_def,set_the_type_constants_def] >>
  Q.PAT_ABBREV_TAC `s1 = (s with
      <|the_type_constants := Y::s.the_type_constants|>)` >>
  `get_type_arity tyname s1 = (HolRes (LENGTH vs), s1)` by (
    simp[get_type_arity_def,ex_bind_def,Abbr`s1`] >>
    EVAL_TAC ) >>
  simp[mk_type_def,try_def,otherwise_def,failwith_def,ex_return_def,Once ex_bind_def] >>
  simp[mk_fun_ty_def] >>
  `get_type_arity "fun" s1 = (HolRes 2, s1)` by (
    qspecl_then[`"fun"`,`s1`]mp_tac get_type_arity_thm >>
    Cases_on`get_type_arity "fun" s1`>>simp[] >>strip_tac >>
    qunabbrev_tac`s1` >> fs[STATE_def] >>
    imp_res_tac CONTEXT_fun >> rfs[] >>
    METIS_TAC[hol_result_distinct,hol_result_11,hol_result_nchotomy] ) >>
  SIMP_TAC (srw_ss()) [mk_type_def,try_def,otherwise_def] >>
  ntac 4(simp[Once ex_bind_def,ex_return_def]) >>
  Q.PAT_ABBREV_TAC`l1 = [(absname,Fun X Y);Z]` >>
  qspecl_then[`l1`,`s1`]mp_tac add_constants_thm >>
  Cases_on`add_constants l1 s1` >>
  simp[Once ex_bind_def] >> strip_tac >>
  imp_res_tac STATE_ALL_DISTINCT >>
  reverse(Cases_on`q`)>>fs[]>-(
    fs[Abbr`l1`]>>fs[Abbr`s1`,MEM_MAP,EXISTS_PROD] >>
    METIS_TAC[] ) >>
  `s1.the_term_constants = s.the_term_constants` by simp[Abbr`s1`] >>
  fs[oneTheory.one] >>
  simp[Once ex_bind_def,add_def_def,get_the_context_def] >>
  simp[Once ex_bind_def,set_the_context_def] >>
  Q.PAT_ABBREV_TAC`s2 = s1 with <|the_term_constants := X; the_context := Y|>` >>
  `STATE s2.the_context s2` by (
    fs[STATE_def] >>
    conj_asm1_tac >- (
      simp[Abbr`s2`] >>
      fs[CONTEXT_def] >>
      match_mp_tac extends_trans >>
      qexists_tac`defs` >> simp[] >>
      simp[extends_def,Once relationTheory.RTC_CASES1] >>
      disj2_tac >> simp[Once relationTheory.RTC_CASES1] >>
      simp[Abbr`s1`] >>
      simp[updates_cases] >>
      rfs[MEM_MAP,EXISTS_PROD] >>
      qexists_tac`x` >>
      conj_tac >- fs[THM_def] >>
      imp_res_tac THM_term_ok_bool >>
      fs[term_ok_def] >>
      fs[CLOSED_def] >>
      imp_res_tac freesin_IMP >>
      rfs[TERM_def] >> METIS_TAC[]) >>
    imp_res_tac THM >> rfs[TERM_Comb] >>
    imp_res_tac QSORT_type_vars_in_term >>
    imp_res_tac THM_term_ok_bool >>
    fs[term_ok_def] >>
    rfs[WELLTYPED] >>
    simp[Abbr`s2`,Abbr`s1`,Abbr`vs`,Abbr`l1`
        ,MAP_MAP_o,combinTheory.o_DEF,ETA_AX] >>
    conj_tac >- METIS_TAC[term_type] >>
    fs[TERM_def] >>
    match_mp_tac term_ok_extend >>
    map_every qexists_tac[`tysof (defs)`,`tmsof (defs)`] >>
    rfs[LET_THM] >> rw[] >- (
      simp[MEM_MAP,EXISTS_PROD] ) >>
    match_mp_tac SUBMAP_FUNION >>
    simp[pred_setTheory.IN_DISJOINT,MEM_MAP,EXISTS_PROD] >>
    qpat_assum`X = const_list Y`(assume_tac o SYM) >>
    simp[MEM_MAP,EXISTS_PROD] >>
    METIS_TAC[] ) >>
  qmatch_assum_abbrev_tac`Abbrev(l1 = [(absname,absty);(repname,repty)])` >>
  `mk_const (repname,[]) s2 = (HolRes (Const repname repty), s2)` by (
    simp[Abbr`s2`,Abbr`s1`,Abbr`l1`] >>
    simp[mk_const_def,ex_bind_def,try_def,get_const_type_def
        ,get_the_term_constants_def,failwith_def,otherwise_def] >>
    simp[Once assoc_def,ex_return_def] >>
    simp[Once assoc_def,ex_return_def] >>
    simp[type_subst_EMPTY] ) >>
  `mk_const (absname,[]) s2 = (HolRes (Const absname absty), s2)` by (
    simp[Abbr`s2`,Abbr`s1`,Abbr`l1`] >>
    simp[mk_const_def,ex_bind_def,try_def,get_const_type_def
        ,get_the_term_constants_def,failwith_def,otherwise_def] >>
    simp[Once assoc_def,ex_return_def] >>
    simp[type_subst_EMPTY] ) >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  Q.PAT_ABBREV_TAC`a = mk_var X` >>
  rpt(qpat_assum`Z = s`kall_tac)>>
  Cases_on`mk_comb (Const repname repty,a) s2` >>
  MP_TAC (mk_comb_thm |> Q.INST [`f`|->`Const repname repty`,`res`|->`q`,`s1`|->`r`,`s`|->`s2`,`defs`|->`s2.the_context`]) >>
  discharge_hyps >- (
    simp[] >>
    conj_asm1_tac >- METIS_TAC[mk_const_thm,EVERY_DEF] >>
    imp_res_tac TERM >>
    simp[Abbr`a`,mk_var_def,TERM_Var_SIMP] >>
    qunabbrev_tac`repty` >>
    imp_res_tac TYPE >> fs[] ) >>
  simp[Once term_type_def,Abbr`repty`,Abbr`a`] >>
  simp[mk_var_def,Once term_type_def] >>
  strip_tac >> Cases_on`q`>>fs[] >>
  simp[Once ex_bind_def] >>
  simp[Once mk_comb_def,type_of_def,ex_return_def,Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[dest_type_def,ex_return_def] >>
  simp[Abbr`absty`] >>
  simp[Once ex_bind_def] >>
  simp[Once mk_eq_def,try_def,otherwise_def,type_of_def,ex_return_def,Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[dest_type_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  imp_res_tac mk_const_eq >>
  simp[Once ex_bind_def] >>
  simp[inst_def] >>
  simp[inst_aux_def,type_subst_def,rev_assocd_thm,REV_ASSOCD,mk_vartype_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once mk_comb_def,type_of_def,ex_return_def,Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[dest_type_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once mk_comb_def,type_of_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[dest_type_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once mk_comb_def,type_of_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once mk_comb_def,type_of_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[dest_type_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  rpt(qpat_assum`Z = s2`kall_tac)>>
  `TERM s2.the_context (Comb P x)` by (
    imp_res_tac THM_term_ok_bool >> fs[] >>
    simp[TERM_def] >>
    match_mp_tac term_ok_extend >>
    map_every qexists_tac[`tysof (defs)`,`tmsof (defs)`] >>
    rfs[LET_THM,Abbr`s2`,Abbr`s1`,STATE_def] >>
    simp[MEM_MAP,EXISTS_PROD] >>
    simp[SUBMAP_DEF,MEM_MAP,EXISTS_PROD] >>
    qpat_assum`X = const_list Y`(assume_tac o SYM) >>
    rpt BasicProvers.VAR_EQ_TAC >>
    simp[MEM_MAP,EXISTS_PROD] >>
    simp[FAPPLY_FUPDATE_THM] >>
    rw[] >> METIS_TAC[]) >>
  `mk_comb (P,Var "r" (term_type x)) s2 = (HolRes (Comb P (Var "r" (term_type x))), s2)` by (
    Cases_on`mk_comb (P,Var "r" (term_type x)) s2` >>
    MP_TAC (mk_comb_thm |> Q.INST [`f`|->`P`,`a`|->`Var "r" (term_type x)`,`res`|->`q`,`s1`|->`r`,`s`|->`s2`,`defs`|->`s2.the_context`]) >>
    discharge_hyps >- (
      rfs[STATE_def,TERM_Comb,TERM_Var_SIMP] >>
      imp_res_tac term_type ) >>
    strip_tac >>
    fs[term_type_Var] >>
    imp_res_tac THM_term_ok_bool >>
    fs[term_ok_def] >>
    fs[STATE_def] >>
    imp_res_tac CONTEXT_std_sig >>
    `TERM defs P ∧ TERM defs x` by simp[TERM_def] >>
    imp_res_tac term_type >>
    rfs[] >> fs[] >>
    Cases_on`q`>>fs[] ) >>
  simp[Once ex_bind_def] >>
  simp[Once mk_eq_def,try_def,otherwise_def,type_of_def,ex_return_def,Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[dest_type_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def,mk_vartype_def,mk_eq_lemma,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once mk_comb_def,type_of_def,ex_return_def,Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[dest_type_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once mk_comb_def,type_of_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[dest_type_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[mk_eq_def,try_def,otherwise_def,Once type_of_def,Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  `CONTEXT s2.the_context` by fs[STATE_def] >>
  fs[TERM_Comb] >>
  imp_res_tac type_of_thm >>
  imp_res_tac term_type >>
  rfs[] >>
  simp[dest_type_def,ex_return_def,Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  imp_res_tac THM_term_ok_bool >> fs[] >>
  fs[term_ok_def] >> rfs[] >>
  fs[] >>
  simp[Once ex_bind_def] >>
  simp[inst_def,inst_aux_def,type_subst_def,rev_assocd_thm,REV_ASSOCD,mk_vartype_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once mk_comb_def,Once type_of_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once type_of_def] >>
  simp[Once ex_bind_def,dest_type_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once mk_comb_def,Once type_of_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once ex_bind_def] >>
  simp[Once type_of_def] >>
  simp[Once ex_bind_def,dest_type_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  simp[Once type_of_def] >>
  simp[Once ex_bind_def] >>
  simp[Once type_of_def] >>
  simp[Once ex_bind_def] >>
  simp[Once type_of_def] >>
  simp[Once ex_bind_def,dest_type_def,ex_return_def] >>
  simp[Once ex_bind_def] >>
  `∃ds. s2.the_context = ds ++ defs` by (
    fs[Abbr`s2`,Abbr`s1`,STATE_def] ) >>
  qexists_tac`ds` >>
  pop_assum(ASSUME_TAC o SYM) >>
  simp[] >>
  simp[THM_def,ETA_AX] >>
  conj_tac >>
  match_mp_tac (List.nth(CONJUNCTS proves_rules,10)) >>
  (conj_tac >- METIS_TAC[STATE_def,CONTEXT_def,extends_theory_ok,init_theory_ok]) >>
  simp[Abbr`s2`,conexts_of_upd_def] >>
  imp_res_tac QSORT_type_vars_in_term >>
  simp[equation_def,Abbr`vs`,MAP_MAP_o,combinTheory.o_DEF,ETA_AX])

(* ------------------------------------------------------------------------- *)
(* Verification of context extension functions                               *)
(* ------------------------------------------------------------------------- *)

val new_type_thm = store_thm("new_type_thm",
  ``STATE defs s ⇒
    case new_type (name,arity) s of
    | (HolErr msg, s') => (s' = s)
    | (HolRes (), s') => (?d. STATE (d::defs) s')``,
  rw[new_type_def,ex_bind_def,add_type_def,can_def,get_type_arity_def,get_the_type_constants_def
    ,otherwise_def,ex_return_def,failwith_def] >>
  BasicProvers.CASE_TAC >>
  BasicProvers.CASE_TAC >>
  imp_res_tac assoc_thm >>
  rw[set_the_type_constants_def,add_def_def,ex_bind_def
    ,get_the_context_def,set_the_context_def] >>
  qexists_tac`NewType name arity` >>
  fs[STATE_def] >>
  conj_asm1_tac >- (
    fs[CONTEXT_def] >>
    simp[extends_def,Once relationTheory.RTC_CASES1] >>
    disj2_tac >> simp[GSYM extends_def] >>
    rfs[updates_cases,MEM_MAP,EXISTS_PROD] ) >>
  rfs[TERM_def] >>
  MATCH_MP_TAC term_ok_extend >>
  map_every qexists_tac[`tysof (defs)`,`tmsof (defs)`] >>
  simp[] >> rw[] >>
  fs[pred_setTheory.IN_DISJOINT] >>
  fs[MEM_MAP,EXISTS_PROD])

val new_constant_thm = store_thm("new_constant_thm",
  ``STATE defs s ∧ TYPE defs ty ⇒
    case new_constant (name,ty) s of
    | (HolErr msg, s') => (s' = s)
    | (HolRes (), s') => (?d. STATE (d::defs) s')``,
  rw[new_constant_def,ex_bind_def] >>
  qspecl_then[`[(name,ty)]`,`s`]mp_tac add_constants_thm >>
  Cases_on`add_constants [(name,ty)] s`>>simp[] >>
  Cases_on`q`>>simp[oneTheory.one] >>
  imp_res_tac STATE_ALL_DISTINCT >> rw[] >>
  rw[add_def_def,ex_bind_def,get_the_context_def,set_the_context_def] >>
  qexists_tac`NewConst name ty` >>
  fs[STATE_def] >>
  conj_asm1_tac >- (
    fs[CONTEXT_def] >>
    simp[extends_def,Once relationTheory.RTC_CASES1] >>
    disj2_tac >> simp[GSYM extends_def] >>
    rfs[updates_cases,MEM_MAP,EXISTS_PROD] >>
    fs[TYPE_def] ) >>
  rfs[TERM_def] >>
  MATCH_MP_TAC term_ok_extend >>
  map_every qexists_tac[`tysof (defs)`,`tmsof (defs)`] >>
  simp[] >> rw[])

val new_axiom_thm = store_thm("new_axiom_thm",
  ``STATE defs s ∧ TERM defs p ⇒
    case new_axiom p s of
    | (HolErr msg, s') => (s' = s)
    | (HolRes th, s') => (?d. THM (d::defs) th ∧ STATE (d::defs) s')``,
  rw[new_axiom_def,ex_bind_def] >>
  imp_res_tac type_of_thm >> rw[] >>
  qspecl_then[`"bool"`,`[]`,`s`]mp_tac mk_type_thm >>
  Cases_on`mk_type ("bool",[]) s`>>simp[] >>
  Cases_on`q`>>simp[]>>strip_tac>>
  BasicProvers.CASE_TAC >> simp[failwith_def,ex_return_def] >>
  simp[get_the_axioms_def,set_the_axioms_def] >>
  simp[add_def_def,ex_bind_def,get_the_context_def,set_the_context_def] >>
  qexists_tac`NewAxiom p` >>
  conj_asm2_tac >- (
    REWRITE_TAC[THM_def] >>
    MATCH_MP_TAC(List.nth(CONJUNCTS proves_rules,10)) >>
    reverse conj_tac >- simp[] >>
    METIS_TAC[STATE_def,CONTEXT_def,extends_theory_ok,init_theory_ok] ) >>
  fs[STATE_def] >>
  conj_asm1_tac >- (
    imp_res_tac term_type >>
    fs[CONTEXT_def] >>
    simp[extends_def,Once relationTheory.RTC_CASES1] >>
    disj2_tac >> simp[GSYM extends_def] >>
    rfs[updates_cases,MEM_MAP,EXISTS_PROD] >>
    fs[TERM_def] >>
    METIS_TAC[term_ok_welltyped,WELLTYPED]) >>
  rfs[TERM_def])

val _ = export_theory();
