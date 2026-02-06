/-
  A functional specification of lexing from strings to token lists.
  Translated from: hol4_sources/lexer_funScript.sml
-/
import CakeML.Core.Tokens
import CakeML.Core.Mlstring
import CakeML.Lib.Location

namespace CakeML

open HOL4
open mlstring

-- ============================================================
-- Intermediate symbols
-- ============================================================

/-- Intermediate symbols produced by the first phase of lexing -/
inductive symbol where
  | StringS : List Char → symbol
  | CharS : Char → symbol
  | NumberS : Int → symbol
  | WordS : Nat → symbol
  | LongS : List (List Char) → List Char → symbol
  | FFIS : List Char → symbol
  | OtherS : List Char → symbol
  | ErrorS : symbol
deriving Repr, BEq, Inhabited

-- ============================================================
-- Helper functions
-- ============================================================

/-- mkCharS: convert a StringS of length 1 to a CharS -/
def mkCharS : symbol → symbol
  | symbol.StringS s => if s.length = 1 then symbol.CharS (s.head!) else symbol.ErrorS
  | _ => symbol.ErrorS

/-- read_while: read characters while predicate holds, accumulating in reverse -/
partial def read_while (P : Char → Bool) : List Char → List Char → List Char × List Char
  | [], s => (s.reverse, [])
  | c :: cs, s =>
    if P c then read_while P cs (c :: s)
    else (s.reverse, c :: cs)

theorem read_while_thm :
  ∀ (P : Char → Bool) (cs s : List Char) (s' cs' : List Char),
    read_while P cs s = (s', cs') → cs'.length ≤ cs.length := by sorry

/-- is_single_char_symbol: check if character is a single-character symbol -/
def is_single_char_symbol (c : Char) : Bool :=
  "()[]{},;".toList.contains c

/-- isSymbol: check if character is a symbolic character -/
def isSymbol (c : Char) : Bool :=
  (Char.ofNat 96 :: "!%&$#+-/:<=>?@\\~^|*".toList).contains c

/-- next_loc: advance column by n -/
def next_loc (n : Nat) : locn → locn
  | locn.POSN r c => locn.POSN r (c + n)
  | x => x

/-- next_line: advance to next line -/
def next_line : locn → locn
  | locn.POSN r _ => locn.POSN (r + 1) 0
  | x => x

/-- isAlphaNum: check if character is alphanumeric -/
def isAlphaNum (c : Char) : Bool := c.isAlpha || c.isDigit

/-- isAlphaNumPrime: check if character is alphanumeric, prime, or underscore -/
def isAlphaNumPrime (c : Char) : Bool := isAlphaNum c || c == '\'' || c == '_'

/-- isHexDigit: check if character is a hex digit -/
def isHexDigit (c : Char) : Bool :=
  c.isDigit || ('a' ≤ c && c ≤ 'f') || ('A' ≤ c && c ≤ 'F')

/-- num_from_dec_string: parse a decimal number from a char list -/
def num_from_dec_string (s : List Char) : Nat :=
  s.foldl (fun acc c => acc * 10 + (c.toNat - '0'.toNat)) 0

/-- num_from_hex_string: parse a hex number from a char list -/
def num_from_hex_string (s : List Char) : Nat :=
  s.foldl (fun acc c =>
    acc * 16 +
      if '0' ≤ c && c ≤ '9' then c.toNat - '0'.toNat
      else if 'a' ≤ c && c ≤ 'f' then c.toNat - 'a'.toNat + 10
      else if 'A' ≤ c && c ≤ 'F' then c.toNat - 'A'.toNat + 10
      else 0) 0

/-- read_char_as_3digits: read 3 decimal digits as a character -/
def read_char_as_3digits (str : List Char) : Option (Char × List Char) :=
  let ds := str.take 3
  let rest := str.drop 3
  if ds.length < 3 then none
  else
    match ds.foldl (fun A d =>
      match A with
      | none => none
      | some a0 => if d.isDigit then some (10 * a0 + (d.toNat - 48)) else none)
      (some 0) with
    | none => none
    | some ci =>
      if ci < 256 then some (Char.ofNat ci, rest)
      else none

theorem read_char_as_3digits_reduces :
  ∀ (str0 : List Char) (c : Char) (str : List Char),
    read_char_as_3digits str0 = some (c, str) →
    str0.length = str.length + 3 := by sorry

/-- read_string: read a string literal, handling escape sequences -/
partial def read_string (strng : List Char) (s : List Char) (loc : locn)
    : symbol × locn × List Char :=
  match strng with
  | [] => (symbol.ErrorS, loc, [])
  | c :: cs =>
    if c == '"' then (symbol.StringS s, loc, cs)
    else if c == '\n' then (symbol.ErrorS, next_line loc, cs)
    else if c != '\\' then
      read_string cs (s ++ [c]) (next_loc 1 loc)
    else
      match cs with
      | '\\' :: cs' => read_string cs' (s ++ ['\\']) (next_loc 2 loc)
      | '"' :: cs' => read_string cs' (s ++ ['"']) (next_loc 2 loc)
      | 'a' :: cs' => read_string cs' (s ++ [Char.ofNat 7]) (next_loc 2 loc)
      | 'b' :: cs' => read_string cs' (s ++ [Char.ofNat 8]) (next_loc 2 loc)
      | 't' :: cs' => read_string cs' (s ++ [Char.ofNat 9]) (next_loc 2 loc)
      | 'n' :: cs' => read_string cs' (s ++ [Char.ofNat 10]) (next_loc 2 loc)
      | 'v' :: cs' => read_string cs' (s ++ [Char.ofNat 11]) (next_loc 2 loc)
      | 'f' :: cs' => read_string cs' (s ++ [Char.ofNat 12]) (next_loc 2 loc)
      | 'r' :: cs' => read_string cs' (s ++ [Char.ofNat 13]) (next_loc 2 loc)
      | d :: ds =>
        if d.isDigit then
          match read_char_as_3digits (d :: ds) with
          | none => (symbol.ErrorS, loc, d :: ds)
          | some (ch, cs') => read_string cs' (s ++ [ch]) (next_loc 4 loc)
        else (symbol.ErrorS, loc, cs)
      | _ => (symbol.ErrorS, loc, cs)

theorem read_string_thm :
  ∀ (s t : List Char) (l l' : locn) (x1 : symbol) (x2 : List Char),
    read_string s t l = (x1, l', x2) →
    x2.length ≤ s.length + t.length := by sorry

/-- skip_comment: skip a (possibly nested) comment -/
partial def skip_comment : List Char → Nat → locn → Option (List Char × locn)
  | [], _, _ => none
  | [_], _, _ => none
  | x :: y :: xs, d, loc =>
    if [x, y] == ['(', '*'] then
      skip_comment xs (d + 1) (next_loc 2 loc)
    else if [x, y] == ['*', ')'] then
      if d = 0 then some (xs, next_loc 2 loc)
      else skip_comment xs (d - 1) (next_loc 2 loc)
    else if x.toNat = 10 then
      skip_comment (y :: xs) d (next_line loc)
    else skip_comment (y :: xs) d (next_loc 1 loc)

theorem skip_comment_thm :
  ∀ (xs : List Char) (d : Nat) (l l' : locn) (str : List Char),
    skip_comment xs d l = some (str, l') → str.length ≤ xs.length := by sorry

/-- read_FFIcall: read an FFI call name -/
partial def read_FFIcall : List Char → List Char → locn → symbol × locn × List Char
  | [], _acc, loc => (symbol.ErrorS, loc, [])
  | c :: s0, acc, loc =>
    if c == ')' then
      (symbol.FFIS acc.reverse, next_loc 2 loc, s0)
    else if c == '\n' then (symbol.ErrorS, loc, s0)
    else if c.isWhitespace then
      read_FFIcall s0 acc (next_loc 1 loc)
    else
      read_FFIcall s0 (c :: acc) (next_loc 1 loc)

theorem read_FFIcall_reduces_input :
  ∀ (s0 : List Char) (a : List Char) (l0 : locn) (t : symbol) (l : locn) (s : List Char),
    read_FFIcall s0 a l0 = (t, l, s) → s.length < s0.length + 1 := by sorry

/-- read_REPLcommand: read a REPL command -/
partial def read_REPLcommand : List Char → List Char → locn → symbol × locn × List Char
  | [], _acc, loc => (symbol.ErrorS, loc, [])
  | c :: s0, acc, loc =>
    if c == '}' then
      (symbol.FFIS acc.reverse, next_loc 2 loc, s0)
    else if c == '\n' then (symbol.ErrorS, loc, s0)
    else if c.isWhitespace then
      read_REPLcommand s0 acc (next_loc 1 loc)
    else
      read_REPLcommand s0 (c :: acc) (next_loc 1 loc)

theorem read_REPLcommand_reduces_input :
  ∀ (s0 : List Char) (a : List Char) (l0 : locn) (t : symbol) (l : locn) (s : List Char),
    read_REPLcommand s0 a l0 = (t, l, s) → s.length < s0.length + 1 := by sorry

/-- read_Ident_ret: helper for returning from read_Ident -/
def read_Ident_ret (acc : List (List Char)) (n : List Char) (new_loc : locn) (rest : List Char)
    : symbol × locn × List Char :=
  if acc.isEmpty then
    (symbol.OtherS n, new_loc, rest)
  else
    (symbol.LongS acc.reverse n, new_loc, rest)

/-- read_Ident: read an identifier (possibly qualified with dots) -/
partial def read_Ident : List Char → locn → List (List Char) → symbol × locn × List Char
  | [], loc, _ => (symbol.ErrorS, loc, [])
  | c :: strng, loc, acc =>
    if is_single_char_symbol c then
      if acc.isEmpty then
        (symbol.OtherS [c], next_loc 1 loc, strng)
      else
        (symbol.ErrorS, loc, strng)
    else if isSymbol c then
      let (n, rest) := read_while isSymbol strng [c]
      let new_loc := next_loc n.length loc
      read_Ident_ret acc n new_loc rest
    else if c.isAlpha then
      let (n, rest) := read_while isAlphaNumPrime strng [c]
      let new_loc := next_loc n.length loc
      match rest with
      | [] => read_Ident_ret acc n new_loc rest
      | c1 :: rest1 =>
        if c1 == '.' then read_Ident rest1 new_loc (n :: acc)
        else read_Ident_ret acc n new_loc rest
    else
      (symbol.ErrorS, loc, strng)

theorem read_Ident_LESS :
  ∀ (xs : List Char) (l : locn) (acc : List (List Char))
    (s : symbol) (loc : locn) (rest : List Char),
    read_Ident xs l acc = (s, loc, rest) →
    if xs = [] then rest = [] else rest.length < xs.length := by sorry

/-- isPREFIX for List Char: check if one list is a prefix of another -/
def isPrefixStr (pfx str : List Char) : Bool :=
  match pfx, str with
  | [], _ => true
  | _ :: _, [] => false
  | p :: ps, s :: ss => p == s && isPrefixStr ps ss

/-- next_sym: read the next symbol from the input, returning none at EOF -/
partial def next_sym : List Char → locn → Option (symbol × locs × List Char)
  | [], _ => none
  | c :: strng, loc =>
    if c == '\n' then
      next_sym strng (next_line loc)
    else if c.isWhitespace then
      next_sym strng (next_loc 1 loc)
    else if c.isDigit then
      if strng != [] && c == '0' && strng.head! == 'w' then
        if strng.tail! == [] then some (symbol.ErrorS, locs.Locs loc loc, [])
        else if (strng.tail!.head!).isDigit then
          let (n, rest) := read_while Char.isDigit strng.tail! []
          some (symbol.WordS (num_from_dec_string n),
                locs.Locs loc (next_loc (n.length + 1) loc),
                rest)
        else if strng.tail!.head! == 'x' then
          let (n, rest) := read_while isHexDigit strng.tail!.tail! []
          some (symbol.WordS (num_from_hex_string n),
                locs.Locs loc (next_loc (n.length + 2) loc),
                rest)
        else some (symbol.ErrorS, locs.Locs loc loc, strng.tail!)
      else
        if strng != [] && c == '0' && strng.head! == 'x' then
          let (n, rest) := read_while isHexDigit strng.tail! []
          some (symbol.NumberS (Int.ofNat (num_from_hex_string n)),
                locs.Locs loc (next_loc n.length loc),
                rest)
        else
          let (n, rest) := read_while Char.isDigit strng []
          some (symbol.NumberS (Int.ofNat (num_from_dec_string (c :: n))),
                locs.Locs loc (next_loc n.length loc),
                rest)
    else if c == '~' && strng != [] && (strng.head!).isDigit then
      let (n, rest) := read_while Char.isDigit strng []
      some (symbol.NumberS (0 - Int.ofNat (num_from_dec_string n)),
            locs.Locs loc (next_loc (n.length + 1) loc),
            rest)
    else if c == '\'' then
      let (n, rest) := read_while isAlphaNumPrime strng [c]
      some (symbol.OtherS n, locs.Locs loc (next_loc (n.length - 1) loc),
            rest)
    else if c == '"' then
      let (t, loc', rest) := read_string strng [] (next_loc 1 loc)
      some (t, locs.Locs loc loc', rest)
    else if isPrefixStr ['*', ')'] (c :: strng) then
      some (symbol.ErrorS, locs.Locs loc (next_loc 2 loc), strng.tail!)
    else if isPrefixStr ['#', '"'] (c :: strng) then
      let (t, loc', rest) := read_string strng.tail! [] (next_loc 2 loc)
      some (mkCharS t, locs.Locs loc loc', rest)
    else if isPrefixStr ['#', '('] (c :: strng) then
      let (t, loc', rest) := read_FFIcall strng.tail! [] (next_loc 2 loc)
      some (t, locs.Locs loc loc', rest)
    else if isPrefixStr ['(', '*'] (c :: strng) then
      match skip_comment strng.tail! 0 (next_loc 2 loc) with
      | none => some (symbol.ErrorS, locs.Locs loc (next_loc 2 loc), [])
      | some (rest, loc') => next_sym rest loc'
    else if c == '_' then some (symbol.OtherS ['_'], locs.Locs loc loc, strng)
    else
      let (tok, end_loc, rest) := read_Ident (c :: strng) loc []
      some (tok, locs.Locs loc end_loc, rest)

theorem next_sym_LESS :
  ∀ (input : List Char) (l : locn) (s : symbol) (l' : locs) (rest : List Char),
    next_sym input l = some (s, l', rest) →
    rest.length < input.length := by sorry

-- ============================================================
-- Token conversion (phase 2)
-- ============================================================

/-- init_loc: initial location (row 0, column 0) -/
def init_loc : locn := locn.POSN 0 0

/-- processIdent: convert an identifier string to the appropriate token -/
def processIdent (s : List Char) : token :=
  match s with
  | [] => token.LexErrorT
  | c :: rest =>
    if c.isAlpha then
      token.AlphaT (mlstring.implode (c :: rest))
    else
      token.SymbolT (mlstring.implode (c :: rest))

/-- get_token: map a string to a keyword/punctuation token, or an identifier token -/
def get_token (s : List Char) : token :=
  if s == "#".toList then token.HashT else
  if s == "(".toList then token.LparT else
  if s == ")".toList then token.RparT else
  if s == "*".toList then token.StarT else
  if s == ",".toList then token.CommaT else
  if s == "->".toList then token.ArrowT else
  if s == "...".toList then token.DotsT else
  if s == ":".toList then token.ColonT else
  if s == ":>".toList then token.SealT else
  if s == ";".toList then token.SemicolonT else
  if s == "=".toList then token.EqualsT else
  if s == "=>".toList then token.DarrowT else
  if s == "[".toList then token.LbrackT else
  if s == "]".toList then token.RbrackT else
  if s == "_".toList then token.UnderbarT else
  if s == "{".toList then token.LbraceT else
  if s == "}".toList then token.RbraceT else
  if s == "|".toList then token.BarT else
  if s == "and".toList then token.AndT else
  if s == "andalso".toList then token.AndalsoT else
  if s == "as".toList then token.AsT else
  if s == "case".toList then token.CaseT else
  if s == "datatype".toList then token.DatatypeT else
  if s == "else".toList then token.ElseT else
  if s == "end".toList then token.EndT else
  if s == "eqtype".toList then token.EqtypeT else
  if s == "exception".toList then token.ExceptionT else
  if s == "fn".toList then token.FnT else
  if s == "fun".toList then token.FunT else
  if s == "handle".toList then token.HandleT else
  if s == "if".toList then token.IfT else
  if s == "in".toList then token.InT else
  if s == "include".toList then token.IncludeT else
  if s == "let".toList then token.LetT else
  if s == "local".toList then token.LocalT else
  if s == "of".toList then token.OfT else
  if s == "op".toList then token.OpT else
  if s == "open".toList then token.OpenT else
  if s == "orelse".toList then token.OrelseT else
  if s == "raise".toList then token.RaiseT else
  if s == "rec".toList then token.RecT else
  if s == "sharing".toList then token.SharingT else
  if s == "sig".toList then token.SigT else
  if s == "signature".toList then token.SignatureT else
  if s == "struct".toList then token.StructT else
  if s == "structure".toList then token.StructureT else
  if s == "then".toList then token.ThenT else
  if s == "type".toList then token.TypeT else
  if s == "val".toList then token.ValT else
  if s == "where".toList then token.WhereT else
  if s == "with".toList then token.WithT else
  if s == "withtype".toList then token.WithtypeT else
  if s != [] && s.head! == '\'' then token.TyvarT (mlstring.implode s) else
  processIdent s

/-- to_path: convert a list of mlstrings to a path -/
def to_path : List mlstring → path
  | [] => path.End
  | x :: xs => path.Mod x (to_path xs)

/-- token_of_sym: convert a symbol to a token -/
def token_of_sym : symbol → token
  | symbol.ErrorS => token.LexErrorT
  | symbol.StringS s => token.StringT (mlstring.implode s)
  | symbol.CharS c => token.CharT c
  | symbol.NumberS i => token.IntT i
  | symbol.WordS n => token.WordT n
  | symbol.LongS xs s => token.LongidT (to_path (xs.map mlstring.implode)) (mlstring.implode s)
  | symbol.FFIS s => token.FFIT (mlstring.implode s)
  | symbol.OtherS s => get_token s

/-- next_token: read the next token from the input -/
def next_token (input : List Char) (loc : locn) : Option (token × locs × List Char) :=
  match next_sym input loc with
  | none => none
  | some (sym, ls, rest_of_input) =>
    some (token_of_sym sym, ls, rest_of_input)

theorem next_token_LESS :
  ∀ (s : token) (l : locn) (l' : locs) (rest input : List Char),
    next_token input l = some (s, l', rest) →
    rest.length < input.length := by sorry

-- ============================================================
-- Top-level lexer
-- ============================================================

/-- lexer_fun_aux: auxiliary function that repeatedly reads tokens -/
partial def lexer_fun_aux (input : List Char) (loc : locn) : List (token × locs) :=
  match next_token input loc with
  | none => []
  | some (tok, locs.Locs loc' loc'', rest_of_input) =>
    (tok, locs.Locs loc' loc'') :: lexer_fun_aux rest_of_input (next_loc 1 loc'')

/-- lexer_fun: the main lexer, converting a string to a list of (token, locs) pairs -/
def lexer_fun (input : List Char) : List (token × locs) :=
  lexer_fun_aux input init_loc

-- ============================================================
-- Splitting at top-level semicolons
-- ============================================================

/-- toplevel_semi_dex: find the index of the next top-level semicolon -/
def toplevel_semi_dex : Nat → Nat → List (token × locs) → Option Nat
  | _, _, [] => none
  | i, d, (h, _) :: t =>
    if h == token.SemicolonT && d == 0 then some (i + 1)
    else if h == token.LetT then toplevel_semi_dex (i + 1) (d + 1) t
    else if h == token.StructT then toplevel_semi_dex (i + 1) (d + 1) t
    else if h == token.SigT then toplevel_semi_dex (i + 1) (d + 1) t
    else if h == token.LparT then toplevel_semi_dex (i + 1) (d + 1) t
    else if h == token.EndT then toplevel_semi_dex (i + 1) (d - 1) t
    else if h == token.RparT then toplevel_semi_dex (i + 1) (d - 1) t
    else toplevel_semi_dex (i + 1) d t

theorem toplevel_semi_dex_non0 :
  ∀ (i d : Nat) (toks : List (token × locs)) (j : Nat),
    toplevel_semi_dex i d toks = some j → 0 < j := by sorry

/-- split_top_level_semi: split a token list at top-level semicolons -/
partial def split_top_level_semi (toks : List (token × locs)) : List (List (token × locs)) :=
  match toplevel_semi_dex 0 0 toks with
  | none => []
  | some i =>
    toks.take i :: split_top_level_semi (toks.drop i)

-- Local helper lemmas (translated as sorry)
theorem lem1 : True := by sorry
theorem lem2 : True := by sorry
theorem read_while_EMPTY : True := by sorry
theorem NOT_NIL_EXISTS_CONS : True := by sorry

end CakeML
