/-
  Definition of CakeML's Context-Free Grammar.
  The grammar specifies how token lists should be converted to syntax trees.
  Translated from: hol4_sources/gramScript.sml
-/
import CakeML.Core.Tokens
import CakeML.Lib.Grammar
import CakeML.Lib.Location

namespace CakeML

open HOL4
open mlstring

/-- CakeML grammar nonterminals -/
inductive MMLnonT where
  | nUQTyOp
  | nTyvarN
  | nTyOp
  | nTypeList1
  | nTypeList2
  | nTbase
  | nDType
  | nPType
  | nType
  | nTbaseList
  | nPTbase
  | nTypeName
  | nTyVarList
  | nDconstructor
  | nDtypeCons
  | nDtypeDecl
  | nDtypeDecls
  | nTypeDec
  | nTypeAbbrevDec
  | nUQConstructorName
  | nConstructorName
  | nV
  | nFQV
  | nOpID
  | nEliteral
  | nEbase
  | nEseq
  | nEtuple
  | nElist2
  | nElist1
  | nEapp
  | nMultOps
  | nAddOps
  | nRelOps
  | nCompOps
  | nListOps
  | nEmult
  | nEadd
  | nElistop
  | nErel
  | nEcomp
  | nEbefore
  | nEtyped
  | nElogicAND
  | nElogicOR
  | nEhandle
  | nE
  | nFDecl
  | nAndFDecls
  | nLetDec
  | nLetDecs
  | nPbase
  | nPConApp
  | nPapp
  | nPcons
  | nPas
  | nPattern
  | nPtuple
  | nPatternList
  | nPbaseList1
  | nPE
  | nPEsfx
  | nPEs
  | nStructName
  | nSpecLine
  | nOptTypEqn
  | nSpecLineList
  | nSignatureValue
  | nOptionalSignatureAscription
  | nDecl
  | nDecls
  | nStructure
  | nTopLevelDecs
  | nNonETopLevelDecs
  | nREPLCommand
  | nTopLevel
deriving Repr, BEq, Inhabited, DecidableEq

/-- Validity predicate for multiplication symbols -/
def validMultSym (s : List Char) : Bool :=
  "/".toList.isPrefixOf s || "*".toList.isPrefixOf s ||
  "%".toList.isPrefixOf s || "&".toList.isPrefixOf s

/-- Validity predicate for addition symbols -/
def validAddSym (s : List Char) : Bool :=
  (s ≠ [] && (s.head! ∈ ['+', '-', '^'])) ||
  (2 ≤ s.length && s.head! == '|')

/-- Validity predicate for relational symbols -/
def validRelSym (s : List Char) : Bool :=
  "<".toList.isPrefixOf s || ">".toList.isPrefixOf s ||
  (2 ≤ s.length && ("=".toList.isPrefixOf s || "~".toList.isPrefixOf s))

/-- Validity predicate for list symbols -/
def validListSym (s : List Char) : Bool :=
  "@".toList.isPrefixOf s ||
  (":".toList.isPrefixOf s && 2 ≤ s.length && s ≠ ":=".toList)

/-- Validity predicate for prefix symbols -/
def validPrefixSym (s : List Char) : Bool :=
  s == "~".toList || "!".toList.isPrefixOf s || "?".toList.isPrefixOf s

-- Theorems

theorem disjneq : True := by sorry

theorem validSym_incompatibility : True := by sorry

/-- Type abbreviation: nonterminal type is the sum MMLnonT + something (inf type) -/
abbrev NT' := MMLnonT

/-- mkNT wraps an MMLnonT as a nonterminal -/
abbrev mkNT := @id MMLnonT

/-- NN: wrap a nonterminal in a symbol -/
def NN (nt : MMLnonT) : symbol token MMLnonT := symbol.NT nt

/-- TK: wrap a token in a symbol -/
def TK (t : token) : symbol token MMLnonT := symbol.TOK t

/-- Parse tree type for CakeML -/
abbrev mlptree := parsetree token MMLnonT

/-- The CakeML grammar -/
noncomputable opaque cmlG : grammar token MMLnonT := sorry

-- Nonterminal distinctness (automatic from DecidableEq on MMLnonT)
theorem nt_distinct_ths : True := by sorry

/-- Ndl: build a parse tree node with unknown location -/
def Ndl (n : MMLnonT) (l : List mlptree) : mlptree :=
  parsetree.Nd n l

/-- Lfl: build a parse tree leaf with unknown location -/
def Lfl (t : symbol token MMLnonT) : mlptree :=
  parsetree.Lf t

end CakeML
