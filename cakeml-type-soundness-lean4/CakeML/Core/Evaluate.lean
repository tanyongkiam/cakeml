/-
  Functional big-step semantics for evaluation of CakeML programs.
  Translated from: hol4_sources/evaluateScript.sml
-/
import CakeML.Core.SemanticPrimitives

namespace CakeML

open HOL4
open mlstring

-- ============================================================
-- Helpers
-- ============================================================

def fix_clock (s : state ffi) (p : state ffi × result α β) : state ffi × result α β :=
  let (s', res) := p
  ({ s' with clock := if s'.clock ≤ s.clock then s'.clock else s.clock }, res)

def dec_clock (s : state ffi) : state ffi :=
  { s with clock := s.clock - 1 }

def do_eval_res (vs : List v) (s : state ffi) :
    state ffi × result (sem_env × List dec) v :=
  match do_eval vs s.eval_state_field with
  | none => (s, result.Rerr (error_result.Rabort abort.Rtype_error))
  | some (env1, decs, es1) =>
    ({ s with eval_state_field := es1 }, result.Rval (env1, decs))

def list_result : result v v → result (List v) v
  | result.Rval val' => result.Rval [val']
  | result.Rerr e => result.Rerr e

def sing_env (n : varN) (val' : v) : sem_env :=
  sem_env.mk (nsBind n val' nsEmpty) nsEmpty

def one_con_check (envc : env_ctor) : exp → Bool
  | exp.Con cn es => do_con_check envc cn es.length
  | _ => true

-- ============================================================
-- evaluate / evaluate_match / evaluate_decs (mutual, partial)
-- ============================================================

mutual
partial def evaluate (st : state ffi) (env : sem_env)
    (exps : List exp) : state ffi × result (List v) v :=
  match exps with
  | [] => (st, result.Rval [])
  | e1 :: e2 :: es =>
    match fix_clock st (evaluate st env [e1]) with
    | (st', result.Rval v1) =>
      match evaluate st' env (e2 :: es) with
      | (st'', result.Rval vs) => (st'', result.Rval (v1.head! :: vs))
      | (st'', result.Rerr err) => (st'', result.Rerr err)
    | (st', result.Rerr err) => (st', result.Rerr err)
  | [exp.Lit l] => (st, result.Rval [v.Litv l])
  | [exp.Raise e] =>
    match evaluate st env [e] with
    | (st', result.Rval vals) => (st', result.Rerr (error_result.Rraise vals.head!))
    | (st', result.Rerr err) => (st', result.Rerr err)
  | [exp.Handle e pes] =>
    match fix_clock st (evaluate st env [e]) with
    | (st', result.Rval v7) => (st', result.Rval v7)
    | (st', result.Rerr (error_result.Rraise val')) =>
      if can_pmatch_all env.c st'.refs (pes.map Prod.fst) val' then
        evaluate_match st' env val' pes val'
      else (st', result.Rerr (error_result.Rabort abort.Rtype_error))
    | (st', result.Rerr (error_result.Rabort a)) =>
      (st', result.Rerr (error_result.Rabort a))
  | [exp.Con cn es] =>
    if do_con_check env.c cn es.length then
      match evaluate st env es.reverse with
      | (st', result.Rval vs) =>
        match build_conv env.c cn vs.reverse with
        | none => (st', result.Rerr (error_result.Rabort abort.Rtype_error))
        | some val' => (st', result.Rval [val'])
      | (st', result.Rerr err) => (st', result.Rerr err)
    else (st, result.Rerr (error_result.Rabort abort.Rtype_error))
  | [exp.Var n] =>
    match nsLookup env.v_field n with
    | none => (st, result.Rerr (error_result.Rabort abort.Rtype_error))
    | some val' => (st, result.Rval [val'])
  | [exp.Fun x e] => (st, result.Rval [v.Closure env x e])
  | [exp.App op' es] =>
    match fix_clock st (evaluate st env es.reverse) with
    | (st', result.Rval vs) =>
      match getOpClass op' with
      | op_class.FunApp =>
        match do_opapp vs.reverse with
        | some (env', e) =>
          if st'.clock == 0 then (st', result.Rerr (error_result.Rabort abort.Rtimeout_error))
          else evaluate (dec_clock st') env' [e]
        | none => (st', result.Rerr (error_result.Rabort abort.Rtype_error))
      | op_class.Force =>
        match dest_thunk vs.reverse st'.refs with
        | dest_thunk_ret.BadRef => (st', result.Rerr (error_result.Rabort abort.Rtype_error))
        | dest_thunk_ret.NotThunk => (st', result.Rerr (error_result.Rabort abort.Rtype_error))
        | dest_thunk_ret.IsThunk thunk_mode.Evaluated val' => (st', result.Rval [val'])
        | dest_thunk_ret.IsThunk thunk_mode.NotEvaluated f =>
          match do_opapp [f, v.Conv none []] with
          | some (env', e) =>
            if st'.clock == 0 then (st', result.Rerr (error_result.Rabort abort.Rtimeout_error))
            else
              match evaluate (dec_clock st') env' [e] with
              | (st2, result.Rval vs2) =>
                match update_thunk vs.reverse st2.refs vs2 with
                | none => (st2, result.Rerr (error_result.Rabort abort.Rtype_error))
                | some refs => ({ st2 with refs := refs }, result.Rval vs2)
              | (st2, result.Rerr e') => (st2, result.Rerr e')
          | none => (st', result.Rerr (error_result.Rabort abort.Rtype_error))
      | op_class.EvalOp =>
        match fix_clock st' (do_eval_res vs.reverse st') with
        | (st1, result.Rval (env1, decs)) =>
          if st1.clock == 0 then (st1, result.Rerr (error_result.Rabort abort.Rtimeout_error))
          else
            match fix_clock (dec_clock st1) (evaluate_decs (dec_clock st1) env1 decs) with
            | (st2, result.Rval env2) =>
              match declare_env st2.eval_state_field (extend_dec_env env2 env1) with
              | some (x, es2) =>
                ({ st2 with eval_state_field := reset_env_generation st'.eval_state_field es2 },
                 result.Rval [x])
              | none => (st2, result.Rerr (error_result.Rabort abort.Rtype_error))
            | (st2, result.Rerr (error_result.Rabort a)) =>
              (st2, result.Rerr (error_result.Rabort a))
            | (st2, result.Rerr e') =>
              ({ st2 with eval_state_field := reset_env_generation st'.eval_state_field st2.eval_state_field },
               result.Rerr e')
        | (st1, result.Rerr e') => (st1, result.Rerr e')
      | op_class.Simple =>
        match do_app (st'.refs, st'.ffi_field) op' vs.reverse with
        | none => (st', result.Rerr (error_result.Rabort abort.Rtype_error))
        | some ((refs, ffi'), r) =>
          ({ st' with refs := refs, ffi_field := ffi' }, list_result r)
    | (st', result.Rerr err) => (st', result.Rerr err)
  | [exp.Log lop' e1 e2] =>
    match fix_clock st (evaluate st env [e1]) with
    | (st', result.Rval v1) =>
      match do_log lop' v1.head! e2 with
      | none => (st', result.Rerr (error_result.Rabort abort.Rtype_error))
      | some (exp_or_val.Exp e) => evaluate st' env [e]
      | some (exp_or_val.Val val') => (st', result.Rval [val'])
    | (st', result.Rerr err) => (st', result.Rerr err)
  | [exp.If e1 e2 e3] =>
    match fix_clock st (evaluate st env [e1]) with
    | (st', result.Rval vals) =>
      match do_if vals.head! e2 e3 with
      | none => (st', result.Rerr (error_result.Rabort abort.Rtype_error))
      | some e => evaluate st' env [e]
    | (st', result.Rerr err) => (st', result.Rerr err)
  | [exp.Mat e pes] =>
    match fix_clock st (evaluate st env [e]) with
    | (st', result.Rval vals) =>
      if can_pmatch_all env.c st'.refs (pes.map Prod.fst) vals.head! then
        evaluate_match st' env vals.head! pes bind_exn_v
      else (st', result.Rerr (error_result.Rabort abort.Rtype_error))
    | (st', result.Rerr err) => (st', result.Rerr err)
  | [exp.Let xo e1 e2] =>
    match fix_clock st (evaluate st env [e1]) with
    | (st', result.Rval vals) =>
      evaluate st' (sem_env.mk (nsOptBind xo vals.head! env.v_field) env.c) [e2]
    | (st', result.Rerr err) => (st', result.Rerr err)
  | [exp.Letrec funs e] =>
    if ALL_DISTINCT (funs.map (fun ⟨x, _, _⟩ => x)) then
      evaluate st (sem_env.mk (build_rec_env funs env env.v_field) env.c) [e]
    else (st, result.Rerr (error_result.Rabort abort.Rtype_error))
  | [exp.Tannot e _] => evaluate st env [e]
  | [exp.Lannot e _] => evaluate st env [e]

partial def evaluate_match (st : state ffi) (env : sem_env) (val' : v)
    (pes : List (pat × exp)) (err_v : v) : state ffi × result (List v) v :=
  match pes with
  | [] => (st, result.Rerr (error_result.Rraise err_v))
  | (p, e) :: rest =>
    if ALL_DISTINCT (pat_bindings p []) then
      match pmatch env.c st.refs p val' [] with
      | match_result.No_match => evaluate_match st env val' rest err_v
      | match_result.Match_type_error =>
        (st, result.Rerr (error_result.Rabort abort.Rtype_error))
      | match_result.Match env_v' =>
        evaluate st (sem_env.mk (nsAppend (alist_to_ns env_v') env.v_field) env.c) [e]
    else (st, result.Rerr (error_result.Rabort abort.Rtype_error))

partial def evaluate_decs (st : state ffi) (env : sem_env)
    (ds : List dec) : state ffi × result sem_env v :=
  match ds with
  | [] => (st, result.Rval (sem_env.mk nsEmpty nsEmpty))
  | d1 :: d2 :: rest =>
    match fix_clock st (evaluate_decs st env [d1]) with
    | (st1, result.Rval env1) =>
      match evaluate_decs st1 (extend_dec_env env1 env) (d2 :: rest) with
      | (st2, r) => (st2, combine_dec_result env1 r)
    | (st1, result.Rerr err) => (st1, result.Rerr err)
  | [dec.Dlet _ p e] =>
    if ALL_DISTINCT (pat_bindings p []) && every_exp (one_con_check env.c) e then
      match evaluate st env [e] with
      | (st', result.Rval vals) =>
        (st',
         match pmatch env.c st'.refs p vals.head! [] with
         | match_result.No_match => result.Rerr (error_result.Rraise bind_exn_v)
         | match_result.Match_type_error => result.Rerr (error_result.Rabort abort.Rtype_error)
         | match_result.Match new_vals =>
           result.Rval (sem_env.mk (alist_to_ns new_vals) nsEmpty))
      | (st', result.Rerr err) => (st', result.Rerr err)
    else (st, result.Rerr (error_result.Rabort abort.Rtype_error))
  | [dec.Dletrec _ funs] =>
    (st,
     if ALL_DISTINCT (funs.map (fun ⟨x, _, _⟩ => x)) &&
        funs.all (fun ⟨_, _, e⟩ => every_exp (one_con_check env.c) e)
     then result.Rval (sem_env.mk (build_rec_env funs env nsEmpty) nsEmpty)
     else result.Rerr (error_result.Rabort abort.Rtype_error))
  | [dec.Dtype _ tds] =>
    if tds.all (fun td => check_dup_ctors td) then
      ({ st with next_type_stamp := st.next_type_stamp + tds.length },
       result.Rval (sem_env.mk nsEmpty (build_tdefs st.next_type_stamp tds)))
    else (st, result.Rerr (error_result.Rabort abort.Rtype_error))
  | [dec.Dtabbrev _ _ _ _] =>
    (st, result.Rval (sem_env.mk nsEmpty nsEmpty))
  | [dec.Denv n] =>
    match declare_env st.eval_state_field env with
    | none => (st, result.Rerr (error_result.Rabort abort.Rtype_error))
    | some (x, es') =>
      ({ st with eval_state_field := es' },
       result.Rval (sem_env.mk (nsSing n x) nsEmpty))
  | [dec.Dexn _ cn ts] =>
    ({ st with next_exn_stamp := st.next_exn_stamp + 1 },
     result.Rval (sem_env.mk nsEmpty (nsSing cn (ts.length, stamp.ExnStamp st.next_exn_stamp))))
  | [dec.Dmod mn ds'] =>
    match evaluate_decs st env ds' with
    | (st', result.Rval env') =>
      (st', result.Rval (sem_env.mk (nsLift mn env'.v_field) (nsLift mn env'.c)))
    | (st', result.Rerr err) => (st', result.Rerr err)
  | [dec.Dlocal lds ds'] =>
    match fix_clock st (evaluate_decs st env lds) with
    | (st1, result.Rval env1) => evaluate_decs st1 (extend_dec_env env1 env) ds'
    | (st1, result.Rerr err) => (st1, result.Rerr err)
end

-- ============================================================
-- Theorems (all sorry)
-- ============================================================

theorem evaluate_clock :
  (∀ (s1 : state ffi) env e r s2,
     evaluate s1 env e = (s2, r) → s2.clock ≤ s1.clock) ∧
  (∀ (s1 : state ffi) env val' p v' r s2,
     evaluate_match s1 env val' p v' = (s2, r) → s2.clock ≤ s1.clock) ∧
  (∀ (s1 : state ffi) env ds r s2,
     evaluate_decs s1 env ds = (s2, r) → s2.clock ≤ s1.clock) := by sorry

theorem fix_clock_evaluate :
  (∀ (s1 : state ffi) env e,
     fix_clock s1 (evaluate s1 env e) = evaluate s1 env e) ∧
  (∀ (s1 : state ffi) env ds,
     fix_clock s1 (evaluate_decs s1 env ds) = evaluate_decs s1 env ds) := by sorry

theorem fix_clock_do_eval_res :
  ∀ (s : state ffi) vs,
    fix_clock s (do_eval_res vs s) = do_eval_res vs s := by sorry

end CakeML
