/-
  Word types: word8 and word64, mapped to BitVec.
-/

namespace HOL4

abbrev word8 := BitVec 8
abbrev word64 := BitVec 64

def w2n {n : Nat} (w : BitVec n) : Nat := w.toNat
def n2w_8 (k : Nat) : BitVec 8 := BitVec.ofNat 8 k
def n2w_64 (k : Nat) : BitVec 64 := BitVec.ofNat 64 k

def word_add {n : Nat} (a b : BitVec n) : BitVec n := a + b
def word_sub {n : Nat} (a b : BitVec n) : BitVec n := a - b
def word_mul {n : Nat} (a b : BitVec n) : BitVec n := a * b
def word_and {n : Nat} (a b : BitVec n) : BitVec n := a &&& b
def word_or {n : Nat} (a b : BitVec n) : BitVec n := a ||| b
def word_xor {n : Nat} (a b : BitVec n) : BitVec n := a ^^^ b
def word_lsl {n : Nat} (a : BitVec n) (k : Nat) : BitVec n := a <<< k
def word_lsr {n : Nat} (a : BitVec n) (k : Nat) : BitVec n := a >>> k
def word_asr {n : Nat} (a : BitVec n) (k : Nat) : BitVec n := BitVec.sshiftRight a k
def word_ror {n : Nat} (a : BitVec n) (k : Nat) : BitVec n := a.rotateRight k

def word_lt {n : Nat} (a b : BitVec n) : Bool := a.toNat < b.toNat
def word_gt {n : Nat} (a b : BitVec n) : Bool := a.toNat > b.toNat
def word_le {n : Nat} (a b : BitVec n) : Bool := a.toNat ≤ b.toNat
def word_ge {n : Nat} (a b : BitVec n) : Bool := a.toNat ≥ b.toNat

end HOL4
