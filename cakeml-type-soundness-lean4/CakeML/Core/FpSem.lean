/-
  Definitions of the floating point operations used in CakeML.
  Translated from: hol4_sources/fpSemScript.sml
-/
import CakeML.Lib.IEEE754
import CakeML.Lib.Words
import CakeML.Core.Ast

namespace CakeML

open HOL4

/-- Stub for roundTiesToEven rounding mode -/
def roundTiesToEven : word64 := 0

inductive fp_cmp where
  | FP_Less | FP_LessEqual | FP_Greater | FP_GreaterEqual | FP_Equal
deriving Repr, BEq, Inhabited, DecidableEq

inductive fp_uop where
  | FP_Abs | FP_Neg | FP_Sqrt
deriving Repr, BEq, Inhabited, DecidableEq

inductive fp_bop where
  | FP_Add | FP_Sub | FP_Mul | FP_Div
deriving Repr, BEq, Inhabited, DecidableEq

inductive fp_top where
  | FP_Fma
deriving Repr, BEq, Inhabited, DecidableEq

/-- Map opb comparison to fp64 comparison -/
def fp_cmp_def : opb → (word64 → word64 → Bool)
  | opb.Lt => fp64_lessThan
  | opb.Leq => fp64_lessEqual
  | opb.Gt => fp64_greaterThan
  | opb.Geq => fp64_greaterEqual

/-- Map fp_cmp to fp64 comparison -/
def fp_cmp_comp : fp_cmp → (word64 → word64 → Bool)
  | fp_cmp.FP_Less => fp64_lessThan
  | fp_cmp.FP_LessEqual => fp64_lessEqual
  | fp_cmp.FP_Greater => fp64_greaterThan
  | fp_cmp.FP_GreaterEqual => fp64_greaterEqual
  | fp_cmp.FP_Equal => fp64_equal

/-- Map fp_uop to fp64 unary operation -/
def fp_uop_comp : fp_uop → (word64 → word64)
  | fp_uop.FP_Abs => fp64_abs
  | fp_uop.FP_Neg => fp64_negate
  | fp_uop.FP_Sqrt => fp64_sqrt roundTiesToEven

/-- Map fp_bop to fp64 binary operation -/
def fp_bop_comp : fp_bop → (word64 → word64 → word64)
  | fp_bop.FP_Add => fp64_add roundTiesToEven
  | fp_bop.FP_Sub => fp64_sub roundTiesToEven
  | fp_bop.FP_Mul => fp64_mul roundTiesToEven
  | fp_bop.FP_Div => fp64_div roundTiesToEven

/-- Fused multiply-add: fpfma v1 v2 v3 = v2 * v3 + v1 -/
def fpfma (v1 v2 v3 : word64) : word64 :=
  fp64_mul_add roundTiesToEven v2 v3 v1

/-- Map fp_top to fp64 ternary operation -/
def fp_top_comp : fp_top → (word64 → word64 → word64 → word64)
  | fp_top.FP_Fma => fpfma

end CakeML
