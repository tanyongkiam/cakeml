(*Pretty printing for patLang*)
structure patPP =
struct
open astPP conPP modPP exhPP

val _ = bring_fwd_ctors "patLang" ``:patLang$op``
val _ = bring_fwd_ctors "patLang" ``:patLang$exp``

val patPrettyPrinters = ref []: (string * term * term_grammar.userprinter) list ref

fun add_patPP hd = patPrettyPrinters:= (hd:: !patPrettyPrinters)

(*TODO: Decide how to differentiate letrec and lambdas?*)
(*pat_Nested mutually recursive letrec*)
fun pat_letrecPrint sys d t pg str brk blk =
  let
    val (temp,expr) = dest_comb t
    val (_,ls) = dest_comb temp
    val fundef = #1(listSyntax.dest_list ls)
    fun printTerms [] = str ""
    |   printTerms [x] = sys (Top,Top,Top) d x
    |   printTerms (t::xs) = printTerms [t] >>add_newline>>str "and = ">> (printTerms xs)
  in
     blk CONSISTENT 0 (str "let " >> (blk CONSISTENT 0 (str "fun = ">>printTerms fundef))
     >>add_newline>>str "in">>add_newline>>str"  ">>sys (Top,Top,Top) d expr >>add_newline>> str "end")
  end;

val _=add_patPP ("pat_letrecprint", ``Letrec x y``,genPrint pat_letrecPrint);

(*pat_Lambdas expr*)
fun pat_lambdaPrint sys d t pg str brk blk =
  blk CONSISTENT 0 (str"fun (">>brk(0,2)>>sys (Prec(0,"patlambda"),Top,Top) d (strip t)>>brk(0,0)>>str")");

val _=add_patPP ("pat_lambdaprint", ``Fun x``,genPrint pat_lambdaPrint);

(*reuse con extend global*)
val _=add_patPP("pat_extendglobal",``Extend_global n``,genPrint con_extendglobalPrint);

(*pat_uops with nat args*)
(*TODO: Check these*)
fun pat_uopPrint uop sys d t pg str brk blk =
  (str uop>>str"_">>sys (Prec(0,"patuop"),Top,Top) d (strip t));

(*TODO: Tag_eq has been changed to take 2 arguments, the pretty printing is probably wrong*)
val _=add_patPP("pat_optageqprint",``Tag_eq x y``,genPrint (pat_uopPrint "tag_eq"));
val _=add_patPP("pat_opelpatprint",``El x``,genPrint (pat_uopPrint "elem"));

fun pat_uappPrint sys d t pg str brk blk =
  let val (l,r)= dest_comb t;
      val [r] = #1(listSyntax.dest_list r)
  in
    m_brack str pg (sys(pg,pg,pg) d (strip l) >>str " ">> sys (pg,pg,pg) d r)
  end;

(*Special cases for pat ops, should probably be simplified directly*)
val _=add_patPP("pat_uappprint",``App (Tag_eq x y) ls``,genPrint pat_uappPrint);
val _=add_patPP("pat_uappprint",``App (El y) ls``,genPrint pat_uappPrint);

(*Prints all constructor args in a list comma separated*)
val _=add_patPP ("pat_conprint", ``Con x y``,con_pconPrint);

(*TODO: Check this, need to write equality properly*)
(*pat_Apply Equality*)
fun pat_equalityPrint sys d t pg str brk blk =
  let val [l,r] = #1(listSyntax.dest_list (rand t))
  in
    sys (Prec(0,"pateq"),Top,Top) d l >> str " = " >> sys (Prec(0,"pateq"),Top,Top) d r

  end;
val _=add_patPP ("pat_equalityprint", ``App (Op (Op Equality)) ls``, genPrint pat_equalityPrint);

(*TODO: Is there a neater way of doing this? Mostly copied from I2 except extra rand needed*)
fun pat_initglobalPrint Gs B sys (ppfns:term_pp_types.ppstream_funs) gravs d t =
  let
    open term_pp_types PPBackEnd
    val (str,brk,blk,sty) = (#add_string ppfns, #add_break ppfns,#ublock ppfns,#ustyle ppfns);
    val (t,x) = dest_comb t
    val num = rand (rand (rand t))
    val [x] = #1(listSyntax.dest_list x) (*Assume singleton list for arg to init global as well...*)

    val sys = wrap_sys sys
  in
    sty [FG DarkBlue] (str"g" >> sys (Top,Top,Top) d num) >>str " := " >> blk CONSISTENT 0 (sys (Top,Top,Top) d x)
  end handle HOL_ERR _ => raise term_pp_types.UserPP_Failed;

val _=add_patPP ("pat_initglobal", ``App (Op (Init_global_var n)) ls``,pat_initglobalPrint);

(*pat_Apply Op*)
val _=add_patPP ("pat_oppappprint", ``App (Op (Op Opapp)) ls``, genPrint oppappPrint);

(*pat_sequence*)
fun pat_seqPrint sys d t pg str brk blk =
  let val (l,r) = dest_comb t
      val os = blk CONSISTENT 0 ( sys(Prec(0,"patseq"),Top,Top) d (strip l) >>str ";">>
    brk (1,0)>>sys (Prec(0,"patseq"),Top,Top) d r )
  in
    case pg of Prec(_,"patseq") => os
            |  _ => str"(">>os>>str ")"
  end;

val _=add_patPP ("pat_seqprint",``Seq x y``,genPrint letnonePrint);

(*pat_Let*)
(*brackets around bound expression to be safe, same in intLang*)
fun pat_letpatPrint sys d t pg str brk blk =
  let val (l,r) = dest_comb t
  in
    blk CONSISTENT 0 (str"bind ">>sys(Prec(0,"patlet"),Top,Top) d (strip l)>>add_newline>>str"in">>add_newline>>str"  ">> sys (Top,Top,Top) d r>>add_newline>>str"end")
  end;

val _=add_patPP ("pat_letprint",``Let y z ``,genPrint pat_letpatPrint);

(*pat_raise expr*)
val _=add_patPP ("pat_raiseprint", ``Raise x``,genPrint raisePrint);

(*pat_Literals*)
(*pat_Pattern lit*)
val _=add_patPP ("pat_litprint", ``Lit x``, genPrint plitPrint);

(*pat local var name debrujin indices*)
fun pat_varlocalPrint Gs B sys (ppfns:term_pp_types.ppstream_funs) gravs d t =
  let
    open term_pp_types PPBackEnd
    val (str,brk,blk,sty) = (#add_string ppfns, #add_break ppfns,#ublock ppfns,#ustyle ppfns);
    val sys = wrap_sys sys
  in
    sty [FG VividGreen] (str"l">>sys (Top,Top,Top) d (strip t))
  end handle HOL_ERR _ => raise term_pp_types.UserPP_Failed;

val _=add_patPP ("pat_varlocalprint", ``Var_local x``,pat_varlocalPrint);

(*pat global Var name*)
val _=add_patPP ("pat_varglobalprint", ``Var_global n``,mod_varglobalPrint);

(*pat_handle*)
fun pat_handlePrint sys d t pg str brk blk =
  let val (l,r) = dest_comb t
  in
    sys(Prec(0,"pathandle"),Top,Top) d (strip l)>>brk(1,0)
    >>blk CONSISTENT 0 (str "handle =>">>brk(1,2) >>sys (Top,Top,Top) d r)
  end;

val _=add_patPP ("pat_handleprint", ``Handle x y``,genPrint (pat_handlePrint));

(*pat_If-then-else*)
val _=add_patPP("pat_ifthenelseprint", ``If x y z``,genPrint ifthenelsePrint);

(*pat binops*)
val _=add_patPP ("pat_assignappprint", ``App (Op (Op Opapp)) [Var_global 10; x]``,genPrint (infixappPrint ":="));
val _=add_patPP ("pat_eqappprint", ``App (Op (Op Opapp)) [Var_global 9; x]``,genPrint (infixappPrint "="));
val _=add_patPP ("pat_gteqappprint", ``App (Op (Op Opapp)) [Var_global 8; x]``,genPrint (infixappPrint ">="));
val _=add_patPP ("pat_lteqappprint", ``App (Op (Op Opapp)) [Var_global 7; x]``,genPrint (infixappPrint "<="));
val _=add_patPP ("pat_gtappprint", ``App (Op (Op Opapp)) [Var_global 6; x]``,genPrint (infixappPrint ">"));
val _=add_patPP ("pat_ltappprint", ``App (Op (Op Opapp)) [Var_global 5; x]``,genPrint (infixappPrint "<"));
val _=add_patPP ("pat_modappprint", ``App (Op (Op Opapp)) [Var_global 4; x]``,genPrint (infixappPrint "mod"));
val _=add_patPP ("pat_divappprint", ``App (Op (Op Opapp)) [Var_global 3; x]``,genPrint (infixappPrint "div"));
val _=add_patPP ("pat_timesappprint", ``App (Op (Op Opapp)) [Var_global 2; x]``,genPrint (infixappPrint "*"));
val _=add_patPP ("pat_minusappprint", ``App (Op (Op Opapp)) [Var_global 1; x]``,genPrint (infixappPrint "-"));
val _=add_patPP ("pat_addappprint", ``App (Op (Op Opapp)) [Var_global 0; x]``,genPrint (infixappPrint "+"));

(*pat uops*)
val _=add_patPP ("pat_refappprint", ``App (Op (Op Opapp)) [Var_global 13; x]``,genPrint (prefixappPrint "ref"));
val _=add_patPP ("pat_derefappprint", ``App (Op (Op Opapp)) [Var_global 12;x]``,genPrint (prefixappPrint "!"));
val _=add_patPP ("pat_negappprint", ``App (Op (Op Opapp)) [Var_global 11; x]``,genPrint (prefixappPrint "~"));

fun enable_patPP_verbose () = map temp_add_user_printer (!patPrettyPrinters);
fun enable_patPP () = (enable_patPP_verbose();())
fun disable_patPP_verbose () = map (fn (x,y,z) => temp_remove_user_printer x) (!patPrettyPrinters);
fun disable_patPP () = (disable_patPP_verbose();())

end;


