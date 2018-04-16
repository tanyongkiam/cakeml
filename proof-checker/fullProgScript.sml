open preamble ml_progLib ml_translatorLib
open proofCheckerProgTheory
open ml_translatorTheory ml_translatorLib
open proofCheckerTheory
open basisFunctionsLib

val _ = new_theory "fullProg";

val _ = translation_extends "proofCheckerProg";

local
  val ths = ml_translatorLib.eq_lemmas();
in
  fun find_equality_type_thm tm =
    first (can (C match_term tm) o rand o snd o strip_imp o concl) ths
end;

val EqualityType_PROOFCHECKER_VARS_TYPE = find_equality_type_thm``PROOFCHECKER_VARS_TYPE``;
val EqualityType_WORD = find_equality_type_thm``WORD``;

val PROOFCHECKER_TRM_TYPE_no_closures = Q.prove(
  `∀a b c.
  EqualityType a ⇒
  PROOFCHECKER_TRM_TYPE a b c ⇒ no_closures c`,
  ho_match_mp_tac PROOFCHECKER_TRM_TYPE_ind \\
  rw[PROOFCHECKER_TRM_TYPE_def] \\
  rw[no_closures_def] \\
    TRY (
    qmatch_assum_rename_tac`LIST_TYPE _ x y` \\
    qhdtm_x_assum`LIST_TYPE`mp_tac \\
    last_x_assum mp_tac \\
    map_every qid_spec_tac[`y`,`x`] \\
    Induct \\ rw[LIST_TYPE_def] \\
    rw[no_closures_def] \\
    metis_tac[] ) \\
  fs[EqualityType_def] \\ TRY (metis_tac[]) \\
  metis_tac[EqualityType_def,EqualityType_PROOFCHECKER_VARS_TYPE,EqualityType_WORD]);

val ctor_same_type_def = semanticPrimitivesTheory.ctor_same_type_def;

val PROOFCHECKER_TRM_TYPE_types_match = Q.prove(
  `∀a b c d e.
  EqualityType a ⇒
  PROOFCHECKER_TRM_TYPE a b c ∧ PROOFCHECKER_TRM_TYPE a d e ⇒ types_match c e`,
  ho_match_mp_tac PROOFCHECKER_TRM_TYPE_ind\\
  rw[PROOFCHECKER_TRM_TYPE_def] \\
  Cases_on`d`>> fs[PROOFCHECKER_TRM_TYPE_def] \\
  fs[types_match_def,ctor_same_type_def] \\ rw[] \\
  TRY (
    qmatch_assum_rename_tac`LIST_TYPE _ x1 y1` >>
    qhdtm_x_assum`LIST_TYPE`mp_tac >>
    qmatch_assum_rename_tac`LIST_TYPE _ x2 y2` >>
    qhdtm_x_assum`LIST_TYPE`mp_tac >>
    last_x_assum mp_tac >>
    rpt(pop_assum kall_tac) >>
    map_every qid_spec_tac[`y2`,`x2`,`y1`,`x1`] >>
    Induct >> simp[LIST_TYPE_def,PULL_EXISTS,types_match_def,ctor_same_type_def]
    >-
      (Cases >> simp[LIST_TYPE_def,PULL_EXISTS,types_match_def,ctor_same_type_def])
    >>
    qx_gen_tac`p` >>
    gen_tac >> Cases >> simp[PULL_EXISTS,LIST_TYPE_def] >>
    rw[types_match_def,ctor_same_type_def] >>
    PROVE_TAC[EqualityType_def] ) >>
  metis_tac[EqualityType_def,EqualityType_PROOFCHECKER_VARS_TYPE,EqualityType_WORD]);

val PROOFCHECKER_TRM_TYPE_11 = Q.prove(
  `∀a b c d e.
  EqualityType a ⇒
  PROOFCHECKER_TRM_TYPE a b c ∧ PROOFCHECKER_TRM_TYPE a d e ⇒ (b=d ⇔ c=e)`,
  ho_match_mp_tac PROOFCHECKER_TRM_TYPE_ind >>
  rw[PROOFCHECKER_TRM_TYPE_def]>>
  Cases_on`d`>> fs[PROOFCHECKER_TRM_TYPE_def] \\ rw[EQ_IMP_THM] \\
  TRY (
    qmatch_assum_rename_tac`LIST_TYPE _ x y1` >>
    qhdtm_x_assum`LIST_TYPE`mp_tac >>
    qmatch_assum_rename_tac`LIST_TYPE _ x y2` >>
    qhdtm_x_assum`LIST_TYPE`mp_tac >>
    last_x_assum mp_tac >>
    rpt(pop_assum kall_tac) >>
    map_every qid_spec_tac[`y2`,`y1`,`x`] >>
    Induct >> simp[LIST_TYPE_def,PULL_EXISTS] >>
    rw[] >>
    metis_tac[]) >>
  TRY (
    qmatch_assum_rename_tac`LIST_TYPE _ x1 y` >>
    qhdtm_x_assum`LIST_TYPE`mp_tac >>
    qmatch_assum_rename_tac`LIST_TYPE _ x2 y` >>
    qhdtm_x_assum`LIST_TYPE`mp_tac >>
    last_x_assum mp_tac >>
    rpt(pop_assum kall_tac) >>
    map_every qid_spec_tac[`y`,`x1`,`x2`] >>
    Induct >> simp[LIST_TYPE_def,PULL_EXISTS] >- (
      Cases \\ rw[LIST_TYPE_def] ) \\
    gen_tac \\ Cases \\ rw[LIST_TYPE_def] >>
    metis_tac[]) >>
  metis_tac[EqualityType_def,EqualityType_PROOFCHECKER_VARS_TYPE,EqualityType_WORD]);

val EqualityType_PROOFCHECKER_TRM_TYPE = Q.store_thm("EqualityType_PROOFCHECKER_TRM_TYPE",
  `EqualityType a ⇒
  EqualityType (PROOFCHECKER_TRM_TYPE a)`,
  metis_tac[EqualityType_def,PROOFCHECKER_TRM_TYPE_11,
    PROOFCHECKER_TRM_TYPE_no_closures, PROOFCHECKER_TRM_TYPE_types_match])|> store_eq_thm

(* Concrete instantiations and pretty printing *)
val fu_inst_def = Define`
  fu_inst = fin_univ varls varls`

val fu_inst_def = Define`
  fu_inst = fin_univ varls varls`

val ids_loc_inst_def = Define`
  ids_loc_inst =
  ids_loc
  i01 i02 i03 (\x. x = i01)
  i01 i02 i03
  i01 i02 i03 i04`

val var_to_str_def = Define`
  (var_to_str i01 = strlit"i01") ∧
  (var_to_str i02 = strlit"i02") ∧
  (var_to_str i03 = strlit"i03") ∧
  (var_to_str i04 = strlit"i04") ∧
  (var_to_str i05 = strlit"i05") ∧
  (var_to_str i06 = strlit"i06") ∧
  (var_to_str i07 = strlit"i07") ∧
  (var_to_str i08 = strlit"i08") ∧
  (var_to_str i09 = strlit"i09") ∧
  (var_to_str i10 = strlit"i10") ∧
  (var_to_str i11 = strlit"i11") ∧
  (var_to_str i12 = strlit"i12") ∧
  (var_to_str i13 = strlit"i13") ∧
  (var_to_str i14 = strlit"i14") ∧
  (var_to_str i15 = strlit"i15") ∧
  (var_to_str i16 = strlit"i16") ∧
  (var_to_str i17 = strlit"i17") ∧
  (var_to_str i18 = strlit"i18") ∧
  (var_to_str i19 = strlit"i19") ∧
  (var_to_str i20 = strlit"i20") ∧
  (var_to_str i21 = strlit"i21") ∧
  (var_to_str i22 = strlit"i22") ∧
  (var_to_str i23 = strlit"i23") ∧
  (var_to_str i24 = strlit"i24") ∧
  (var_to_str i25 = strlit"i25") ∧
  (var_to_str i26 = strlit"i26") ∧
  (var_to_str i27 = strlit"i27") ∧
  (var_to_str i28 = strlit"i28") ∧
  (var_to_str i29 = strlit"i29") ∧
  (var_to_str i30 = strlit"i30") ∧
  (var_to_str i31 = strlit"i31") ∧
  (var_to_str i32 = strlit"i32") ∧
  (var_to_str i33 = strlit"i33")`

val MEM_trm_size = Q.prove(`
  ∀ls a.
  MEM a ls ⇒
  trm_size f a < trm1_size f ls`,
  Induct>>rw[]>>EVAL_TAC>>fs[]>>
  first_x_assum drule>>fs[]);

val const_to_str_def = Define`
  const_to_str (w:word32) = (toString (w2i w))`

val brack_def = Define`
  brack str = concat [strlit"("; str ; strlit")"]`

val brace_def = Define`
  brace str = concat [strlit"{"; str ; strlit"}"]`

val trm_to_str_def = tDefine "trm_to_str"`
  (trm_to_str (Var x) = var_to_str x) ∧
  (trm_to_str (Const r) = const_to_str r) ∧
  (trm_to_str (Function f args) = brack (concat [var_to_str f; brack(concatWith (strlit ",") (MAP trm_to_str (FILTER (λt.t ≠ Const 0w) args)))])) ∧
  (trm_to_str (Functional f) = concat [var_to_str f; strlit "(||)"]) ∧
  (trm_to_str (Plus t1 t2) = brack(concat [trm_to_str t1; strlit "+" ; trm_to_str t2])) ∧
  (trm_to_str (Times t1 t2) = brack(concat [trm_to_str t1; strlit "*" ; trm_to_str t2])) ∧
  (trm_to_str (Max t1 t2) = concat [strlit"Max("; trm_to_str t1; strlit "," ; trm_to_str t2; strlit")"]) ∧
  (trm_to_str (Min t1 t2) = concat [strlit"Min("; trm_to_str t1; strlit "," ; trm_to_str t2; strlit")"]) ∧
  (trm_to_str (Abs t1) = concat [strlit"Abs("; trm_to_str t1;strlit")"]) ∧
  (trm_to_str (Neg t1) = concat [strlit"-"; brack(trm_to_str t1)]) ∧
  (trm_to_str (DiffVar x) = concat [strlit"Dv"; brace(var_to_str x)]) ∧
  (trm_to_str (Differential t) = concat[strlit "D"; brace(trm_to_str t)])`
  (WF_REL_TAC `measure (trm_size ARB)`>>fs[]>>
  rw[]>>
  fs[MEM_FILTER]>>
  imp_res_tac MEM_trm_size>>
  EVAL_TAC>>
  pop_assum (qspec_then `ARB` assume_tac)>>fs[]);

val ode_to_str_def = Define`
  (ode_to_str (OVar x sp) =
    concat [var_to_str x;
    case sp of NONE => strlit"NONE"
    |  SOME y => concat[strlit"SOME"; brack(var_to_str y)]]) ∧
  (ode_to_str (OSing x t) =
    concat [strlit"d"; var_to_str x ; strlit"="; trm_to_str t]) ∧
  (ode_to_str (OProd ODE1 ODE2) =
    concat [ode_to_str ODE1; strlit"," ;ode_to_str ODE2])`

val hp_to_str_def = Define`
  (hp_to_str (Pvar a) = var_to_str a) ∧
  (hp_to_str (Assign x e) = concat[var_to_str x ; strlit":=" ; trm_to_str e]) ∧
  (hp_to_str (AssignAny x) = concat[var_to_str x ; strlit":=* "]) ∧
  (hp_to_str (DiffAssign x e) = concat[strlit"D" ; brace(var_to_str x) ; strlit":=" ; trm_to_str e]) ∧
  (hp_to_str (Test p) = concat[strlit "?" ; fml_to_str p]) ∧
  (hp_to_str (EvolveODE ODE p) = brace(concat[ode_to_str ODE ; strlit"&" ; fml_to_str p])) ∧
  (hp_to_str (Choice a b) = brace(concat[hp_to_str a ; strlit"U" ; hp_to_str b])) ∧
  (hp_to_str (Sequence a b) = brace(concat[hp_to_str a ; strlit";" ; hp_to_str b])) ∧
  (hp_to_str (Loop a) = concat[brace(hp_to_str a) ; strlit"*"]) ∧
  (fml_to_str (Geq t1 t2) = concat[trm_to_str t1 ; strlit">=" ; trm_to_str t2]) ∧
  (fml_to_str (Prop p args) =
  concat [var_to_str p; brack(concatWith (strlit ",") (MAP trm_to_str (FILTER (λt.t ≠ Const 0w) args)))]) ∧
  (fml_to_str (Not p) = concat[strlit"!" ; brack(fml_to_str p)]) ∧
  (fml_to_str (And p q) = brack(concat[fml_to_str p ; strlit"&" ; fml_to_str q])) ∧
  (fml_to_str (Exists x p) = concat[strlit"E" ; var_to_str x ;strlit " . " ; brack(fml_to_str p)]) ∧
  (fml_to_str (Diamond a p) = concat[strlit"<" ; hp_to_str a ; strlit">" ; brack(fml_to_str p)]) ∧
  (fml_to_str (InContext C p) = concat [var_to_str C ; brack(fml_to_str p)])`

val seq_to_str_def = Define`
  seq_to_str (A,S) =
    concat [concatWith (strlit", ") (MAP fml_to_str A); strlit" |- "; concatWith (strlit", ") (MAP fml_to_str S)]`

val rule_to_str_def = Define`
  rule_to_str (SG,C) =
    concat[concatWith (strlit ";;  ") (MAP seq_to_str SG);
           strlit"            "; seq_to_str C]`

val pt_result_full_def = Define`
  pt_result_full pt =
  case pt_result fu_inst ids_loc_inst pt of
    NONE => NONE
  | SOME r => SOME (rule_to_str r)`

val res = translate fu_inst_def;
val res = translate ids_loc_inst_def;
val res = translate var_to_str_def;
val res = translate const_to_str_def;
val res = translate brack_def;
val res = translate brace_def;
val res = translate trm_to_str_def;
val res = translate ode_to_str_def
val res = translate hp_to_str_def
val res = translate seq_to_str_def
val res = translate rule_to_str_def

val res = translate pt_result_full_def;

val ML_code_prog =
  get_ml_prog_state ()
  |> clean_state |> remove_snocs
  |> get_thm

val prog = ML_code_prog |> concl |> strip_comb |> #2 |> el 3

(* print to file
open astPP2;

val _ = astPP2.enable_astPP()

val _ = trace("pp_avoids_symbol_merges",0)

val t = TextIO.openOut("pt_result_full.sml")
val _ = TextIO.output(t,term_to_string prog)
val _ = TextIO.closeOut(t)
val _ = astPP2.disable_astPP()
*)

(* Now we add parser and File I/O *)
val parser = (cfTacticsLib.parse_topdecs) `

  exception Fail of string;
  exception ParseException of int
  type ('a,'b) subst = ('a,'b) proofChecker_subst

  type vars = proofChecker_vars
  type space = proofChecker_vars option
  type 'a trm = 'a proofChecker_trm
  type 'a ODE = 'a proofChecker_ODE
  type ('a,'b) hp = ('a,'b) proofChecker_hp
  type ('a,'b) formula = ('a,'b) proofChecker_formula
  type ('a,'b) rrule = ('a,'b) proofChecker_rrule
  type ('a,'b) lrule = ('a,'b) proofChecker_lrule
  type axRule = proofChecker_axRule
  type axiom = proofChecker_axiom

  type ('a,'b) sequent =  ('a,'b) proofChecker_formula list * ('a,'b) proofChecker_formula list
  type ('a,'b) rule = ('a,'b) sequent list * ('a,'b) sequent





  fun sub x y = String.sub x y
  fun  size x = String.size x

  fun repeat (x) (i) = List.tabulate i (fn _ => x)
  val num_IDS = List.length proofchecker_varls




  fun subst_of_tuple (
  a
  ,b
  ,c
  ,d
  ,e
  ,f
  ) =
  Recordtypesubst a b c d e f

    type ('a,'b) map = 'a -> 'b

    fun map_of_alist (l) eq tostr =
        let
      fun loop f l  =
          case l of
        [] => f
      | (x,y)::xs =>
        let
            val junk = (loop f xs)
        in
            (fn z => if eq x z then y else junk z)
        end
        in
      loop (fn x => raise Fail ("bad map lookup for" ^ (tostr x))) l
        end


  fun fun_of_map m = m
    type 'a parse = ((string * int) -> ('a* int))
    val tOKEN_CAPACITY = 20


  fun isAlphaNum c =
  let val or = Char.ord c in
  (or >= 48 andalso or <= 57)
  orelse (or >= 65 andalso or <= 90)
  orelse (or >= 97 andalso or <= 122)
  end

    fun alphanum(str, i) = (
  let
      val len = size str
      val j = ref i
      fun alphanumloop (s, i, acc) =
      let val c = sub s i in
       if isAlphaNum c
       then alphanumloop (s, i+1, c::acc)
       else (String.implode (List.rev acc),i)
      end
  in
   alphanumloop(str, i, [])
  end
    )

    fun eatSym(lit)= (fn (str:string,i:int) =>
  let
      val len = size str
      val j = ref i
      fun symLoop (lit, s, i) =
      case lit of
        [] => ((), i)
      | c::cs =>
      let val d = sub s i in
       if d = c
       then symLoop (cs, s, i+1)
       else raise ParseException i
      end
  in
   symLoop(String.explode lit,str,i)
  end
    )

    fun idMap x = map_of_alist[
      ("i01",I01),
      ("i02",I02),
      ("i03",I03),
      ("i04",I04),
      ("i05",I05),
      ("i06",I06),
      ("i07",I07),
      ("i08",I08),
      ("i09",I09),
      ("i10",I10),
      ("i11",I11),
      ("i12",I12),
      ("i13",I13),
      ("i14",I14),
      ("i15",I15),
      ("i16",I16),
      ("i17",I17),
      ("i18",I18),
      ("i19",I19),
      ("i20",I20),
      ("i21",I21),
      ("i22",I22),
      ("i23",I23),
      ("i24",I24),
      ("i25",I25),
      ("i26",I26),
      ("i27",I27),
      ("i28",I28),
      ("i29",I29),
      ("i30",I30),
      ("i31",I31),
      ("i32",I32),
      ("i33",I33)
    ]
  (fn x => fn y => x = y)
  (fn x => x)
  x

    fun intOfId x = map_of_alist[
      (I01,0),
      (I02,1),
      (I03,2),
      (I04,3),
      (I05,4),
      (I06,5),
      (I07,6),
      (I08,7),
      (I09,8),
      (I10,9),
      (I11,10),
      (I12,11),
      (I13,12),
      (I14,13),
      (I15,14),
      (I16,15),
      (I17,16),
      (I18,17),
      (I19,18),
      (I20,19),
      (I21,20),
      (I22,21),
      (I23,22),
      (I24,23),
      (I25,24),
      (I26,25),
      (I27,26),
      (I28,27),
      (I29,28),
      (I30,29),
      (I31,30),
      (I32,31),
      (I33,32)
  ]
  (fn x => fn y => x = y)
  (fn x => Int.toString((proofchecker_var_to_el x)+1))
  x


    fun eatChar(str,i,c) = (
      if(sub str i <> c) then (
        raise ParseException i
      )
      else
    i+1
    )


    fun p0(f0) =(fn (str,i) =>
  case f0(str,eatChar(str,i,#"(")) of
   (res,j) =>
      let
    val k = eatChar(str,j,#")")
      in (res,k)
      end
    )


  fun fst (x,y) = x
  fun snd (x,y) = y

    fun p1(f1,f2) =(fn (str,i) =>
      let
      val j1 = eatChar(str,i,#"(")
      val r1 = f1(str,j1)
      val j3 = eatChar(str,snd r1,#" ")
      val r2 = f2(str,j3)
      val j5 = eatChar(str,snd r2,#")")
      in ((fst r1,fst r2),j5) end
    )


    fun p2(f1,f2,f3) =(fn (str,i) =>
  let    val j1 = eatChar(str,i,#"(")
      val r1 = f1(str,j1)
      val j3 = eatChar(str,snd r1,#" ")
      val r2 = f2(str,j3)
      val j5 = eatChar(str,snd r2,#" ")
      val r3 = f3(str,j5)
      val j7 = eatChar(str,snd r3,#")")
  in    ((fst r1,fst r2,fst r3),j7)end
    )

    fun p3(f1,f2,f3,f4) =(fn (str,i) =>
  let    val j1 = eatChar(str,i,#"(")
      val r1 = f1(str,j1)
      val j3 = eatChar(str,snd r1,#" ")
      val r2 = f2(str,j3)
      val j5 = eatChar(str,snd r2,#" ")
      val r3 = f3(str,j5)
      val j7 = eatChar(str,snd r3,#" ")
      val r4 = f4(str,j7)
      val j9 = eatChar(str,snd r4,#")")
  in    ((fst r1,fst r2,fst r3,fst r4),j9)end
    )

    fun p6(f1,f2,f3,f4,f5,f6,f7) = (fn (str,i) =>
  let    val j1 = eatChar(str,i,#"(")
      val r1 = f1(str,j1)
      val j3 = eatChar(str,snd r1,#" ")
      val r2 = f2(str,j3)
      val j5 = eatChar(str,snd r2,#" ")
      val r3 = f3(str,j5)
      val j7 = eatChar(str,snd r3,#" ")
      val r4 = f4(str,j7)
      val j9 = eatChar(str,snd r4,#" ")
      val r5 = f5(str,j9)
      val j11 = eatChar(str,snd r5,#" ")
      val r6 = f6(str,j11)
      val j13 = eatChar(str,snd r6,#" ")
      val r7 = f7(str,j13)
      val j15 = eatChar(str,snd r7,#")")
  in    ((fst r1,fst r2,fst r3,fst r4,fst r5,fst r6,fst r7),j15)end
    )

    fun p7(f1,f2,f3,f4,f5,f6,f7,f8) =(fn (str,i) =>
  let    val j1 = eatChar(str,i,#"(")
      val r1 = f1(str,j1)
      val j3 = eatChar(str,snd r1,#" ")
      val r2 = f2(str,j3)
      val j5 = eatChar(str,snd r2,#" ")
      val r3 = f3(str,j5)
      val j7 = eatChar(str,snd r3,#" ")
      val r4 = f4(str,j7)
      val j9 = eatChar(str,snd r4,#" ")
      val r5 = f5(str,j9)
      val j11 = eatChar(str,snd r5,#" ")
      val r6 = f6(str,j11)
      val j13 = eatChar(str,snd r6,#" ")
      val r7 = f7(str,j13)
      val j15 = eatChar(str,snd r7,#" ")
      val r8 = f8(str,j15)
      val j17 = eatChar(str,snd r8,#")")
  in    ((fst r1,fst r2,fst r3,fst r4,fst r5,fst r6,fst r7,fst r8),j17)end
    )



    fun mv (str,i) =
  let
      val r1 = alphanum(str,i)
      val ident = fst r1
      val j = snd r1
  in
      (idMap ident,j)
  end

    fun space  (str,i) =
      if(sub str i = #"(") then (
        let
        val r1 = p1(eatSym("NB"), mv)(str,i)
        val elem = snd (fst r1)
        val j2 = snd r1
        in
        (SOME(elem),j2) end
      ) else (
        let val r2 = eatSym("All")(str,i) in
        (NONE,snd r2) end
      )


    fun unit (str,i) =
      eatSym("()")(str,i)


    fun sum (l,r)  (str,i) =
      let
      val j2 = eatChar(str,i,#"(")
      val r1 = alphanum(str,j2)
      val ident = fst r1
      val j3 = snd r1
      val j4 = eatChar(str,j3,#" ")
      val rMain =
    case ident of
          "Inl" =>
            let val r1 = l(str,j4)
  val lres = fst r1
  val j5 = snd r1
  in          (Inl(lres),j5) end
          |  "Inr" =>
            let val r2 = r(str,j4)
  val rres = fst r2
  val j5 = snd r2
  in
            (Inr(rres),j5) end
      val res = fst rMain
      val beforeParen = snd rMain
      val j6 = eatChar(str,beforeParen,#")")
      in (res,j6) end


    fun option t (str, i) =
      if(sub str i = #"(") then (
        let
      val r1 = p1(eatSym("Some"), t)(str,i)
      val elem = snd (fst r1)
      val j2 = snd r1
        in (SOME(elem),j2) end
      ) else (
        let val r1 = eatSym("None")(str,i)
        val ident = fst r1
        val j2 = snd r1
        in (NONE,j2) end
      )

  val ptup = p1


    fun axMap x = map_of_alist [
      ("AloopIter",Aloopiter),
      ("AI",Ai),
      ("Atest",Atest),
      ("Abox",Abox),
      ("Achoice",Achoice),
      ("AK",Ak),
      ("AV",Av),
      ("Aassign",Aassign),
      ("Aassignany", Aassignany),
      ("Adassign",Adassign),
      ("Advar",Advar),
      ("AdConst",Adconst),
      ("AdPlus",Adplus),
      ("AdMult",Admult),
      ("ADW",Adw),
      ("ADE",Ade),
      ("ADC",Adc),
      ("ADS",Ads),
      ("AEquivReflexive",Aequivreflexive),
      ("ADiffEffectSys",Adiffeffectsys),
      ("AAllElim",Aallelim),
      ("ADiffLinear",Adifflinear),
      ("ABoxSplit",Aboxsplit),
      ("AImpSelf",Aimpself),
      ("Acompose",Acompose),
      ("AconstFcong",Aconstfcong),
      ("AassignEq",Aassigneq),
      ("AdMinus",Adminus),
      ("AallInst",Aallinst),
      ("AequalCommute", Aequalcommute),
      ("ATrueImply", Atrueimply),
      ("Adiamond", Adiamond),
      ("AdiamondModusPonens", Adiamondmodusponens),
      ("AequalRefl",Aequalrefl),
      ("AlessEqualRefl",Alessequalrefl),
      ("Aassignd",Aassignd),
      ("Atestd",Atestd),
      ("Achoiced",Achoiced),
      ("Acomposed",Acomposed),
      ("Arandomd",Arandomd)
    ]
  (fn x => fn y => x = y)
  (fn x => x)
  x


    fun axiom (str,i)  =
  let
      val r1 =p0(alphanum)(str,i)
      val axname = fst r1
      val j = snd r1
      val ax = axMap(axname)
  in    (ax,j)
  end


  fun  axruleMap x = map_of_alist[
      ("CQ",Cq),
      ("CE",Ce),
      ("G",G),
      ("monb",Monb)]
  (fn x => fn y => x = y)
  (fn x => x)
    x

    fun axrule (str,i) =
  let    val r1 = p0(alphanum)(str,i)
  val axname = fst r1
  val j = snd r1
      val ax = axruleMap(axname)
  in    (ax,j)end


  fun valOf x = case x of SOME y => y | NONE => raise Fail "opt"
  fun natLit  (str,i) =
  let
  val r1 =  alphanum(str,i)
  val nstr = fst r1
  val j = snd r1
  in    (valOf (Int.fromString nstr), j)end

  fun nat (str,i) =
  let
  val r1 = p1(eatSym("Nata"),natLit)(str,i)
  val n = snd (fst r1)
  val j = snd r1
  in    ((n), j)end


  fun intLit (str,i) =
      if(sub str i = #"-") then (
  let
  val r1 = natLit(str,i+1)
  val n = fst r1
  val j = snd r1
  in      (~n,j)end
      ) else (
        natLit(str,i)
      )


  fun int (str,i) =
  let    val r1= p1(eatSym("int_of_integer"),intLit)(str,i)
  val n = snd (fst r1)
  val j = snd r1
  in    ((n), j)end


  fun rat (str,i) =
  let    val r1  = p1(eatSym("Worda"),int)(str,i)
  val numm = snd (fst r1)
  val j = snd r1
  in    (numm,j)
  end


    fun real(str, i) =
  let    val r1 = p1(eatSym("Abs_bword"),rat)(str,i)
  val ratt = snd (fst r1)
  val j = snd r1
  in    ((ratt),j)
  end

     fun zc() = Const (Word64.fromInt 0)

  fun loop p f = if p() then (f(); loop p f) else ()


    fun list (p)  (str, i) =
      let
      val iList = eatChar(str,i,#"(")
      fun theLoop (str,j) acc =
    if sub str j <> #")" then
        let
      val r1 = p(str,j)
      val elem = fst r1
      val j1 = snd r1
        in
      theLoop (str,if(sub str j1 = #" ") then (j1 + 1) else j1) (elem::acc)
        end
    else (j, List.rev acc)
      val mainR = theLoop (str,iList) []
      in
    (snd mainR, eatChar (str,fst mainR,#")"))
      end


    fun noneElse(p) (str,i) =
      if(i+1 < size str andalso sub str i  = #"n" andalso sub str (i+1) = #"s") then (
        ((fn x => NONE), i+2)
      ) else (
        p(str,i)
      )



    fun bff(p)  (str,i) =
  let    val r1 = list(p)(str,i)
  val l = fst r1
  val j1 = snd r1
  in((fn e => List.nth l (fun_of_map intOfId e)),j1)
  end




    fun bfl(p) (str,i) =
  let    val r1 = list(p)(str,i)
  val l = fst r1
  val j1 =snd r1
  in
      (
  l
  ,j1)end

    fun emptyElseL(base, p,l) = (fn (str,i) =>
      if(sub str i = #"e") then (
        if(i+2 < size str andalso sub str (i+1) = #"s" andalso sub str (i+2) = #"t") then (
          (repeat base num_IDS, i+3)
        ) else (repeat base num_IDS,i+1)
      ) else if (i+1 < size str andalso sub str i = #"(" andalso sub str (i+1) = #"s") then (
  let      val j1 =  if(i+3 < size str andalso sub str (i+2) = #"s" andalso sub str (i+3) = #"t") then (i+4) else i+2
        val j2 = eatChar(str,j1,#" ")
        val r1 = p(str,j2)
        val elem = fst r1
        val j3  = snd r1
        val j4 = eatChar(str,j3,#")")
  in      (
  elem :: (repeat base (num_IDS-1)),j4) end
      ) else (
        l(str,i)
      )
    )


    fun trm(id)  (str,i) =
      if (sub str i = #"z") then (
        if(i+2 < size str andalso sub str (i+1) = #"s" andalso sub str (i+2) = #"t") then (
          (zc(),i+3)
        ) else (
          (zc(),i+1)
        )
      ) else (
    let
        val j1 = eatChar(str, i, #"(")
        val r1 = alphanum(str, j1)
        val con = fst r1
        val j2 = snd r1
        val j3 = eatChar(str, j2, #" ")
        val mainR =
          (case con of
             "Var" =>
       let
                 val r1 = mv(str,j3)
           val r = fst r1
           val j4 = snd r1
       in
                 (Var(r),j4)
       end
            | "Const" =>
        let
      val r1 = int(str,j3)
      val r = fst r1
      val j4 = snd r1
        in
      (Const(Word64.fromInt (r*4294967296)),j4)
        end
            | "z" => (zc(),j3)
            | "Function" =>
        let
      val r1 = id(str,j3)
      val name = fst r1
      val j4 = snd r1
      val j5 = eatChar(str,j4, #" ")
      val r2 = emptyElseL(Const (Word64.fromInt 0),trm(id),bfl(trm(id))) (str,j5)
      val args = fst r2
      val j6 = snd r2
        in
      (Function name args , j6)
        end
            | "Functional" =>
        let
      val r1 =  id(str,j3)
      val name = fst r1
      val j4 = snd r1
        in
      (Functional(name),j4)
        end
            | "Plus" =>
        let
      val r1 = trm(id)(str,j3)
      val left = fst r1 val j4 = snd r1
      val j5 = eatChar(str,j4,#" ")
      val r2 = trm(id)(str,j5)
      val right = fst r2
      val j6 = snd r2
        in
      (Plus left right ,j6)
        end
            | "Neg" =>
        let
      val r1 = trm(id)(str,j3)
      val left = fst r1 val j4 = snd r1
        in
      (Neg left ,j4)
        end
            | "Times" =>
        let
      val r1 = trm(id)(str,j3)
      val left = fst r1 val  j4 = snd r1
      val j5 = eatChar(str,j4,#" ")
      val r2 = trm(id)(str,j5)
      val right = fst r2 val j6 = snd r2
        in
      (Times left right,j6)
        end
            | "Differential" =>
        let
      val r1 = trm(id)(str,j3)
      val child = fst r1  val j4 = snd r1
        in
      (Differential(child),j4)
        end
            | "DiffVar" =>
        let
      val r1 = mv(str,j3)
      val name = fst r1
      val  j4 = snd r1
        in
      (Diffvar(name),j4)
        end
  | rest => (print("Unknown constructor " ^ rest ^ " at " ^ (Int.toString j3) ^ "\n"); raise ParseException j3)

          )
        val res = fst mainR
        val beforeParen = snd mainR
        val iEnd = eatChar(str,beforeParen,#")")
    in
        (res,iEnd)
    end
      )

    fun ode(fid)  (str,i) =
        let
      val j1 = eatChar(str,i,#"(")
      val r1 = alphanum(str,j1)
      val con = fst r1
      val j2 = snd r1
      val j3 = eatChar(str, j2, #" ")
      val mainR =
        (case con of
           "OVar" =>
     let
         val r1     = mv(str,j3)
         val c = fst r1
         val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = space(str,j5)
      val sp = fst r2
      val j6 = snd r2
  in          (Ovar c sp,j6)
  end        | "OSing" =>
  let          val r1 = mv(str,j3)
         val x = fst r1
         val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = trm(fid)(str,j5)
  val t = fst r2 val j6 = snd r2
  in          (Osing x t,j6)
  end        | "OProd" =>
  let          val r1 = ode(fid)(str,j3)
         val ode1 = fst r1
         val j4 = snd r1
               val j5 = eatChar(str,j4,#" ")
            val r2 = ode(fid)(str,j5)
  val ode2 = fst r2 val j6 = snd r2
  in          (Oprod ode1 ode2,j6)
  end
  | rest => (print("Unknown constructor " ^ rest ^ " at " ^ (Int.toString j3) ^ "\n"); raise ParseException j3)
  )
  val res = fst mainR
  val beforeParen = snd mainR
      val iEnd = eatChar(str,beforeParen,#")")
  in    (res,iEnd)end



    fun hp(fid,pid)  (str, i) =
  let    val j1 = eatChar(str,i,#"(")
         val r1 = alphanum(str,j1)
         val con = fst r1
         val j2 = snd r1
         val j3 = eatChar(str, j2, #" ")
         val mainR =
        (case con of
           "Pvar" =>
  let          val r1 = mv(str,j3)
  val a = fst r1
  val  j4 = snd r1
  in          (Pvar(a),j4)
  end        | "Assign" =>
  let          val r1 = mv(str,j3)
  val x = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = trm(fid)(str,j5)
      val t = fst r2
      val j6 = snd r2
  in          (Assign x t,j6)
  end        | "DiffAssign" =>
  let          val r1 = mv(str,j3)
  val x = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = trm(fid)(str,j5)
  val t = fst r2 val j6 = snd r2
  in          (Diffassign x t,j6)
  end        | "AssignRand" =>
  let          val r1 = mv(str,j3)
  val x = fst r1 val j4 = snd r1
  in          (Assignany(x),j4)
  end        | "Test" =>
  let          val r1 = formula(fid,pid)(str,j3)
  val p = fst r1 val j4 = snd r1
  in          (Test(p), j4)
  end        | "EvolveODE" =>
  let          val r1 = ode(fid)(str,j3)
  val ooo = fst r1 val  j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = formula(fid,pid)(str,j5)
  val p = fst r2 val j6 = snd r2
  in          (Evolveode ooo p,j6)
  end        | "Choice" =>
  let          val r1 = hp(fid,pid)(str,j3)
  val a = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = hp(fid,pid)(str,j5)
  val b = fst r2 val j6 = snd r2
  in          (Choice a b,j6)
  end        | "Sequence" =>
  let          val r1 = hp(fid,pid)(str,j3)
  val a = fst r1 val  j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = hp(fid,pid)(str,j5)
  val b = fst r2 val  j6 = snd r2
  in          (Sequence a b,j6)
  end        | "Loop" =>
  let          val r1 = hp(fid,pid)(str,j3)
  val a = fst r1
  val  j4 = snd r1
  in          (Loop(a),j4)
  end
  | rest => (print("Unknown constructor " ^ rest ^ " at " ^ (Int.toString j3) ^ "\n"); raise ParseException j3)
  )
  val res = fst mainR
  val beforeParen = snd mainR
      val iEnd = eatChar(str,beforeParen,#")")
  in    (res,iEnd)end


  and  formula(fid,pid) (str, i) =
  let    val j1 = eatChar(str,i,#"(")
      val r1 = alphanum(str,j1)
  val con = fst r1
  val j2 = snd r1
      val j3 = eatChar(str, j2, #" ")
      val mainR =
        ( case con of
           "Geq" =>
  let          val r1 = trm(fid)(str,j3)
  val t1 = fst r1
  val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = trm(fid)(str,j5)
  val t2 = fst r2 val  j6 = snd r2
  in          (Geq t1 t2,j6)
  end        | "Prop" =>
  let          val r1 = mv(str,j3)
  val name = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = emptyElseL(Const (Word64.fromInt 0), trm(fid),bfl(trm(fid)))(str,j5)
  val args = fst r2 val j6 = snd r2
  in          (Prop name args, j6)
  end        | "Not" =>
  let          val t1 = formula(fid,pid)(str,j3)
  val f = fst t1 val j4 = snd t1
  in          (Not(f),j4)
  end        | "And" =>
  let          val r1 = formula(fid,pid)(str,j3)
  val p = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = formula(fid,pid)(str,j5)
  val q = fst r2 val j6 = snd r2
  in          (And p q,j6)
  end       | "Exists" =>
  let          val r1 = mv(str,j3)
  val name = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = formula(fid,pid)(str,j5)
  val q = fst r2 val j6  = snd r2
  in          (Exists name q,j6)
  end        | "Diamond" =>
  let          val r1 = hp(fid,pid)(str,j3)
  val a = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = formula(fid,pid)(str,j5)
  val q = fst r2 val j6 = snd r2
  in          (Diamond a q, j6)
  end        | "InContext" =>
  let          val r1 = pid(str,j3)
  val  name = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = formula(fid,pid)(str,j5)
      val q = fst r2 val j6 = snd r2
  in          (Incontext name q,j6)
  end
  | rest => (print("Unknown constructor " ^ rest ^ " at " ^ (Int.toString j3) ^ "\n"); raise ParseException j3)
  )
  val res = fst mainR
  val beforeParen = snd mainR
      val iEnd = eatChar(str,beforeParen,#")")
  in    (res,iEnd)end



    fun subst (str,i) =
  case p7(eatSym("subst_exta"),
        noneElse(bff(option(trm(sum(mv,mv))))),
        noneElse(bff(option(trm(mv)))),
        noneElse(bff(option(formula(sum(mv,mv),mv)))),
        noneElse(bff(option(formula(mv,sum(mv,unit))))),
        noneElse(bff(option(hp(mv,mv)))),
        noneElse(bff(option(ode(mv)))),
        space
      )(str,i)
  of
  ((_, fff,funl,pred,con,hpp,oode,sp), j1) =>
  let
      val ooode =
        (case sp of
           NONE     => (fn y => fn z => case (y,z) of (id,NONE) => oode id | (ids,SOME(_)) => NONE)
          | SOME(id) => (fn y => fn z => case (y,z) of (id,NONE) => NONE | (id,SOME(i)) =>
                     if(i = id) then (oode(id)) else (NONE)))
  val sigma = subst_of_tuple(fff,funl,pred,con,hpp,ooode)
  in
      (sigma,j1)
  end


    fun sequent(str,i) =
      ptup(list(formula(mv,mv)),list(formula(mv,mv)))(str,i)


  fun  leftRule(str,i) =
  let    val j1 = eatChar(str, i, #"(")
      val r1 = alphanum(str, j1)
  val con = fst r1
  val j2 = snd r1
      val mainR =
        (case con of
           "HideL" => (Hidel, j2)
          | "ImplyL" => (Implyl, j2)
          | "AndL" => (Andl, j2)
          | "NotL" => (Notl, j2)
          | "FalseL" => (Falsel, j2)
          | "OrLeft" => (Orl, j2)
          | "EquivL" => (Equivl, j2)
          | "CutLeft" =>
  let          val j3 = eatChar(str, j2, #" ")
            val r1 = formula(mv,mv)(str,j3)
  val f = fst r1
  val j4 = snd r1
  in          (Cutleft(f),j4)end
          | "BRenameL" =>
  let          val j3 = eatChar(str, j2, #" ")
            val r1 = mv(str,j3)
  val w = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = mv(str,j5)
  val r = fst r2 val j6 = snd r2
  in          (Brenamel w r,j6)end
  | rest => (print("Unknown lrule constructor " ^ rest ^ " at " ^ (Int.toString j2) ^ "\n"); raise ParseException j2)
        )
   val res = fst mainR val beforeParen = snd mainR
      val iEnd = eatChar(str,beforeParen,#")")
  in
      (res,iEnd)
  end



    fun rightRule(str,i) =
  let    val j1 = eatChar(str, i, #"(")
      val r1 = alphanum(str, j1)
  val con = fst r1
  val j2 = snd r1
      val mainR =
        (case con of
           "CutRight" =>
  let          val j3 = eatChar(str, j2, #" ")
            val r1 = formula(mv,mv)(str,j3)
   val f = fst r1 val j4 = snd r1
  in          (Cutright(f),j4)
  end        | "ImplyR" => (Implyr,j2)
          | "AndR" =>(Andr, j2)
          | "OrRight" =>(Orr, j2)
          | "NotRight" =>(Notr, j2)
          | "HideR" => (Hider,j2)
          | "CohideRR" => (Cohiderr, j2)
          | "TrueR" => (Truer,j2)
          | "EquivR" => (Equivr,j2)
          | "EquivifyR" => (Equivifyr,j2)
          | "CommuteEquivR" => (Commuteequivr,j2)
          | "Skolem" => (Skolem,j2)
          | "ExchangeRight" =>
            let val j3 = eatChar(str, j2,#" ")
                val r1 = nat(str,j3)
            in
              (Exchanger (fst r1),(snd r1))
            end
          | "BRenameR" =>
  let          val j3 = eatChar(str, j2, #" ")
            val r1 = mv(str,j3)
  val w = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = mv(str,j5)
  val r = fst r2 val j6 = snd r2
  in          (Brenamer w r,j6)end
  | rest => (print("Unknown rrule constructor " ^ rest ^ " at " ^ (Int.toString j2) ^ "\n"); raise ParseException j2)

        )
   val res = fst mainR
  val  beforeParen = snd mainR
      val iEnd = eatChar(str,beforeParen,#")")
  in    (res,iEnd)end


    fun ruleAppl(str,i) =
  let    val j1 = eatChar(str, i, #"(")
      val r1 = alphanum(str, j1)
      val con = fst r1
      val j2 = snd r1
      val j3 = eatChar(str, j2, #" ")
      val mainR =
        (case con of
           "URename" =>
  let          val r1 = mv(str,j3)
  val w = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = mv(str,j5)
  val r= fst r2 val j6 = snd r2
  in          (Urename w r,j6)
  end        | "Rrule" =>
  let          val r1 = rightRule(str,j3)
         val rule = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = nat(str,j5)
      val n = fst r2 val j6 = snd r2
  in          (Rightrule rule n,j6)
  end        | "Lrule" =>
  let          val r1 = leftRule(str,j3)
  val rule = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = nat(str,j5)
  val n = fst r2 val j6 = snd r2
  in          (Leftrule rule n,j6)
  end        | "CloseId" =>
  let          val r1 = nat(str,j3)
  val w = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = nat(str,j5)
  val r = fst r2 val j6 = snd r2
  in          (Closeid w r,j6)
  end        | "Cohide2" =>
  let          val r1 = nat(str,j3)
  val w = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = nat(str,j5)
  val r = fst r2 val j6 = snd r2
  in          (Cohide2 w r,j6)
  end        | "Cut" =>
  let          val r1 = formula(mv,mv)(str,j3)
  val f = fst r1
  val j4 = snd r1
  in          (Cut(f),j4)
  end        | "DIGeqSchema" =>
  let          val r1  = ode(mv)(str,j3)
  val ooo = fst r1 val j4 = snd r1
            val j5      = eatChar(str,j4,#" ")
            val r2 = trm(mv)(str,j5)
  val t1 = fst r2 val j6 = snd r2
            val j7      = eatChar(str,j6,#" ")
            val r3 = trm(mv)(str,j7)
  val t2 = fst r3 val j8 = snd r3
  in          (Digeqschema ooo t1 t2,j8)
  end
          | "DIEqSchema" =>
  let          val r1  = ode(mv)(str,j3)
  val ooo = fst r1 val j4 = snd r1
            val j5      = eatChar(str,j4,#" ")
            val r2 = trm(mv)(str,j5)
  val t1 = fst r2 val j6 = snd r2
            val j7      = eatChar(str,j6,#" ")
            val r3 = trm(mv)(str,j7)
  val t2 = fst r3 val j8 = snd r3
  in          (Dieqschema ooo t1 t2,j8)
  end
  | rest => (print("Unknown rule con " ^ rest ^ " at " ^ (Int.toString j3) ^ "\n"); raise ParseException j3)
  )
  val res = fst mainR val beforeParen = snd mainR
      val iEnd = eatChar(str,beforeParen,#")")
  in    (res,iEnd)
  end



  fun  proofTerm (str,i) =
  let
      val j1 = eatChar(str, i, #"(")
      val r1 = alphanum(str, j1)
      val con = fst r1
  (*    val blah = print  con*)
      val j2 = snd r1
      val j3 = eatChar(str, j2, #" ")
      val mainR =
        (case con of
           "FOLRConstant" =>
  let          val r1 = formula(mv,mv)(str,j3)
  val f = fst r1 val j4 = snd r1
  in          (Folrconstant(f),j4)
  end        | "RuleApp" =>
         let
       val r1 = proofTerm(str,j3)
       val child = fst r1 val j4 = snd r1
       val j5 = eatChar(str,j4,#" ")
       val r2 = ruleAppl(str,j5)
       val rApp = fst r2 val j6 = snd r2
       val j7 = eatChar(str,j6,#" ")
       val r3 = nat(str,j7)
       val  n = fst r3 val j8 = snd r3
         in
       (Ruleapplication child rApp n,j8)
         end
           | "AxRule" =>
  let          val r1 = axrule(str,j3)
         val ar = fst r1 val j4 = snd r1
  in          (Axiomaticrule(ar),j4)
  end        | "PrUSubst" =>
  let          val r1 = proofTerm(str,j3)
         val pterm = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = subst(str,j5)
      val sub = fst r2 val j6 = snd r2
  in
      (Prusubst pterm sub,j6)
  end
     | "Ax" =>
         let
       val r1 = axiom(str,j3)
       val a = fst r1 val j4 = snd r1
         in          (Ax(a),j4)
         end
           | "FNC" =>
  let          val r1 = proofTerm(str,j3)
  val child = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = sequent(str,j5)
  val newCon = fst r2 val j6 = snd r2
            val j7 = eatChar(str,j6,#" ")
            val r3 = ruleAppl(str,j7)
  val rApp = fst r3 val j8 = snd r3
  in          (Fnc child newCon rApp,j8)
  end        | "Pro" =>
  let          val r1 = proofTerm(str,j3)
         val pterm1 = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = proofTerm(str,j5)
      val pterm2 = fst r2 val j6 = snd r2
  in          (Pro pterm1 pterm2,j6)
  end        | "Start" =>
  let          val r1 = sequent(str,j3)
         val seq = fst r1 val j4  = snd r1
  in          (Start ((fst seq),(snd seq)),j4)
  end        | "Sub" =>
  let          val r1 = proofTerm(str,j3)
         val pterm1 = fst r1 val j4 = snd r1
            val j5 = eatChar(str,j4,#" ")
            val r2 = proofTerm(str,j5)
      val pterm2 = fst r2
      val j6 = snd r2
            val j7 = eatChar(str,j6,#" ")
            val r3 = nat(str,j7)
  val n = fst r3 val j8 = snd r3
  in          (Sub pterm1 pterm2 n,j8)
  end
  | rest => (print("Unknown pt constructor " ^ rest ^ " at " ^ (Int.toString j3) ^ "\n"); raise ParseException j3)
  )
  val res = fst mainR val beforeParen = snd mainR
      val iEnd = eatChar(str,beforeParen,#")")
  in    (res,iEnd)
  end

  fun parse (s) =  fst(proofTerm(s,0));

  val main =
    let val clines = (CommandLine.arguments()) in
      if List.length clines = 1 then
        let val fd = TextIO.openIn (List.hd clines) in
        (((
        case pt_result_full (parse (TextIO.inputAll fd)) of
          NONE => print("Failed to check.\n")
        | (SOME s) => (print("Checked:\n");print s;print"\n")
        )
        handle ParseException i => print ("ParseException"^ (Int.toString i)^ "\n"))
        handle Fail s => print ("Fail"^ (s)^ "\n"))
        handle Bind => print ("Match exn\n")
        handle _ => print ("Unknown Exception\n")
        end
      else
        print"Error in cline args: call with single file containing proof term\n"
    end;`

val full_prog = rconc (EVAL ``^prog ++ ^parser``);
val full_prog_def = Define`full_prog = ^full_prog`;

val _ = export_theory();
