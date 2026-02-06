/-
  Definition of CakeML abstract syntax (AST).
  Translated from: hol4_sources/astScript.sml
-/
import CakeML.Lib.HOL4Prelude
import CakeML.Lib.Words
import CakeML.Lib.Location
import CakeML.Core.Namespace
import CakeML.Core.Mlstring

namespace CakeML

open HOL4
open mlstring

/-- Literal constants -/
inductive lit where
  | IntLit : Int → lit
  | Char : Char → lit
  | StrLit : mlstring → lit
  | Word8 : word8 → lit
  | Word64 : word64 → lit
  | Float64 : word64 → lit
deriving Repr, BEq, Inhabited

inductive shift where
  | Lsl | Lsr | Asr | Ror
deriving Repr, BEq, Inhabited, DecidableEq

inductive arith where
  | Add | Sub | Mul | Div | Mod | Neg | And | Xor | Or | Not | Abs | Sqrt | FMA
deriving Repr, BEq, Inhabited, DecidableEq

/-- Module names -/
abbrev modN := mlstring
/-- Variable names -/
abbrev varN := mlstring
/-- Constructor names -/
abbrev conN := mlstring
/-- Type names -/
abbrev typeN := mlstring
/-- Type variable names -/
abbrev tvarN := mlstring

inductive word_size where
  | W8 | W64
deriving Repr, BEq, Inhabited, DecidableEq

inductive thunk_mode where
  | Evaluated | NotEvaluated
deriving Repr, BEq, Inhabited, DecidableEq

inductive thunk_op where
  | AllocThunk : thunk_mode → thunk_op
  | UpdateThunk : thunk_mode → thunk_op
  | ForceThunk : thunk_op
deriving Repr, BEq, Inhabited, DecidableEq

inductive opb where
  | Lt | Gt | Leq | Geq
deriving Repr, BEq, Inhabited, DecidableEq

inductive test where
  | Equal : test
  | Compare : opb → test
  | AltCompare : opb → test
deriving Repr, BEq, Inhabited, DecidableEq

inductive prim_type where
  | BoolT : prim_type
  | IntT : prim_type
  | CharT : prim_type
  | StrT : prim_type
  | WordT : word_size → prim_type
  | Float64T : prim_type
deriving Repr, BEq, Inhabited, DecidableEq

inductive op where
  | Arith : arith → prim_type → op
  | FromTo : prim_type → prim_type → op
  | Shift : word_size → shift → Nat → op
  | Equality : op
  | Test : test → prim_type → op
  | Opapp : op
  | Opassign : op
  | Opref : op
  | Opderef : op
  | Aw8alloc : op
  | Aw8sub : op
  | Aw8length : op
  | Aw8update : op
  | CopyStrStr : op
  | CopyStrAw8 : op
  | CopyAw8Str : op
  | CopyAw8Aw8 : op
  | XorAw8Str_unsafe : op
  | Implode : op
  | Explode : op
  | Strsub : op
  | Strlen : op
  | Strcat : op
  | VfromList : op
  | Vsub : op
  | Vlength : op
  | Aalloc : op
  | AallocEmpty : op
  | AallocFixed : op
  | Asub : op
  | Alength : op
  | Aupdate : op
  | Vsub_unsafe : op
  | Asub_unsafe : op
  | Aupdate_unsafe : op
  | Aw8sub_unsafe : op
  | Aw8update_unsafe : op
  | ThunkOp : thunk_op → op
  | ListAppend : op
  | ConfigGC : op
  | FFI : mlstring → op
  | Eval : op
  | Env_id : op
deriving Repr, BEq, Inhabited

inductive op_class where
  | EvalOp : op_class
  | FunApp : op_class
  | Force : op_class
  | Simple : op_class
deriving Repr, BEq, Inhabited, DecidableEq

def getOpClass : op → op_class
  | op.Opapp => op_class.FunApp
  | op.Eval => op_class.EvalOp
  | op.ThunkOp t => if t == thunk_op.ForceThunk then op_class.Force else op_class.Simple
  | _ => op_class.Simple

/-- Types used in type annotations -/
inductive ast_t where
  | Atvar : tvarN → ast_t
  | Atfun : ast_t → ast_t → ast_t
  | Attup : List ast_t → ast_t
  | Atapp : List ast_t → id modN typeN → ast_t
deriving Repr, BEq, Inhabited

/-- Patterns -/
inductive pat where
  | Pany : pat
  | Pvar : varN → pat
  | Plit : lit → pat
  | Pcon : Option (id modN conN) → List pat → pat
  | Pref : pat → pat
  | Pas : pat → varN → pat
  | Ptannot : pat → ast_t → pat
deriving Repr, BEq, Inhabited

/-- Short circuiting logical operations -/
inductive lop where
  | Andalso | Orelse
deriving Repr, BEq, Inhabited, DecidableEq

/-- Expressions -/
inductive exp where
  | Raise : exp → exp
  | Handle : exp → List (pat × exp) → exp
  | Lit : lit → exp
  | Con : Option (id modN conN) → List exp → exp
  | Var : id modN varN → exp
  | Fun : varN → exp → exp
  | App : op → List exp → exp
  | Log : lop → exp → exp → exp
  | If : exp → exp → exp → exp
  | Mat : exp → List (pat × exp) → exp
  | Let : Option varN → exp → exp → exp
  | Letrec : List (varN × varN × exp) → exp → exp
  | Tannot : exp → ast_t → exp
  | Lannot : exp → locs → exp
deriving Repr, BEq, Inhabited

abbrev type_def := List (List tvarN × typeN × List (conN × List ast_t))

/-- Declarations -/
inductive dec where
  | Dlet : locs → pat → exp → dec
  | Dletrec : locs → List (varN × varN × exp) → dec
  | Dtype : locs → type_def → dec
  | Dtabbrev : locs → List tvarN → typeN → ast_t → dec
  | Dexn : locs → conN → List ast_t → dec
  | Dmod : modN → List dec → dec
  | Dlocal : List dec → List dec → dec
  | Denv : tvarN → dec
deriving Repr, BEq, Inhabited

mutual
/-- Accumulates the bindings of a pattern -/
def pat_bindings : pat → List varN → List varN
  | pat.Pany, already_bound => already_bound
  | pat.Pvar n, already_bound => n :: already_bound
  | pat.Plit _, already_bound => already_bound
  | pat.Pcon _ ps, already_bound => pats_bindings ps already_bound
  | pat.Pref p, already_bound => pat_bindings p already_bound
  | pat.Pas p i, already_bound => pat_bindings p (i :: already_bound)
  | pat.Ptannot p _, already_bound => pat_bindings p already_bound

def pats_bindings : List pat → List varN → List varN
  | [], already_bound => already_bound
  | p :: ps, already_bound => pats_bindings ps (pat_bindings p already_bound)
end

/-- every_exp: check a predicate on all sub-expressions -/
partial def every_exp (p : exp → Bool) : exp → Bool
  | exp.Raise e => p (exp.Raise e) && every_exp p e
  | exp.Handle e pes => p (exp.Handle e pes) && every_exp p e &&
      pes.all (fun ⟨_, e⟩ => every_exp p e)
  | exp.Lit l => p (exp.Lit l)
  | exp.Con cn es => p (exp.Con cn es) && es.all (every_exp p)
  | exp.Var v => p (exp.Var v)
  | exp.Fun x e => p (exp.Fun x e) && every_exp p e
  | exp.App op' es => p (exp.App op' es) && es.all (every_exp p)
  | exp.Log lop' e1 e2 => p (exp.Log lop' e1 e2) && every_exp p e1 && every_exp p e2
  | exp.If e1 e2 e3 => p (exp.If e1 e2 e3) && every_exp p e1 && every_exp p e2 && every_exp p e3
  | exp.Mat e pes => p (exp.Mat e pes) && every_exp p e &&
      pes.all (fun ⟨_, e⟩ => every_exp p e)
  | exp.Let x e1 e2 => p (exp.Let x e1 e2) && every_exp p e1 && every_exp p e2
  | exp.Tannot e a => p (exp.Tannot e a) && every_exp p e
  | exp.Lannot e a => p (exp.Lannot e a) && every_exp p e
  | exp.Letrec funs e => p (exp.Letrec funs e) && every_exp p e &&
      funs.all (fun ⟨_, _, e⟩ => every_exp p e)

def Seqs : List exp → exp
  | [] => exp.Con none []
  | x :: xs => exp.Let none x (Seqs xs)

def Apps : exp → List exp → exp
  | f, [] => f
  | f, x :: xs => Apps (exp.App op.Opapp [f, x]) xs

def Funs : List varN → exp → exp
  | [], e => e
  | x :: xs, e => exp.Fun x (Funs xs e)

end CakeML
