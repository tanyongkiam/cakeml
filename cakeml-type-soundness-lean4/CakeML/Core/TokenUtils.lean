/-
  Utility functions over tokens.
  Translated from: hol4_sources/tokenUtilsScript.sml
-/
import CakeML.Core.Tokens
import CakeML.Lib.Grammar
import CakeML.Lib.Location

namespace CakeML

open HOL4
open mlstring

/-- Is the token an IntT? -/
def isInt : token → Bool
  | token.IntT _ => true
  | _ => false

/-- Is the token a StringT? -/
def isString : token → Bool
  | token.StringT _ => true
  | _ => false

/-- Is the token an AlphaT? -/
def isAlphaT : token → Bool
  | token.AlphaT _ => true
  | _ => false

/-- Is the token a SymbolT? -/
def isSymbolT : token → Bool
  | token.SymbolT _ => true
  | _ => false

/-- Is the token an AlphaT or SymbolT? -/
def isAlphaSym : token → Bool
  | token.AlphaT _ => true
  | token.SymbolT _ => true
  | _ => false

/-- Is the token a TyvarT? -/
def isTyvarT : token → Bool
  | token.TyvarT _ => true
  | _ => false

/-- Is the token a WhitespaceT? -/
def isWhitespaceT : token → Bool
  | token.WhitespaceT _ => true
  | _ => false

/-- Is the token a CharT? -/
def isCharT : token → Bool
  | token.CharT _ => true
  | _ => false

/-- Is the token a WordT? -/
def isWordT : token → Bool
  | token.WordT _ => true
  | _ => false

/-- Is the token a LongidT? -/
def isLongidT : token → Bool
  | token.LongidT _ _ => true
  | _ => false

/-- Destruct a LongidT -/
def destLongidT : token → Option (path × mlstring)
  | token.LongidT str s => some (str, s)
  | _ => none

/-- Destruct a TyvarT from a parse tree leaf -/
def destTyvarPT : parsetree token ν → Option mlstring
  | parsetree.Lf (symbol.TOK (token.TyvarT s)) => some s
  | _ => none

/-- Destruct a leaf node -/
def destLf : parsetree token ν → Option (symbol token ν)
  | parsetree.Lf x => some x
  | _ => none

/-- Destruct a TOK -/
def destTOK : symbol token ν → Option token
  | symbol.TOK t => some t
  | _ => none

/-- Destruct an AlphaT -/
def destAlphaT : token → Option mlstring
  | token.AlphaT s => some s
  | _ => none

/-- Destruct a SymbolT -/
def destSymbolT : token → Option mlstring
  | token.SymbolT s => some s
  | _ => none

/-- Destruct an IntT -/
def destIntT : token → Option Int
  | token.IntT i => some i
  | _ => none

/-- Destruct a CharT -/
def destCharT : token → Option Char
  | token.CharT c => some c
  | _ => none

/-- Destruct a StringT -/
def destStringT : token → Option mlstring
  | token.StringT s => some s
  | _ => none

/-- Destruct a WordT -/
def destWordT : token → Option Nat
  | token.WordT w => some w
  | _ => none

/-- Destruct a FFIT -/
def destFFIT : token → Option mlstring
  | token.FFIT s => some s
  | _ => none

/-- Destruct a REPLIDT -/
def destREPLIDT : token → Option mlstring
  | token.REPLIDT s => some s
  | _ => none

-- Theorems

theorem destLongidT_EQ_SOME :
  ∀ (t : token) (strs : path × mlstring),
    destLongidT t = some strs ↔ ∃ str s, t = token.LongidT str s ∧ strs = (str, s) := by sorry

theorem destAlphaT_EQ_SOME :
  ∀ (t : token) (s : mlstring), destAlphaT t = some s ↔ t = token.AlphaT s := by sorry

theorem destSymbolT_EQ_SOME :
  ∀ (t : token) (s : mlstring), destSymbolT t = some s ↔ t = token.SymbolT s := by sorry

end CakeML
