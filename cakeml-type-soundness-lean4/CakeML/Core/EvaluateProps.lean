/-
  Properties of the operational semantics.
  Translated from: hol4_sources/evaluatePropsScript.sml
-/
import CakeML.Core.Evaluate
import CakeML.Core.SemanticPrimitivesProps

namespace CakeML

open HOL4
open mlstring

/- Lean additions (not in HOL4 evaluatePropsScript.sml):
   - RTC: Reflexive transitive closure inductive. HOL4 uses the relation library.
   - isPrefixProp: IS_PREFIX as a Prop. HOL4 uses rich_listTheory.IS_PREFIX.
   - LIST_REL: Pairwise list relation. HOL4 uses listTheory.LIST_REL. -/

-- ============================================================
-- Auxiliary: Reflexive Transitive Closure
-- ============================================================

/-- Reflexive transitive closure of a relation -/
inductive RTC (R : α → α → Prop) : α → α → Prop where
  | refl : RTC R x x
  | step : R x y → RTC R y z → RTC R x z

/-- IS_PREFIX as a Prop (list prefix ordering) -/
def isPrefixProp (l1 l2 : List α) : Prop :=
  ∃ sfx, l2 = l1 ++ sfx

/-- LIST_REL: pairwise relation on lists (HOL4 LIST_REL) -/
def LIST_REL (R : α → β → Prop) : List α → List β → Prop
  | [], [] => True
  | a :: as', b :: bs => R a b ∧ LIST_REL R as' bs
  | _, _ => False

-- result_rel is defined in SemanticPrimitivesProps

-- ============================================================
-- Definitions
-- ============================================================

def call_FFI_rel {ffi : Type} (s1 s2 : ffi_state ffi) : Prop :=
  ∃ n conf bytes t, call_FFI s1 n conf bytes = ffi_result.FFI_return s2 t

def dest_IO_event : io_event → ffiname × List word8 × List (word8 × word8)
  | io_event.IO_event s c b => (s, c, b)

def io_events_mono {ffi : Type} (s1 s2 : ffi_state ffi) : Prop :=
  isPrefixProp s1.io_events s2.io_events ∧
  (s2.io_events = s1.io_events → s2 = s1)

def is_clock_io_mono {ffi : Type} (f : state ffi → state ffi × result α β) (s : state ffi) : Prop :=
  match f s with
  | (s', r) =>
    io_events_mono s.ffi_field s'.ffi_field
    ∧ s'.clock ≤ s.clock
    ∧ s.next_type_stamp ≤ s'.next_type_stamp
    ∧ s.next_exn_stamp ≤ s'.next_exn_stamp
    ∧ s.refs.length ≤ s'.refs.length
    ∧ (∀ clk,
        match f ({ s with clock := clk }) with
        | (s'', r') =>
          (r' ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error)
            → r ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error)
            → r' = r ∧ s'' = { s' with clock := clk - (s.clock - s'.clock) })
          ∧ (r ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error)
            → (clk ≥ s.clock - s'.clock
              ↔ r' ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error)))
          ∧ (r' ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error)
            → clk ≤ s.clock
            → r ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error))
          ∧ (clk ≤ s.clock → io_events_mono s''.ffi_field s'.ffi_field))

def adj_clock (inc dec_ : Nat) (s : state ffi) : state ffi :=
  { s with clock := (s.clock + inc) - dec_ }

-- ============================================================
-- Theorems
-- ============================================================

theorem call_FFI_LENGTH :
  call_FFI st index conf x = ffi_result.FFI_return new_st new_bytes →
  x.length = new_bytes.length := by sorry

theorem call_FFI_rel_consts {ffi : Type} {s1 s2 : ffi_state ffi} :
  call_FFI_rel s1 s2 → s2.oracle_field = s1.oracle_field := by sorry

theorem RTC_call_FFI_rel_consts {ffi : Type} :
  ∀ (s1 s2 : ffi_state ffi), RTC call_FFI_rel s1 s2 →
  s2.oracle_field = s1.oracle_field := by sorry

theorem io_events_mono_refl {ffi : Type} {ffi_st : ffi_state ffi} :
  io_events_mono ffi_st ffi_st := by sorry

theorem io_events_mono_trans {ffi : Type} {ffi1 ffi2 ffi3 : ffi_state ffi} :
  io_events_mono ffi1 ffi2 ∧ io_events_mono ffi2 ffi3 →
  io_events_mono ffi1 ffi3 := by sorry

theorem io_events_mono_antisym {ffi : Type} {s1 s2 : ffi_state ffi} :
  io_events_mono s1 s2 ∧ io_events_mono s2 s1 → s1 = s2 := by sorry

theorem call_FFI_rel_io_events_mono {ffi : Type} :
  ∀ (s1 s2 : ffi_state ffi), RTC call_FFI_rel s1 s2 →
  io_events_mono s1 s2 := by sorry

theorem do_app_call_FFI_rel {ffi : Type}
    {r : store v} {ffi_st : ffi_state ffi} {r' : store v} {ffi_st' : ffi_state ffi} :
  do_app (r, ffi_st) op' vs = some ((r', ffi_st'), res) →
  RTC call_FFI_rel ffi_st ffi_st' := by sorry

theorem evaluate_call_FFI_rel :
  (∀ (s : state ffi) env exps,
    RTC call_FFI_rel s.ffi_field (evaluate s env exps).1.ffi_field) ∧
  (∀ (s : state ffi) env val' pes errv,
    RTC call_FFI_rel s.ffi_field (evaluate_match s env val' pes errv).1.ffi_field) ∧
  (∀ (s : state ffi) env ds,
    RTC call_FFI_rel s.ffi_field (evaluate_decs s env ds).1.ffi_field) := by sorry

theorem evaluate_call_FFI_rel_imp :
  (∀ (s : state ffi) env p s' r,
    evaluate s env p = (s', r) →
    RTC call_FFI_rel s.ffi_field s'.ffi_field) ∧
  (∀ (s : state ffi) env val' pes errv s' r,
    evaluate_match s env val' pes errv = (s', r) →
    RTC call_FFI_rel s.ffi_field s'.ffi_field) ∧
  (∀ (s : state ffi) env p s' r,
    evaluate_decs s env p = (s', r) →
    RTC call_FFI_rel s.ffi_field s'.ffi_field) := by sorry

/- Omitted: Theorem evaluate_decs_call_FFI_rel [local].
   HOL4: Local helper extracting the decs-only conjunct from evaluate_call_FFI_rel.
   Reason: [local] proof helper; the exported evaluate_decs_call_FFI_rel_imp is present below. -/

theorem evaluate_decs_call_FFI_rel_imp :
  ∀ (s : state ffi) env p s' r,
    evaluate_decs s env p = (s', r) →
    RTC call_FFI_rel s.ffi_field s'.ffi_field := by sorry

theorem do_app_io_events_mono {ffi : Type}
    {r : store v} {ffi_st : ffi_state ffi} {r' : store v} {ffi_st' : ffi_state ffi} :
  do_app (r, ffi_st) op' vs = some ((r', ffi_st'), res) →
  io_events_mono ffi_st ffi_st' := by sorry

theorem evaluate_io_events_mono :
  (∀ (s : state ffi) env exps,
    io_events_mono s.ffi_field (evaluate s env exps).1.ffi_field) ∧
  (∀ (s : state ffi) env val' pes errv,
    io_events_mono s.ffi_field (evaluate_match s env val' pes errv).1.ffi_field) ∧
  (∀ (s : state ffi) env ds,
    io_events_mono s.ffi_field (evaluate_decs s env ds).1.ffi_field) := by sorry

theorem evaluate_io_events_mono_imp :
  (∀ (s : state ffi) env p s' r,
    evaluate s env p = (s', r) →
    io_events_mono s.ffi_field s'.ffi_field) ∧
  (∀ (s : state ffi) env val' pes errv s' r,
    evaluate_match s env val' pes errv = (s', r) →
    io_events_mono s.ffi_field s'.ffi_field) ∧
  (∀ (s : state ffi) env p s' r,
    evaluate_decs s env p = (s', r) →
    io_events_mono s.ffi_field s'.ffi_field) := by sorry

theorem is_clock_io_mono_cong {ffi : Type}
    {s t : state ffi}
    {f g : state ffi → state ffi × result α β} :
  s = t →
  (∀ (s' : state ffi), s'.eval_state_field = t.eval_state_field ∧ s'.refs = t.refs ∧
         s'.ffi_field = t.ffi_field → f s' = g s') →
  (is_clock_io_mono f s ↔ is_clock_io_mono g t) := by sorry

theorem is_clock_io_mono_return {ffi : Type} {r : α} {s : state ffi} :
  is_clock_io_mono (β := β) (fun s => (s, result.Rval r)) s := by sorry

theorem is_clock_io_mono_err {ffi : Type} {r : error_result β} {s : state ffi} :
  is_clock_io_mono (α := α) (fun s => (s, result.Rerr r)) s := by sorry

theorem pair_CASE_eq_forall {P : α → β → Prop} {x : α × β} :
  (match x with | (a, b) => P a b) = (∀ a b, x = (a, b) → P a b) := by sorry

theorem is_clock_io_mono_bind {ffi : Type}
    {f : state ffi → state ffi × result α β}
    {g : result α β → state ffi → state ffi × result γ δ}
    {s : state ffi} :
  is_clock_io_mono f s ∧
  (∀ s' r, f s = (s', r) → is_clock_io_mono (g r) s') ∧
  (∀ s', g (result.Rerr (error_result.Rabort abort.Rtimeout_error)) s' =
         (s', result.Rerr (error_result.Rabort abort.Rtimeout_error))) →
  is_clock_io_mono (fun s => match f s with | (s', r) => g r s') s := by sorry

theorem is_clock_io_mono_check {ffi : Type}
    {f : state ffi → state ffi × result α β}
    {s : state ffi} :
  (s.clock ≠ 0 →
    is_clock_io_mono (fun s => f (adj_clock 1 0 s)) (dec_clock s)) →
  is_clock_io_mono (fun s => if s.clock = 0
    then (s, result.Rerr (error_result.Rabort abort.Rtimeout_error)) else f s) s := by sorry

theorem dec_inc_clock {ffi : Type} {s : state ffi} :
  dec_clock (adj_clock 1 0 s) = s := by sorry

theorem do_app_refs_length :
  do_app refs_ffi op' vs = some res →
  (HOL4.FST refs_ffi).length ≤ (HOL4.FST (HOL4.FST res)).length := by sorry

theorem is_clock_io_mono_do_app_simple {ffi : Type} :
  ∀ xs (st : state ffi),
    is_clock_io_mono (fun st' =>
      match do_app (st'.refs, st'.ffi_field) op' xs with
      | none => (st', result.Rerr (error_result.Rabort abort.Rtype_error))
      | some ((refs, ffi_st), r) =>
        ({ st' with refs := refs, ffi_field := ffi_st }, list_result r)) st := by sorry

theorem is_clock_io_mono_acc_safe {ffi : Type}
    {f : state ffi → ε}
    {st : state ffi} :
  ∀ (val' : ε) (g : ε → state ffi → state ffi × result α β),
    (∀ (st : state ffi) clk, f ({ st with clock := clk }) = f st) →
    (f st = val' ∨ f st ≠ val') →
    is_clock_io_mono (fun st' => g (f st) st') st →
    is_clock_io_mono (fun st' => g (f st') st') st := by sorry

theorem is_clock_io_mono_if_safe {ffi : Type}
    {f : state ffi → Prop}
    {j k : state ffi → state ffi × result α β}
    {st : state ffi} [DecidablePred f] :
  (∀ (st : state ffi) clk, f ({ st with clock := clk }) = f st) →
  is_clock_io_mono (fun st => if f st then j st else k st) st →
  is_clock_io_mono (fun st' => if f st' then j st' else k st') st := by sorry

theorem is_clock_io_mono_option_case_safe {ffi : Type}
    {f : state ffi → Option ε}
    {g : state ffi → state ffi × result α β}
    {h : ε → state ffi → state ffi × result α β}
    {st : state ffi} :
  (∀ (st : state ffi) clk, f ({ st with clock := clk }) = f st) →
  (f st = none ∨ f st ≠ none) →
  is_clock_io_mono (fun st => match f st with | none => g st | some x => h x st) st →
  is_clock_io_mono (fun st' => match f st' with | none => g st' | some x => h x st') st := by sorry

theorem is_clock_io_mono_match_case_safe {ffi : Type}
    {f : state ffi → match_result ε}
    {g h : state ffi → state ffi × result α β}
    {j : ε → state ffi → state ffi × result α β}
    {st : state ffi} :
  (∀ (st : state ffi) clk, f ({ st with clock := clk }) = f st) →
  (f st = match_result.No_match ∨ f st ≠ match_result.No_match) →
  is_clock_io_mono (fun st => match f st with
    | match_result.No_match => g st
    | match_result.Match_type_error => h st
    | match_result.Match env' => j env' st) st →
  is_clock_io_mono (fun st' => match f st' with
    | match_result.No_match => g st'
    | match_result.Match_type_error => h st'
    | match_result.Match env' => j env' st') st := by sorry

theorem is_clock_io_mono_match_case_pair_safe {ffi : Type}
    {f : state ffi → match_result ε}
    {g h : state ffi → result α β}
    {j : ε → state ffi → result α β}
    {st : state ffi} :
  (∀ (st : state ffi) clk, f ({ st with clock := clk }) = f st) →
  (f st = match_result.No_match ∨ f st ≠ match_result.No_match) →
  is_clock_io_mono (fun st => (st, match f st with
    | match_result.No_match => g st
    | match_result.Match_type_error => h st
    | match_result.Match env' => j env' st)) st →
  is_clock_io_mono (fun st' => (st', match f st' with
    | match_result.No_match => g st'
    | match_result.Match_type_error => h st'
    | match_result.Match env' => j env' st')) st := by sorry

/- Omitted: val step_tac.
   HOL4: Proof tactic for stepping through is_clock_io_mono proofs.
   Reason: Proof automation artifact; not mathematical content. -/

theorem is_clock_io_mono_evaluate :
  (∀ (s : state ffi) env es,
    is_clock_io_mono (fun s => evaluate s env es) s) ∧
  (∀ (s : state ffi) env val' pes err_v,
    is_clock_io_mono (fun s => evaluate_match s env val' pes err_v) s) ∧
  (∀ (s : state ffi) env ds,
    is_clock_io_mono (fun s => evaluate_decs s env ds) s) := by sorry

theorem is_clock_io_mono_evaluate_decs :
  ∀ (s : state ffi) env p,
    is_clock_io_mono (fun s => evaluate_decs s env p) s := by sorry

theorem is_clock_io_mono_extra {ffi : Type}
    {f : state ffi → state ffi × result α β}
    {s s' : state ffi} {r : result α β} {extra : Nat} :
  (∀ s, is_clock_io_mono f s) →
  f s = (s', r) →
  r ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error) →
  f ({ s with clock := s.clock + extra }) =
    ({ s' with clock := s'.clock + extra }, r) := by sorry

theorem is_clock_io_mono_extra_mono {ffi : Type}
    {f : state ffi → state ffi × result α β}
    {s : state ffi} {extra : Nat} :
  (∀ s, is_clock_io_mono f s) →
  io_events_mono (f s).1.ffi_field
    (f ({ s with clock := s.clock + extra })).1.ffi_field := by sorry

theorem evaluate_add_to_clock :
  ∀ (s : state ffi) env es s' r extra,
    evaluate s env es = (s', r) ∧
    r ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error) →
    evaluate ({ s with clock := s.clock + extra }) env es =
      ({ s' with clock := s'.clock + extra }, r) := by sorry

theorem evaluate_match_add_to_clock :
  ∀ (s : state ffi) env val' pes err_v s' r extra,
    evaluate_match s env val' pes err_v = (s', r) ∧
    r ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error) →
    evaluate_match ({ s with clock := s.clock + extra }) env val' pes err_v =
      ({ s' with clock := s'.clock + extra }, r) := by sorry

theorem list_result_eq_Rval :
  list_result r = result.Rval r' ↔ ∃ val', r' = [val'] ∧ r = result.Rval val' := by sorry

theorem list_result_eq_Rerr :
  list_result r = result.Rerr e ↔ r = result.Rerr e := by sorry

theorem result_rel_list_result {R : v → v → Prop} {Q : v → v → Prop}
    {r1 r2 : result v v} :
  result_rel (LIST_REL R) Q (list_result r1) (list_result r2) ↔
  result_rel R Q r1 r2 := by sorry

theorem list_result_inj :
  list_result x = list_result y → x = y := by sorry

theorem evaluate_length :
  (∀ (s : state ffi) env p s' r,
    evaluate s env p = (s', result.Rval r) → r.length = p.length) ∧
  (∀ (s : state ffi) env val' p er s' r,
    evaluate_match s env val' p er = (s', result.Rval r) → r.length = 1) ∧
  (∀ (s : state ffi) env ds s' r,
    evaluate_decs s env ds = (s', result.Rval r) → True) := by sorry

theorem evaluate_nil :
  ∀ (s : state ffi) env, evaluate s env [] = (s, result.Rval []) := by sorry

theorem evaluate_sing :
  ∀ (s : state ffi) env e s' vs,
    evaluate s env [e] = (s', result.Rval vs) → ∃ val', vs = [val'] := by sorry

theorem evaluate_cons :
  ∀ (s : state ffi) env e es,
    evaluate s env (e :: es) =
      match evaluate s env [e] with
      | (s', result.Rval vs) =>
        match evaluate s' env es with
        | (s'', result.Rval vs') => (s'', result.Rval (vs ++ vs'))
        | err => err
      | err => err := by sorry

theorem evaluate_append :
  ∀ (s : state ffi) env xs ys,
    evaluate s env (xs ++ ys) =
      match evaluate s env xs with
      | (s', result.Rval vs) =>
        match evaluate s' env ys with
        | (s'', result.Rval vs') => (s'', result.Rval (vs ++ vs'))
        | err => err
      | err => err := by sorry

theorem evaluate_decs_nil :
  ∀ (s : state ffi) env,
    evaluate_decs s env [] =
      (s, result.Rval (sem_env.mk nsEmpty nsEmpty)) := by sorry

theorem evaluate_decs_cons :
  ∀ (s : state ffi) env d ds,
    evaluate_decs s env (d :: ds) =
      match evaluate_decs s env [d] with
      | (s1, result.Rval env1) =>
        match evaluate_decs s1 (extend_dec_env env1 env) ds with
        | (s2, r) => (s2, combine_dec_result env1 r)
      | err => err := by sorry

theorem evaluate_decs_append :
  ∀ ds1 (s : state ffi) env ds2,
    evaluate_decs s env (ds1 ++ ds2) =
      match evaluate_decs s env ds1 with
      | (s1, result.Rval env1) =>
        match evaluate_decs s1 (extend_dec_env env1 env) ds2 with
        | (s2, r) => (s2, combine_dec_result env1 r)
      | (s1, result.Rerr v7) => (s1, result.Rerr v7) := by sorry

theorem evaluate_match_list_result :
  evaluate_match s env val' p er = (s', r) →
  ∃ r', r = list_result r' := by sorry

/- Omitted: val evaluate_decs_lemmas.
   HOL4: Convenience val binding collecting decs-only lemma conjuncts.
   Reason: Proof automation artifact; not mathematical content. -/

theorem evaluate_decs_add_to_clock :
  ∀ (s : state ffi) env p s' r extra,
    evaluate_decs s env p = (s', r) ∧
    r ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error) →
    evaluate_decs ({ s with clock := s.clock + extra }) env p =
      ({ s' with clock := s'.clock + extra }, r) := by sorry

/- Omitted: Theorem add_lemma [local].
   HOL4: ∀ k k'. ∃ extra. k = k' + extra ∨ k' = k + extra.
   Reason: [local] trivial arithmetic helper. -/

/- Omitted: Theorem with_clock_ffi [local].
   HOL4: (s with clock := k).ffi = s.ffi.
   Reason: [local] trivial accessor lemma. -/

theorem evaluate_decs_clock_determ :
  ∀ (s : state ffi) env p s1 r1 s2 r2 k1 k2,
    evaluate_decs ({ s with clock := k1 }) env p = (s1, r1) ∧
    evaluate_decs ({ s with clock := k2 }) env p = (s2, r2) →
    match (r1, r2) with
    | (result.Rerr (error_result.Rabort abort.Rtimeout_error),
       result.Rerr (error_result.Rabort abort.Rtimeout_error)) => True
    | (result.Rerr (error_result.Rabort abort.Rtimeout_error), _) => k1 < k2
    | (_, result.Rerr (error_result.Rabort abort.Rtimeout_error)) => k2 < k1
    | _ => s1.ffi_field = s2.ffi_field ∧ r1 = r2 := by sorry

theorem evaluate_add_to_clock_io_events_mono :
  (∀ (s : state ffi) env d extra,
    io_events_mono (evaluate s env d).1.ffi_field
      (evaluate ({ s with clock := s.clock + extra }) env d).1.ffi_field) ∧
  (∀ (s : state ffi) env val' d er extra,
    io_events_mono (evaluate_match s env val' d er).1.ffi_field
      (evaluate_match ({ s with clock := s.clock + extra }) env val' d er).1.ffi_field) := by sorry

theorem evaluate_decs_add_to_clock_io_events_mono :
  ∀ (s : state ffi) env d,
    io_events_mono
      (evaluate_decs s env d).1.ffi_field
      (evaluate_decs ({ s with clock := s.clock + extra }) env d).1.ffi_field := by sorry

theorem evaluate_decs_ffi_mono_clock :
  ∀ k1 k2 (s : state ffi) env p,
    k1 ≤ k2 →
    io_events_mono
      (evaluate_decs ({ s with clock := k1 }) env p).1.ffi_field
      (evaluate_decs ({ s with clock := k2 }) env p).1.ffi_field := by sorry

theorem evaluate_next_type_stamp_mono :
  (∀ (s : state ffi) env es s' res1,
    evaluate s env es = (s', res1) →
    s.next_type_stamp ≤ s'.next_type_stamp) ∧
  (∀ (s : state ffi) env val' pes err_v s' res2,
    evaluate_match s env val' pes err_v = (s', res2) →
    s.next_type_stamp ≤ s'.next_type_stamp) ∧
  (∀ (s : state ffi) env ds s' res3,
    evaluate_decs s env ds = (s', res3) →
    s.next_type_stamp ≤ s'.next_type_stamp) := by sorry

theorem evaluate_next_exn_stamp_mono :
  (∀ (s : state ffi) env es s' res1,
    evaluate s env es = (s', res1) →
    s.next_exn_stamp ≤ s'.next_exn_stamp) ∧
  (∀ (s : state ffi) env val' pes err_v s' res2,
    evaluate_match s env val' pes err_v = (s', res2) →
    s.next_exn_stamp ≤ s'.next_exn_stamp) ∧
  (∀ (s : state ffi) env ds s' res3,
    evaluate_decs s env ds = (s', res3) →
    s.next_exn_stamp ≤ s'.next_exn_stamp) := by sorry

/- Omitted: Theorem evaluate_case_eqs.
   HOL4: LIST_CONJ [pair_case_eq, result_case_eq, error_result_case_eq, ...].
   Reason: Convenience conjunction for proof automation; in Lean 4,
   handled by simp lemmas and cases/match tactics. -/

theorem evaluate_set_next_stamps :
  (∀ (s0 : state ffi) env xs s1 res,
    evaluate s0 env xs = (s1, res) →
    (s1.next_type_stamp = s0.next_type_stamp →
      ∀ k, evaluate ({ s0 with next_type_stamp := k }) env xs =
        ({ s1 with next_type_stamp := k }, res)) ∧
    (s1.next_exn_stamp = s0.next_exn_stamp →
      ∀ k, evaluate ({ s0 with next_exn_stamp := k }) env xs =
        ({ s1 with next_exn_stamp := k }, res))) ∧
  (∀ (s0 : state ffi) env val' pes errv s1 res,
    evaluate_match s0 env val' pes errv = (s1, res) →
    (s1.next_type_stamp = s0.next_type_stamp →
      ∀ k, evaluate_match ({ s0 with next_type_stamp := k }) env val' pes errv =
        ({ s1 with next_type_stamp := k }, res)) ∧
    (s1.next_exn_stamp = s0.next_exn_stamp →
      ∀ k, evaluate_match ({ s0 with next_exn_stamp := k }) env val' pes errv =
        ({ s1 with next_exn_stamp := k }, res))) ∧
  (∀ (s0 : state ffi) env ds s1 res,
    evaluate_decs s0 env ds = (s1, res) →
    (s1.next_type_stamp = s0.next_type_stamp →
      ∀ k, evaluate_decs ({ s0 with next_type_stamp := k }) env ds =
        ({ s1 with next_type_stamp := k }, res)) ∧
    (s1.next_exn_stamp = s0.next_exn_stamp →
      ∀ k, evaluate_decs ({ s0 with next_exn_stamp := k }) env ds =
        ({ s1 with next_exn_stamp := k }, res))) := by sorry

theorem call_FFI_return_unchanged {ffi : Type} {ffi_st : ffi_state ffi} :
  (call_FFI ffi_st s conf bytes = ffi_result.FFI_return ffi_st bytes') ↔
  (s = ffiname.ExtCall (strlit []) ∧ bytes' = bytes) := by sorry

/- Renamed: HOL4 Theorem do_app_ffi_unchanged → Lean do_app_ffi_unchanged'
   (avoids collision with do_app_ffi_unchanged in SemanticPrimitivesProps.lean,
   which has a different signature). -/
theorem do_app_ffi_unchanged' {ffi : Type}
    {refs refs' : store v} {ffi_st : ffi_state ffi} :
  do_app (refs, ffi_st) op' vs = some ((refs', ffi_st), r) →
  (∀ outcome, r ≠ result.Rerr (error_result.Rabort (abort.Rffi_error outcome))) →
  ∀ ffi2 : ffi_state ffi, do_app (refs, ffi2) op' vs = some ((refs', ffi2), r) := by sorry

theorem evaluate_ffi_intro :
  (∀ (s : state ffi) env e s' r,
    evaluate s env e = (s', r) ∧
    s'.ffi_field = s.ffi_field ∧
    (∀ outcome, r ≠ result.Rerr (error_result.Rabort (abort.Rffi_error outcome))) →
    ∀ nffi : ffi_state ffi2,
      evaluate ({ s with ffi_field := nffi }) env e =
        ({ s' with ffi_field := nffi }, r)) ∧
  (∀ (s : state ffi) env val' pes errv s' r,
    evaluate_match s env val' pes errv = (s', r) ∧
    s'.ffi_field = s.ffi_field ∧
    (∀ outcome, r ≠ result.Rerr (error_result.Rabort (abort.Rffi_error outcome))) →
    ∀ nffi : ffi_state ffi2,
      evaluate_match ({ s with ffi_field := nffi }) env val' pes errv =
        ({ s' with ffi_field := nffi }, r)) ∧
  (∀ (s : state ffi) env ds s' r,
    evaluate_decs s env ds = (s', r) ∧
    s'.ffi_field = s.ffi_field ∧
    (∀ outcome, r ≠ result.Rerr (error_result.Rabort (abort.Rffi_error outcome))) →
    ∀ nffi : ffi_state ffi2,
      evaluate_decs ({ s with ffi_field := nffi }) env ds =
        ({ s' with ffi_field := nffi }, r)) := by sorry

theorem is_clock_io_mono_set_clock {ffi : Type}
    {f : state ffi → state ffi × result α β}
    {s s' : state ffi} {r : result α β} {ck1 : Nat} :
  is_clock_io_mono f s →
  f s = (s', r) →
  r ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error) →
  ∃ ck0, f ({ s with clock := ck0 }) = ({ s' with clock := ck1 }, r) := by sorry

/- Omitted: val evaluate_set_clock_lemmas.
   HOL4: Convenience val binding collecting set_clock conjuncts.
   Reason: Proof automation artifact; not mathematical content. -/

theorem evaluate_set_clock :
  ∀ (s : state ffi) env exps s1 res,
    evaluate s env exps = (s1, res) ∧
    res ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error) →
    ∀ ck, ∃ ck1, evaluate ({ s with clock := ck1 }) env exps =
      ({ s1 with clock := ck }, res) := by sorry

theorem evaluate_decs_set_clock :
  ∀ (s : state ffi) env decs s1 res,
    evaluate_decs s env decs = (s1, res) ∧
    res ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error) →
    ∀ ck, ∃ ck1, evaluate_decs ({ s with clock := ck1 }) env decs =
      ({ s1 with clock := ck }, res) := by sorry

theorem is_clock_io_mono_minimal {ffi : Type}
    {f : state ffi → state ffi × result α β}
    {s s' : state ffi} {r : result α β} {k : Nat} :
  is_clock_io_mono f s →
  f s = (s', r) ∧ s'.clock = 0 ∧
  r ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error) ∧
  s.clock > k →
  ∃ s'', f ({ s with clock := k }) =
    (s'', result.Rerr (error_result.Rabort abort.Rtimeout_error)) ∧
    io_events_mono s''.ffi_field s'.ffi_field := by sorry

/- Omitted: val evaluate_minimal_lemmas.
   HOL4: Convenience val binding collecting minimal clock conjuncts.
   Reason: Proof automation artifact; not mathematical content. -/

theorem evaluate_minimal_clock :
  ∀ (s : state ffi) env es s' r k,
    evaluate s env es = (s', r) ∧
    s'.clock = 0 ∧
    r ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error) ∧
    s.clock > k →
    ∃ s'',
      evaluate ({ s with clock := k }) env es =
        (s'', result.Rerr (error_result.Rabort abort.Rtimeout_error)) ∧
      io_events_mono s''.ffi_field s'.ffi_field := by sorry

theorem evaluate_match_minimal_clock :
  ∀ (s : state ffi) env val' pes err_v s' r k,
    evaluate_match s env val' pes err_v = (s', r) ∧
    s'.clock = 0 ∧
    r ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error) ∧
    s.clock > k →
    ∃ s'',
      evaluate_match ({ s with clock := k }) env val' pes err_v =
        (s'', result.Rerr (error_result.Rabort abort.Rtimeout_error)) ∧
      io_events_mono s''.ffi_field s'.ffi_field := by sorry

theorem evaluate_set_init_clock :
  ∀ (st : state ffi) env xs st' res,
    evaluate st env xs = (st', res) ∧
    res ≠ result.Rerr (error_result.Rabort abort.Rtimeout_error) →
    ∀ k, ∃ ck res1 st1,
      evaluate ({ st with clock := k }) env xs = (st1, res1) ∧
      ((res1 = res ∧ st1 = { st' with clock := ck }) ∨
       (res1 = result.Rerr (error_result.Rabort abort.Rtimeout_error) ∧
        io_events_mono st1.ffi_field st'.ffi_field)) := by sorry

theorem can_pmatch_all_EVERY :
  can_pmatch_all envC refs ps val' = true ↔
  ∀ p, p ∈ ps → pmatch envC refs p val' [] ≠ match_result.Match_type_error := by sorry

theorem same_type_trans :
  same_type t1 t2 = true ∧ same_type t1 t3 = true → same_type t2 t3 = true := by sorry

theorem evaluate_refs_length_mono :
  (∀ (s : state ffi) env es s' r,
    evaluate s env es = (s', r) → s.refs.length ≤ s'.refs.length) ∧
  (∀ (s : state ffi) env val' pes err_v s' r,
    evaluate_match s env val' pes err_v = (s', r) →
    s.refs.length ≤ s'.refs.length) := by sorry

theorem combine_dec_result_eq_Rerr :
  combine_dec_result env r = result.Rerr e ↔ r = result.Rerr e := by sorry

theorem eval_no_eval_simulation :
  (∀ (s : state ffi) env exps s' res,
    evaluate s env exps = (s', res) ∧
    s.eval_state_field = none ∧
    res ≠ result.Rerr (error_result.Rabort abort.Rtype_error) →
    s'.eval_state_field = none ∧
    evaluate ({ s with eval_state_field := es }) env exps =
      ({ s' with eval_state_field := es }, res)) ∧
  (∀ (s : state ffi) env x pes err_x s' res,
    evaluate_match s env x pes err_x = (s', res) ∧
    s.eval_state_field = none ∧
    res ≠ result.Rerr (error_result.Rabort abort.Rtype_error) →
    s'.eval_state_field = none ∧
    evaluate_match ({ s with eval_state_field := es }) env x pes err_x =
      ({ s' with eval_state_field := es }, res)) ∧
  (∀ (s : state ffi) env decs s' res,
    evaluate_decs s env decs = (s', res) ∧
    s.eval_state_field = none ∧
    res ≠ result.Rerr (error_result.Rabort abort.Rtype_error) →
    s'.eval_state_field = none ∧
    evaluate_decs ({ s with eval_state_field := es }) env decs =
      ({ s' with eval_state_field := es }, res)) := by sorry

theorem evaluate_ffi_etc_intro :
  ∀ (s0 : state ffi) env xs s1 res (s : state ffi),
    evaluate s0 env xs = (s1, res) ∧
    (∀ outcome, res ≠ result.Rerr (error_result.Rabort (abort.Rffi_error outcome))) ∧
    s1.ffi_field = s0.ffi_field ∧
    s1.next_type_stamp = s0.next_type_stamp ∧
    s1.next_exn_stamp = s0.next_exn_stamp ∧
    s0.eval_state_field = none ∧
    res ≠ result.Rerr (error_result.Rabort abort.Rtype_error) ∧
    s.refs = s0.refs →
    ∃ ck1 ck2, evaluate ({ s with clock := ck1 }) env xs =
      ({ s with refs := s1.refs, clock := ck2 }, res) := by sorry

theorem same_type_sym :
  same_type t1 t2 = true → same_type t2 t1 = true := by sorry

theorem pmatch_not_type_error_EQ :
  (pmatch envC refs pat.Pany val' acc ≠ match_result.Match_type_error ↔ True) ∧
  (pmatch envC refs (pat.Pvar n) val' acc ≠ match_result.Match_type_error ↔ True) ∧
  (pmatch envC refs (pat.Pcon (some name) xs) val' acc ≠ match_result.Match_type_error ↔
    ∃ ys t l stmp,
      val' = v.Conv (some t) ys ∧
      nsLookup envC name = some (l, stmp) ∧ xs.length = l ∧
      same_type stmp t = true ∧
      (t = stmp → l = ys.length ∧
        pmatch.pmatch_list envC refs xs ys acc ≠ match_result.Match_type_error)) ∧
  (pmatch envC refs (pat.Pcon none xs) val' acc ≠ match_result.Match_type_error ↔
    ∃ ys, val' = v.Conv none ys ∧ xs.length = ys.length ∧
      pmatch.pmatch_list envC refs xs ys acc ≠ match_result.Match_type_error) ∧
  (pmatch.pmatch_list envC refs [] [] acc ≠ match_result.Match_type_error ↔ True) ∧
  (pmatch.pmatch_list envC refs [] (val' :: vs) acc ≠ match_result.Match_type_error ↔ False) ∧
  (pmatch.pmatch_list envC refs (p :: ps) [] acc ≠ match_result.Match_type_error ↔ False) ∧
  (pmatch.pmatch_list envC refs (p :: ps) (val' :: vs) acc ≠ match_result.Match_type_error ↔
    pmatch envC refs p val' acc ≠ match_result.Match_type_error ∧
    (pmatch envC refs p val' acc = match_result.No_match →
      pmatch.pmatch_list envC refs ps vs acc ≠ match_result.Match_type_error) ∧
    (∀ (a : List (varN × v)), pmatch envC refs p val' acc = match_result.Match a →
      pmatch.pmatch_list envC refs ps vs a ≠ match_result.Match_type_error)) := by sorry

theorem do_app_ffi_mono {ffi : Type}
    {refs refs' : store v} {ffi_st ffi_st' : ffi_state ffi} :
  do_app (refs, ffi_st) op' args = some ((refs', ffi_st'), r) →
  ∃ l, ffi_st'.io_events = ffi_st.io_events ++ l := by sorry

theorem do_app_SOME_ffi_same_oracle_state {ffi : Type}
    {refs refs' : store v} {ffi_st ffi_st' : ffi_state ffi} :
  do_app (refs, ffi_st) op' args = some ((refs', ffi_st'), r) →
  do_app (refs, { ffi_st with io_events := l }) op' args =
    some ((refs', { ffi_st' with io_events :=
      l ++ (ffi_st'.io_events.drop ffi_st.io_events.length) }), r) := by sorry

theorem evaluate_history_irrelevance :
  (∀ (st : state ffi) env exps st' res,
    evaluate st env exps = (st', res) →
    ∃ new_io, st'.ffi_field.io_events = st.ffi_field.io_events ++ new_io ∧
    (∀ l, evaluate ({ st with ffi_field := { st.ffi_field with io_events := l } }) env exps =
      ({ st' with ffi_field := { st'.ffi_field with io_events := l ++ new_io } }, res))) ∧
  (∀ (st : state ffi) env val' pes err_v st' res,
    evaluate_match st env val' pes err_v = (st', res) →
    ∃ new_io, st'.ffi_field.io_events = st.ffi_field.io_events ++ new_io ∧
    (∀ l, evaluate_match ({ st with ffi_field := { st.ffi_field with io_events := l } })
        env val' pes err_v =
      ({ st' with ffi_field := { st'.ffi_field with io_events := l ++ new_io } }, res))) ∧
  (∀ (st : state ffi) env ds st' res,
    evaluate_decs st env ds = (st', res) →
    ∃ new_io, st'.ffi_field.io_events = st.ffi_field.io_events ++ new_io ∧
    (∀ l, evaluate_decs ({ st with ffi_field := { st.ffi_field with io_events := l } })
        env ds =
      ({ st' with ffi_field := { st'.ffi_field with io_events := l ++ new_io } }, res))) := by sorry

theorem evaluate_add_history :
  (∀ (st : state ffi) env exps st' res,
    evaluate ({ st with ffi_field := { st.ffi_field with io_events := [] } }) env exps =
      (st', res) →
    evaluate st env exps =
      ({ st' with ffi_field := { st'.ffi_field with io_events :=
          st.ffi_field.io_events ++ st'.ffi_field.io_events } }, res)) ∧
  (∀ (st : state ffi) env val' pes err_v st' res,
    evaluate_match ({ st with ffi_field := { st.ffi_field with io_events := [] } })
      env val' pes err_v = (st', res) →
    evaluate_match st env val' pes err_v =
      ({ st' with ffi_field := { st'.ffi_field with io_events :=
          st.ffi_field.io_events ++ st'.ffi_field.io_events } }, res)) := by sorry

theorem Apps_append :
  ∀ (xs ys : List exp) (f : exp), Apps f (xs ++ ys) = Apps (Apps f xs) ys := by sorry

theorem evaluate_Apps_Rerr :
  ∀ (xs : List exp) (f : exp) (st : state ffi) env s1 e,
    evaluate st env xs = (s1, result.Rerr e) →
    evaluate st env [Apps f (xs.reverse)] = (s1, result.Rerr e) := by sorry

theorem evaluate_Apps_Funs :
  ∀ (l : List exp) x (ns : List varN) vs (st : state ffi) s1 s2 env env1 e,
    evaluate st env l = (s1, result.Rval vs) ∧
    evaluate s1 env [x] = (s2, result.Rval [v.Closure env1 (ns.head!) (Funs ns.tail! e)]) ∧
    l.length = ns.length ∧ ns ≠ [] ∧ ns.length ≤ s2.clock →
    evaluate st env [Apps x l.reverse] =
      evaluate
        ({ s2 with clock := s2.clock - ns.length })
        (sem_env.mk (nsAppend (alist_to_ns (HOL4.ZIP (ns.reverse, vs))) env1.v_field)
                     env1.c) [e] := by sorry

theorem evaluate_Apps_f_err :
  ∀ (xs : List exp) vs (st : state ffi) env (f : exp) s1 s2,
    evaluate st env xs = (s1, result.Rval vs) ∧
    evaluate s1 env [f] = (s2, result.Rerr r) →
    evaluate st env [Apps f xs.reverse] = (s2, result.Rerr r) := by sorry

theorem evaluate_Apps_Funs_timeout :
  ∀ (l : List exp) x (ns : List varN) vs (st : state ffi) s1 s2 env env1 e,
    evaluate st env l = (s1, result.Rval vs) ∧
    evaluate s1 env [x] = (s2, result.Rval [v.Closure env1 (ns.head!) (Funs ns.tail! e)]) ∧
    l.length = ns.length ∧ ns ≠ [] ∧ s2.clock < ns.length →
    evaluate st env [Apps x l.reverse] =
      ({ s2 with clock := 0 }, result.Rerr (error_result.Rabort abort.Rtimeout_error)) := by sorry

/- Renamed: HOL4 Theorem evaluate_Apps → Lean evaluate_Apps'
   (the Lean version has a slightly different signature to avoid
   name collision with the Apps definition). -/
theorem evaluate_Apps' :
  ∀ (xs : List exp) (st : state ffi) env s1 (ns : List varN) n clos_v env1 e vs,
    evaluate st env xs = (s1, result.Rval vs) ∧
    xs.length = ns.length + 1 ∧
    nsLookup env.v_field n = some clos_v ∧
    do_opapp [clos_v, vs.getLast!] = some (env1, Funs ns e) →
    evaluate st env [Apps (exp.Var n) xs.reverse] =
      if s1.clock < xs.length then
        ({ s1 with clock := 0 }, result.Rerr (error_result.Rabort abort.Rtimeout_error))
      else
        evaluate
          ({ s1 with clock := s1.clock - xs.length })
          (sem_env.mk (nsAppend (alist_to_ns (HOL4.ZIP (ns.reverse, vs.dropLast)))
                                env1.v_field)
                       env1.c) [e] := by sorry

end CakeML
