/-
  Specification of how to convert parse trees to abstract syntax.
  Translated from: hol4_sources/cmlPtreeConversionScript.sml
-/
import CakeML.Core.Ast
import CakeML.Core.Tokens
import CakeML.Core.Gram
import CakeML.Core.TokenUtils

namespace CakeML

open HOL4
open mlstring

/-
  PCstate0: state for tracking fixities and constructor arities.
  Recording a fixity of none represents an explicit nonfix declaration.
-/
structure PCstate0 where
  fixities : List (mlstring × Option Nat)
  ctr_arities : List (id mlstring mlstring × Nat)
deriving Inhabited

/-- The monadic type: state+failure monad over a list of PCstate0 -/
abbrev M (α : Type) := List PCstate0 → Option (α × List PCstate0)

/-- Empty PCstate0 -/
def empty_PCstate0 : PCstate0 :=
  { fixities := [], ctr_arities := [] }

/-- Push a new anonymous scope -/
def mpushPC_scope : M Unit := fun pcs => some ((), empty_PCstate0 :: pcs)

/-- Look up fixity in scope stack -/
partial def fixity_lookup (nm : mlstring) : List PCstate0 → Option Nat
  | [] => none
  | pc0 :: rest =>
    match ALOOKUP pc0.fixities nm with
    | none => fixity_lookup nm rest
    | some none => none
    | some (some r) => some r

/-- Monadic fixity lookup -/
def mfixity_lookup (nm : mlstring) : M Nat :=
  fun pcs => Option.map (fun r => (r, pcs)) (fixity_lookup nm pcs)

/-- Update head of scope stack -/
def mFUPD_HD (f : PCstate0 → PCstate0) : M Unit := fun pcs =>
  match pcs with
  | [] => none
  | h :: t => some ((), f h :: t)

/-- Set fixity for a name -/
def msetfix (nm : mlstring) (fix : Option Nat) : M Unit :=
  mFUPD_HD (fun s0 => { s0 with fixities := (nm, fix) :: s0.fixities })

/-- Pop anonymous scope -/
def mpopscope : M Unit := fun pcs =>
  match pcs with
  | [] => none
  | _ :: t => some ((), t)

/-- Pop named scope -/
def mpop_namedscope (_ : mlstring) : M Unit := fun pcs =>
  match pcs with
  | [] => none
  | [_] => none
  | _ :: next :: rest => some ((), next :: rest)

/-- If-then-else in the monad -/
def ifM {α : Type} (bM : Option Bool) (tM eM : Option α) : Option α :=
  match bM with
  | none => none
  | some b => if b then tM else eM

/-- Build a binary operation expression -/
def mk_binop (a_op : id modN varN) (a1 a2 : exp) : exp :=
  if a_op == id.Short (strlit "::".toList) then
    exp.Con (some (id.Short (strlit "::".toList))) [a1, a2]
  else
    exp.App op.Opapp [exp.App op.Opapp [exp.Var a_op, a1], a2]

/-- Check that a parse tree leaf matches a token -/
def tokcheck (pt : mlptree) (tok : token) : Bool :=
  match destLf pt with
  | some sym =>
    match destTOK sym with
    | some t => t == tok
    | none => false
  | none => false

/-- ptree_UQTyop: extract unqualified type operator name -/
def ptree_UQTyop : mlptree → Option mlstring
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nUQTyOp then none
    else
      match args with
      | [pt] => do
          let lf ← destLf pt
          let tk ← destTOK lf
          (destSymbolT tk) <|> (destAlphaT tk)
      | _ => none

/-- ptree_TyvarN: extract type variable name -/
def ptree_TyvarN : mlptree → Option mlstring
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nTyvarN then none
    else
      match args with
      | [tyv] => destTyvarPT tyv
      | _ => none

/-- Convert a path to a qualified id -/
def Long_Short : path → mlstring → id modN mlstring
  | path.End, s => id.Short s
  | path.Mod x xs, s => id.Long x (Long_Short xs s)

/-- ptree_Tyop: extract type operator (possibly qualified) -/
def ptree_Tyop : mlptree → Option (id modN typeN)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nTyOp then none
    else
      match args with
      | [pt] =>
        (do
          let lf ← destLf pt
          let tk ← destTOK lf
          let (xs, s) ← destLongidT tk
          some (Long_Short xs s)) <|>
        (do
          let nm ← ptree_UQTyop pt
          some (id.Short nm))
      | _ => none

/-- Check a list of tokens against a list of parse trees -/
def tokcheckl : List mlptree → List token → Bool
  | [], [] => true
  | pt :: prest, tok :: tokrest => tokcheck pt tok && tokcheckl prest tokrest
  | _, _ => false

/-- Left-associative infix parse tree linearization -/
partial def ptree_linfix (topnt : MMLnonT) (opn : token) (elnt : mlptree → Option α)
    (pt : mlptree) : Option (List α) :=
  match pt with
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt == mkNT topnt then
      match args with
      | [pt'] => do let e ← elnt pt'; some [e]
      | [x, op_pt, pt'] => do
          if !tokcheck op_pt opn then none
          else do
            let front ← ptree_linfix topnt opn elnt x
            let last ← elnt pt'
            some (front ++ [last])
      | _ => none
    else none

/-- Tuplify a list of types -/
def tuplify : List ast_t → Option ast_t
  | [] => none
  | [ty] => some ty
  | tys => some (ast_t.Attup tys)

-- Mutually recursive type parsing functions
mutual
partial def ptree_Type (nm : MMLnonT) : mlptree → Option ast_t
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT nm then none
    else if nm == MMLnonT.nType then
      match args with
      | [dt] => do
          let tys ← ptree_PType dt
          tuplify tys
      | [dt, arrowt, rt] => do
          if !tokcheck arrowt token.ArrowT then none
          else do
            let dtys ← ptree_PType dt
            let dty ← tuplify dtys
            let rty ← ptree_Type MMLnonT.nType rt
            some (ast_t.Atfun dty rty)
      | _ => none
    else if nm == MMLnonT.nDType then
      match args with
      | [pt] => ptree_Type MMLnonT.nTbase pt
      | [dt, opn] => do
          let dty ← ptree_Type MMLnonT.nDType dt
          let opname ← ptree_Tyop opn
          some (ast_t.Atapp [dty] opname)
      | _ => none
    else if nm == MMLnonT.nTbase then
      match args with
      | [pt] =>
        (Option.map ast_t.Atvar (destTyvarPT pt)) <|>
        (Option.map (ast_t.Atapp []) (ptree_Tyop pt))
      | [lpart, t, rpart] => do
          if !(tokcheck lpart token.LparT && tokcheck rpart token.RparT) then none
          else ptree_Type MMLnonT.nType t
      | [lpart, tl, rpart, opn] => do
          if !(tokcheck lpart token.LparT && tokcheck rpart token.RparT) then none
          else do
            let tylist ← ptree_Typelist2 tl
            let opname ← ptree_Tyop opn
            some (ast_t.Atapp tylist opname)
      | _ => none
    else none

partial def ptree_Typelist2 : mlptree → Option (List ast_t)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nTypeList2 then none
    else
      match args with
      | [dt, commat, tl'] => do
          if !tokcheck commat token.CommaT then none
          else do
            let ty ← ptree_Type MMLnonT.nType dt
            let tylist ← ptree_TypeList1 tl'
            some (ty :: tylist)
      | _ => none

partial def ptree_TypeList1 : mlptree → Option (List ast_t)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nTypeList1 then none
    else
      match args with
      | [dt] => do
          let ty ← ptree_Type MMLnonT.nType dt
          some [ty]
      | [dt, commat, tl] => do
          if !tokcheck commat token.CommaT then none
          else do
            let ty ← ptree_Type MMLnonT.nType dt
            let tl' ← ptree_TypeList1 tl
            some (ty :: tl')
      | _ => none

partial def ptree_PType : mlptree → Option (List ast_t)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nPType then none
    else
      match args with
      | [dty_pt] => do
          let dty ← ptree_Type MMLnonT.nDType dty_pt
          some [dty]
      | [dty_pt, st, pty_pt] => do
          if !tokcheck st token.StarT then none
          else do
            let dty ← ptree_Type MMLnonT.nDType dty_pt
            let ptys ← ptree_PType pty_pt
            some (dty :: ptys)
      | _ => none
end

/-- Parse a TypeName: (tyvar list, typeN) -/
partial def ptree_TypeName : mlptree → Option (List tvarN × typeN)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt == mkNT MMLnonT.nTypeName then
      match args with
      | [opt] => do
          let opn ← ptree_UQTyop opt
          some ([], opn)
      | [sym, opt] => do
          let tyvn ← destTyvarPT sym
          let opn ← ptree_UQTyop opt
          some ([tyvn], opn)
      | [lp, tyvl, rp, opt] => do
          if !(tokcheck lp token.LparT && tokcheck rp token.RparT) then none
          else do
            let tyvnms ← ptree_linfix MMLnonT.nTyVarList token.CommaT ptree_TyvarN tyvl
            let opn ← ptree_UQTyop opt
            some (tyvnms, opn)
      | _ => none
    else none

/-- Extract unqualified constructor name -/
def ptree_UQConstructorName : mlptree → Option mlstring
  | parsetree.Lf _ => none
  | parsetree.Nd nm args =>
    if nm != mkNT MMLnonT.nUQConstructorName then none
    else
      match args with
      | [pt] => do
          let lf ← destLf pt
          let tk ← destTOK lf
          destAlphaT tk
      | _ => none

/-- Extract constructor name (possibly qualified) -/
def ptree_ConstructorName : mlptree → Option (id modN conN)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nConstructorName then none
    else
      match args with
      | [pt] =>
        (do
          let s ← ptree_UQConstructorName pt
          some (id.Short s)) <|>
        (do
          let lf ← destLf pt
          let tk ← destTOK lf
          let (xs, s) ← destLongidT tk
          some (Long_Short xs s))
      | _ => none

/-- Detuplify a type -/
def detuplify : ast_t → List ast_t
  | ast_t.Attup args => args
  | ty => [ty]

theorem detuplify_pmatch :
  ∀ ty, detuplify ty =
    match ty with
    | ast_t.Attup args => args
    | ty => [ty] := by sorry

/-- Parse PTbase -/
partial def ptree_PTbase : mlptree → Option ast_t
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt == mkNT MMLnonT.nPTbase then
      match args with
      | [pt] =>
        (Option.map ast_t.Atvar (destTyvarPT pt)) <|>
        (Option.map (ast_t.Atapp []) (ptree_Tyop pt))
      | [lpart, t, rpart] => do
          if !(tokcheck lpart token.LparT && tokcheck rpart token.RparT) then none
          else ptree_Type MMLnonT.nType t
      | _ => none
    else none

/-- Parse TbaseList -/
partial def ptree_TbaseList : mlptree → Option (List ast_t)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt == mkNT MMLnonT.nTbaseList then
      match args with
      | [] => some []
      | [ptb_pt, rest_pt] => do
          let b ← ptree_PTbase ptb_pt
          let rest ← ptree_TbaseList rest_pt
          some (b :: rest)
      | _ => none
    else none

/-- Parse Dconstructor -/
partial def ptree_Dconstructor : mlptree → Option (conN × List ast_t)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt == mkNT MMLnonT.nDconstructor then
      match args with
      | [] => none
      | t :: ts => do
          let cname ← ptree_UQConstructorName t
          let types ← match ts with
            | [blist] => ptree_TbaseList blist
            | _ => none
          some (cname, types)
    else none

/-- Parse DtypeDecl -/
partial def ptree_DtypeDecl (pt : mlptree) : Option (List tvarN × typeN × List (conN × List ast_t)) :=
  match pt with
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt == mkNT MMLnonT.nDtypeDecl then
      match args with
      | [tynm_pt, eqt, dtc_pt] => do
          if !tokcheck eqt token.EqualsT then none
          else do
            let tynm ← ptree_TypeName tynm_pt
            let dtc ← ptree_linfix MMLnonT.nDtypeCons token.BarT ptree_Dconstructor dtc_pt
            some (tynm.1, tynm.2, dtc)
      | _ => none
    else none

/-- Parse TypeDec -/
partial def ptree_TypeDec (ptree : mlptree) : Option type_def :=
  match ptree with
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt == mkNT MMLnonT.nTypeDec then
      match args with
      | [datatype_pt, pt] => do
          if !tokcheck datatype_pt token.DatatypeT then none
          else ptree_linfix MMLnonT.nDtypeDecls token.AndT ptree_DtypeDecl pt
      | _ => none
    else none

/-- Parse TypeAbbrevDec -/
partial def ptree_TypeAbbrevDec (ptree : mlptree) : Option dec :=
  match ptree with
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nTypeAbbrevDec then none
    else
      match args with
      | [typetok, tynm, eqtok, typ_pt] => do
          if !(tokcheck typetok token.TypeT && tokcheck eqtok token.EqualsT) then none
          else do
            let (vars, nm) ← ptree_TypeName tynm
            let typ ← ptree_Type MMLnonT.nType typ_pt
            some (dec.Dtabbrev unknown_loc vars nm typ)
      | _ => none

/-- singleSymP: match a single symbolic token satisfying a predicate -/
def singleSymP (P : List Char → Bool) : List mlptree → Option (id modN varN) :=
  fun pts =>
    match pts with
    | [pt] => do
        let lf ← destLf pt
        let tk ← destTOK lf
        let s ← destSymbolT tk
        if P (explode s) then some (id.Short s)
        else none
    | _ => none

/-- Parse operator -/
def ptree_Op : mlptree → Option (id modN varN)
  | parsetree.Lf _ => none
  | parsetree.Nd nt subs =>
    if nt == mkNT MMLnonT.nMultOps then
      if tokcheckl subs [token.StarT] then some (id.Short (strlit "*".toList))
      else if tokcheckl subs [token.AlphaT (strlit "mod".toList)] then
        some (id.Short (strlit "mod".toList))
      else if tokcheckl subs [token.AlphaT (strlit "div".toList)] then
        some (id.Short (strlit "div".toList))
      else singleSymP (validMultSym) subs
    else if nt == mkNT MMLnonT.nAddOps then singleSymP (validAddSym) subs
    else if nt == mkNT MMLnonT.nListOps then singleSymP (validListSym) subs
    else if nt == mkNT MMLnonT.nRelOps then
      (singleSymP (validRelSym) subs) <|>
      (do if !tokcheckl subs [token.EqualsT] then none
          else some (id.Short (strlit "=".toList)))
    else if nt == mkNT MMLnonT.nCompOps then
      if tokcheckl subs [token.SymbolT (strlit ":=".toList)] then
        some (id.Short (strlit ":=".toList))
      else if tokcheckl subs [token.AlphaT (strlit "o".toList)] then
        some (id.Short (strlit "o".toList))
      else none
    else none

/-- Extract variable name -/
def ptree_V : mlptree → Option mlstring
  | parsetree.Lf _ => none
  | parsetree.Nd nt subs => do
      if nt != mkNT MMLnonT.nV then none
      else
        match subs with
        | [pt] => do
            let lf ← destLf pt
            let t ← destTOK lf
            (destAlphaT t) <|> (destSymbolT t)
        | _ => none

/-- Extract fully qualified variable -/
def ptree_FQV : mlptree → Option (id modN varN)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nFQV then none
    else
      match args with
      | [pt] =>
        (Option.map id.Short (ptree_V pt)) <|>
        (do
          let lf ← destLf pt
          let tk ← destTOK lf
          let (xs, s) ← destLongidT tk
          some (Long_Short xs s))
      | _ => none

/-- Check if a char list represents a symbolic constructor -/
def isSymbolicConstructor (s : List Char) : Option Bool :=
  some (s == "::".toList)

/-- Check if a char list represents a constructor -/
def isConstructor (s : List Char) : Option Bool := do
  let symb ← isSymbolicConstructor s
  if symb then some true
  else
    match s.head? with
    | none => some false
    | some c => some (c.isAlpha && c.isUpper)

/-- Convert expression to pattern (where possible) -/
def EtoPat : exp → Option pat
  | exp.Con x args => if args.isEmpty then some (pat.Pcon x []) else none
  | exp.Var (id.Short n) => some (pat.Pvar n)
  | exp.Var (id.Long str n) => some (pat.Pcon (some (id.Long str n)) [])
  | _ => none

/-- Parse OpID -/
partial def ptree_OpID : mlptree → Option exp
  | parsetree.Lf _ => none
  | parsetree.Nd nt subs =>
    if nt != mkNT MMLnonT.nOpID then none
    else
      match subs with
      | [parsetree.Lf (symbol.TOK tk)] =>
        (do
          let s ← destAlphaT tk
          let isCon ← isConstructor (explode s)
          if isCon then some (exp.Con (some (id.Short s)) [])
          else some (exp.Var (id.Short s))) <|>
        (do
          let s ← destSymbolT tk
          let isSym ← isSymbolicConstructor (explode s)
          if isSym then some (exp.Con (some (id.Short s)) [])
          else some (exp.Var (id.Short s))) <|>
        (do
          let (path_val, s) ← destLongidT tk
          let isCon ← isConstructor (explode s)
          if isCon then some (exp.Con (some (Long_Short path_val s)) [])
          else some (exp.Var (Long_Short path_val s))) <|>
        (if tk == token.StarT then
          match isSymbolicConstructor "*".toList with
          | some true => some (exp.Con (some (id.Short (strlit "*".toList))) [])
          | _ => some (exp.Var (id.Short (strlit "*".toList)))
         else if tk == token.EqualsT then some (exp.Var (id.Short (strlit "=".toList)))
         else none)
      | _ => none

/-- Apply a pattern to an argument -/
def Papply (p : pat) (arg : pat) : pat :=
  match p with
  | pat.Pcon cn args => pat.Pcon cn (args ++ [arg])
  | _ => p

/-- Maybe handle Ref pattern -/
def maybe_handleRef : pat → pat
  | pat.Pcon (some (id.Short s)) [p] =>
    if s == strlit "Ref".toList then pat.Pref p
    else pat.Pcon (some (id.Short s)) [p]
  | p => p

-- Mutually recursive pattern parsing
mutual
partial def ptree_Pattern (nt : MMLnonT) : mlptree → Option pat
  | parsetree.Lf _ => none
  | parsetree.Nd nm args =>
    if mkNT nt != nm then none
    else if nm == mkNT MMLnonT.nPbase then
      match args with
      | [vic] =>
        (ptree_Pattern MMLnonT.nPtuple vic) <|>
        (do let cname ← ptree_ConstructorName vic; some (pat.Pcon (some cname) [])) <|>
        (do let vname ← ptree_V vic; some (pat.Pvar vname)) <|>
        (do
          let lf ← destLf vic
          let t ← destTOK lf
          (do let i ← destIntT t; some (pat.Plit (lit.IntLit i))) <|>
          (do let s ← destStringT t; some (pat.Plit (lit.StrLit s))) <|>
          (do let c ← destCharT t; some (pat.Plit (lit.Char c)))) <|>
        (do if !tokcheck vic token.UnderbarT then none
            else some pat.Pany)
      | [lb, rb] =>
        if tokcheckl args [token.LbrackT, token.RbrackT] then
          some (pat.Pcon (some (id.Short (strlit "[]".toList))) [])
        else if tokcheckl [lb] [token.OpT] then do
          let e ← ptree_OpID rb
          EtoPat e
        else none
      | [lb, plistpt, rb] => do
          if !tokcheckl [lb, rb] [token.LbrackT, token.RbrackT] then none
          else do
            let plist ← ptree_Plist plistpt
            some (plist.foldr
              (fun p a => pat.Pcon (some (id.Short (strlit "::".toList))) [p, a])
              (pat.Pcon (some (id.Short (strlit "[]".toList))) []))
      | _ => none
    else if nm == mkNT MMLnonT.nPConApp then
      match args with
      | [cn] => do
          let cname ← ptree_ConstructorName cn
          some (pat.Pcon (some cname) [])
      | [capp_pt, base_pt] => do
          let capp ← ptree_Pattern MMLnonT.nPConApp capp_pt
          let base ← ptree_Pattern MMLnonT.nPbase base_pt
          some (Papply capp base)
      | _ => none
    else if nm == mkNT MMLnonT.nPapp then
      match args with
      | [pb] => ptree_Pattern MMLnonT.nPbase pb
      | [capp_pt, ppt] => do
          let capp ← ptree_Pattern MMLnonT.nPConApp capp_pt
          let b ← ptree_Pattern MMLnonT.nPbase ppt
          some (maybe_handleRef (Papply capp b))
      | _ => none
    else if nm == mkNT MMLnonT.nPcons then
      match args with
      | [papt] => ptree_Pattern MMLnonT.nPapp papt
      | [papt, cons_t, pcons_pt] => do
          if !tokcheck cons_t (token.SymbolT (strlit "::".toList)) then none
          else do
            let pa ← ptree_Pattern MMLnonT.nPapp papt
            let patt ← ptree_Pattern MMLnonT.nPcons pcons_pt
            some (pat.Pcon (some (id.Short (strlit "::".toList))) [pa, patt])
      | _ => none
    else if nm == mkNT MMLnonT.nPas then
      match args with
      | [papt] => ptree_Pattern MMLnonT.nPcons papt
      | [vt, as_t, papt] => do
          if !tokcheck as_t token.AsT then none
          else do
            let pa ← ptree_Pattern MMLnonT.nPcons papt
            let vtt ← ptree_V vt
            some (pat.Pas pa vtt)
      | _ => none
    else if nm == mkNT MMLnonT.nPattern then
      match args with
      | [pas] => ptree_Pattern MMLnonT.nPas pas
      | [pas_pt, colon_t, type_pt] => do
          if !tokcheck colon_t token.ColonT then none
          else do
            let pc ← ptree_Pattern MMLnonT.nPas pas_pt
            let ty ← ptree_Type MMLnonT.nType type_pt
            some (pat.Ptannot pc ty)
      | _ => none
    else if nm == mkNT MMLnonT.nPtuple then
      match args with
      | [lp, rp] => do
          if !tokcheckl [lp, rp] [token.LparT, token.RparT] then none
          else some (pat.Pcon none [])
      | [lp, pl_pt, rp] => do
          if !tokcheckl [lp, rp] [token.LparT, token.RparT] then none
          else do
            let pl ← ptree_Plist pl_pt
            match pl with
            | [] => none
            | [p] => some p
            | _ => some (pat.Pcon none pl)
      | _ => none
    else none

partial def ptree_Plist : mlptree → Option (List pat)
  | parsetree.Lf _ => none
  | parsetree.Nd nm args =>
    if nm != mkNT MMLnonT.nPatternList then none
    else
      match args with
      | [p_pt] => do
          let p ← ptree_Pattern MMLnonT.nPattern p_pt
          some [p]
      | [p, ct, pl] => do
          if !tokcheck ct token.CommaT then none
          else do
            let hdpat ← ptree_Pattern MMLnonT.nPattern p
            let tlpats ← ptree_Plist pl
            some (hdpat :: tlpats)
      | _ => none
end

theorem ptree_Pattern_pevaled : True := by sorry
theorem ptree_Plist_thm : True := by sorry

/-- Parse PbaseList1 -/
partial def ptree_PbaseList1 : mlptree → Option (List pat)
  | parsetree.Lf _ => none
  | parsetree.Nd nm args =>
    if nm != mkNT MMLnonT.nPbaseList1 then none
    else
      match args with
      | [p_pt] => Option.map (fun p => [p]) (ptree_Pattern MMLnonT.nPbase p_pt)
      | [p_pt, pl_pt] => do
          let p ← ptree_Pattern MMLnonT.nPbase p_pt
          let pl ← ptree_PbaseList1 pl_pt
          some (p :: pl)
      | _ => none

/-- Encode a sequence of expressions -/
def Eseq_encode : List exp → Option exp
  | [] => none
  | [e] => some e
  | e :: es => do
      let body ← Eseq_encode es
      some (exp.Let none e body)

/-- Destruct a Con expression -/
def dest_Conk (e : exp) (k : Option (id modN conN) → List exp → α) (v : α) : α :=
  match e with
  | exp.Con x y => k x y
  | _ => v

/-- Destruct an FFI op -/
def destFFIop : op → Option mlstring
  | op.FFI s => some s
  | _ => none

/-- Strip location annotation from expression -/
def strip_loc_expr : exp → exp × Option locs
  | exp.Lannot e l =>
    let (e0, _) := strip_loc_expr e
    (e0, some l)
  | e => (e, none)

/-- Merge optional locations -/
def merge_locsopt : Option locs → Option locs → Option locs
  | some l1, some l2 => some (merge_locs l1 l2)
  | _, _ => none

/-- Optionally annotate with location -/
def optLannot : Option locs → exp → exp
  | none, e => e
  | some l, e => exp.Lannot e l

/-- Build an App expression, handling special constructors -/
def mkAst_App (a1 a2 : exp) : exp :=
  let (a10, loc1) := strip_loc_expr a1
  dest_Conk a10
    (fun nm_opt args =>
      if nm_opt == some (id.Short (strlit "Ref".toList)) && args.isEmpty then
        exp.App op.Opref [a2]
      else
        let (a2', loc2) := strip_loc_expr a2
        optLannot (merge_locsopt loc1 loc2) (exp.Con nm_opt (args ++ [a2'])))
    (match a10 with
     | exp.App opn args =>
       match destFFIop opn with
       | none => exp.App op.Opapp [a1, a2]
       | some _ => exp.App opn (args ++ [a2])
     | _ => exp.App op.Opapp [a1, a2])

/-- Extract (varN, exp) pair from a pattern for lambda -/
def dePat (p : pat) (b : exp) : varN × exp :=
  match p with
  | pat.Pvar v => (v, b)
  | _ => (strlit [], exp.Mat (exp.Var (id.Short (strlit []))) [(p, b)])

/-- Build a Fun from a pattern -/
def mkFun (p : pat) (b : exp) : exp :=
  let (v, body) := dePat p b
  exp.Fun v body

/-- Parse an expression literal -/
def ptree_Eliteral : mlptree → Option exp
  | parsetree.Lf _ => none
  | parsetree.Nd nt subs => do
      if !(subs.length == 1 && nt == mkNT MMLnonT.nEliteral) then none
      else do
        let lf ← destLf (subs.head!)
        let t ← destTOK lf
        (do let i ← destIntT t; some (exp.Lit (lit.IntLit i))) <|>
        (do let c ← destCharT t; some (exp.Lit (lit.Char c))) <|>
        (do let s ← destStringT t; some (exp.Lit (lit.StrLit s))) <|>
        (do let n ← destWordT t; some (exp.Lit (lit.Word64 (BitVec.ofNat 64 n)))) <|>
        (do let s ← destFFIT t; some (exp.App (op.FFI s) []))

/-- Bind location to expression -/
def bind_loc (e : exp) (l : locs) : exp :=
  match e with
  | exp.Lannot _ _ => e
  | _ => exp.Lannot e l

/-- Build a let from a pattern -/
def letFromPat (p : pat) (rhs body : exp) : exp :=
  match p with
  | pat.Pany => exp.Let none rhs body
  | pat.Pvar v => exp.Let (some v) rhs body
  | _ => exp.Mat rhs [(p, body)]

-- Mutually recursive expression parsing
mutual
partial def ptree_Expr (ent : MMLnonT) : mlptree → Option exp
  | parsetree.Lf _ => none
  | parsetree.Nd nt subs => do
      let e ← (if mkNT ent == nt then
        if nt == mkNT MMLnonT.nEbase then
          match subs with
          | [lpart, pt, rpart] =>
            if tokcheck lpart token.LparT then do
              if !tokcheck rpart token.RparT then none
              else do
                let eseq ← ptree_Eseq pt
                Eseq_encode eseq
            else do
              if !tokcheckl [lpart, rpart] [token.LbrackT, token.RbrackT] then none
              else do
                let elist ← ptree_Exprlist MMLnonT.nElist1 pt
                some (elist.foldr
                  (fun e acc => exp.Con (some (id.Short (strlit "::".toList))) [e, acc])
                  (exp.Con (some (id.Short (strlit "[]".toList))) []))
          | [single] =>
            (ptree_Eliteral single) <|>
            (do let s ← ptree_FQV single; some (exp.Var s)) <|>
            (do let cname ← ptree_ConstructorName single;
                some (exp.Con (some cname) [])) <|>
            (ptree_Expr MMLnonT.nEtuple single)
          | [lp, rp] =>
            if tokcheckl [lp, rp] [token.LparT, token.RparT] then
              some (exp.Con none [])
            else if tokcheckl [lp, rp] [token.LbrackT, token.RbrackT] then
              some (exp.Con (some (id.Short (strlit "[]".toList))) [])
            else if tokcheck lp token.OpT then
              ptree_OpID rp
            else none
          | [lett, letdecs_pt, intok, ept, endt] => do
              if !tokcheckl [lett, intok, endt] [token.LetT, token.InT, token.EndT] then none
              else do
                let letdecs ← ptree_LetDecs letdecs_pt
                let eseq ← ptree_Eseq ept
                let e ← Eseq_encode eseq
                some (letdecs.foldr
                  (fun df acc =>
                    match df with
                    | Sum.inl (p, e0) => letFromPat p e0 acc
                    | Sum.inr fds => exp.Letrec fds acc)
                  e)
          | _ => none
        else if nt == mkNT MMLnonT.nEapp then
          match subs with
          | [t1, t2] => do
              let a1 ← ptree_Expr MMLnonT.nEapp t1
              let a2 ← ptree_Expr MMLnonT.nEbase t2
              some (mkAst_App a1 a2)
          | [t] => ptree_Expr MMLnonT.nEbase t
          | _ => none
        else if nt == mkNT MMLnonT.nEtuple then
          match subs with
          | [lpart, el2, rpart] => do
              if !tokcheckl [lpart, rpart] [token.LparT, token.RparT] then none
              else do
                let es ← ptree_Exprlist MMLnonT.nElist2 el2
                some (exp.Con none es)
          | _ => none
        else if nt == mkNT MMLnonT.nEmult then
          match subs with
          | [t1, opt, t2] => do
              let a1 ← ptree_Expr MMLnonT.nEmult t1
              let a_op ← ptree_Op opt
              let a2 ← ptree_Expr MMLnonT.nEapp t2
              some (mk_binop a_op a1 a2)
          | [t] => ptree_Expr MMLnonT.nEapp t
          | _ => none
        else if nt == mkNT MMLnonT.nEadd then
          match subs with
          | [t1, opt, t2] => do
              let a1 ← ptree_Expr MMLnonT.nEadd t1
              let a_op ← ptree_Op opt
              let a2 ← ptree_Expr MMLnonT.nEmult t2
              some (mk_binop a_op a1 a2)
          | [t] => ptree_Expr MMLnonT.nEmult t
          | _ => none
        else if nt == mkNT MMLnonT.nElistop then
          match subs with
          | [t1, opt, t2] => do
              let a1 ← ptree_Expr MMLnonT.nEadd t1
              let a_op ← ptree_Op opt
              let a2 ← ptree_Expr MMLnonT.nElistop t2
              some (mk_binop a_op a1 a2)
          | [t] => ptree_Expr MMLnonT.nEadd t
          | _ => none
        else if nt == mkNT MMLnonT.nErel then
          match subs with
          | [t1, opt, t2] => do
              let a1 ← ptree_Expr MMLnonT.nErel t1
              let a_op ← ptree_Op opt
              let a2 ← ptree_Expr MMLnonT.nElistop t2
              some (mk_binop a_op a1 a2)
          | [t] => ptree_Expr MMLnonT.nElistop t
          | _ => none
        else if nt == mkNT MMLnonT.nEcomp then
          match subs with
          | [t1, opt, t2] => do
              let a1 ← ptree_Expr MMLnonT.nEcomp t1
              let a_op ← ptree_Op opt
              let a2 ← ptree_Expr MMLnonT.nErel t2
              some (mk_binop a_op a1 a2)
          | [t] => ptree_Expr MMLnonT.nErel t
          | _ => none
        else if nt == mkNT MMLnonT.nEbefore then
          match subs with
          | [t1, opt, t2] => do
              if !tokcheck opt (token.AlphaT (strlit "before".toList)) then none
              else do
                let a1 ← ptree_Expr MMLnonT.nEbefore t1
                let a2 ← ptree_Expr MMLnonT.nEcomp t2
                some (mk_binop (id.Short (strlit "before".toList)) a1 a2)
          | [t] => ptree_Expr MMLnonT.nEcomp t
          | _ => none
        else if nt == mkNT MMLnonT.nEtyped then
          match subs with
          | [e_pt, colon, ty_pt] => do
              if !tokcheck colon token.ColonT then none
              else do
                let e ← ptree_Expr MMLnonT.nEbefore e_pt
                let ty ← ptree_Type MMLnonT.nType ty_pt
                some (exp.Tannot e ty)
          | [t] => ptree_Expr MMLnonT.nEbefore t
          | _ => none
        else if nt == mkNT MMLnonT.nElogicAND then
          match subs with
          | [t1, andt, t2] => do
              if !tokcheck andt token.AndalsoT then none
              else do
                let a1 ← ptree_Expr MMLnonT.nElogicAND t1
                let a2 ← ptree_Expr MMLnonT.nEtyped t2
                some (exp.Log lop.Andalso a1 a2)
          | [t] => ptree_Expr MMLnonT.nEtyped t
          | _ => none
        else if nt == mkNT MMLnonT.nElogicOR then
          match subs with
          | [t1, ort, t2] => do
              if !tokcheck ort token.OrelseT then none
              else do
                let a1 ← ptree_Expr MMLnonT.nElogicOR t1
                let a2 ← ptree_Expr MMLnonT.nElogicAND t2
                some (exp.Log lop.Orelse a1 a2)
          | [t] => ptree_Expr MMLnonT.nElogicAND t
          | _ => none
        else if nt == mkNT MMLnonT.nEhandle then
          match subs with
          | [pt] => ptree_Expr MMLnonT.nElogicOR pt
          | [e1pt, handlet, ent] => do
              if !tokcheck handlet token.HandleT then none
              else do
                let e ← ptree_Expr MMLnonT.nElogicOR e1pt
                let pes ← ptree_PEs ent
                some (exp.Handle e pes)
          | _ => none
        else if nt == mkNT MMLnonT.nE then
          match subs with
          | [t] => ptree_Expr MMLnonT.nEhandle t
          | [raiset, ept] => do
              if !tokcheck raiset token.RaiseT then none
              else do
                let e ← ptree_Expr MMLnonT.nE ept
                some (exp.Raise e)
          | [fnt, pnt, arrowt, ent] =>
            (do
              if !tokcheckl [fnt, arrowt] [token.FnT, token.DarrowT] then none
              else do
                let p ← ptree_Pattern MMLnonT.nPattern pnt
                let e ← ptree_Expr MMLnonT.nE ent
                some (mkFun p e)) <|>
            (do
              if !tokcheckl [fnt, arrowt] [token.CaseT, token.OfT] then none
              else do
                let e ← ptree_Expr MMLnonT.nE pnt
                let pes ← ptree_PEs ent
                some (exp.Mat e pes))
          | [ift, g, thent, te, elset, ee] => do
              if !tokcheckl [ift, thent, elset] [token.IfT, token.ThenT, token.ElseT] then none
              else do
                let a1 ← ptree_Expr MMLnonT.nE g
                let a2 ← ptree_Expr MMLnonT.nE te
                let a3 ← ptree_Expr MMLnonT.nE ee
                some (exp.If a1 a2 a3)
          | _ => none
        else none
      else none)
      some (bind_loc e unknown_loc)

partial def ptree_Exprlist (nm : MMLnonT) : mlptree → Option (List exp)
  | parsetree.Lf _ => none
  | parsetree.Nd nt subs =>
    if nt == mkNT MMLnonT.nElist1 then
      match subs with
      | [sing] => do let e ← ptree_Expr MMLnonT.nE sing; some [e]
      | [e_pt, ct, el1] => do
          if !tokcheck ct token.CommaT then none
          else do
            let front ← ptree_Expr MMLnonT.nE e_pt
            let back ← ptree_Exprlist MMLnonT.nElist1 el1
            some (front :: back)
      | _ => none
    else if nt == mkNT MMLnonT.nElist2 then
      match subs with
      | [e_pt, ct, el1] => do
          if !tokcheck ct token.CommaT then none
          else do
            let front ← ptree_Expr MMLnonT.nE e_pt
            let back ← ptree_Exprlist MMLnonT.nElist1 el1
            some (front :: back)
      | _ => none
    else none

partial def ptree_AndFDecls : mlptree → Option (List (varN × varN × exp))
  | parsetree.Lf _ => none
  | parsetree.Nd nt subs =>
    if nt != mkNT MMLnonT.nAndFDecls then none
    else
      match subs with
      | [single] => do
          let fdec ← ptree_FDecl single
          some [fdec]
      | [fdecspt, andt, fdecpt] => do
          if !tokcheck andt token.AndT then none
          else do
            let fdecs ← ptree_AndFDecls fdecspt
            let fdec ← ptree_FDecl fdecpt
            some (fdecs ++ [fdec])
      | _ => none

partial def ptree_FDecl : mlptree → Option (varN × varN × exp)
  | parsetree.Lf _ => none
  | parsetree.Nd nt subs =>
    if nt != mkNT MMLnonT.nFDecl then none
    else
      match subs with
      | [fname_pt, pats_pt, eqt, body_pt] => do
          if !tokcheck eqt token.EqualsT then none
          else do
            let fname ← ptree_V fname_pt
            let ps ← ptree_PbaseList1 pats_pt
            let p1 ← ps.head?
            let body0 ← ptree_Expr MMLnonT.nE body_pt
            let rest := ps.tail
            let inner := rest.foldr mkFun body0
            some (fname, dePat p1 inner)
      | _ => none

partial def ptree_LetDecs : mlptree → Option (List (Sum (pat × exp) (List (varN × varN × exp))))
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nLetDecs then none
    else
      match args with
      | [] => some []
      | [ld_pt, lds_pt] =>
        if tokcheck ld_pt token.SemicolonT then ptree_LetDecs lds_pt
        else do
          let ld ← ptree_LetDec ld_pt
          let lds ← ptree_LetDecs lds_pt
          some (ld :: lds)
      | _ => none

partial def ptree_LetDec : mlptree → Option (Sum (pat × exp) (List (varN × varN × exp)))
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nLetDec then none
    else
      match args with
      | [funtok, andfdecls_pt] => do
          if !tokcheck funtok token.FunT then none
          else do
            let fds ← ptree_AndFDecls andfdecls_pt
            some (Sum.inr fds)
      | [valtok, p_pt, eqtok, e_pt] => do
          if !tokcheckl [valtok, eqtok] [token.ValT, token.EqualsT] then none
          else do
            let p ← ptree_Pattern MMLnonT.nPattern p_pt
            let e ← ptree_Expr MMLnonT.nE e_pt
            some (Sum.inl (p, e))
      | _ => none

partial def ptree_PEs : mlptree → Option (List (pat × exp))
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nPEs then none
    else
      match args with
      | [pattern_pt, arrow_pt, pe_pt] => do
          if !tokcheck arrow_pt token.DarrowT then none
          else do
            let pat' ← ptree_Pattern MMLnonT.nPattern pattern_pt
            let (e, pes) ← ptree_PE pe_pt
            some ((pat', e) :: pes)
      | _ => none

partial def ptree_PE : mlptree → Option (exp × List (pat × exp))
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nPE then none
    else
      match args with
      | [eorraise_pt, pesfx_pt] =>
        (do
          if !tokcheck eorraise_pt token.RaiseT then none
          else do
            let (e, pes) ← ptree_PE pesfx_pt
            some (exp.Raise e, pes)) <|>
        (do
          let e ← ptree_Expr MMLnonT.nElogicOR eorraise_pt
          let (handlep, pes) ← ptree_PEsfx pesfx_pt
          some (if handlep then (exp.Handle e pes, [])
                else (e, pes)))
      | [fncase_tok, epat_pt, arrowof_tok, last_pt] =>
        (do
          if !tokcheckl [fncase_tok, arrowof_tok] [token.FnT, token.DarrowT] then none
          else do
            let pat' ← ptree_Pattern MMLnonT.nPattern epat_pt
            let e ← ptree_Expr MMLnonT.nE last_pt
            some (mkFun pat' e, [])) <|>
        (do
          if !tokcheckl [fncase_tok, arrowof_tok] [token.CaseT, token.OfT] then none
          else do
            let e ← ptree_Expr MMLnonT.nE epat_pt
            let pes ← ptree_PEs last_pt
            some (exp.Mat e pes, []))
      | [iftok, ge_pt, thentok, then_pt, elsetok, else_pt] => do
          if !tokcheckl [iftok, thentok, elsetok] [token.IfT, token.ThenT, token.ElseT] then none
          else do
            let ge ← ptree_Expr MMLnonT.nE ge_pt
            let te ← ptree_Expr MMLnonT.nE then_pt
            let (ee, rest) ← ptree_PE else_pt
            some (exp.If ge te ee, rest)
      | _ => none

partial def ptree_PEsfx : mlptree → Option (Bool × List (pat × exp))
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nPEsfx then none
    else
      match args with
      | [] => some (false, [])
      | [handlebar_tok, pes_pt] =>
        (do
          if !tokcheck handlebar_tok token.HandleT then none
          else do
            let pes ← ptree_PEs pes_pt
            some (true, pes)) <|>
        (do
          if !tokcheck handlebar_tok token.BarT then none
          else do
            let pes ← ptree_PEs pes_pt
            some (false, pes))
      | _ => none

partial def ptree_Eseq : mlptree → Option (List exp)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nEseq then none
    else
      match args with
      | [single] => do
          let e ← ptree_Expr MMLnonT.nE single
          some [e]
      | [e_pt, semi, seq_pt] => do
          if !tokcheck semi token.SemicolonT then none
          else do
            let e ← ptree_Expr MMLnonT.nE e_pt
            let seq ← ptree_Eseq seq_pt
            some (e :: seq)
      | _ => none
end

theorem dumb1 : (p = q) = (q = p) := by sorry
theorem dumb2 : True := by sorry
theorem ptree_Expr_pevaled : True := by sorry
theorem ptree_Expr_others : True := by sorry

/-- Parse structure name -/
def ptree_StructName : mlptree → Option mlstring
  | parsetree.Lf _ => none
  | parsetree.Nd nm args =>
    if nm != mkNT MMLnonT.nStructName then none
    else
      match args with
      | [pt] => do
          let lf ← destLf pt
          let tk ← destTOK lf
          destAlphaT tk
      | _ => none

/-- Parse optional type equation -/
partial def ptree_OptTypEqn : mlptree → Option (Option ast_t)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nOptTypEqn then none
    else
      match args with
      | [] => some none
      | [eqtok, typ_pt] => do
          if !tokcheck eqtok token.EqualsT then none
          else do
            let typ ← ptree_Type MMLnonT.nType typ_pt
            some (some typ)
      | _ => none

/-- Parse spec line -/
partial def ptree_SpecLine : mlptree → Option Unit
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nSpecLine then none
    else
      match args with
      | [td_pt] => do
          let _ ← ptree_TypeDec td_pt
          some ()
      | [exntok, dcon_pt] => do
          if !tokcheck exntok token.ExceptionT then none
          else do
            let _ ← ptree_Dconstructor dcon_pt
            some ()
      | [typetok, tynm_pt, opteqn_pt] => do
          if !tokcheck typetok token.TypeT then none
          else do
            let _ ← ptree_TypeName tynm_pt
            let _ ← ptree_OptTypEqn opteqn_pt
            some ()
      | [valtok, vname_pt, coltok, type_pt] => do
          if !tokcheckl [valtok, coltok] [token.ValT, token.ColonT] then none
          else do
            let _ ← ptree_V vname_pt
            let _ ← ptree_Type MMLnonT.nType type_pt
            some ()
      | _ => none

/-- Parse spec line list -/
partial def ptree_SpeclineList : mlptree → Option Unit
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nSpecLineList then none
    else
      match args with
      | [] => some ()
      | [sl_pt, sll_pt] =>
        if tokcheck sl_pt token.SemicolonT then ptree_SpeclineList sll_pt
        else do
          let _ ← ptree_SpecLine sl_pt
          ptree_SpeclineList sll_pt
      | _ => none

/-- Parse signature value -/
partial def ptree_SignatureValue : mlptree → Option Unit
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nSignatureValue then none
    else
      match args with
      | [sigtok, sll_pt, endtok] => do
          if !tokcheckl [sigtok, endtok] [token.SigT, token.EndT] then none
          else ptree_SpeclineList sll_pt
      | _ => none

-- Mutually recursive declaration parsing
mutual
partial def ptree_Decl : mlptree → Option dec
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nDecl then none
    else
      match args with
      | [dt] =>
        (do
          let tydec ← ptree_TypeDec dt
          some (dec.Dtype unknown_loc tydec)) <|>
        (ptree_TypeAbbrevDec dt) <|>
        (ptree_Structure dt)
      | [funtok, fdecls] =>
        (do
          if !tokcheck funtok token.FunT then none
          else do
            let fdecs ← ptree_AndFDecls fdecls
            some (dec.Dletrec unknown_loc fdecs)) <|>
        (do
          if !tokcheck funtok token.ExceptionT then none
          else do
            let (enm, etys) ← ptree_Dconstructor fdecls
            some (dec.Dexn unknown_loc enm etys))
      | [valtok, patpt, eqtok, ept] => do
          if !tokcheckl [valtok, eqtok] [token.ValT, token.EqualsT] then none
          else do
            let pat' ← ptree_Pattern MMLnonT.nPattern patpt
            let e ← ptree_Expr MMLnonT.nE ept
            some (dec.Dlet unknown_loc pat' e)
      | [localtok, decls1_pt, intok, decls2_pt, endtok] => do
          if !tokcheckl [localtok, intok, endtok] [token.LocalT, token.InT, token.EndT] then none
          else do
            let decls1 ← ptree_Decls decls1_pt
            let decls2 ← ptree_Decls decls2_pt
            some (dec.Dlocal decls1 decls2)
      | _ => none

partial def ptree_Decls : mlptree → Option (List dec)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nDecls then none
    else
      match args with
      | [] => some []
      | [d_pt, ds_pt] =>
        if tokcheck d_pt token.SemicolonT then ptree_Decls ds_pt
        else do
          let d ← ptree_Decl d_pt
          let ds ← ptree_Decls ds_pt
          some (d :: ds)
      | _ => none

partial def ptree_Structure : mlptree → Option dec
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nStructure then none
    else
      match args with
      | [structuretok, sname_pt, asc_opt, eqtok, structtok, ds_pt, endtok] => do
          if !tokcheckl [structtok, structuretok, eqtok, endtok]
                        [token.StructT, token.StructureT, token.EqualsT, token.EndT] then none
          else do
            let sname ← ptree_StructName sname_pt
            let _asc ← match asc_opt with
              | parsetree.Lf _ => none
              | parsetree.Nd ascnt ascargs =>
                if ascnt != mkNT MMLnonT.nOptionalSignatureAscription then none
                else
                  match ascargs with
                  | [] => some none
                  | [sealtok, sig_pt] => do
                      if !tokcheck sealtok token.SealT then none
                      else do
                        let sigv ← ptree_SignatureValue sig_pt
                        some (some sigv)
                  | _ => none
            let ds ← ptree_Decls ds_pt
            some (dec.Dmod sname ds)
      | _ => none
end

-- Parse top-level declarations
mutual
partial def ptree_TopLevelDecs : mlptree → Option (List dec)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nTopLevelDecs then none
    else
      match args with
      | [] => some []
      | [td_pt, tds_pt] =>
        if tokcheck td_pt token.SemicolonT then ptree_TopLevelDecs tds_pt
        else do
          let td ← ptree_Decl td_pt
          let tds ← ptree_NonETopLevelDecs tds_pt
          some (td :: tds)
      | [e_pt, semitok, tds_pt] => do
          if !tokcheck semitok token.SemicolonT then none
          else do
            let e ← ptree_Expr MMLnonT.nE e_pt
            let tds ← ptree_TopLevelDecs tds_pt
            some (dec.Dlet unknown_loc (pat.Pvar (strlit "it".toList)) e :: tds)
      | _ => none

partial def ptree_NonETopLevelDecs : mlptree → Option (List dec)
  | parsetree.Lf _ => none
  | parsetree.Nd nt args =>
    if nt != mkNT MMLnonT.nNonETopLevelDecs then none
    else
      match args with
      | [] => some []
      | [pt1, pt2] =>
        if tokcheck pt1 token.SemicolonT then ptree_TopLevelDecs pt2
        else do
          let td ← ptree_Decl pt1
          let tds ← ptree_NonETopLevelDecs pt2
          some (td :: tds)
      | _ => none
end

end CakeML
