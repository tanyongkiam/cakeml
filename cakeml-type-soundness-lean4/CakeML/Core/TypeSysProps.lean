/-
  Theorems about the type system.
  Translated from: hol4_sources/typeSysPropsScript.sml
-/
import CakeML.Core.TypeSystem
import CakeML.Core.TypeSoundInvariants

namespace CakeML

open HOL4
open mlstring

set_option autoImplicit true

-- ============================================================
-- Basic stuff
-- ============================================================

theorem unchanged_tenv :
    ∀ (tenv : type_env),
      ({ v := tenv.v, c := tenv.c, t := tenv.t } : type_env) = tenv := by sorry

theorem extend_dec_tenv_assoc :
    ∀ (tenv1 tenv2 tenv3 : type_env),
      extend_dec_tenv tenv1 (extend_dec_tenv tenv2 tenv3) =
      extend_dec_tenv (extend_dec_tenv tenv1 tenv2) tenv3 := by sorry

theorem tenv_val_ok_nsEmpty :
    tenv_val_ok nsEmpty := by sorry

theorem tenv_ctor_ok_nsEmpty :
    tenv_ctor_ok nsEmpty := by sorry

theorem tenv_abbrev_ok_nsEmpty :
    tenv_abbrev_ok nsEmpty := by sorry

theorem tenv_ok_empty :
    tenv_ok ({ v := nsEmpty, c := nsEmpty, t := nsEmpty } : type_env) := by sorry

-- ============================================================
-- Definition: type_pes
-- ============================================================

def type_pes (tvs tvs' : Nat) (tenv : type_env) (tenvE : tenv_val_exp)
    (pes : List (pat × exp)) (t1 t2 : sem_t) : Prop :=
  ∀ p e, (p, e) ∈ pes →
    ∃ bindings,
      ALL_DISTINCT (pat_bindings p []) = true ∧
      type_p tvs tenv p t1 bindings ∧
      type_e tenv (bind_var_list tvs' bindings tenvE) e t2

theorem type_pes_cons :
    ∀ tvs tvs' tenv tenvE p e pes t1 t2,
      type_pes tvs tvs' tenv tenvE ((p, e) :: pes) t1 t2 ↔
      (ALL_DISTINCT (pat_bindings p []) = true ∧
       (∃ bindings,
          type_p tvs tenv p t1 bindings ∧
          type_e tenv (bind_var_list tvs' bindings tenvE) e t2) ∧
       type_pes tvs tvs' tenv tenvE pes t1 t2) := by sorry

-- ============================================================
-- check_freevars
-- ============================================================

theorem check_freevars_add :
    ∀ tvs tvs' t_val,
      check_freevars tvs tvs' t_val →
      ∀ tvs'', tvs'' ≥ tvs → check_freevars tvs'' tvs' t_val := by sorry

-- ============================================================
-- type_subst
-- ============================================================

theorem check_freevars_subst_single :
    ∀ dbmax tvs t_val tvs' ts,
      tvs.length = ts.length →
      check_freevars dbmax tvs t_val →
      EVERY (check_freevars dbmax tvs') ts →
      check_freevars dbmax tvs' (type_subst (alist_to_fmap (ZIP (tvs, ts))) t_val) := by sorry

theorem check_freevars_subst_list :
    ∀ dbmax tvs tvs' ts ts',
      tvs.length = ts.length →
      EVERY (check_freevars dbmax tvs) ts' →
      EVERY (check_freevars dbmax tvs') ts →
      EVERY (check_freevars dbmax tvs') (ts'.map (type_subst (alist_to_fmap (ZIP (tvs, ts))))) := by sorry

-- ============================================================
-- deBruijn_inc
-- ============================================================

theorem deBruijn_inc0 :
    (∀ (t_val : sem_t) sk, deBruijn_inc sk 0 t_val = t_val) ∧
    (∀ (ts : List sem_t) sk, ts.map (deBruijn_inc sk 0) = ts) := by sorry

theorem deBruijn_inc_deBruijn_inc :
    ∀ sk i2 (t_val : sem_t) i1,
      deBruijn_inc sk i1 (deBruijn_inc sk i2 t_val) = deBruijn_inc sk (i1 + i2) t_val := by sorry

theorem type_subst_deBruijn_inc_list : True := by sorry

theorem nil_deBruijn_inc :
    ∀ skip tvs (t_val : sem_t),
      (check_freevars skip [] t_val ∨ check_freevars skip [] (deBruijn_inc skip tvs t_val)) →
      deBruijn_inc skip tvs t_val = t_val := by sorry

-- ============================================================
-- deBruijn_subst
-- ============================================================

theorem deBruijn_subst_check_freevars :
    ∀ tvs tvs' (t_val : sem_t) ts,
      check_freevars tvs tvs' t_val →
      EVERY (check_freevars tvs tvs') ts →
      check_freevars tvs tvs' (deBruijn_subst 0 ts t_val) := by sorry

theorem deBruijn_subst_check_freevars2 :
    ∀ tvs tvs' (t_val : sem_t) ts,
      check_freevars ts.length tvs' t_val →
      EVERY (check_freevars tvs tvs') ts →
      check_freevars tvs tvs' (deBruijn_subst 0 ts t_val) := by sorry

theorem check_freevars_subst_inc :
    ∀ tvs tvs2 (t_val : sem_t),
      check_freevars tvs tvs2 t_val →
      ∀ tvs' targs tvs1,
        tvs = targs.length + tvs' →
        EVERY (check_freevars (tvs1 + tvs') tvs2) targs →
        check_freevars (tvs1 + tvs') tvs2
          (deBruijn_subst 0 targs (deBruijn_inc targs.length tvs1 t_val)) := by sorry

theorem check_freevars_subst :
    ∀ tvs tvs2 (t_val : sem_t),
      check_freevars tvs tvs2 t_val →
      ∀ tvs' targs tvs1,
        tvs = targs.length + tvs' →
        EVERY (check_freevars (tvs1 + tvs') tvs2) targs →
        check_freevars (tvs1 + tvs') tvs2 (deBruijn_subst 0 targs t_val) := by sorry

theorem type_subst_deBruijn_subst_list : True := by sorry

theorem nil_deBruijn_subst :
    ∀ skip tvs (t_val : sem_t),
      check_freevars skip [] t_val →
      deBruijn_subst skip tvs t_val = t_val := by sorry

theorem deBruijn_subst2 :
    (∀ (t_val : sem_t) sk (targs targs' : List sem_t),
      check_freevars targs.length [] t_val →
      deBruijn_subst sk (targs'.map (deBruijn_inc 0 sk)) (deBruijn_subst 0 targs t_val) =
      deBruijn_subst 0 (targs.map (deBruijn_subst sk (targs'.map (deBruijn_inc 0 sk)))) t_val) ∧
    (∀ (ts : List sem_t) sk (targs targs' : List sem_t),
      EVERY (check_freevars targs.length []) ts →
      (ts.map (deBruijn_subst 0 targs)).map (deBruijn_subst sk (targs'.map (deBruijn_inc 0 sk))) =
      ts.map (deBruijn_subst 0 (targs.map (deBruijn_subst sk (targs'.map (deBruijn_inc 0 sk)))))) := by sorry

theorem type_e_subst_lem3 :
    ∀ tvs tvs2 (t_val : sem_t),
      check_freevars tvs tvs2 t_val →
      ∀ tvs' targs n,
        tvs = n + targs.length →
        EVERY (check_freevars tvs' tvs2) targs →
        check_freevars (n + tvs') tvs2
          (deBruijn_subst n (targs.map (deBruijn_inc 0 n)) t_val) := by sorry

theorem subst_inc_cancel :
    (∀ (t_val : sem_t) ts inc,
      deBruijn_subst 0 ts (deBruijn_inc 0 (inc + ts.length) t_val) =
      deBruijn_inc 0 inc t_val) ∧
    (∀ (ts' : List sem_t) ts inc,
      (ts'.map (deBruijn_inc 0 (inc + ts.length))).map (deBruijn_subst 0 ts) =
      ts'.map (deBruijn_inc 0 inc)) := by sorry

theorem deBruijn_subst_id :
    (∀ (t_val : sem_t) n,
      check_freevars n [] t_val →
      deBruijn_subst 0 ((COUNT_LIST n).map sem_t.Tvar_db) t_val = t_val) ∧
    (∀ (ts : List sem_t) n,
      EVERY (check_freevars n []) ts →
      ts.map (deBruijn_subst 0 ((COUNT_LIST n).map sem_t.Tvar_db)) = ts) := by sorry

theorem deBruijn_subst_freevars :
    ∀ skip targs (t_val : sem_t) tvs,
      skip = 0 →
      EVERY (check_freevars tvs []) targs →
      check_freevars targs.length [] t_val →
      check_freevars tvs [] (deBruijn_subst skip targs t_val) := by sorry

-- ============================================================
-- tenv_abbrev stuff
-- ============================================================

theorem tenv_abbrev_ok_lookup :
    ∀ (tenvT : tenv_abbrev) tn tvs t_val,
      tenv_abbrev_ok tenvT →
      nsLookup tenvT tn = some (tvs, t_val) →
      check_freevars 0 tvs t_val := by sorry

theorem check_freevars_type_name_subst :
    ∀ tvs (t_val : ast_t) dbmax (tenvT : tenv_abbrev),
      tenv_abbrev_ok tenvT →
      check_type_names tenvT t_val →
      check_freevars_ast tvs t_val →
      check_freevars dbmax tvs (type_name_subst tenvT t_val) := by sorry

theorem tenv_abbrev_ok_merge :
    ∀ (tenvT1 tenvT2 : tenv_abbrev),
      tenv_abbrev_ok tenvT1 →
      tenv_abbrev_ok tenvT2 →
      tenv_abbrev_ok (nsAppend tenvT1 tenvT2) := by sorry

-- ============================================================
-- tenv_ctor stuff
-- ============================================================

theorem type_ctor_long : True := by sorry

theorem tenv_ctor_ok_merge :
    ∀ (tenvC1 tenvC2 : tenv_ctor),
      tenv_ctor_ok tenvC1 →
      tenv_ctor_ok tenvC2 →
      tenv_ctor_ok (nsAppend tenvC1 tenvC2) := by sorry

theorem tenv_ctor_ok_lookup :
    ∀ (tenvC : tenv_ctor) cn tvs ts tn,
      tenv_ctor_ok tenvC →
      nsLookup tenvC cn = some (tvs, ts, tn) →
      ∀ t' ∈ ts, check_freevars 0 tvs t' := by sorry

-- ============================================================
-- tenv_val_exp stuff: definitions
-- ============================================================

-- deBruijn_subst_tenvE: substitution on tenv_val_exp
def deBruijn_subst_tenvE (targs : List sem_t) : tenv_val_exp → tenv_val_exp
  | tenv_val_exp.Empty => tenv_val_exp.Empty
  | tenv_val_exp.Bind_tvar tvs env =>
    tenv_val_exp.Bind_tvar tvs (deBruijn_subst_tenvE targs env)
  | tenv_val_exp.Bind_name x tvs t_val env =>
    tenv_val_exp.Bind_name x tvs
      (deBruijn_subst (tvs + num_tvs env)
        (targs.map (deBruijn_inc 0 (tvs + num_tvs env)))
        t_val)
      (deBruijn_subst_tenvE targs env)

-- db_merge: merge two tenv_val_exp
def db_merge : tenv_val_exp → tenv_val_exp → tenv_val_exp
  | tenv_val_exp.Empty, e => e
  | tenv_val_exp.Bind_tvar tvs e1, e2 =>
    tenv_val_exp.Bind_tvar tvs (db_merge e1 e2)
  | tenv_val_exp.Bind_name x tvs t_val e1, e2 =>
    tenv_val_exp.Bind_name x tvs t_val (db_merge e1 e2)

-- ============================================================
-- tenv_val_exp stuff: theorems
-- ============================================================

theorem bind_tvar_rewrites :
    (∀ tvs (e1 e2 : tenv_val_exp), db_merge (bind_tvar tvs e1) e2 = bind_tvar tvs (db_merge e1 e2)) ∧
    (∀ tvs (e : tenv_val_exp), num_tvs (bind_tvar tvs e) = tvs + num_tvs e) ∧
    (∀ tvs (e : tenv_val_exp), num_tvs (tenv_val_exp.Bind_tvar tvs e) = tvs + num_tvs e) ∧
    (∀ tvs n t_val (e : tenv_val_exp), num_tvs (tenv_val_exp.Bind_name n tvs t_val e) = num_tvs e) ∧
    (num_tvs tenv_val_exp.Empty = 0) ∧
    (∀ (n : mlstring) inc tvs (e : tenv_val_exp), tveLookup n inc (bind_tvar tvs e) = tveLookup n (inc + tvs) e) ∧
    (∀ tvs (e : tenv_val_exp), tenv_val_exp_ok (bind_tvar tvs e) ↔ tenv_val_exp_ok e) ∧
    (∀ targs tvs (e : tenv_val_exp),
      deBruijn_subst_tenvE targs (bind_tvar tvs e) =
      bind_tvar tvs (deBruijn_subst_tenvE targs e)) := by sorry

theorem bind_tvar0 :
    ∀ (x : tenv_val_exp), bind_tvar 0 x = x := by sorry

theorem tveLookup_subst_none :
    ∀ (n : mlstring) inc (e : tenv_val_exp) targs,
      tveLookup n inc (deBruijn_subst_tenvE targs e) = none ↔
      tveLookup n inc e = none := by sorry

theorem tveLookup_db_merge_none :
    ∀ (n : mlstring) inc (e1 e2 : tenv_val_exp),
      tveLookup n inc (db_merge e1 e2) = none ↔
      tveLookup n inc e1 = none ∧ tveLookup n (num_tvs e1 + inc) e2 = none := by sorry

theorem tveLookup_inc_none :
    ∀ (n : mlstring) inc (e : tenv_val_exp),
      tveLookup n inc e = none ↔ tveLookup n 0 e = none := by sorry

theorem tveLookup_freevars_0 :
    ∀ (n : mlstring) tvs (tenvE : tenv_val_exp) tvs' t_val,
      tenv_val_exp_ok tenvE →
      num_tvs tenvE = 0 →
      tveLookup n tvs tenvE = some (tvs', t_val) →
      check_freevars tvs' [] t_val := by sorry

theorem tveLookup_bvl :
    ∀ (x : mlstring) tvs tvs' bindings (tenvE : tenv_val_exp),
      tveLookup x tvs (bind_var_list tvs' bindings tenvE) =
      match ALOOKUP bindings x with
      | some t_val => some (tvs', deBruijn_inc tvs' tvs t_val)
      | none => tveLookup x tvs tenvE := by sorry

theorem bind_var_list_append :
    ∀ n (te1 te2 : List (mlstring × sem_t)) (te3 : tenv_val_exp),
      bind_var_list n (te1 ++ te2) te3 =
      bind_var_list n te1 (bind_var_list n te2 te3) := by sorry

theorem num_tvs_bind_var_list :
    ∀ tvs env (tenvE : tenv_val_exp),
      num_tvs (bind_var_list tvs env tenvE) = num_tvs tenvE := by sorry

theorem tenv_val_exp_ok_bvl :
    ∀ (tenvE : tenv_val_exp) env,
      tenv_val_exp_ok tenvE →
      EVERY (check_freevars (num_tvs tenvE) []) (env.map Prod.snd) →
      tenv_val_exp_ok (bind_var_list 0 env tenvE) := by sorry

theorem tveLookup_subst_some :
    ∀ (n : mlstring) (e : tenv_val_exp) targs tvs t_val inc,
      tveLookup n inc e = some (tvs, t_val) →
      tveLookup n inc (deBruijn_subst_tenvE targs e) =
        some (tvs, deBruijn_subst (tvs + inc + num_tvs e)
          (targs.map (deBruijn_inc 0 (tvs + inc + num_tvs e))) t_val) := by sorry

theorem num_tvs_db_merge :
    ∀ (e1 e2 : tenv_val_exp),
      num_tvs (db_merge e1 e2) = num_tvs e1 + num_tvs e2 := by sorry

theorem num_tvs_deBruijn_subst_tenvE :
    ∀ targs (tenvE : tenv_val_exp),
      num_tvs (deBruijn_subst_tenvE targs tenvE) = num_tvs tenvE := by sorry

theorem tveLookup_inc_some :
    ∀ (n : mlstring) inc (e : tenv_val_exp) tvs t_val inc2,
      tveLookup n inc e = some (tvs, t_val) →
      ∃ t', t_val = deBruijn_inc tvs inc t' ∧
            tveLookup n inc2 e = some (tvs, deBruijn_inc tvs inc2 t') := by sorry

theorem tveLookup_add_inc :
    ∀ (x : mlstring) inc (tenv : tenv_val_exp) tvs t_val inc2,
      tveLookup x inc tenv = some (tvs, t_val) →
      tveLookup x (inc2 + inc) tenv = some (tvs, deBruijn_inc tvs inc2 t_val) := by sorry

theorem tveLookup_freevars_subst :
    ∀ (tenvE : tenv_val_exp) targs (n : mlstring) t_val inc,
      EVERY (check_freevars (inc + num_tvs tenvE) []) targs →
      tveLookup n inc tenvE = some (targs.length, t_val) →
      tenv_val_exp_ok tenvE →
      check_freevars (inc + num_tvs tenvE) [] (deBruijn_subst 0 targs t_val) := by sorry

theorem tenv_val_exp_ok_db_merge :
    ∀ (e1 e2 : tenv_val_exp),
      tenv_val_exp_ok (db_merge e1 e2) → tenv_val_exp_ok e2 := by sorry

theorem tveLookup_no_tvs :
    ∀ tvs l (tenv : tenv_val_exp) (n : mlstring) t_val,
      tenv_val_exp_ok tenv →
      num_tvs tenv = 0 →
      (tveLookup n tvs tenv = some (l, t_val) ↔ tveLookup n 0 tenv = some (l, t_val)) := by sorry

theorem deBruijn_subst_E_bvl :
    ∀ tenv1 (tenv2 : tenv_val_exp) tvs targs,
      deBruijn_subst_tenvE targs (bind_var_list tvs tenv1 tenv2) =
      bind_var_list tvs
        (tenv1.map (fun (x, t_val) =>
          (x, deBruijn_subst (tvs + num_tvs tenv2)
            (targs.map (deBruijn_inc 0 (tvs + num_tvs tenv2))) t_val)))
        (deBruijn_subst_tenvE targs tenv2) := by sorry

theorem db_merge_bvl :
    ∀ tenv1 (tenv2 tenv3 : tenv_val_exp) tvs,
      db_merge (bind_var_list tvs tenv1 tenv2) tenv3 =
      bind_var_list tvs tenv1 (db_merge tenv2 tenv3) := by sorry

theorem tveLookup_db_merge_some :
    ∀ (n : mlstring) inc (tenvE1 tenvE2 : tenv_val_exp) tvs t_val,
      tveLookup n inc (db_merge tenvE1 tenvE2) = some (tvs, t_val) ↔
      tveLookup n inc tenvE1 = some (tvs, t_val) ∨
      (tveLookup n inc tenvE1 = none ∧
       tveLookup n (num_tvs tenvE1 + inc) tenvE2 = some (tvs, t_val)) := by sorry

-- ============================================================
-- type_op
-- ============================================================

theorem type_op_cases : True := by sorry

-- ============================================================
-- type_p
-- ============================================================

theorem type_ps_length :
    ∀ tvs tenvC ps ts tenv,
      type_ps tvs tenvC ps ts tenv → ps.length = ts.length := by sorry

theorem type_p_freevars :
    (∀ tvs tenvC p t_val env',
      type_p tvs tenvC p t_val env' →
      check_freevars tvs [] t_val ∧
      EVERY (check_freevars tvs []) (env'.map Prod.snd)) ∧
    (∀ tvs tenvC ps ts env',
      type_ps tvs tenvC ps ts env' →
      EVERY (check_freevars tvs []) ts ∧
      EVERY (check_freevars tvs []) (env'.map Prod.snd)) := by sorry

theorem type_p_subst : True := by sorry

theorem type_p_bvl :
    (∀ tvs tenvC p t_val bindings,
      type_p tvs tenvC p t_val bindings →
      ∀ (tenv' : tenv_val_exp),
        tenv_val_exp_ok tenv' → tenv_val_exp_ok (bind_var_list tvs bindings tenv')) ∧
    (∀ tvs tenvC ps ts bindings,
      type_ps tvs tenvC ps ts bindings →
      ∀ (tenv' : tenv_val_exp),
        tenv_val_exp_ok tenv' → tenv_val_exp_ok (bind_var_list tvs bindings tenv')) := by sorry

theorem type_p_tenvV_indep : True := by sorry

-- ============================================================
-- type_e, type_es, type_funs
-- ============================================================

theorem type_es_list_rel : True := by sorry

theorem type_es_length :
    ∀ tenv tenvE es ts,
      type_es tenv tenvE es ts → es.length = ts.length := by sorry

theorem type_funs_MAP_FST :
    ∀ funs tenv tenvE env,
      type_funs tenv tenvE funs env →
      funs.map (fun (x, _, _) => x) = env.map Prod.fst := by sorry

theorem tenv_val_exp_ok_bvl_tvs :
    ∀ funs tenv env tvs bindings (tenvE : tenv_val_exp),
      type_funs tenv (bind_var_list 0 bindings (bind_tvar tvs tenvE)) funs env →
      tenv_val_exp_ok tenvE →
      tenv_val_exp_ok (bind_var_list tvs env tenvE) := by sorry

theorem tenv_val_exp_ok_bvl_funs :
    ∀ funs env tenv bindings (tenvE : tenv_val_exp),
      type_funs tenv (bind_var_list 0 bindings tenvE) funs env →
      tenv_val_exp_ok tenvE →
      tenv_val_exp_ok (bind_var_list 0 env tenvE) := by sorry

theorem type_e_freevars :
    (∀ tenv tenvE e t_val,
      type_e tenv tenvE e t_val →
      tenv_val_exp_ok tenvE → tenv_val_ok tenv.v →
      check_freevars (num_tvs tenvE) [] t_val) ∧
    (∀ tenv tenvE es ts,
      type_es tenv tenvE es ts →
      tenv_val_exp_ok tenvE → tenv_val_ok tenv.v →
      EVERY (check_freevars (num_tvs tenvE) []) ts) ∧
    (∀ tenv tenvE funs env,
      type_funs tenv tenvE funs env →
      tenv_val_exp_ok tenvE → tenv_val_ok tenv.v →
      EVERY (check_freevars (num_tvs tenvE) []) (env.map Prod.snd)) := by sorry

theorem type_e_subst : True := by sorry

-- Recursive functions have function type
theorem type_funs_Tfn :
    ∀ (tenv : type_env) (tenvE : tenv_val_exp)
      (funs : List (varN × varN × exp)) (bindings : List (varN × sem_t))
      (tvs : Nat) (t_val : sem_t) (n : mlstring),
      type_funs tenv tenvE funs bindings →
      ALOOKUP bindings n = some t_val →
      ∃ t1 t2, t_val = Tfn t1 t2 ∧ check_freevars (num_tvs tenvE) [] (Tfn t1 t2) := by sorry

-- Recursive functions can be looked up in the execution environment
theorem type_funs_lookup :
    ∀ (fn : mlstring) (tenvE : tenv_val_exp)
      (funs : List (varN × varN × exp)) (bindings : List (varN × sem_t))
      (n : mlstring) (e : exp) (tenv : type_env),
      (fn, n, e) ∈ funs →
      type_funs tenv tenvE funs bindings →
      ∃ t_val, ALOOKUP bindings fn = some t_val := by sorry

-- Functions in the type environment can be found
theorem type_funs_find_recfun :
    ∀ (fn : mlstring) (env : List (varN × sem_t))
      (funs : List (varN × varN × exp)) (bindings : List (varN × sem_t))
      (e : exp) (tenv : type_env) (tenvE : tenv_val_exp) (t_val : sem_t),
      ALOOKUP bindings fn = some t_val →
      type_funs tenv tenvE funs bindings →
      ∃ n e, find_recfun fn funs = some (n, e) := by sorry

theorem type_recfun_lookup :
    ∀ (fn : mlstring) (funs : List (varN × varN × exp)) (n : varN) (e : exp)
      (tenv : type_env) (tenvE : tenv_val_exp) (bindings : List (varN × sem_t))
      (tvs : Nat) (t1 t2 : sem_t),
      find_recfun fn funs = some (n, e) →
      type_funs tenv tenvE funs bindings →
      ALOOKUP bindings fn = some (Tfn t1 t2) →
      type_e tenv (tenv_val_exp.Bind_name n 0 t1 tenvE) e t2 ∧
      check_freevars (num_tvs tenvE) [] (Tfn t1 t2) := by sorry

-- No duplicate function definitions in a single let rec
theorem type_funs_distinct :
    ∀ tenv tenvE funs bindings,
      type_funs tenv tenvE funs bindings →
      ALL_DISTINCT (funs.map (fun (x, _, _) => x)) = true := by sorry

theorem type_funs_tenv_exp_ok :
    ∀ funs env tenv (tenvE : tenv_val_exp) tvs bindings,
      num_tvs tenvE = 0 →
      type_funs tenv (bind_var_list 0 bindings (bind_tvar tvs tenvE)) funs env →
      tenv_val_exp_ok (bind_var_list tvs env tenv_val_exp.Empty) := by sorry

-- ============================================================
-- ctMap stuff: definition
-- ============================================================

-- type_def_to_ctMap: converts type definitions to constructor type map
def type_def_to_ctMap (tenvT : tenv_abbrev) (next_stamp : Nat) :
    List (List tvarN × mlstring × List (conN × List ast_t)) → List type_ident →
    List (stamp × (List tvarN × List sem_t × type_ident))
  | [], [] => []
  | (tvs, _tn, ctors) :: tds, id_val :: ids =>
    type_def_to_ctMap tenvT (next_stamp + 1) tds ids ++
    (ctors.map (fun (cn, ts) =>
      (stamp.TypeStamp cn next_stamp,
       (tvs, ts.map (type_name_subst tenvT), id_val)))).reverse
  | _, _ => []

-- ============================================================
-- ctMap stuff: theorems
-- ============================================================

theorem mem_type_def_to_ctMap :
    ∀ (tenvT : tenv_abbrev) next tds ids stmp x,
      (stmp, x) ∈ type_def_to_ctMap tenvT next tds ids →
      tds.length = ids.length →
      ∃ cn i, stmp = stamp.TypeStamp cn i ∧ next ≤ i ∧ i < next + tds.length := by sorry

theorem ctMap_ok_merge_imp : True := by sorry

theorem ctMap_ok_lookup :
    ∀ (ctMap' : ctMap) (cn : conN) (tvs : List tvarN) (ts : List sem_t) (ti : type_ident) (tn : stamp),
      ctMap_ok ctMap' →
      FLOOKUP ctMap' tn = some (tvs, ts, ti) →
      ∀ t' ∈ ts, check_freevars 0 tvs t' := by sorry

theorem type_def_to_ctMap_mem : True := by sorry

theorem ctMap_ok_type_defs : True := by sorry

-- ============================================================
-- check_ctor_tenv
-- ============================================================

theorem check_ctor_tenv_change_tenvT : True := by sorry

theorem check_ctor_tenv_EVERY : True := by sorry

-- ============================================================
-- type_v
-- ============================================================

theorem nsLookup_add_tenvE1 :
    ∀ (tenvE : tenv_val_exp) (tenvV : tenv_val) (n : mlstring) tvs t_val tvs2,
      check_freevars tvs2 [] t_val →
      tveLookup n tvs tenvE = some (tvs2, t_val) →
      nsLookup (add_tenvE tenvE tenvV) (id.Short n) = some (tvs2, t_val) := by sorry

theorem nsLookup_add_tenvE2 :
    ∀ (tenvE : tenv_val_exp) (tenvV : tenv_val) (n : mlstring) tvs t_val tvs2,
      tveLookup n tvs tenvE = none →
      nsLookup tenvV (id.Short n) = some (tvs2, t_val) →
      nsLookup (add_tenvE tenvE tenvV) (id.Short n) = some (tvs2, t_val) := by sorry

theorem nsLookup_add_tenvE3 :
    ∀ (tenvE : tenv_val_exp) (tenvV : tenv_val) (n : id modN varN) t_val tvs2 mn,
      nsLookup tenvV (id.Long mn n) = some (tvs2, t_val) →
      nsLookup (add_tenvE tenvE tenvV) (id.Long mn n) = some (tvs2, t_val) := by sorry

theorem tenv_val_ok_add_tenvE :
    ∀ (tenvE : tenv_val_exp) (tenvV : tenv_val),
      num_tvs tenvE = 0 →
      tenv_val_exp_ok tenvE →
      tenv_val_ok tenvV →
      tenv_val_ok (add_tenvE tenvE tenvV) := by sorry

theorem add_tenvE_nsAppend :
    ∀ (tenvE : tenv_val_exp) (tenvV : tenv_val),
      nsAppend (add_tenvE tenvE nsEmpty) tenvV = add_tenvE tenvE tenvV := by sorry

theorem add_tenvE_bvl :
    ∀ n bindings (tenvE : tenv_val_exp) (tenvV : tenv_val),
      add_tenvE (bind_var_list n bindings tenvE) tenvV =
      nsBindList (bindings.map (fun (x, t_val) => (x, (n, t_val)))) (add_tenvE tenvE tenvV) := by sorry

theorem type_v_freevars :
    ∀ tvs (tenvC : ctMap) tenvS v_val t_val,
      type_v tvs tenvC tenvS v_val t_val → check_freevars tvs [] t_val := by sorry

-- This is the theorem `type_subst` from the HOL4 source (about type_v and substitution)
theorem type_subst_thm : True := by sorry

theorem check_ctor_tenv_ok :
    ∀ (tenvT : tenv_abbrev) tds tis,
      tds.length = tis.length →
      check_ctor_tenv tenvT tds →
      tenv_abbrev_ok tenvT →
      tenv_ctor_ok (build_ctor_tenv tenvT tds tis) := by sorry

theorem nsMap_build_ctor_tenv : True := by sorry

-- ============================================================
-- type_d
-- ============================================================

theorem type_d_check_uniq :
    (∀ check tenv d tdecs new_tenv,
      type_d check tenv d tdecs new_tenv →
      type_d false tenv d tdecs new_tenv) ∧
    (∀ check tenv d tdecs new_tenv,
      type_ds check tenv d tdecs new_tenv →
      type_ds false tenv d tdecs new_tenv) := by sorry

theorem extend_dec_tenv_ok :
    ∀ (tenv tenv' : type_env),
      tenv_ok tenv → tenv_ok tenv' →
      tenv_ok (extend_dec_tenv tenv tenv') := by sorry

theorem type_d_tenv_ok_helper :
    (∀ check tenv d tdecs (tenv' : type_env),
      type_d check tenv d tdecs tenv' →
      tenv_ok tenv → tenv_ok tenv') ∧
    (∀ check tenv d tdecs (tenv' : type_env),
      type_ds check tenv d tdecs tenv' →
      tenv_ok tenv → tenv_ok tenv') := by sorry

theorem type_d_tenv_ok :
    ∀ check tenv d tdecs (tenv' : type_env),
      type_d check tenv d tdecs tenv' →
      tenv_ok tenv →
      tenv_ok (extend_dec_tenv tenv' tenv) := by sorry

-- ============================================================
-- type_ds
-- ============================================================

theorem type_ds_empty :
    ∀ check (tenv : type_env) decls r,
      type_ds check tenv [] decls r ↔
      decls = (fun _ => False) ∧ r = ({ v := nsEmpty, c := nsEmpty, t := nsEmpty } : type_env) := by sorry

theorem type_ds_sing :
    ∀ check (tenv : type_env) d decls r,
      type_ds check tenv [d] decls r ↔ type_d check tenv d decls r := by sorry

end CakeML
