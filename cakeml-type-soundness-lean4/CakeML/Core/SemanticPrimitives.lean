/-
  Definitions of semantic primitives (e.g., values, and functions for doing
  primitive operations) used in the semantics.
  Translated from: hol4_sources/semanticPrimitivesScript.sml
-/
import CakeML.Core.Ast
import CakeML.Core.FpSem
import CakeML.Core.Misc
import CakeML.Core.Ffi

namespace CakeML

open HOL4
open mlstring

-- ============================================================
-- Stamps
-- ============================================================

inductive stamp where
  | TypeStamp : conN → Nat → stamp
  | ExnStamp : Nat → stamp
deriving Repr, BEq, Inhabited, DecidableEq

-- ============================================================
-- Mutually recursive: v and sem_env
-- ============================================================

mutual
inductive v where
  | Litv : lit → v
  | Conv : Option stamp → List v → v
  | Closure : sem_env → varN → exp → v
  | Recclosure : sem_env → List (varN × varN × exp) → varN → v
  | Loc : Bool → Nat → v
  | Vectorv : List v → v
  | Env : sem_env → (Nat × Nat) → v

inductive sem_env where
  | mk : ns modN varN v → ns modN conN (Nat × stamp) → sem_env
end

instance : Inhabited v := ⟨v.Litv (lit.IntLit 0)⟩
instance : Inhabited sem_env := ⟨sem_env.mk nsEmpty nsEmpty⟩

-- BEq for v is needed throughout; use sorry since mutual inductives can't derive it
partial def v_beq : v → v → Bool := fun _ _ => sorry
partial def sem_env_beq : sem_env → sem_env → Bool := fun _ _ => sorry

instance : BEq v := ⟨v_beq⟩
instance : BEq sem_env := ⟨sem_env_beq⟩

namespace sem_env
def v_field : sem_env → ns modN varN v
  | mk v _ => v
def c : sem_env → ns modN conN (Nat × stamp)
  | mk _ c => c
end sem_env

-- ============================================================
-- Type aliases
-- ============================================================

abbrev env_ctor := ns modN conN (Nat × stamp)
abbrev env_val := ns modN varN v

-- ============================================================
-- Stamp constants
-- ============================================================

def bind_stamp : stamp := stamp.ExnStamp 0
def chr_stamp : stamp := stamp.ExnStamp 1
def div_stamp : stamp := stamp.ExnStamp 2
def subscript_stamp : stamp := stamp.ExnStamp 3

def bind_exn_v : v := v.Conv (some bind_stamp) []
def chr_exn_v : v := v.Conv (some chr_stamp) []
def div_exn_v : v := v.Conv (some div_stamp) []
def sub_exn_v : v := v.Conv (some subscript_stamp) []

-- ============================================================
-- Type numbers
-- ============================================================

def bool_type_num : Nat := 0
def list_type_num : Nat := 1
def option_type_num : Nat := 2
def lit_type_num : Nat := 3
def id_type_num : Nat := 4
def ast_t_type_num : Nat := 5
def pat_type_num : Nat := 6
def lop_type_num : Nat := 7
def opn_type_num : Nat := 8
def opb_type_num : Nat := 9
def opw_type_num : Nat := 10
def shift_type_num : Nat := 11
def word_size_type_num : Nat := 12
def fp_uop_type_num : Nat := 13
def fp_bop_type_num : Nat := 14
def fp_top_type_num : Nat := 15
def fp_cmp_type_num : Nat := 16
def op_type_num : Nat := 20
def locn_type_num : Nat := 21
def locs_type_num : Nat := 22
def exp_type_num : Nat := 24
def dec_type_num : Nat := 25

-- ============================================================
-- Result types
-- ============================================================

inductive abort where
  | Rtype_error : abort
  | Rtimeout_error : abort
  | Rffi_error : final_event → abort
deriving Repr, BEq, Inhabited

inductive error_result (α : Type) where
  | Rraise : α → error_result α
  | Rabort : abort → error_result α
deriving Inhabited

inductive result (α β : Type) where
  | Rval : α → result α β
  | Rerr : error_result β → result α β
deriving Inhabited

-- ============================================================
-- Store types
-- ============================================================

inductive store_v (α : Type) where
  | Refv : α → store_v α
  | W8array : List word8 → store_v α
  | Varray : List α → store_v α
  | Thunk : thunk_mode → α → store_v α
deriving Inhabited

def store_v_same_type : store_v α → store_v α → Bool
  | store_v.Refv _, store_v.Refv _ => true
  | store_v.W8array _, store_v.W8array _ => true
  | store_v.Varray _, store_v.Varray _ => true
  | store_v.Thunk thunk_mode.NotEvaluated _, store_v.Thunk _ _ => true
  | _, _ => false

abbrev store (α : Type) := List (store_v α)

def empty_store : store α := []

def store_lookup (l : Nat) (st : store α) : Option (store_v α) :=
  if l < st.length then some (EL l st) else none

def store_alloc (sv : store_v α) (st : store α) : store α × Nat :=
  (st ++ [sv], st.length)

def store_assign (n : Nat) (sv : store_v α) (st : store α) : Option (store α) :=
  if n < st.length && store_v_same_type (EL n st) sv then
    some (LUPDATE sv n st)
  else none

-- ============================================================
-- Compiler / Eval state types
-- ============================================================

abbrev compiler_args := (Nat × Nat) × v × List dec
abbrev compiler_fun := compiler_args → Option (v × List word8 × List word64)

structure eval_decs_state where
  compiler : compiler_fun
  compiler_state : v
  env_id_counter : Nat × Nat × Nat
  decode_decs : v → Option (List dec)

abbrev eval_oracle_fun := Nat → compiler_args

structure eval_oracle_state where
  oracle : eval_oracle_fun
  custom_do_eval : List v → eval_oracle_fun → Option ((Nat × Nat) × eval_oracle_fun × List dec)
  envs : List (List sem_env)
  generation : Nat

inductive eval_state where
  | EvalDecs : eval_decs_state → eval_state
  | EvalOracle : eval_oracle_state → eval_state

-- ============================================================
-- State record
-- ============================================================

structure state (ffi : Type) where
  clock : Nat
  refs : store v
  ffi_field : ffi_state ffi
  next_type_stamp : Nat
  next_exn_stamp : Nat
  eval_state_field : Option eval_state
deriving Inhabited

-- ============================================================
-- Constructor helpers
-- ============================================================

def do_con_check (cenv : env_ctor) (n_opt : Option (id modN conN)) (l : Nat) : Bool :=
  match n_opt with
  | none => true
  | some n =>
    match nsLookup cenv n with
    | none => false
    | some (l', _) => l == l'

def build_conv (envC : env_ctor) (cn : Option (id modN conN)) (vs : List v) : Option v :=
  match cn with
  | none => some (v.Conv none vs)
  | some id_val =>
    match nsLookup envC id_val with
    | none => none
    | some (_, s) => some (v.Conv (some s) vs)

-- ============================================================
-- Literal / constructor type checking
-- ============================================================

def lit_same_type : lit → lit → Bool
  | lit.IntLit _, lit.IntLit _ => true
  | lit.Char _, lit.Char _ => true
  | lit.StrLit _, lit.StrLit _ => true
  | lit.Word8 _, lit.Word8 _ => true
  | lit.Word64 _, lit.Word64 _ => true
  | lit.Float64 _, lit.Float64 _ => true
  | _, _ => false

inductive match_result (α : Type) where
  | No_match : match_result α
  | Match_type_error : match_result α
  | Match : α → match_result α
deriving Repr, BEq, Inhabited

def same_type : stamp → stamp → Bool
  | stamp.TypeStamp _ n1, stamp.TypeStamp _ n2 => n1 == n2
  | stamp.ExnStamp _, stamp.ExnStamp _ => true
  | _, _ => false

def same_ctor (s1 s2 : stamp) : Bool := s1 == s2

def ctor_same_type : Option stamp → Option stamp → Bool
  | none, none => true
  | some s1, some s2 => same_type s1 s2
  | _, _ => false

def Boolv (b : Bool) : v :=
  if b then v.Conv (some (stamp.TypeStamp (strlit ['T','r','u','e']) bool_type_num)) []
  else v.Conv (some (stamp.TypeStamp (strlit ['F','a','l','s','e']) bool_type_num)) []

-- ============================================================
-- Pattern matching (mutual recursive)
-- ============================================================

partial def pmatch (envC : env_ctor) (s : store v) : pat → v → List (varN × v) → match_result (List (varN × v))
  | pat.Pany, _, env => match_result.Match env
  | pat.Pvar x, v', env => match_result.Match ((x, v') :: env)
  | pat.Plit l, v.Litv l', env =>
    if l == l' then match_result.Match env
    else if lit_same_type l l' then match_result.No_match
    else match_result.Match_type_error
  | pat.Pcon (some n) ps, v.Conv (some stamp') vs, env =>
    match nsLookup envC n with
    | none => match_result.Match_type_error
    | some (l, s_val) =>
      if same_type s_val stamp' && ps.length == l then
        if same_ctor s_val stamp' then
          if vs.length == l then pmatch_list envC s ps vs env
          else match_result.Match_type_error
        else match_result.No_match
      else match_result.Match_type_error
  | pat.Pcon none ps, v.Conv none vs, env =>
    if ps.length == vs.length then pmatch_list envC s ps vs env
    else match_result.Match_type_error
  | pat.Pref p, v.Loc _ lnum, env =>
    match store_lookup lnum s with
    | none => match_result.Match_type_error
    | some (store_v.Refv v') => pmatch envC s p v' env
    | some _ => match_result.Match_type_error
  | pat.Pas p i, v', env => pmatch envC s p v' ((i, v') :: env)
  | pat.Ptannot p _, v', env => pmatch envC s p v' env
  | _, _, _ => match_result.Match_type_error
where pmatch_list (envC : env_ctor) (s : store v) : List pat → List v → List (varN × v) → match_result (List (varN × v))
  | [], [], env => match_result.Match env
  | p :: ps, v' :: vs, env =>
    match pmatch envC s p v' env with
    | match_result.No_match =>
      match pmatch_list envC s ps vs env with
      | match_result.No_match => match_result.No_match
      | match_result.Match_type_error => match_result.Match_type_error
      | match_result.Match _ => match_result.No_match
    | match_result.Match_type_error => match_result.Match_type_error
    | match_result.Match env' => pmatch_list envC s ps vs env'
  | _, _, _ => match_result.Match_type_error

def match_result_is_type_error : match_result α → Bool
  | match_result.Match_type_error => true
  | _ => false

def can_pmatch_all (envC : env_ctor) (refs : store v) : List pat → v → Bool
  | [], _ => true
  | p :: ps, v' =>
    if match_result_is_type_error (pmatch envC refs p v' []) then false
    else can_pmatch_all envC refs ps v'

-- ============================================================
-- Recursive environment building
-- ============================================================

def build_rec_env (funs : List (varN × varN × exp)) (cl_env : sem_env)
    (add_to_env : ns modN varN v) : ns modN varN v :=
  funs.foldr (fun ⟨f, _, _⟩ env' => nsBind f (v.Recclosure cl_env funs f) env') add_to_env

def find_recfun (n : mlstring) : List (mlstring × α × β) → Option (α × β)
  | [] => none
  | (f, x, e) :: funs' => if f == n then some (x, e) else find_recfun n funs'

-- ============================================================
-- Equality
-- ============================================================

inductive eq_result where
  | Eq_val : Bool → eq_result
  | Eq_type_error : eq_result
deriving Repr, BEq, Inhabited, DecidableEq

partial def do_eq : v → v → eq_result
  | v.Litv l1, v.Litv l2 =>
    if lit_same_type l1 l2 then eq_result.Eq_val (l1 == l2) else eq_result.Eq_type_error
  | v.Loc b1 l1, v.Loc b2 l2 =>
    if b1 && b2 then eq_result.Eq_val (l1 == l2) else eq_result.Eq_type_error
  | v.Conv cn1 vs1, v.Conv cn2 vs2 =>
    if cn1 == cn2 && vs1.length == vs2.length then do_eq_list vs1 vs2
    else if ctor_same_type cn1 cn2 then eq_result.Eq_val false
    else eq_result.Eq_type_error
  | v.Vectorv vs1, v.Vectorv vs2 =>
    if vs1.length == vs2.length then do_eq_list vs1 vs2 else eq_result.Eq_val false
  | v.Closure _ _ _, v.Closure _ _ _ => eq_result.Eq_val true
  | v.Closure _ _ _, v.Recclosure _ _ _ => eq_result.Eq_val true
  | v.Recclosure _ _ _, v.Closure _ _ _ => eq_result.Eq_val true
  | v.Recclosure _ _ _, v.Recclosure _ _ _ => eq_result.Eq_val true
  | v.Env _ (gen1, id1), v.Env _ (gen2, id2) =>
    eq_result.Eq_val (gen1 == gen2 && id1 == id2)
  | _, _ => eq_result.Eq_type_error
where do_eq_list : List v → List v → eq_result
  | [], [] => eq_result.Eq_val true
  | v1 :: vs1, v2 :: vs2 =>
    match do_eq v1 v2 with
    | eq_result.Eq_val r => if !r then eq_result.Eq_val false else do_eq_list vs1 vs2
    | eq_result.Eq_type_error => eq_result.Eq_type_error
  | _, _ => eq_result.Eq_val false

-- ============================================================
-- Function application
-- ============================================================

def do_opapp (vs : List v) : Option (sem_env × exp) :=
  match vs with
  | [v.Closure env n e, val'] =>
    some (sem_env.mk (nsBind n val' env.v_field) env.c, e)
  | [v.Recclosure env' funs n', val'] =>
    if ALL_DISTINCT (funs.map (fun ⟨f, _, _⟩ => f)) then
      match find_recfun n' funs with
      | none => none
      | some (n, e) =>
        some (sem_env.mk (nsBind n val' (build_rec_env funs env' env'.v_field)) env'.c, e)
    else none
  | _ => none

-- ============================================================
-- Value conversion functions
-- ============================================================

partial def v_to_list : v → Option (List v)
  | v.Conv (some stamp') [] =>
    if stamp' == stamp.TypeStamp (strlit "[]".toList) list_type_num then some [] else none
  | v.Conv (some stamp') [v1, v2] =>
    if stamp' == stamp.TypeStamp (strlit "::".toList) list_type_num then
      match v_to_list v2 with
      | none => none
      | some vs => some (v1 :: vs)
    else none
  | _ => none

def list_to_v : List v → v
  | [] => v.Conv (some (stamp.TypeStamp (strlit "[]".toList) list_type_num)) []
  | x :: xs => v.Conv (some (stamp.TypeStamp (strlit "::".toList) list_type_num)) [x, list_to_v xs]

partial def v_to_char_list : v → Option (List Char)
  | v.Conv (some stamp') [] =>
    if stamp' == stamp.TypeStamp (strlit "[]".toList) list_type_num then some [] else none
  | v.Conv (some stamp') [v.Litv (lit.Char c), rest] =>
    if stamp' == stamp.TypeStamp (strlit "::".toList) list_type_num then
      match v_to_char_list rest with
      | none => none
      | some cs => some (c :: cs)
    else none
  | _ => none

def vs_to_string : List v → Option mlstring
  | [] => some (strlit [])
  | v.Litv (lit.StrLit s1) :: vs =>
    match vs_to_string vs with
    | none => none
    | some s2 => some (mlstring.strcat s1 s2)
  | _ :: _ => none

def maybe_to_v : Option v → v
  | none => v.Conv (some (stamp.TypeStamp (strlit "None".toList) option_type_num)) []
  | some val' => v.Conv (some (stamp.TypeStamp (strlit "Some".toList) option_type_num)) [val']

partial def v_to_id : v → Option (id modN conN)
  | v.Conv (some stamp') [v.Litv (lit.StrLit s)] =>
    if stamp' == stamp.TypeStamp (strlit "Short".toList) id_type_num then
      some (id.Short s)
    else none
  | v.Conv (some stamp') [v.Litv (lit.StrLit s), rest] =>
    if stamp' == stamp.TypeStamp (strlit "Long".toList) id_type_num then
      match v_to_id rest with
      | none => none
      | some id_val => some (id.Long s id_val)
    else none
  | _ => none

def nat_to_v (n : Nat) : v := v.Litv (lit.IntLit (Int.ofNat n))

def maybe_all_list : List (Option α) → Option (List α)
  | [] => some []
  | none :: _ => none
  | some x :: vs =>
    match maybe_all_list vs with
    | none => none
    | some xs => some (x :: xs)

def v_to_word8 : v → Option word8
  | v.Litv (lit.Word8 w) => some w
  | _ => none

def v_to_word8_list (val' : v) : Option (List word8) :=
  match v_to_list val' with
  | none => none
  | some xs => maybe_all_list (xs.map v_to_word8)

def v_to_word64 : v → Option word64
  | v.Litv (lit.Word64 w) => some w
  | _ => none

def v_to_word64_list (val' : v) : Option (List word64) :=
  match v_to_list val' with
  | none => none
  | some xs => maybe_all_list (xs.map v_to_word64)

-- ============================================================
-- Eval helpers
-- ============================================================

def lookup_env (s : eval_oracle_state) (ij : Nat × Nat) : Option sem_env :=
  match s.envs.get? ij.1 with
  | none => none
  | some gen_envs => gen_envs.get? ij.2

def add_decs_generation (s : eval_decs_state) : eval_decs_state :=
  match s.env_id_counter with
  | (_, _, next_gen) =>
    { s with env_id_counter := (next_gen, 0, next_gen + 1) }

def add_env_generation (s : eval_oracle_state) : eval_oracle_state :=
  { s with generation := s.envs.length, envs := s.envs ++ [[]] }

def declare_env (es : Option eval_state) (env : sem_env) :
    Option (v × Option eval_state) :=
  match es with
  | none => none
  | some (eval_state.EvalDecs s) =>
    match s.env_id_counter with
    | (cur_gen, next_id, next_gen) =>
      some (v.Env env (cur_gen, next_id),
            some (eval_state.EvalDecs
              { s with env_id_counter := (cur_gen, next_id + 1, next_gen) }))
  | some (eval_state.EvalOracle s') =>
    match s'.envs.get? s'.generation with
    | none => none
    | some gen_envs =>
      some (v.Conv none [nat_to_v s'.generation, nat_to_v gen_envs.length],
            some (eval_state.EvalOracle
              { s' with envs := LUPDATE (gen_envs ++ [env]) s'.generation s'.envs }))

-- ============================================================
-- Concrete values
-- ============================================================

partial def concrete_v : v → Bool
  | v.Loc _ _ => true
  | v.Litv _ => true
  | v.Conv _ vs => concrete_v_list vs
  | v.Vectorv vs => concrete_v_list vs
  | _ => false
where concrete_v_list : List v → Bool
  | [] => true
  | val' :: vs => concrete_v val' && concrete_v_list vs

-- ============================================================
-- Compiler agreement
-- ============================================================

def compiler_agrees (f : compiler_fun) (args : compiler_args)
    (result_triple : v × v × v) : Bool :=
  let (st_v, bs_v, ws_v) := result_triple
  match f args, args, v_to_word8_list bs_v, v_to_word64_list ws_v with
  | some (st, c_bs, c_ws), (_, prev_st_v, _), some bs, some ws =>
    st == st_v && c_bs == bs && c_ws == ws && concrete_v st_v && concrete_v prev_st_v
  | _, _, _, _ => false

-- ============================================================
-- do_eval
-- ============================================================

def do_eval (vs : List v) (es : Option eval_state) :
    Option (sem_env × List dec × Option eval_state) :=
  match es, vs with
  | some (eval_state.EvalDecs s), [v.Env env id_val, st_v, decs_v, st_v2, bs_v, ws_v] =>
    match s.decode_decs decs_v with
    | none => none
    | some decs =>
      if st_v == s.compiler_state && concrete_v decs_v &&
         compiler_agrees s.compiler (id_val, st_v, decs) (st_v2, bs_v, ws_v)
      then some (env, decs,
                 some (eval_state.EvalDecs
                   (add_decs_generation { s with compiler_state := st_v2 })))
      else none
  | some (eval_state.EvalOracle s'), vs' =>
    match s'.custom_do_eval vs' s'.oracle with
    | none => none
    | some (env_id, oracle', decs) =>
      match lookup_env s' env_id with
      | none => none
      | some env =>
        some (env, decs,
              some (eval_state.EvalOracle
                (add_env_generation { s' with oracle := oracle' })))
  | _, _ => none

def reset_env_generation (prior_es es : Option eval_state) : Option eval_state :=
  match prior_es, es with
  | some (eval_state.EvalDecs prior_s'), some (eval_state.EvalDecs s') =>
    match prior_s'.env_id_counter, s'.env_id_counter with
    | (cur_gen, next_id, _), (_, _, next_gen) =>
      some (eval_state.EvalDecs
        { s' with env_id_counter := (cur_gen, next_id, next_gen) })
  | some (eval_state.EvalOracle prior_s), some (eval_state.EvalOracle s) =>
    some (eval_state.EvalOracle { s with generation := prior_s.generation })
  | _, _ => es

-- ============================================================
-- copy_array
-- ============================================================

def copy_array {α : Type} (src : List α) (srcoff len : Int)
    (d : Option (List α × Int)) : Option (List α) :=
  if srcoff < 0 || len < 0 || src.length < (srcoff + len).toNat then none
  else
    let copied := (src.drop srcoff.toNat).take len.toNat
    match d with
    | none => some copied
    | some (dst, dstoff) =>
      if dstoff < 0 || dst.length < (dstoff + len).toNat then none
      else some ((dst.take dstoff.toNat) ++ copied ++ (dst.drop (dstoff + len).toNat))

def ws_to_chars (ws : List word8) : List Char :=
  ws.map (fun w => Char.ofNat (w2n w))

def chars_to_ws (cs : List Char) : List word8 :=
  cs.map (fun c => BitVec.ofNat 8 c.toNat)

-- ============================================================
-- Shift lookups
-- ============================================================

def shift8_lookup : shift → word8 → Nat → word8
  | shift.Lsl => word_lsl
  | shift.Lsr => word_lsr
  | shift.Asr => word_asr
  | shift.Ror => word_ror

def shift64_lookup : shift → word64 → Nat → word64
  | shift.Lsl => word_lsl
  | shift.Lsr => word_lsr
  | shift.Asr => word_asr
  | shift.Ror => word_ror

-- ============================================================
-- exp_or_val
-- ============================================================

inductive exp_or_val where
  | Exp : exp → exp_or_val
  | Val : v → exp_or_val
deriving Inhabited

abbrev store_ffi (ffi : Type) := store v × ffi_state ffi

-- ============================================================
-- xor_bytes
-- ============================================================

def xor_bytes : List word8 → List word8 → Option (List word8)
  | [], bs2 => some bs2
  | _ :: _, [] => none
  | b1 :: bs1, b2 :: bs2 =>
    match xor_bytes bs1 bs2 with
    | none => none
    | some rest => some (word_xor b1 b2 :: rest)

-- ============================================================
-- thunk_op (store operation)
-- ============================================================

def thunk_op_fn (st : store v × ffi_state ffi) (th_op : thunk_op) (vs : List v) :
    Option ((store v × ffi_state ffi) × result v v) :=
  let (s, t) := st
  match th_op, vs with
  | thunk_op.AllocThunk m, [val'] =>
    let (s', n) := store_alloc (store_v.Thunk m val') s
    some ((s', t), result.Rval (v.Loc false n))
  | thunk_op.UpdateThunk m, [v.Loc _ lnum, val'] =>
    match store_assign lnum (store_v.Thunk m val') s with
    | some s' => some ((s', t), result.Rval (v.Conv none []))
    | none => none
  | _, _ => none

-- ============================================================
-- check_type, dest_Litv, etc.
-- ============================================================

def check_type : prim_type → v → Prop
  | prim_type.BoolT, val' => val' = Boolv true ∨ val' = Boolv false
  | prim_type.IntT, val' => ∃ i, val' = v.Litv (lit.IntLit i)
  | prim_type.CharT, val' => ∃ c, val' = v.Litv (lit.Char c)
  | prim_type.StrT, val' => ∃ s, val' = v.Litv (lit.StrLit s)
  | prim_type.WordT word_size.W8, val' => ∃ w, val' = v.Litv (lit.Word8 w)
  | prim_type.WordT word_size.W64, val' => ∃ w, val' = v.Litv (lit.Word64 w)
  | prim_type.Float64T, val' => ∃ w, val' = v.Litv (lit.Float64 w)

def dest_Litv : v → Option lit
  | v.Litv l => some l
  | _ => none

def the_Litv_IntLit : v → Int
  | v.Litv (lit.IntLit i) => i
  | _ => 0

def the_Litv_Word8 : v → word8
  | v.Litv (lit.Word8 w) => w
  | _ => 0

def the_Litv_Word64 : v → word64
  | v.Litv (lit.Word64 w) => w
  | _ => 0

def the_Litv_Float64 : v → word64
  | v.Litv (lit.Float64 w) => w
  | _ => 0

def the_Litv_Char : v → Char
  | v.Litv (lit.Char c) => c
  | _ => default

def the_Boolv (val' : v) : Bool := val' == Boolv true

-- ============================================================
-- Comparison helpers
-- ============================================================

def num_cmp : opb → Nat → Nat → Bool
  | opb.Lt, i, j => i < j
  | opb.Leq, i, j => i ≤ j
  | opb.Gt, i, j => i > j
  | opb.Geq, i, j => i ≥ j

def int_cmp : opb → Int → Int → Bool
  | opb.Lt, i, j => i < j
  | opb.Leq, i, j => i ≤ j
  | opb.Gt, i, j => i > j
  | opb.Geq, i, j => i ≥ j

-- ============================================================
-- do_test
-- ============================================================

def check_type_bool : prim_type → v → Bool
  | prim_type.BoolT, val' => val' == Boolv true || val' == Boolv false
  | prim_type.IntT, v.Litv (lit.IntLit _) => true
  | prim_type.CharT, v.Litv (lit.Char _) => true
  | prim_type.StrT, v.Litv (lit.StrLit _) => true
  | prim_type.WordT word_size.W8, v.Litv (lit.Word8 _) => true
  | prim_type.WordT word_size.W64, v.Litv (lit.Word64 _) => true
  | prim_type.Float64T, v.Litv (lit.Float64 _) => true
  | _, _ => false

def do_test : test → prim_type → v → v → eq_result
  | test.Equal, ty, v1, v2 =>
    if check_type_bool ty v1 && check_type_bool ty v2 then
      if ty == prim_type.Float64T
      then eq_result.Eq_val (fp64_equal (the_Litv_Float64 v1) (the_Litv_Float64 v2))
      else do_eq v1 v2
    else eq_result.Eq_type_error
  | test.Compare cmp, ty, v1, v2 =>
    match ty, dest_Litv v1, dest_Litv v2 with
    | prim_type.IntT, some (lit.IntLit i), some (lit.IntLit j) =>
      eq_result.Eq_val (int_cmp cmp i j)
    | prim_type.CharT, some (lit.Char c), some (lit.Char d) =>
      eq_result.Eq_val (num_cmp cmp c.toNat d.toNat)
    | prim_type.WordT word_size.W8, some (lit.Word8 w), some (lit.Word8 v') =>
      eq_result.Eq_val (num_cmp cmp (w2n w) (w2n v'))
    | prim_type.Float64T, some (lit.Float64 w), some (lit.Float64 v') =>
      eq_result.Eq_val (fp_cmp_def cmp w v')
    | _, _, _ => eq_result.Eq_type_error
  | _, _, _, _ => eq_result.Eq_type_error

-- ============================================================
-- do_arith
-- ============================================================

def do_arith (a : arith) (ty : prim_type) (vals : List v) : Option (Sum v v) :=
  match ty with
  | prim_type.Float64T =>
    let ws := vals.map the_Litv_Float64
    match a, ws with
    | arith.Abs, [v1] => some (Sum.inr (v.Litv (lit.Float64 (fp64_abs v1))))
    | arith.Neg, [v1] => some (Sum.inr (v.Litv (lit.Float64 (fp64_negate v1))))
    | arith.Sqrt, [v1] => some (Sum.inr (v.Litv (lit.Float64 (fp64_sqrt roundTiesToEven v1))))
    | arith.Add, [v1, v2] => some (Sum.inr (v.Litv (lit.Float64 (fp64_add roundTiesToEven v1 v2))))
    | arith.Sub, [v1, v2] => some (Sum.inr (v.Litv (lit.Float64 (fp64_sub roundTiesToEven v1 v2))))
    | arith.Mul, [v1, v2] => some (Sum.inr (v.Litv (lit.Float64 (fp64_mul roundTiesToEven v1 v2))))
    | arith.Div, [v1, v2] => some (Sum.inr (v.Litv (lit.Float64 (fp64_div roundTiesToEven v1 v2))))
    | arith.FMA, [v1, v2, v3] => some (Sum.inr (v.Litv (lit.Float64 (fp64_mul_add roundTiesToEven v2 v3 v1))))
    | _, _ => none
  | prim_type.IntT =>
    let is := vals.map the_Litv_IntLit
    match a, is with
    | arith.Add, [v1, v2] => some (Sum.inr (v.Litv (lit.IntLit (v1 + v2))))
    | arith.Sub, [v1, v2] => some (Sum.inr (v.Litv (lit.IntLit (v1 - v2))))
    | arith.Mul, [v1, v2] => some (Sum.inr (v.Litv (lit.IntLit (v1 * v2))))
    | arith.Div, [_, v2] =>
      if v2 == 0 then some (Sum.inl div_exn_v)
      else some (Sum.inr (v.Litv (lit.IntLit (is.head! / v2))))
    | arith.Mod, [_, v2] =>
      if v2 == 0 then some (Sum.inl div_exn_v)
      else some (Sum.inr (v.Litv (lit.IntLit (is.head! % v2))))
    | _, _ => none
  | prim_type.WordT word_size.W8 =>
    let ws := vals.map the_Litv_Word8
    match a, ws with
    | arith.Add, [v1, v2] => some (Sum.inr (v.Litv (lit.Word8 (word_add v1 v2))))
    | arith.Sub, [v1, v2] => some (Sum.inr (v.Litv (lit.Word8 (word_sub v1 v2))))
    | arith.And, [v1, v2] => some (Sum.inr (v.Litv (lit.Word8 (word_and v1 v2))))
    | arith.Or, [v1, v2] => some (Sum.inr (v.Litv (lit.Word8 (word_or v1 v2))))
    | arith.Xor, [v1, v2] => some (Sum.inr (v.Litv (lit.Word8 (word_xor v1 v2))))
    | _, _ => none
  | prim_type.WordT word_size.W64 =>
    let ws := vals.map the_Litv_Word64
    match a, ws with
    | arith.Add, [v1, v2] => some (Sum.inr (v.Litv (lit.Word64 (word_add v1 v2))))
    | arith.Sub, [v1, v2] => some (Sum.inr (v.Litv (lit.Word64 (word_sub v1 v2))))
    | arith.And, [v1, v2] => some (Sum.inr (v.Litv (lit.Word64 (word_and v1 v2))))
    | arith.Or, [v1, v2] => some (Sum.inr (v.Litv (lit.Word64 (word_or v1 v2))))
    | arith.Xor, [v1, v2] => some (Sum.inr (v.Litv (lit.Word64 (word_xor v1 v2))))
    | _, _ => none
  | prim_type.BoolT =>
    match a, vals with
    | arith.Not, [v1] => some (Sum.inr (Boolv (!(the_Boolv v1))))
    | _, _ => none
  | _ => none

-- ============================================================
-- do_conversion
-- ============================================================

def do_conversion (val' : v) (ty1 ty2 : prim_type) : Option (Sum v v) :=
  match ty1, ty2 with
  | prim_type.WordT word_size.W8, prim_type.IntT =>
    some (Sum.inr (v.Litv (lit.IntLit (Int.ofNat (w2n (the_Litv_Word8 val'))))))
  | prim_type.WordT word_size.W64, prim_type.IntT =>
    some (Sum.inr (v.Litv (lit.IntLit (Int.ofNat (w2n (the_Litv_Word64 val'))))))
  | prim_type.IntT, prim_type.WordT word_size.W8 =>
    some (Sum.inr (v.Litv (lit.Word8 (BitVec.ofNat 8 (the_Litv_IntLit val').toNat))))
  | prim_type.IntT, prim_type.WordT word_size.W64 =>
    some (Sum.inr (v.Litv (lit.Word64 (BitVec.ofNat 64 (the_Litv_IntLit val').toNat))))
  | prim_type.CharT, prim_type.IntT =>
    some (Sum.inr (v.Litv (lit.IntLit (Int.ofNat (the_Litv_Char val').toNat))))
  | prim_type.IntT, prim_type.CharT =>
    let i := the_Litv_IntLit val'
    if i < 0 || i > 255 then some (Sum.inl chr_exn_v)
    else some (Sum.inr (v.Litv (lit.Char (Char.ofNat i.toNat))))
  | prim_type.Float64T, prim_type.WordT word_size.W64 =>
    some (Sum.inr (v.Litv (lit.Word64 (the_Litv_Float64 val'))))
  | prim_type.WordT word_size.W64, prim_type.Float64T =>
    some (Sum.inr (v.Litv (lit.Float64 (the_Litv_Word64 val'))))
  | _, _ => none

-- ============================================================
-- do_app (the big one)
-- ============================================================

partial def do_app (st : store v × ffi_state ffi) (op' : op) (vs : List v) :
    Option ((store v × ffi_state ffi) × result v v) :=
  let (s, t) := st
  match op', vs with
  | op.ListAppend, [x1, x2] =>
    match v_to_list x1, v_to_list x2 with
    | some xs, some ys => some ((s, t), result.Rval (list_to_v (xs ++ ys)))
    | _, _ => none
  | op.Shift word_size.W8 sh n, [v.Litv (lit.Word8 w)] =>
    some ((s, t), result.Rval (v.Litv (lit.Word8 (shift8_lookup sh w n))))
  | op.Shift word_size.W64 sh n, [v.Litv (lit.Word64 w)] =>
    some ((s, t), result.Rval (v.Litv (lit.Word64 (shift64_lookup sh w n))))
  | op.Equality, [v1, v2] =>
    match do_eq v1 v2 with
    | eq_result.Eq_type_error => none
    | eq_result.Eq_val b => some ((s, t), result.Rval (Boolv b))
  | op.Opassign, [v.Loc _ lnum, val'] =>
    match store_assign lnum (store_v.Refv val') s with
    | some s' => some ((s', t), result.Rval (v.Conv none []))
    | none => none
  | op.Opref, [val'] =>
    let (s', n) := store_alloc (store_v.Refv val') s
    some ((s', t), result.Rval (v.Loc true n))
  | op.Opderef, [v.Loc _ n] =>
    match store_lookup n s with
    | some (store_v.Refv val') => some ((s, t), result.Rval val')
    | _ => none
  | op.Aw8alloc, [v.Litv (lit.IntLit n), v.Litv (lit.Word8 w)] =>
    if n < 0 then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
    else
      let (s', lnum) := store_alloc (store_v.W8array (REPLICATE n.toNat w)) s
      some ((s', t), result.Rval (v.Loc true lnum))
  | op.Aw8sub, [v.Loc _ lnum, v.Litv (lit.IntLit i)] =>
    match store_lookup lnum s with
    | some (store_v.W8array ws) =>
      if i < 0 then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
      else if i.toNat >= ws.length then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
      else some ((s, t), result.Rval (v.Litv (lit.Word8 (EL i.toNat ws))))
    | _ => none
  | op.Aw8sub_unsafe, [v.Loc _ lnum, v.Litv (lit.IntLit i)] =>
    match store_lookup lnum s with
    | some (store_v.W8array ws) =>
      if i < 0 || i.toNat >= ws.length then none
      else some ((s, t), result.Rval (v.Litv (lit.Word8 (EL i.toNat ws))))
    | _ => none
  | op.Aw8length, [v.Loc _ n] =>
    match store_lookup n s with
    | some (store_v.W8array ws) =>
      some ((s, t), result.Rval (v.Litv (lit.IntLit (Int.ofNat ws.length))))
    | _ => none
  | op.Aw8update, [v.Loc _ lnum, v.Litv (lit.IntLit i), v.Litv (lit.Word8 w)] =>
    match store_lookup lnum s with
    | some (store_v.W8array ws) =>
      if i < 0 then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
      else if i.toNat >= ws.length then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
      else
        match store_assign lnum (store_v.W8array (LUPDATE w i.toNat ws)) s with
        | none => none
        | some s' => some ((s', t), result.Rval (v.Conv none []))
    | _ => none
  | op.Aw8update_unsafe, [v.Loc _ lnum, v.Litv (lit.IntLit i), v.Litv (lit.Word8 w)] =>
    match store_lookup lnum s with
    | some (store_v.W8array ws) =>
      if i < 0 || i.toNat >= ws.length then none
      else
        match store_assign lnum (store_v.W8array (LUPDATE w i.toNat ws)) s with
        | none => none
        | some s' => some ((s', t), result.Rval (v.Conv none []))
    | _ => none
  | op.CopyStrStr, [v.Litv (lit.StrLit strng), v.Litv (lit.IntLit off), v.Litv (lit.IntLit len)] =>
    match copy_array (mlstring.explode strng) off len none with
    | none => some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
    | some cs => some ((s, t), result.Rval (v.Litv (lit.StrLit (mlstring.implode cs))))
  | op.CopyStrAw8, [v.Litv (lit.StrLit strng), v.Litv (lit.IntLit off),
                     v.Litv (lit.IntLit len), v.Loc _ dst, v.Litv (lit.IntLit dstoff)] =>
    match store_lookup dst s with
    | some (store_v.W8array ws) =>
      match copy_array (mlstring.explode strng) off len (some (ws_to_chars ws, dstoff)) with
      | none => some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
      | some cs =>
        match store_assign dst (store_v.W8array (chars_to_ws cs)) s with
        | some s' => some ((s', t), result.Rval (v.Conv none []))
        | _ => none
    | _ => none
  | op.CopyAw8Str, [v.Loc _ src, v.Litv (lit.IntLit off), v.Litv (lit.IntLit len)] =>
    match store_lookup src s with
    | some (store_v.W8array ws) =>
      match copy_array ws off len none with
      | none => some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
      | some ws' => some ((s, t), result.Rval (v.Litv (lit.StrLit (mlstring.implode (ws_to_chars ws')))))
    | _ => none
  | op.CopyAw8Aw8, [v.Loc _ src, v.Litv (lit.IntLit off), v.Litv (lit.IntLit len),
                     v.Loc _ dst, v.Litv (lit.IntLit dstoff)] =>
    match store_lookup src s, store_lookup dst s with
    | some (store_v.W8array ws), some (store_v.W8array ds) =>
      match copy_array ws off len (some (ds, dstoff)) with
      | none => some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
      | some ws' =>
        match store_assign dst (store_v.W8array ws') s with
        | some s' => some ((s', t), result.Rval (v.Conv none []))
        | _ => none
    | _, _ => none
  | op.XorAw8Str_unsafe, [v.Loc _ dst, v.Litv (lit.StrLit str_arg)] =>
    match store_lookup dst s with
    | some (store_v.W8array bs) =>
      match xor_bytes ((mlstring.explode str_arg).map (fun c => BitVec.ofNat 8 c.toNat)) bs with
      | none => none
      | some new_bs =>
        match store_assign dst (store_v.W8array new_bs) s with
        | none => none
        | some s' => some ((s', t), result.Rval (v.Conv none []))
    | _ => none
  | op.Implode, [val'] =>
    match v_to_char_list val' with
    | some ls => some ((s, t), result.Rval (v.Litv (lit.StrLit (mlstring.implode ls))))
    | none => none
  | op.Explode, [v.Litv (lit.StrLit strng)] =>
    some ((s, t), result.Rval (list_to_v ((mlstring.explode strng).map (fun c => v.Litv (lit.Char c)))))
  | op.Strsub, [v.Litv (lit.StrLit strng), v.Litv (lit.IntLit i)] =>
    if i < 0 then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
    else if i.toNat >= mlstring.strlen strng then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
    else some ((s, t), result.Rval (v.Litv (lit.Char (EL i.toNat (mlstring.explode strng)))))
  | op.Strlen, [v.Litv (lit.StrLit strng)] =>
    some ((s, t), result.Rval (v.Litv (lit.IntLit (Int.ofNat (mlstring.strlen strng)))))
  | op.Strcat, [val'] =>
    match v_to_list val' with
    | some vs' =>
      match vs_to_string vs' with
      | some strng => some ((s, t), result.Rval (v.Litv (lit.StrLit strng)))
      | _ => none
    | _ => none
  | op.VfromList, [val'] =>
    match v_to_list val' with
    | some vs' => some ((s, t), result.Rval (v.Vectorv vs'))
    | none => none
  | op.Vsub_unsafe, [v.Vectorv vs', v.Litv (lit.IntLit i)] =>
    if 0 ≤ i && i.toNat < vs'.length then
      some ((s, t), result.Rval (EL i.toNat vs'))
    else none
  | op.Vsub, [v.Vectorv vs', v.Litv (lit.IntLit i)] =>
    if i < 0 then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
    else if i.toNat >= vs'.length then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
    else some ((s, t), result.Rval (EL i.toNat vs'))
  | op.Vlength, [v.Vectorv vs'] =>
    some ((s, t), result.Rval (v.Litv (lit.IntLit (Int.ofNat vs'.length))))
  | op.Aalloc, [v.Litv (lit.IntLit n), val'] =>
    if n < 0 then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
    else
      let (s', lnum) := store_alloc (store_v.Varray (REPLICATE n.toNat val')) s
      some ((s', t), result.Rval (v.Loc true lnum))
  | op.AallocEmpty, [v.Conv none []] =>
    let (s', lnum) := store_alloc (store_v.Varray []) s
    some ((s', t), result.Rval (v.Loc true lnum))
  | op.AallocFixed, vs' =>
    let (s', lnum) := store_alloc (store_v.Varray vs') s
    some ((s', t), result.Rval (v.Loc true lnum))
  | op.Asub, [v.Loc _ lnum, v.Litv (lit.IntLit i)] =>
    match store_lookup lnum s with
    | some (store_v.Varray vs') =>
      if i < 0 then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
      else if i.toNat >= vs'.length then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
      else some ((s, t), result.Rval (EL i.toNat vs'))
    | _ => none
  | op.Asub_unsafe, [v.Loc _ lnum, v.Litv (lit.IntLit i)] =>
    match store_lookup lnum s with
    | some (store_v.Varray vs') =>
      if i < 0 || i.toNat >= vs'.length then none
      else some ((s, t), result.Rval (EL i.toNat vs'))
    | _ => none
  | op.Alength, [v.Loc _ n] =>
    match store_lookup n s with
    | some (store_v.Varray ws) =>
      some ((s, t), result.Rval (v.Litv (lit.IntLit (Int.ofNat ws.length))))
    | _ => none
  | op.Aupdate, [v.Loc _ lnum, v.Litv (lit.IntLit i), val'] =>
    match store_lookup lnum s with
    | some (store_v.Varray vs') =>
      if i < 0 then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
      else if i.toNat >= vs'.length then some ((s, t), result.Rerr (error_result.Rraise sub_exn_v))
      else
        match store_assign lnum (store_v.Varray (LUPDATE val' i.toNat vs')) s with
        | none => none
        | some s' => some ((s', t), result.Rval (v.Conv none []))
    | _ => none
  | op.Aupdate_unsafe, [v.Loc _ lnum, v.Litv (lit.IntLit i), val'] =>
    match store_lookup lnum s with
    | some (store_v.Varray vs') =>
      if i < 0 || i.toNat >= vs'.length then none
      else
        match store_assign lnum (store_v.Varray (LUPDATE val' i.toNat vs')) s with
        | none => none
        | some s' => some ((s', t), result.Rval (v.Conv none []))
    | _ => none
  | op.ConfigGC, [v.Litv (lit.IntLit _), v.Litv (lit.IntLit _)] =>
    some ((s, t), result.Rval (v.Conv none []))
  | op.FFI n, [v.Litv (lit.StrLit conf), v.Loc _ lnum] =>
    match store_lookup lnum s with
    | some (store_v.W8array ws) =>
      match call_FFI t (ffiname.ExtCall n) ((mlstring.explode conf).map (fun c => BitVec.ofNat 8 c.toNat)) ws with
      | ffi_result.FFI_return t' ws' =>
        match store_assign lnum (store_v.W8array ws') s with
        | some s' => some ((s', t'), result.Rval (v.Conv none []))
        | none => none
      | ffi_result.FFI_final outcome =>
        some ((s, t), result.Rerr (error_result.Rabort (abort.Rffi_error outcome)))
    | _ => none
  | op.Env_id, [v.Env _ (gen, id_val)] =>
    some ((s, t), result.Rval (v.Conv none [nat_to_v gen, nat_to_v id_val]))
  | op.Env_id, [v.Conv none [gen, id_val]] =>
    some ((s, t), result.Rval (v.Conv none [gen, id_val]))
  | op.ThunkOp th_op, vs' => thunk_op_fn (s, t) th_op vs'
  | op.Arith a ty, vs' =>
    if vs'.all (check_type_bool ty) then
      match do_arith a ty vs' with
      | some (Sum.inr res) => some ((s, t), result.Rval res)
      | some (Sum.inl exn) => some ((s, t), result.Rerr (error_result.Rraise exn))
      | none => none
    else none
  | op.FromTo ty1 ty2, [val'] =>
    if check_type_bool ty1 val' then
      match do_conversion val' ty1 ty2 with
      | some (Sum.inr res) => some ((s, t), result.Rval res)
      | some (Sum.inl exn) => some ((s, t), result.Rerr (error_result.Rraise exn))
      | none => none
    else none
  | op.Test tst test_ty, [v1, v2] =>
    match do_test tst test_ty v1 v2 with
    | eq_result.Eq_type_error => none
    | eq_result.Eq_val b => some ((s, t), result.Rval (Boolv b))
  | _, _ => none

-- ============================================================
-- Logical operations and if-then-else
-- ============================================================

def do_log (l : lop) (val' : v) (e : exp) : Option exp_or_val :=
  if (l == lop.Andalso && val' == Boolv true) || (l == lop.Orelse && val' == Boolv false) then
    some (exp_or_val.Exp e)
  else if (l == lop.Andalso && val' == Boolv false) || (l == lop.Orelse && val' == Boolv true) then
    some (exp_or_val.Val val')
  else none

def do_if (val' : v) (e1 e2 : exp) : Option exp :=
  if val' == Boolv true then some e1
  else if val' == Boolv false then some e2
  else none

-- ============================================================
-- Type definition helpers
-- ============================================================

def build_constrs (stamp_val : Nat) (condefs : List (conN × List ast_t)) :
    List (conN × Nat × stamp) :=
  condefs.map (fun ⟨cn, ts⟩ => (cn, ts.length, stamp.TypeStamp cn stamp_val))

def build_tdefs (next_stamp : Nat) : type_def → env_ctor
  | [] => alist_to_ns []
  | (_, _, condefs) :: tds =>
    nsAppend (build_tdefs (next_stamp + 1) tds)
      (alist_to_ns (build_constrs next_stamp condefs).reverse)

def check_dup_ctors (td : List tvarN × typeN × List (conN × List ast_t)) : Bool :=
  let (_, _, condefs) := td
  ALL_DISTINCT (condefs.map Prod.fst)

def combine_dec_result (env : sem_env) (r : result sem_env v) : result sem_env v :=
  match r with
  | result.Rval env' =>
    result.Rval (sem_env.mk (nsAppend env'.v_field env.v_field)
                             (nsAppend env'.c env.c))
  | result.Rerr e => result.Rerr e

def extend_dec_env (new_env env : sem_env) : sem_env :=
  sem_env.mk (nsAppend new_env.v_field env.v_field) (nsAppend new_env.c env.c)

-- ============================================================
-- Thunk helpers
-- ============================================================

inductive dest_thunk_ret where
  | BadRef : dest_thunk_ret
  | NotThunk : dest_thunk_ret
  | IsThunk : thunk_mode → v → dest_thunk_ret
deriving Inhabited

def dest_thunk (args : List v) (st : store v) : dest_thunk_ret :=
  match args with
  | [v.Loc _ n] =>
    match store_lookup n st with
    | none => dest_thunk_ret.BadRef
    | some (store_v.Thunk thunk_mode.Evaluated val') => dest_thunk_ret.IsThunk thunk_mode.Evaluated val'
    | some (store_v.Thunk thunk_mode.NotEvaluated val') => dest_thunk_ret.IsThunk thunk_mode.NotEvaluated val'
    | some _ => dest_thunk_ret.NotThunk
  | _ => dest_thunk_ret.NotThunk

def update_thunk (args : List v) (st : store v) (vals : List v) : Option (store v) :=
  match args, vals with
  | [v.Loc _ n], [val'] =>
    match dest_thunk [val'] st with
    | dest_thunk_ret.NotThunk => store_assign n (store_v.Thunk thunk_mode.Evaluated val') st
    | _ => none
  | _, _ => none

end CakeML
