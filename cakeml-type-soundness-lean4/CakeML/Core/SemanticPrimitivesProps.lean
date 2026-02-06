/-
  Various basic properties of the semantic primitives.
  Translated from: hol4_sources/semanticPrimitivesPropsScript.sml
-/
import CakeML.Core.SemanticPrimitives
import CakeML.Core.NamespaceProps

namespace CakeML

open HOL4
open mlstring

set_option autoImplicit true

-- ============================================================
-- Simple simp lemmas about sem_env
-- ============================================================

theorem with_same_v :
    ∀ (env : sem_env),
      sem_env.mk env.v_field env.c = env := by sorry

theorem unchanged_env :
    ∀ (env : sem_env),
      sem_env.mk env.v_field env.c = env := by sorry

theorem with_same_clock :
    ∀ (st : state ffi),
      { st with clock := st.clock } = st := by sorry

theorem Boolv_11 :
    ∀ b1 b2, Boolv b1 = Boolv b2 ↔ b1 = b2 := by sorry

theorem extend_dec_env_assoc :
    ∀ (env1 env2 env3 : sem_env),
      extend_dec_env env1 (extend_dec_env env2 env3) =
      extend_dec_env (extend_dec_env env1 env2) env3 := by sorry

-- ============================================================
-- shift_lookup and do_shift definitions
-- ============================================================

def shift_lookup_props : shift → BitVec n → Nat → BitVec n
  | shift.Lsl => word_lsl
  | shift.Lsr => word_lsr
  | shift.Asr => word_asr
  | shift.Ror => word_ror

def do_shift_props : shift → Nat → word_size → lit → Option lit
  | sh, n, word_size.W8, lit.Word8 w => some (lit.Word8 (shift_lookup_props sh w n))
  | sh, n, word_size.W64, lit.Word64 w => some (lit.Word64 (shift_lookup_props sh w n))
  | _, _, _, _ => none

-- ============================================================
-- lit_same_type properties
-- ============================================================

theorem lit_same_type_refl :
    ∀ l, lit_same_type l l = true := by sorry

theorem lit_same_type_sym :
    ∀ l1 l2, lit_same_type l1 l2 = true → lit_same_type l2 l1 = true := by sorry

-- ============================================================
-- pat_bindings properties
-- ============================================================

theorem pat_bindings_accum :
    (∀ (p : pat) (acc : List varN),
      pat_bindings p acc = pat_bindings p [] ++ acc) ∧
    (∀ (ps : List pat) (acc : List varN),
      pats_bindings ps acc = pats_bindings ps [] ++ acc) := by sorry

-- ============================================================
-- pmatch properties
-- ============================================================

-- Note: pmatch_list is defined via 'where' in SemanticPrimitives.lean.
-- We state theorems about pmatch only. The pmatch_list part of the
-- conjunction is reflected by quantifying over list arguments directly.

theorem pmatch_append :
    (∀ (cenv : env_ctor) (st : store v) (p : pat) (val' : v)
       (env env' env'' : List (varN × v)),
      pmatch cenv st p val' env = match_result.Match env' →
      pmatch cenv st p val' (env ++ env'') = match_result.Match (env' ++ env'')) ∧
    (∀ (cenv : env_ctor) (st : store v) (ps : List pat) (vs' : List v)
       (env env' env'' : List (varN × v)),
      pmatch.pmatch_list cenv st ps vs' env = match_result.Match env' →
      pmatch.pmatch_list cenv st ps vs' (env ++ env'') = match_result.Match (env' ++ env'')) := by sorry

theorem pmatch_extend :
    (∀ (cenv : env_ctor) (s : store v) (p : pat) (val' : v)
       (env env' : List (varN × v)),
      pmatch cenv s p val' env = match_result.Match env' →
      ∃ env'', env' = env'' ++ env ∧ env''.map Prod.fst = pat_bindings p []) ∧
    (∀ (cenv : env_ctor) (s : store v) (ps : List pat) (vs' : List v)
       (env env' : List (varN × v)),
      pmatch.pmatch_list cenv s ps vs' env = match_result.Match env' →
      ∃ env'', env' = env'' ++ env ∧ env''.map Prod.fst = pats_bindings ps []) := by sorry

theorem pmatch_nsAppend :
    (∀ (ns' : env_ctor) (st : store v) (pat' : pat) (val' : v)
       (env : List (varN × v)) (m : List (varN × v)) (ns'' : env_ctor),
      (pmatch ns' st pat' val' env = match_result.No_match →
       pmatch (nsAppend ns' ns'') st pat' val' env = match_result.No_match) ∧
      (pmatch ns' st pat' val' env = match_result.Match m →
       pmatch (nsAppend ns' ns'') st pat' val' env = match_result.Match m)) ∧
    (∀ (ns' : env_ctor) (st : store v) (pats : List pat) (vs' : List v)
       (env : List (varN × v)) (m : List (varN × v)) (ns'' : env_ctor),
      (pmatch.pmatch_list ns' st pats vs' env = match_result.No_match →
       pmatch.pmatch_list (nsAppend ns' ns'') st pats vs' env = match_result.No_match) ∧
      (pmatch.pmatch_list ns' st pats vs' env = match_result.Match m →
       pmatch.pmatch_list (nsAppend ns' ns'') st pats vs' env = match_result.Match m)) := by sorry

theorem pmatch_nsAppend_No_match :
    ∀ (ns' : env_ctor) (st : store v) (pat' : pat) (val' : v)
      (env : List (varN × v)) (ns'' : env_ctor),
      pmatch ns' st pat' val' env = match_result.No_match →
      pmatch (nsAppend ns' ns'') st pat' val' env = match_result.No_match := by sorry

theorem pmatch_nsAppend_Match :
    ∀ (ns' : env_ctor) (st : store v) (pat' : pat) (val' : v)
      (env : List (varN × v)) (m : List (varN × v)) (ns'' : env_ctor),
      pmatch ns' st pat' val' env = match_result.Match m →
      pmatch (nsAppend ns' ns'') st pat' val' env = match_result.Match m := by sorry

theorem pmatch_acc :
    (∀ (envc : env_ctor) (store' : store v) (p : pat) (val' : v)
       (env env' env2 : List (varN × v)),
      (pmatch envc store' p val' env = match_result.Match env' ↔
       pmatch envc store' p val' (env ++ env2) = match_result.Match (env' ++ env2)) ∧
      (pmatch envc store' p val' env = match_result.No_match ↔
       pmatch envc store' p val' (env ++ env2) = match_result.No_match) ∧
      (pmatch envc store' p val' env = match_result.Match_type_error ↔
       pmatch envc store' p val' (env ++ env2) = match_result.Match_type_error)) ∧
    (∀ (envc : env_ctor) (store' : store v) (ps : List pat) (vs' : List v)
       (env env' env2 : List (varN × v)),
      (pmatch.pmatch_list envc store' ps vs' env = match_result.Match env' ↔
       pmatch.pmatch_list envc store' ps vs' (env ++ env2) = match_result.Match (env' ++ env2)) ∧
      (pmatch.pmatch_list envc store' ps vs' env = match_result.No_match ↔
       pmatch.pmatch_list envc store' ps vs' (env ++ env2) = match_result.No_match) ∧
      (pmatch.pmatch_list envc store' ps vs' env = match_result.Match_type_error ↔
       pmatch.pmatch_list envc store' ps vs' (env ++ env2) = match_result.Match_type_error)) := by sorry

-- ============================================================
-- do_opapp_cases
-- ============================================================

theorem do_opapp_cases :
    ∀ (env' : sem_env) (vs' : List v) (e : exp),
      do_opapp vs' = some (env', e) ↔
      (∃ v2 env'' n,
        vs' = [v.Closure env'' n e, v2] ∧
        env' = sem_env.mk (nsBind n v2 env''.v_field) env''.c) ∨
      (∃ v2 env'' funs n' n'',
        vs' = [v.Recclosure env'' funs n', v2] ∧
        find_recfun n' funs = some (n'', e) ∧
        ALL_DISTINCT (funs.map (fun ⟨f, _, _⟩ => f)) ∧
        env' = sem_env.mk (nsBind n'' v2 (build_rec_env funs env'' env''.v_field)) env''.c) := by sorry

-- ============================================================
-- do_app properties
-- ============================================================

theorem do_app_NONE_ffi :
    ∀ (refs : store v) (ffi' : ffi_state ffi) (op' : op) (args : List v)
      (ffi_val : ffi_state ffi),
      do_app (refs, ffi_val) op' args = none →
      do_app (refs, ffi') op' args = none := by sorry

theorem do_app_SOME_ffi_same :
    ∀ (refs refs' : store v) (ffi_val ffi' : ffi_state ffi)
      (op' : op) (args : List v) (r : result v v),
      do_app (refs, ffi_val) op' args = some ((refs', ffi_val), r) →
      (∀ outcome, r ≠ result.Rerr (error_result.Rabort (abort.Rffi_error outcome))) →
      do_app (refs, ffi') op' args = some ((refs', ffi'), r) := by sorry

theorem do_app_ffi_unchanged :
    ∀ (st st' : store v) (ffi_val ffi' : ffi_state ffi)
      (op' : op) (vs' : List v) (res : result v v),
      (∀ s, op' ≠ op.FFI s) →
      do_app (st, ffi_val) op' vs' = some ((st', ffi'), res) →
      ffi_val = ffi' := by sorry

theorem do_app_ffi_changed :
    ∀ (st st' : store v) (ffi_val ffi' : ffi_state ffi)
      (op' : op) (vs' : List v) (res : result v v),
      do_app (st, ffi_val) op' vs' = some ((st', ffi'), res) →
      ffi_val ≠ ffi' →
      ∃ s conf lnum ws ffi_st ws' b,
        op' = op.FFI s ∧
        vs' = [v.Litv (lit.StrLit conf), v.Loc b lnum] ∧
        store_lookup lnum st = some (store_v.W8array ws) ∧
        s ≠ strlit [] ∧
        ffi_val.oracle_field (ffiname.ExtCall s) ffi_val.ffi_state_field
          ((explode conf).map (fun c => BitVec.ofNat 8 c.toNat)) ws =
          oracle_result.Oracle_return ffi_st ws' ∧
        ws.length = ws'.length ∧
        st' = LUPDATE (store_v.W8array ws') lnum st ∧
        ffi'.oracle_field = ffi_val.oracle_field ∧
        ffi'.ffi_state_field = ffi_st ∧
        ffi'.io_events =
          ffi_val.io_events ++
            [io_event.IO_event (ffiname.ExtCall s)
              ((explode conf).map (fun c => BitVec.ofNat 8 c.toNat))
              (ZIP (ws, ws'))] := by sorry

theorem do_app_not_timeout :
    ∀ (s : store v × ffi_state ffi) (op' : op) (vs' : List v)
      (s' : store v × ffi_state ffi) (a : abort),
      do_app s op' vs' = some (s', result.Rerr (error_result.Rabort a)) →
      a ≠ abort.Rtimeout_error := by sorry

theorem do_app_type_error :
    ∀ (s : store v × ffi_state ffi) (op' : op) (es : List v)
      (x : store v × ffi_state ffi) (a : abort),
      do_app s op' es = some (x, result.Rerr (error_result.Rabort a)) →
      x = s := by sorry

-- ============================================================
-- build_rec_env properties
-- ============================================================

theorem build_rec_env_merge :
    ∀ (funs : List (varN × varN × exp)) (env : sem_env) (env' : ns modN varN v),
      build_rec_env funs env env' =
      nsAppend (alist_to_ns (funs.map (fun ⟨f, _, _⟩ => (f, v.Recclosure env funs f)))) env' := by sorry

-- ============================================================
-- do_con_check / build_conv
-- ============================================================

theorem do_con_check_build_conv :
    ∀ (tenvC : env_ctor) (cn : Option (id modN conN)) (vs' : List v) (l : Nat),
      do_con_check tenvC cn l → ∃ val', build_conv tenvC cn vs' = some val' := by sorry

-- ============================================================
-- map_error_result
-- ============================================================

def map_error_result (f : α → β) : error_result α → error_result β
  | error_result.Rraise e => error_result.Rraise (f e)
  | error_result.Rabort a => error_result.Rabort a

theorem map_error_result_Rtype_error :
    ∀ (f : α → β) (e : error_result α) (a : abort),
      map_error_result f e = error_result.Rabort a ↔ e = error_result.Rabort a := by sorry

theorem map_error_result_I :
    ∀ (e : error_result α), map_error_result _root_.id e = e := by sorry

-- ============================================================
-- map_result
-- ============================================================

def map_result (f1 : α → γ) (f2 : β → δ) : result α β → result γ δ
  | result.Rval v' => result.Rval (f1 v')
  | result.Rerr e => result.Rerr (map_error_result f2 e)

theorem map_result_Rval :
    ∀ (f1 : α → γ) (f2 : β → δ) (e : result α β) (x : γ),
      map_result f1 f2 e = result.Rval x ↔ ∃ y, e = result.Rval y ∧ x = f1 y := by sorry

theorem map_result_Rerr :
    ∀ (f1 : α → γ) (f2 : β → δ) (e : result α β) (e' : error_result δ),
      map_result f1 f2 e = result.Rerr e' ↔
      ∃ a, e = result.Rerr a ∧ map_error_result f2 a = e' := by sorry

-- ============================================================
-- exc_rel
-- ============================================================

def exc_rel (R : α → α → Prop) : error_result α → error_result α → Prop
  | error_result.Rraise v1, error_result.Rraise v2 => R v1 v2
  | error_result.Rabort a1, error_result.Rabort a2 => a1 = a2
  | _, _ => False

theorem exc_rel_raise1 :
    ∀ (R : α → α → Prop) (val' : α) (e : error_result α),
      exc_rel R (error_result.Rraise val') e ↔
      ∃ v', e = error_result.Rraise v' ∧ R val' v' := by sorry

theorem exc_rel_raise2 :
    ∀ (R : α → α → Prop) (e : error_result α) (val' : α),
      exc_rel R e (error_result.Rraise val') ↔
      ∃ v', e = error_result.Rraise v' ∧ R v' val' := by sorry

theorem exc_rel_type_error1 :
    ∀ (R : α → α → Prop) (a : abort) (e : error_result α),
      exc_rel R (error_result.Rabort a) e ↔ e = error_result.Rabort a := by sorry

theorem exc_rel_type_error2 :
    ∀ (R : α → α → Prop) (e : error_result α) (a : abort),
      exc_rel R e (error_result.Rabort a) ↔ e = error_result.Rabort a := by sorry

theorem exc_rel_refl :
    ∀ (R : α → α → Prop), (∀ x, R x x) → ∀ x, exc_rel R x x := by sorry

theorem exc_rel_trans :
    ∀ (R : α → α → Prop),
      (∀ x y z, R x y ∧ R y z → R x z) →
      ∀ x y z, exc_rel R x y ∧ exc_rel R y z → exc_rel R x z := by sorry

-- ============================================================
-- result_rel
-- ============================================================

def result_rel (R1 : α → α → Prop) (R2 : β → β → Prop) : result α β → result α β → Prop
  | result.Rval v1, result.Rval v2 => R1 v1 v2
  | result.Rerr e1, result.Rerr e2 => exc_rel R2 e1 e2
  | _, _ => False

theorem result_rel_Rval :
    ∀ (R1 : α → α → Prop) (R2 : β → β → Prop) (val' : α) (r : result α β),
      result_rel R1 R2 (result.Rval val') r ↔
      ∃ v', r = result.Rval v' ∧ R1 val' v' := by sorry

theorem result_rel_Rerr1 :
    ∀ (R1 : α → α → Prop) (R2 : β → β → Prop) (e : error_result β) (r : result α β),
      result_rel R1 R2 (result.Rerr e) r ↔
      ∃ e', r = result.Rerr e' ∧ exc_rel R2 e e' := by sorry

theorem result_rel_Rerr2 :
    ∀ (R1 : α → α → Prop) (R2 : β → β → Prop) (r : result α β) (e : error_result β),
      result_rel R1 R2 r (result.Rerr e) ↔
      ∃ e', r = result.Rerr e' ∧ exc_rel R2 e' e := by sorry

theorem result_rel_refl :
    ∀ (R1 : α → α → Prop) (R2 : β → β → Prop),
      (∀ x, R1 x x) → (∀ x, R2 x x) → ∀ x, result_rel R1 R2 x x := by sorry

theorem result_rel_trans :
    ∀ (R1 : α → α → Prop) (R2 : β → β → Prop),
      (∀ x y z, R1 x y ∧ R1 y z → R1 x z) →
      (∀ x y z, R2 x y ∧ R2 y z → R2 x z) →
      ∀ x y z, result_rel R1 R2 x y ∧ result_rel R1 R2 y z → result_rel R1 R2 x z := by sorry

-- ============================================================
-- every_error_result / every_result
-- ============================================================

def every_error_result (P : α → Prop) : error_result α → Prop
  | error_result.Rraise e => P e
  | error_result.Rabort _ => True

def every_result (P1 : α → Prop) (P2 : β → Prop) : result α β → Prop
  | result.Rval v' => P1 v'
  | result.Rerr e => every_error_result P2 e

-- ============================================================
-- map_sv
-- ============================================================

def map_sv (f : α → β) : store_v α → store_v β
  | store_v.Refv v' => store_v.Refv (f v')
  | store_v.W8array w => store_v.W8array w
  | store_v.Varray vs' => store_v.Varray (vs'.map f)
  | store_v.Thunk m v' => store_v.Thunk m (f v')

-- ============================================================
-- dest_Refv / is_Refv
-- ============================================================

def dest_Refv [Inhabited α] : store_v α → α
  | store_v.Refv v' => v'
  | _ => default

def is_Refv : store_v α → Bool
  | store_v.Refv _ => true
  | _ => false

-- ============================================================
-- sv_every
-- ============================================================

def sv_every (P : α → Prop) : store_v α → Prop
  | store_v.Refv v' => P v'
  | store_v.Varray vs' => ∀ x ∈ vs', P x
  | store_v.Thunk _ v' => P v'
  | store_v.W8array _ => True

-- ============================================================
-- sv_rel
-- ============================================================

/-- Relates two store values element-wise using R (HOL4's LIST_REL for Varray) -/
def sv_rel_list (R : α → β → Prop) : List α → List β → Prop
  | [], [] => True
  | a :: as', b :: bs => R a b ∧ sv_rel_list R as' bs
  | _, _ => False

def sv_rel (R : α → β → Prop) : store_v α → store_v β → Prop
  | store_v.Refv v1, store_v.Refv v2 => R v1 v2
  | store_v.W8array w1, store_v.W8array w2 => w1 = w2
  | store_v.Varray vs1, store_v.Varray vs2 => sv_rel_list R vs1 vs2
  | store_v.Thunk m1 v1, store_v.Thunk m2 v2 => m1 = m2 ∧ R v1 v2
  | _, _ => False

theorem sv_rel_refl :
    ∀ (R : α → α → Prop), (∀ x, R x x) → ∀ x, sv_rel R x x := by sorry

theorem sv_rel_trans :
    ∀ (R : α → α → Prop),
      (∀ x y z, R x y ∧ R y z → R x z) →
      ∀ x y z, sv_rel R x y ∧ sv_rel R y z → sv_rel R x z := by sorry

theorem sv_rel_cases :
    ∀ (R : α → β → Prop) (x : store_v α) (y : store_v β),
      sv_rel R x y ↔
      (∃ v1 v2, x = store_v.Refv v1 ∧ y = store_v.Refv v2 ∧ R v1 v2) ∨
      (∃ w, x = store_v.W8array w ∧ y = store_v.W8array w) ∨
      (∃ m v1 v2, x = store_v.Thunk m v1 ∧ y = store_v.Thunk m v2 ∧ R v1 v2) ∨
      (∃ vs1 vs2, x = store_v.Varray vs1 ∧ y = store_v.Varray vs2 ∧ sv_rel R x y) := by sorry

theorem sv_rel_mono :
    ∀ (P Q : α → β → Prop),
      (∀ x y, P x y → Q x y) → ∀ (x : store_v α) (y : store_v β), sv_rel P x y → sv_rel Q x y := by sorry

-- ============================================================
-- store_v_vs / store_vs
-- ============================================================

def store_v_vs : store_v α → List α
  | store_v.Refv v' => [v']
  | store_v.Varray vs' => vs'
  | store_v.W8array _ => []
  | store_v.Thunk _ v' => [v']

def store_vs (s : List (store_v α)) : List α :=
  FLAT (s.map store_v_vs)

-- ============================================================
-- store_vs theorems
-- ============================================================

theorem EVERY_sv_every_MAP_map_sv :
    ∀ (P : β → Prop) (f : α → β) (ls : List (store_v α)),
      (∀ x ∈ store_vs (ls.map (map_sv f)), P x) →
      ∀ x ∈ ls.map (map_sv f), sv_every P x := by sorry

theorem LIST_REL_store_vs_intro :
    ∀ (P : α → β → Prop) (l1 : List (store_v α)) (l2 : List (store_v β)),
      sv_rel_list (sv_rel P) l1 l2 →
      sv_rel_list P (store_vs l1) (store_vs l2) := by sorry

theorem EVERY_sv_every_EVERY_store_vs :
    ∀ (P : α → Prop) (ls : List (store_v α)),
      (∀ x ∈ ls, sv_every P x) ↔ (∀ x ∈ store_vs ls, P x) := by sorry

theorem EVERY_store_vs_intro :
    ∀ (P : α → Prop) (ls : List (store_v α)),
      (∀ x ∈ ls, sv_every P x) → ∀ x ∈ store_vs ls, P x := by sorry

theorem map_sv_compose :
    ∀ (f : β → γ) (g : α → β) (x : store_v α),
      map_sv f (map_sv g x) = map_sv (f ∘ g) x := by sorry

-- ============================================================
-- map_match
-- ============================================================

def map_match (f : α → β) : match_result α → match_result β
  | match_result.Match env => match_result.Match (f env)
  | match_result.No_match => match_result.No_match
  | match_result.Match_type_error => match_result.Match_type_error

-- ============================================================
-- find_recfun properties
-- ============================================================

theorem find_recfun_ALOOKUP :
    ∀ (funs : List (mlstring × α × β)) (n : mlstring),
      find_recfun n funs = ALOOKUP funs n := by sorry

theorem find_recfun_el :
    ∀ (f : mlstring) (funs : List (mlstring × mlstring × exp)) (x : mlstring) (e : exp) (n : Nat),
      ALL_DISTINCT (funs.map (fun ⟨f', _, _⟩ => f')) →
      n < funs.length →
      EL n funs = (f, x, e) →
      find_recfun f funs = some (x, e) := by sorry

-- ============================================================
-- ctors_of_tdef / ctors_of_dec
-- ============================================================

def ctors_of_tdef : List tvarN × typeN × List (conN × List ast_t) → List conN
  | (_, _, condefs) => condefs.map Prod.fst

def ctors_of_dec : dec → List conN
  | dec.Dtype _ tds => FLAT (tds.map ctors_of_tdef)
  | dec.Dexn _ s _ => [s]
  | _ => []

-- ============================================================
-- Free variables (FV)
-- HOL4 defines FV as a set. We use (id modN varN → Prop) here
-- since the project does not depend on Mathlib.
-- ============================================================

abbrev ident_set := id modN varN → Prop

mutual
partial def FV : exp → ident_set
  | exp.Raise e => FV e
  | exp.Handle e pes => fun x => FV e x ∨ FV_pes pes x
  | exp.Lit _ => fun _ => False
  | exp.Con _ ls => FV_list ls
  | exp.Var ident => fun x => x = ident
  | exp.Fun xn e => fun x => FV e x ∧ x ≠ id.Short xn
  | exp.App _ es => FV_list es
  | exp.Log _ e1 e2 => fun x => FV e1 x ∨ FV e2 x
  | exp.If e1 e2 e3 => fun x => FV e1 x ∨ FV e2 x ∨ FV e3 x
  | exp.Mat e pes => fun x => FV e x ∨ FV_pes pes x
  | exp.Let xo e b => fun x =>
      FV e x ∨ (FV b x ∧ match xo with | none => True | some xn => x ≠ id.Short xn)
  | exp.Letrec defs b => fun x =>
      (FV_defs defs x ∨ FV b x) ∧ ∀ f, (f, x) ∈ (defs.map (fun ⟨fn, _, _⟩ => (fn, id.Short fn))) → False
  | exp.Tannot e _ => FV e
  | exp.Lannot e _ => FV e

partial def FV_list : List exp → ident_set
  | [] => fun _ => False
  | e :: es => fun x => FV e x ∨ FV_list es x

partial def FV_pes : List (pat × exp) → ident_set
  | [] => fun _ => False
  | (p, e) :: pes => fun x =>
      (FV e x ∧ ∀ xn, xn ∈ pat_bindings p [] → x ≠ id.Short xn) ∨ FV_pes pes x

partial def FV_defs : List (varN × varN × exp) → ident_set
  | [] => fun _ => False
  | (_, xn, e) :: defs => fun x => (FV e x ∧ x ≠ id.Short xn) ∨ FV_defs defs x
end

theorem FV_pes_MAP :
    ∀ (pes : List (pat × exp)) (x : id modN varN),
      FV_pes pes x ↔
      ∃ pe, pe ∈ pes ∧ FV pe.2 x ∧ ∀ xn, xn ∈ pat_bindings pe.1 [] → x ≠ id.Short xn := by sorry

theorem FV_defs_MAP :
    ∀ (ls : List (varN × varN × exp)) (x : id modN varN),
      FV_defs ls x ↔
      ∃ d, d ∈ ls ∧ FV d.2.2 x ∧ x ≠ id.Short d.2.1 := by sorry

-- ============================================================
-- FV_dec
-- ============================================================

def FV_dec : dec → ident_set
  | dec.Dlet _ p e => FV (exp.Mat e [(p, exp.Lit default)])
  | dec.Dletrec _ defs => FV (exp.Letrec defs (exp.Lit default))
  | dec.Dtype _ _ => fun _ => False
  | dec.Dtabbrev _ _ _ _ => fun _ => False
  | dec.Dexn _ _ _ => fun _ => False
  | _ => fun _ => False

-- ============================================================
-- nat_to_v injectivity
-- ============================================================

theorem nat_to_v_11 :
    ∀ i j, nat_to_v i = nat_to_v j ↔ i = j := by sorry

-- ============================================================
-- concrete_v properties
-- ============================================================

theorem concrete_v_list_thm :
    ∀ (xs : List v),
      concrete_v.concrete_v_list xs = EVERY concrete_v xs := by sorry

theorem concrete_v_simps :
    (∀ (l : lit), concrete_v (v.Litv l) = true) ∧
    (∀ (b : Bool) (n : Nat), concrete_v (v.Loc b n) = true) ∧
    (∀ (stmp : Option stamp) (xs : List v), concrete_v (v.Conv stmp xs) = EVERY concrete_v xs) ∧
    (∀ (xs : List v), concrete_v (v.Vectorv xs) = EVERY concrete_v xs) ∧
    (∀ (se : sem_env) (p : Nat × Nat), concrete_v (v.Env se p) = false) ∧
    (∀ (e2 : sem_env) (nm : varN) (x : exp), concrete_v (v.Closure e2 nm x) = false) ∧
    (∀ (e3 : sem_env) (funs : List (varN × varN × exp)) (nm2 : varN),
      concrete_v (v.Recclosure e3 funs nm2) = false) := by sorry

-- ============================================================
-- prim_type_cases
-- ============================================================

theorem prim_type_cases :
    ∀ (ty : prim_type),
      ty = prim_type.BoolT ∨
      ty = prim_type.IntT ∨
      ty = prim_type.CharT ∨
      ty = prim_type.StrT ∨
      ty = prim_type.WordT word_size.W8 ∨
      ty = prim_type.WordT word_size.W64 ∨
      ty = prim_type.Float64T := by sorry

-- ============================================================
-- do_conversion_check_type / do_arith_check_type
-- ============================================================

theorem do_conversion_check_type :
    ∀ (val' : v) (ty1 ty2 : prim_type) (res : v),
      do_conversion val' ty1 ty2 = some (Sum.inr res) →
      check_type ty2 res := by sorry

theorem do_arith_check_type :
    ∀ (a : arith) (ty : prim_type) (vs' : List v) (res : v),
      do_arith a ty vs' = some (Sum.inr res) →
      check_type ty res := by sorry

end CakeML
