/-
  Opaque stubs for IEEE 754 floating-point operations.
  In HOL4, these come from machine_ieeeTheory / fp64 operations.
-/
import CakeML.Lib.Words

namespace HOL4

/-- 64-bit float represented as a word64 -/
abbrev fp64 := word64

-- Comparison
opaque fp64_lessThan : fp64 → fp64 → Bool := fun _ _ => false
opaque fp64_lessEqual : fp64 → fp64 → Bool := fun _ _ => false
opaque fp64_greaterThan : fp64 → fp64 → Bool := fun _ _ => false
opaque fp64_greaterEqual : fp64 → fp64 → Bool := fun _ _ => false
opaque fp64_equal : fp64 → fp64 → Bool := fun _ _ => false

-- Arithmetic
opaque fp64_add : word64 → fp64 → fp64 → fp64 := fun _ a _ => a
opaque fp64_sub : word64 → fp64 → fp64 → fp64 := fun _ a _ => a
opaque fp64_mul : word64 → fp64 → fp64 → fp64 := fun _ a _ => a
opaque fp64_div : word64 → fp64 → fp64 → fp64 := fun _ a _ => a

-- Unary
opaque fp64_sqrt : word64 → fp64 → fp64 := fun _ a => a
opaque fp64_abs : fp64 → fp64 := fun a => a
opaque fp64_negate : fp64 → fp64 := fun a => a

-- Ternary (FMA)
opaque fp64_mul_add : word64 → fp64 → fp64 → fp64 → fp64 := fun _ a _ _ => a

-- Conversions
opaque fp64_to_int : word64 → fp64 → Option Int := fun _ _ => none
opaque fp64_from_int : word64 → Int → fp64 := fun _ _ => 0

-- Compress
opaque compress_word : fp64 → fp64 := fun a => a

end HOL4
