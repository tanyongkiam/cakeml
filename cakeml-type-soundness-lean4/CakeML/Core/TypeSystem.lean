/-
  Specification of CakeML's type system.
  Translated from: hol4_sources/typeSystemScript.sml
-/
import CakeML.Core.SemanticPrimitives

namespace CakeML

open HOL4
open mlstring

-- ============================================================
-- Type identifier
-- ============================================================

abbrev type_ident := Nat

-- ============================================================
-- Semantic types (renamed from `t` to `sem_t` to avoid Lean conflicts)
-- ============================================================

inductive sem_t where
  /-- Type variables that the user writes down ('a, 'b, etc.) -/
  | Tvar : tvarN → sem_t
  /-- deBruijn indexed type variables -/
  | Tvar_db : Nat → sem_t
  /-- Type application. The number represents the identity of the type constructor. -/
  | Tapp : List sem_t → type_ident → sem_t
deriving Repr, BEq, Inhabited

-- ============================================================
-- Type number abbreviations
-- ============================================================

def Tarray_num : type_ident := 0
def Tbool_num : type_ident := 1
def Tchar_num : type_ident := 2
def Texn_num : type_ident := 3
def Tfn_num : type_ident := 4
def Tint_num : type_ident := 5
def Tlist_num : type_ident := 6
def Tref_num : type_ident := 7
def Tstring_num : type_ident := 8
def Ttup_num : type_ident := 9
def Tvector_num : type_ident := 10
def Tword64_num : type_ident := 11
def Tword8_num : type_ident := 12
def Tword8array_num : type_ident := 13
def Tdouble_num : type_ident := 14

def prim_type_nums : List Nat :=
  [Tarray_num, Tchar_num, Texn_num, Tfn_num, Tint_num, Tref_num, Tstring_num,
   Ttup_num, Tvector_num, Tword64_num, Tword8_num, Tword8array_num, Tdouble_num]

-- ============================================================
-- Type abbreviation constructors
-- ============================================================

def Tarray (t : sem_t) : sem_t := sem_t.Tapp [t] Tarray_num
def Tbool : sem_t := sem_t.Tapp [] Tbool_num
def Tchar : sem_t := sem_t.Tapp [] Tchar_num
def Texn : sem_t := sem_t.Tapp [] Texn_num
def Tfn (t1 t2 : sem_t) : sem_t := sem_t.Tapp [t1, t2] Tfn_num
def Tint : sem_t := sem_t.Tapp [] Tint_num
def Tlist (t : sem_t) : sem_t := sem_t.Tapp [t] Tlist_num
def Tref (t : sem_t) : sem_t := sem_t.Tapp [t] Tref_num
def Tstring : sem_t := sem_t.Tapp [] Tstring_num
def Ttup (ts : List sem_t) : sem_t := sem_t.Tapp ts Ttup_num
def Tvector (t : sem_t) : sem_t := sem_t.Tapp [t] Tvector_num
def Tword64 : sem_t := sem_t.Tapp [] Tword64_num
def Tword8 : sem_t := sem_t.Tapp [] Tword8_num
def Tword8array : sem_t := sem_t.Tapp [] Tword8array_num
def Tdouble : sem_t := sem_t.Tapp [] Tdouble_num

-- ============================================================
-- check_freevars
-- ============================================================

partial def check_freevars (dbmax : Nat) (tvs : List mlstring) : sem_t → Bool
  | sem_t.Tvar tv => tvs.any (· == tv)
  | sem_t.Tapp ts _ => EVERY (check_freevars dbmax tvs) ts
  | sem_t.Tvar_db n => n < dbmax

-- ============================================================
-- check_freevars_ast
-- ============================================================

partial def check_freevars_ast (tvs : List mlstring) : ast_t → Bool
  | ast_t.Atvar tv => tvs.any (· == tv)
  | ast_t.Attup ts => EVERY (check_freevars_ast tvs) ts
  | ast_t.Atfun t1 t2 =>
    check_freevars_ast tvs t1 && check_freevars_ast tvs t2
  | ast_t.Atapp ts _ => EVERY (check_freevars_ast tvs) ts

-- ============================================================
-- type_subst: Simultaneous substitution of types for type variables
-- ============================================================

partial def type_subst (s : fmap mlstring sem_t) : sem_t → sem_t
  | sem_t.Tvar tv =>
    match FLOOKUP s tv with
    | none => sem_t.Tvar tv
    | some t => t
  | sem_t.Tapp ts tn => sem_t.Tapp (ts.map (type_subst s)) tn
  | sem_t.Tvar_db n => sem_t.Tvar_db n

-- ============================================================
-- deBruijn_inc: Increment deBruijn indices
-- ============================================================

partial def deBruijn_inc (skip n : Nat) : sem_t → sem_t
  | sem_t.Tvar tv => sem_t.Tvar tv
  | sem_t.Tvar_db m => if m < skip then sem_t.Tvar_db m else sem_t.Tvar_db (m + n)
  | sem_t.Tapp ts tn => sem_t.Tapp (ts.map (deBruijn_inc skip n)) tn

-- ============================================================
-- deBruijn_subst
-- ============================================================

partial def deBruijn_subst (skip : Nat) (ts : List sem_t) : sem_t → sem_t
  | sem_t.Tvar tv => sem_t.Tvar tv
  | sem_t.Tvar_db n =>
    if ¬(n < skip) && (n < ts.length + skip) then
      EL (n - skip) ts
    else if ¬(n < skip) then
      sem_t.Tvar_db (n - ts.length)
    else
      sem_t.Tvar_db n
  | sem_t.Tapp ts' tn => sem_t.Tapp (ts'.map (deBruijn_subst skip ts)) tn

-- ============================================================
-- Type environments
-- ============================================================

inductive tenv_val_exp where
  | Empty : tenv_val_exp
  /-- Binds several de Bruijn type variables -/
  | Bind_tvar : Nat → tenv_val_exp → tenv_val_exp
  /-- The number is how many de Bruijn type variables the typescheme binds -/
  | Bind_name : varN → Nat → sem_t → tenv_val_exp → tenv_val_exp
deriving Repr, BEq, Inhabited

-- ============================================================
-- bind_tvar
-- ============================================================

def bind_tvar (tvs : Nat) (tenvE : tenv_val_exp) : tenv_val_exp :=
  if tvs == 0 then tenvE else tenv_val_exp.Bind_tvar tvs tenvE

-- ============================================================
-- opt_bind_name
-- ============================================================

def opt_bind_name (n : Option mlstring) (tvs : Nat) (t : sem_t) (tenvE : tenv_val_exp) : tenv_val_exp :=
  match n with
  | none => tenvE
  | some n' => tenv_val_exp.Bind_name n' tvs t tenvE

-- ============================================================
-- tveLookup
-- ============================================================

def tveLookup (n : mlstring) : Nat → tenv_val_exp → Option (Nat × sem_t)
  | _, tenv_val_exp.Empty => none
  | inc, tenv_val_exp.Bind_tvar tvs tenvE => tveLookup n (inc + tvs) tenvE
  | inc, tenv_val_exp.Bind_name n' tvs t tenvE =>
    if n' == n then some (tvs, deBruijn_inc tvs inc t)
    else tveLookup n inc tenvE

-- ============================================================
-- Type environment abbreviations
-- ============================================================

abbrev tenv_abbrev := ns modN typeN (List tvarN × sem_t)
abbrev tenv_ctor := ns modN conN (List tvarN × List sem_t × type_ident)
abbrev tenv_val := ns modN varN (Nat × sem_t)

-- ============================================================
-- type_env record
-- ============================================================

structure type_env where
  v : tenv_val
  c : tenv_ctor
  t : tenv_abbrev
deriving Inhabited

-- ============================================================
-- extend_dec_tenv
-- ============================================================

def extend_dec_tenv (tenv' tenv : type_env) : type_env :=
  { v := nsAppend tenv'.v tenv.v
    c := nsAppend tenv'.c tenv.c
    t := nsAppend tenv'.t tenv.t }

-- ============================================================
-- lookup_varE
-- ============================================================

def lookup_varE (id_val : id modN varN) (tenvE : tenv_val_exp) : Option (Nat × sem_t) :=
  match id_val with
  | id.Short x => tveLookup x 0 tenvE
  | _ => none

-- ============================================================
-- lookup_var
-- ============================================================

def lookup_var (id_val : id modN varN) (tenvE : tenv_val_exp) (tenv : type_env) : Option (Nat × sem_t) :=
  match lookup_varE id_val tenvE with
  | some x => some x
  | none => nsLookup tenv.v id_val

-- ============================================================
-- num_tvs
-- ============================================================

def num_tvs : tenv_val_exp → Nat
  | tenv_val_exp.Empty => 0
  | tenv_val_exp.Bind_tvar tvs tenvE => tvs + num_tvs tenvE
  | tenv_val_exp.Bind_name _ _ _ tenvE => num_tvs tenvE

-- ============================================================
-- bind_var_list
-- ============================================================

def bind_var_list (tvs : Nat) : List (mlstring × sem_t) → tenv_val_exp → tenv_val_exp
  | [], tenvE => tenvE
  | (n, t) :: binds, tenvE =>
    tenv_val_exp.Bind_name n tvs t (bind_var_list tvs binds tenvE)

-- ============================================================
-- t_of: map prim_type to sem_t
-- ============================================================

def t_of : prim_type → sem_t
  | prim_type.BoolT => Tbool
  | prim_type.IntT => Tint
  | prim_type.CharT => Tchar
  | prim_type.StrT => Tstring
  | prim_type.WordT word_size.W8 => Tword8
  | prim_type.WordT word_size.W64 => Tword64
  | prim_type.Float64T => Tdouble

-- ============================================================
-- supported_test
-- ============================================================

def supported_test : test → prim_type → Bool
  | test.Equal, _ => true
  | test.Compare _, ty =>
    [prim_type.IntT, prim_type.CharT, prim_type.WordT word_size.W8, prim_type.Float64T].any (· == ty)
  | _, _ => false

-- ============================================================
-- supported_arith
-- ============================================================

def supported_arith : arith → prim_type → Option Nat
  | a, prim_type.IntT =>
    if [arith.Add, arith.Sub, arith.Mul, arith.Div, arith.Mod].any (· == a) then some 2 else none
  | a, prim_type.Float64T =>
    if [arith.Abs, arith.Neg, arith.Sqrt].any (· == a) then some 1
    else if [arith.Add, arith.Sub, arith.Mul, arith.Div].any (· == a) then some 2
    else if [arith.FMA].any (· == a) then some 3
    else none
  | a, prim_type.WordT _ =>
    if [arith.Add, arith.Sub, arith.And, arith.Or, arith.Xor].any (· == a) then some 2 else none
  | a, prim_type.BoolT =>
    if [arith.Not].any (· == a) then some 1 else none
  | _, _ => none

-- ============================================================
-- supported_conversion
-- ============================================================

def supported_conversion : prim_type → prim_type → Bool
  | prim_type.WordT word_size.W8, prim_type.IntT => true
  | prim_type.WordT word_size.W64, prim_type.IntT => true
  | prim_type.IntT, prim_type.WordT word_size.W8 => true
  | prim_type.IntT, prim_type.WordT word_size.W64 => true
  | prim_type.CharT, prim_type.IntT => true
  | prim_type.IntT, prim_type.CharT => true
  | prim_type.Float64T, prim_type.WordT word_size.W64 => true
  | prim_type.WordT word_size.W64, prim_type.Float64T => true
  | _, _ => false

-- ============================================================
-- type_op: Check that an operator can have type (t1 -> ... -> tn -> t)
-- ============================================================

def type_op (op_val : op) (ts : List sem_t) (t : sem_t) : Bool :=
  match op_val, ts with
  | op.Opapp, [t1, t2] => t1 == Tfn t2 t
  | op.Shift word_size.W8 _ _, [t1] => (t1 == Tword8) && (t == Tword8)
  | op.Shift word_size.W64 _ _, [t1] => (t1 == Tword64) && (t == Tword64)
  | op.Equality, [t1, t2] => (t1 == t2) && (t == Tbool)
  | op.Arith a ty, ts_args =>
    EVERY (fun arg => arg == t_of ty) ts_args && (t == t_of ty) &&
    (supported_arith a ty == some ts_args.length)
  | op.FromTo ty1 ty2, [t1] =>
    (t1 == t_of ty1) && (t == t_of ty2) && supported_conversion ty1 ty2
  | op.Test tst ty, [t1, t2] =>
    (t1 == t2) && (t == Tbool) && (t1 == t_of ty) && supported_test tst ty
  | op.Opassign, [t1, t2] => (t1 == Tref t2) && (t == Ttup [])
  | op.Opref, [t1] => t == Tref t1
  | op.Opderef, [t1] => t1 == Tref t
  | op.Aw8alloc, [t1, t2] => (t1 == Tint) && (t2 == Tword8) && (t == Tword8array)
  | op.Aw8sub, [t1, t2] => (t1 == Tword8array) && (t2 == Tint) && (t == Tword8)
  | op.Aw8length, [t1] => (t1 == Tword8array) && (t == Tint)
  | op.Aw8update, [t1, t2, t3] =>
    (t1 == Tword8array) && (t2 == Tint) && (t3 == Tword8) && (t == Ttup [])
  | op.CopyStrStr, [t1, t2, t3] =>
    (t1 == Tstring) && (t2 == Tint) && (t3 == Tint) && (t == Tstring)
  | op.CopyStrAw8, [t1, t2, t3, t4, t5] =>
    (t1 == Tstring) && (t2 == Tint) && (t3 == Tint) && (t4 == Tword8array) && (t5 == Tint) && (t == Ttup [])
  | op.CopyAw8Str, [t1, t2, t3] =>
    (t1 == Tword8array) && (t2 == Tint) && (t3 == Tint) && (t == Tstring)
  | op.CopyAw8Aw8, [t1, t2, t3, t4, t5] =>
    (t1 == Tword8array) && (t2 == Tint) && (t3 == Tint) && (t4 == Tword8array) && (t5 == Tint) && (t == Ttup [])
  | op.Implode, [t1] => (t1 == Tlist Tchar) && (t == Tstring)
  | op.Explode, [t1] => (t1 == Tstring) && (t == Tlist Tchar)
  | op.Strsub, [t1, t2] => (t1 == Tstring) && (t2 == Tint) && (t == Tchar)
  | op.Strlen, [t1] => (t1 == Tstring) && (t == Tint)
  | op.Strcat, [t1] => (t1 == Tlist Tstring) && (t == Tstring)
  | op.VfromList, [sem_t.Tapp [t1] ctor] => (ctor == Tlist_num) && (t == Tvector t1)
  | op.Vsub, [t1, t2] => (t2 == Tint) && (Tvector t == t1)
  | op.Vlength, [sem_t.Tapp [_] ctor] => (ctor == Tvector_num) && (t == Tint)
  | op.Aalloc, [t1, t2] => (t1 == Tint) && (t == Tarray t2)
  | op.AallocEmpty, [t1] => (t1 == Ttup []) && (match t with | sem_t.Tapp [_] n => n == Tarray_num | _ => false)
  | op.Asub, [t1, t2] => (t2 == Tint) && (Tarray t == t1)
  | op.Alength, [sem_t.Tapp [_] ctor] => (ctor == Tarray_num) && (t == Tint)
  | op.Aupdate, [t1, t2, t3] => (t1 == Tarray t3) && (t2 == Tint) && (t == Ttup [])
  | op.ConfigGC, [t1, t2] => (t1 == Tint) && (t2 == Tint) && (t == Ttup [])
  | op.FFI _, [t1, t2] => (t1 == Tstring) && (t2 == Tword8array) && (t == Ttup [])
  | op.ListAppend, [sem_t.Tapp [t1] ctor, t2] =>
    (ctor == Tlist_num) && (t2 == sem_t.Tapp [t1] ctor) && (t == t2)
  | _, _ => false

-- ============================================================
-- check_type_names
-- ============================================================

partial def check_type_names (tenvT : ns modN typeN (List mlstring × sem_t)) : ast_t → Bool
  | ast_t.Atvar _ => true
  | ast_t.Attup ts => EVERY (check_type_names tenvT) ts
  | ast_t.Atfun t1 t2 =>
    check_type_names tenvT t1 && check_type_names tenvT t2
  | ast_t.Atapp ts tn =>
    (match nsLookup tenvT tn with
     | some (tvs, _) => tvs.length == ts.length
     | none => false) &&
    EVERY (check_type_names tenvT) ts

-- ============================================================
-- type_name_subst
-- ============================================================

partial def type_name_subst (tenvT : ns modN typeN (List mlstring × sem_t)) : ast_t → sem_t
  | ast_t.Atvar tv => sem_t.Tvar tv
  | ast_t.Attup ts => Ttup (ts.map (type_name_subst tenvT))
  | ast_t.Atfun t1 t2 => Tfn (type_name_subst tenvT t1) (type_name_subst tenvT t2)
  | ast_t.Atapp ts tc =>
    let args := ts.map (type_name_subst tenvT)
    match nsLookup tenvT tc with
    | some (tvs, t) => type_subst (alist_to_fmap (ZIP (tvs, args))) t
    | none => Ttup args  -- can't happen for a type that passes the check

-- ============================================================
-- check_ctor_tenv
-- ============================================================

partial def check_ctor_tenv (tenvT : ns modN typeN (List tvarN × sem_t)) :
    List (List tvarN × mlstring × List (conN × List ast_t)) → Bool
  | [] => true
  | (tvs, tn, ctors) :: tds =>
    check_dup_ctors (tvs, tn, ctors) &&
    ALL_DISTINCT tvs &&
    EVERY (fun (⟨_, ts⟩ : conN × List ast_t) =>
      EVERY (check_freevars_ast tvs) ts && EVERY (check_type_names tenvT) ts) ctors &&
    !(tds.map (fun (⟨_, tn', _⟩ : List tvarN × mlstring × List (conN × List ast_t)) => tn')).any (· == tn) &&
    check_ctor_tenv tenvT tds

-- ============================================================
-- build_ctor_tenv
-- ============================================================

def build_ctor_tenv (tenvT : ns modN typeN (List mlstring × sem_t)) :
    List (List tvarN × mlstring × List (conN × List ast_t)) → List Nat → tenv_ctor
  | [], [] => alist_to_ns []
  | (tvs, _, ctors) :: tds, id_val :: ids =>
    nsAppend
      (build_ctor_tenv tenvT tds ids)
      (alist_to_ns
        ((ctors.map (fun (⟨cn, ts⟩ : conN × List ast_t) =>
          (cn, (tvs, ts.map (type_name_subst tenvT), id_val)))).reverse))
  | _, _ => alist_to_ns []

-- ============================================================
-- is_value: For the value restriction on let-based polymorphism
-- ============================================================

partial def is_value : exp → Bool
  | exp.Lit _ => true
  | exp.Con _ es => EVERY is_value es
  | exp.Var _ => true
  | exp.Fun _ _ => true
  | exp.Tannot e _ => is_value e
  | exp.Lannot e _ => is_value e
  | _ => false

-- ============================================================
-- Inductive typing relations: type_p / type_ps (pattern typing)
-- ============================================================

mutual
inductive type_p : Nat → type_env → pat → sem_t → List (varN × sem_t) → Prop where
  | Pany : ∀ tvs tenv t,
    check_freevars tvs [] t = true →
    type_p tvs tenv pat.Pany t []

  | Pvar : ∀ tvs tenv n t,
    check_freevars tvs [] t = true →
    type_p tvs tenv (pat.Pvar n) t [(n, t)]

  | Plit_int : ∀ tvs tenv n,
    type_p tvs tenv (pat.Plit (lit.IntLit n)) Tint []

  | Plit_char : ∀ tvs tenv c,
    type_p tvs tenv (pat.Plit (lit.Char c)) Tchar []

  | Plit_string : ∀ tvs tenv s,
    type_p tvs tenv (pat.Plit (lit.StrLit s)) Tstring []

  | Plit_word8 : ∀ tvs tenv w,
    type_p tvs tenv (pat.Plit (lit.Word8 w)) Tword8 []

  | Plit_word64 : ∀ tvs tenv w,
    type_p tvs tenv (pat.Plit (lit.Word64 w)) Tword64 []

  | Pcon_some : ∀ tvs tenv cn ps ts tvs' tn ts' bindings,
    EVERY (check_freevars tvs []) ts' = true →
    ts'.length = tvs'.length →
    type_ps tvs tenv ps (ts.map (type_subst (alist_to_fmap (ZIP (tvs', ts'))))) bindings →
    nsLookup tenv.c cn = some (tvs', ts, tn) →
    type_p tvs tenv (pat.Pcon (some cn) ps) (sem_t.Tapp ts' tn) bindings

  | Pcon_none : ∀ tvs tenv ps ts bindings,
    type_ps tvs tenv ps ts bindings →
    type_p tvs tenv (pat.Pcon none ps) (Ttup ts) bindings

  | Pref : ∀ tvs tenv p t bindings,
    type_p tvs tenv p t bindings →
    type_p tvs tenv (pat.Pref p) (Tref t) bindings

  | Pas : ∀ tvs tenv p_val v_val t bindings,
    type_p tvs tenv p_val t bindings →
    type_p tvs tenv (pat.Pas p_val v_val) t (bindings ++ [(v_val, t)])

  | Ptannot : ∀ tvs tenv p t bindings,
    check_freevars_ast [] t = true →
    check_type_names tenv.t t = true →
    type_p tvs tenv p (type_name_subst tenv.t t) bindings →
    type_p tvs tenv (pat.Ptannot p t) (type_name_subst tenv.t t) bindings

inductive type_ps : Nat → type_env → List pat → List sem_t → List (varN × sem_t) → Prop where
  | nil : ∀ tvs tenv,
    type_ps tvs tenv [] [] []

  | cons : ∀ tvs tenv p ps t ts bindings bindings',
    type_p tvs tenv p t bindings →
    type_ps tvs tenv ps ts bindings' →
    type_ps tvs tenv (p :: ps) (t :: ts) (bindings' ++ bindings)
end

-- ============================================================
-- Inductive typing relations: type_e / type_es / type_funs (expression typing)
--
-- Handle and Mat use a Skolemized bindings function instead of
-- existential quantification to comply with Lean's nested inductive
-- restrictions.
-- ============================================================

mutual
inductive type_e : type_env → tenv_val_exp → exp → sem_t → Prop where
  | Lit_int : ∀ tenv tenvE n,
    type_e tenv tenvE (exp.Lit (lit.IntLit n)) Tint

  | Lit_char : ∀ tenv tenvE c,
    type_e tenv tenvE (exp.Lit (lit.Char c)) Tchar

  | Lit_string : ∀ tenv tenvE s,
    type_e tenv tenvE (exp.Lit (lit.StrLit s)) Tstring

  | Lit_word8 : ∀ tenv tenvE w,
    type_e tenv tenvE (exp.Lit (lit.Word8 w)) Tword8

  | Lit_word64 : ∀ tenv tenvE w,
    type_e tenv tenvE (exp.Lit (lit.Word64 w)) Tword64

  | Lit_float64 : ∀ tenv tenvE w,
    type_e tenv tenvE (exp.Lit (lit.Float64 w)) Tdouble

  | Raise : ∀ tenv tenvE e t,
    check_freevars (num_tvs tenvE) [] t = true →
    type_e tenv tenvE e Texn →
    type_e tenv tenvE (exp.Raise e) t

  | Handle : ∀ tenv tenvE e pes t
      (bindings_fn : pat → exp → List (varN × sem_t)),
    type_e tenv tenvE e t →
    pes ≠ [] →
    (∀ p e', (p, e') ∈ pes →
        ALL_DISTINCT (pat_bindings p []) = true) →
    (∀ p e', (p, e') ∈ pes →
        type_p (num_tvs tenvE) tenv p Texn (bindings_fn p e')) →
    (∀ p e', (p, e') ∈ pes →
        type_e tenv (bind_var_list 0 (bindings_fn p e') tenvE) e' t) →
    type_e tenv tenvE (exp.Handle e pes) t

  | Con_some : ∀ tenv tenvE cn es tvs tn ts' ts,
    EVERY (check_freevars (num_tvs tenvE) []) ts' = true →
    tvs.length = ts'.length →
    type_es tenv tenvE es (ts.map (type_subst (alist_to_fmap (ZIP (tvs, ts'))))) →
    nsLookup tenv.c cn = some (tvs, ts, tn) →
    type_e tenv tenvE (exp.Con (some cn) es) (sem_t.Tapp ts' tn)

  | Con_none : ∀ tenv tenvE es ts,
    type_es tenv tenvE es ts →
    type_e tenv tenvE (exp.Con none es) (Ttup ts)

  | Var : ∀ tenv tenvE n t targs tvs,
    tvs = targs.length →
    EVERY (check_freevars (num_tvs tenvE) []) targs = true →
    lookup_var n tenvE tenv = some (tvs, t) →
    type_e tenv tenvE (exp.Var n) (deBruijn_subst 0 targs t)

  | Fun : ∀ tenv tenvE n e t1 t2,
    check_freevars (num_tvs tenvE) [] t1 = true →
    type_e tenv (tenv_val_exp.Bind_name n 0 t1 tenvE) e t2 →
    type_e tenv tenvE (exp.Fun n e) (Tfn t1 t2)

  | App : ∀ tenv tenvE op_val es ts t,
    type_es tenv tenvE es ts →
    type_op op_val ts t = true →
    check_freevars (num_tvs tenvE) [] t = true →
    type_e tenv tenvE (exp.App op_val es) t

  | Log : ∀ tenv tenvE l e1 e2,
    type_e tenv tenvE e1 Tbool →
    type_e tenv tenvE e2 Tbool →
    type_e tenv tenvE (exp.Log l e1 e2) Tbool

  | If : ∀ tenv tenvE e1 e2 e3 t,
    type_e tenv tenvE e1 Tbool →
    type_e tenv tenvE e2 t →
    type_e tenv tenvE e3 t →
    type_e tenv tenvE (exp.If e1 e2 e3) t

  | Mat : ∀ tenv tenvE e pes t1 t2
      (bindings_fn : pat → exp → List (varN × sem_t)),
    type_e tenv tenvE e t1 →
    pes ≠ [] →
    (∀ p e', (p, e') ∈ pes →
        ALL_DISTINCT (pat_bindings p []) = true) →
    (∀ p e', (p, e') ∈ pes →
        type_p (num_tvs tenvE) tenv p t1 (bindings_fn p e')) →
    (∀ p e', (p, e') ∈ pes →
        type_e tenv (bind_var_list 0 (bindings_fn p e') tenvE) e' t2) →
    type_e tenv tenvE (exp.Mat e pes) t2

  | Let : ∀ tenv tenvE n e1 e2 t1 t2,
    type_e tenv tenvE e1 t1 →
    type_e tenv (opt_bind_name n 0 t1 tenvE) e2 t2 →
    type_e tenv tenvE (exp.Let n e1 e2) t2

  | Letrec : ∀ tenv tenvE funs e t bindings,
    type_funs tenv (bind_var_list 0 bindings tenvE) funs bindings →
    type_e tenv (bind_var_list 0 bindings tenvE) e t →
    type_e tenv tenvE (exp.Letrec funs e) t

  | Tannot_e : ∀ tenv tenvE e t,
    check_freevars_ast [] t = true →
    check_type_names tenv.t t = true →
    type_e tenv tenvE e (type_name_subst tenv.t t) →
    type_e tenv tenvE (exp.Tannot e t) (type_name_subst tenv.t t)

  | Lannot_e : ∀ tenv tenvE e l t,
    type_e tenv tenvE e t →
    type_e tenv tenvE (exp.Lannot e l) t

inductive type_es : type_env → tenv_val_exp → List exp → List sem_t → Prop where
  | nil : ∀ tenv tenvE,
    type_es tenv tenvE [] []

  | cons : ∀ tenv tenvE e es t ts,
    type_e tenv tenvE e t →
    type_es tenv tenvE es ts →
    type_es tenv tenvE (e :: es) (t :: ts)

inductive type_funs : type_env → tenv_val_exp → List (varN × varN × exp) → List (varN × sem_t) → Prop where
  | nil : ∀ tenv tenvE,
    type_funs tenv tenvE [] []

  | cons : ∀ tenv tenvE fn n e funs bindings t1 t2,
    check_freevars (num_tvs tenvE) [] (Tfn t1 t2) = true →
    type_e tenv (tenv_val_exp.Bind_name n 0 t1 tenvE) e t2 →
    type_funs tenv tenvE funs bindings →
    ALOOKUP bindings fn = none →
    type_funs tenv tenvE ((fn, n, e) :: funs) ((fn, Tfn t1 t2) :: bindings)
end

-- ============================================================
-- tenv_add_tvs
-- ============================================================

def tenv_add_tvs (tvs : Nat) (bindings : List (mlstring × sem_t)) : List (mlstring × (Nat × sem_t)) :=
  bindings.map (fun (n, t) => (n, (tvs, t)))

-- ============================================================
-- type_pe_determ
-- ============================================================

def type_pe_determ (tenv : type_env) (tenvE : tenv_val_exp) (p : pat) (e : exp) : Prop :=
  ∀ t1 tenv1 t2 tenv2,
    type_p 0 tenv p t1 tenv1 → type_e tenv tenvE e t1 →
    type_p 0 tenv p t2 tenv2 → type_e tenv tenvE e t2 →
    tenv1 = tenv2

-- ============================================================
-- tscheme_inst
-- ============================================================

def tscheme_inst (ts1 ts2 : Nat × sem_t) : Prop :=
  let (tvs_spec, t_spec) := ts1
  let (tvs_impl, t_impl) := ts2
  ∃ subst : List sem_t,
    subst.length = tvs_impl ∧
    check_freevars tvs_impl [] t_impl = true ∧
    EVERY (check_freevars tvs_spec []) subst = true ∧
    deBruijn_subst 0 subst t_impl = t_spec

-- ============================================================
-- tenvLift
-- ============================================================

def tenvLift (mn : mlstring) (tenv : type_env) : type_env :=
  { v := nsLift mn tenv.v
    c := nsLift mn tenv.c
    t := nsLift mn tenv.t }

-- ============================================================
-- EVERY2 (List.Forall2 analog)
-- ============================================================

def EVERY2 (R : α → β → Prop) : List α → List β → Prop
  | [], [] => True
  | a :: as_, b :: bs => R a b ∧ EVERY2 R as_ bs
  | _, _ => False

-- ============================================================
-- Inductive typing relations: type_d / type_ds (declaration typing)
--
-- These are separate (non-mutual) from type_e/type_p since they
-- only reference those types in non-nested positions.
-- ============================================================

mutual
inductive type_d : Bool → type_env → dec → (Nat → Prop) → type_env → Prop where
  | Dlet_poly : ∀ extra_checks tvs tenv p e t bindings locs,
    is_value e = true →
    ALL_DISTINCT (pat_bindings p []) = true →
    type_p tvs tenv p t bindings →
    type_e tenv (bind_tvar tvs tenv_val_exp.Empty) e t →
    (extra_checks = true →
      ∀ tvs' bindings' t',
        type_p tvs' tenv p t' bindings' →
        type_e tenv (bind_tvar tvs' tenv_val_exp.Empty) e t' →
        EVERY2 tscheme_inst
          ((tenv_add_tvs tvs' bindings').map Prod.snd)
          ((tenv_add_tvs tvs bindings).map Prod.snd)) →
    type_d extra_checks tenv (dec.Dlet locs p e)
      (fun _ => False)
      { v := alist_to_ns (tenv_add_tvs tvs bindings), c := nsEmpty, t := nsEmpty }

  | Dlet_mono : ∀ extra_checks tenv p e t bindings locs,
    (extra_checks = true →
      is_value e = false ∧ type_pe_determ tenv tenv_val_exp.Empty p e) →
    ALL_DISTINCT (pat_bindings p []) = true →
    type_p 0 tenv p t bindings →
    type_e tenv tenv_val_exp.Empty e t →
    type_d extra_checks tenv (dec.Dlet locs p e)
      (fun _ => False)
      { v := alist_to_ns (tenv_add_tvs 0 bindings), c := nsEmpty, t := nsEmpty }

  | Dletrec : ∀ extra_checks tenv funs bindings tvs locs,
    type_funs tenv (bind_var_list 0 bindings (bind_tvar tvs tenv_val_exp.Empty)) funs bindings →
    (extra_checks = true →
      ∀ tvs' bindings',
        type_funs tenv (bind_var_list 0 bindings' (bind_tvar tvs' tenv_val_exp.Empty)) funs bindings' →
        EVERY2 tscheme_inst
          ((tenv_add_tvs tvs' bindings').map Prod.snd)
          ((tenv_add_tvs tvs bindings).map Prod.snd)) →
    type_d extra_checks tenv (dec.Dletrec locs funs)
      (fun _ => False)
      { v := alist_to_ns (tenv_add_tvs tvs bindings), c := nsEmpty, t := nsEmpty }

  | Dtype : ∀ extra_checks tenv tdefs type_identities tenvT locs,
    ALL_DISTINCT type_identities = true →
    (∀ x, x ∈ type_identities → ¬ (x ∈ (Tlist_num :: Tbool_num :: prim_type_nums))) →
    check_ctor_tenv (nsAppend tenvT tenv.t) tdefs = true →
    type_identities.length = tdefs.length →
    tenvT = alist_to_ns (MAP2
      (fun (tdinfo : List tvarN × mlstring × List (conN × List ast_t)) (i : Nat) =>
        let (tvs, tn, _) := tdinfo
        (tn, (tvs, sem_t.Tapp (tvs.map sem_t.Tvar) i)))
      tdefs type_identities) →
    type_d extra_checks tenv (dec.Dtype locs tdefs)
      (fun x => x ∈ type_identities)
      { v := nsEmpty,
        c := build_ctor_tenv (nsAppend tenvT tenv.t) tdefs type_identities,
        t := tenvT }

  | Dtabbrev : ∀ extra_checks tenv tvs tn t locs,
    check_freevars_ast tvs t = true →
    check_type_names tenv.t t = true →
    ALL_DISTINCT tvs = true →
    type_d extra_checks tenv (dec.Dtabbrev locs tvs tn t)
      (fun _ => False)
      { v := nsEmpty, c := nsEmpty, t := nsSing tn (tvs, type_name_subst tenv.t t) }

  | Dexn : ∀ extra_checks tenv cn ts locs,
    EVERY (check_freevars_ast []) ts = true →
    EVERY (check_type_names tenv.t) ts = true →
    type_d extra_checks tenv (dec.Dexn locs cn ts)
      (fun _ => False)
      { v := nsEmpty,
        c := nsSing cn ([], ts.map (type_name_subst tenv.t), Texn_num),
        t := nsEmpty }

  | Dmod : ∀ extra_checks tenv mn ds decls tenv',
    type_ds extra_checks tenv ds decls tenv' →
    type_d extra_checks tenv (dec.Dmod mn ds) decls (tenvLift mn tenv')

  | Dlocal : ∀ extra_checks tenv lds ds tenv1 tenv2 decls1 decls2,
    type_ds extra_checks tenv lds decls1 tenv1 →
    type_ds extra_checks (extend_dec_tenv tenv1 tenv) ds decls2 tenv2 →
    (∀ x, decls1 x → decls2 x → False) →
    type_d extra_checks tenv (dec.Dlocal lds ds)
      (fun x => decls1 x ∨ decls2 x) tenv2

inductive type_ds : Bool → type_env → List dec → (Nat → Prop) → type_env → Prop where
  | nil : ∀ extra_checks tenv,
    type_ds extra_checks tenv []
      (fun _ => False)
      { v := nsEmpty, c := nsEmpty, t := nsEmpty }

  | cons : ∀ extra_checks tenv d ds tenv1 tenv2 decls1 decls2,
    type_d extra_checks tenv d decls1 tenv1 →
    type_ds extra_checks (extend_dec_tenv tenv1 tenv) ds decls2 tenv2 →
    (∀ x, decls1 x → decls2 x → False) →
    type_ds extra_checks tenv (d :: ds)
      (fun x => decls1 x ∨ decls2 x) (extend_dec_tenv tenv2 tenv1)
end

-- ============================================================
-- tscheme_inst2
-- ============================================================

def tscheme_inst2 (_ : α) (ts1 ts2 : Nat × sem_t) : Prop :=
  tscheme_inst ts1 ts2

-- ============================================================
-- weak_tenv
-- ============================================================

def weak_tenv (tenv_impl tenv_spec : type_env) : Prop :=
  nsSub tscheme_inst2 tenv_spec.v tenv_impl.v ∧
  nsSub (fun (_ : id modN conN) (x y : List tvarN × List sem_t × type_ident) => x = y) tenv_spec.c tenv_impl.c

end CakeML
