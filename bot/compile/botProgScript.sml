open preamble MonitorProgTheory MonitorProofTheory botFFITheory botFFIProofTheory
open ml_progLib ml_translatorLib
open basisFunctionsLib
open cfTacticsLib cfLetAutoLib semanticsLib
open cfHeapsBaseTheory

fun bring_fwd_ctors ty =
  TypeBase.constructors_of ty
  |> map (fn cn =>
    let val {Thy,Name,...} = dest_thy_const cn in
      Parse.bring_to_front_overload Name {Name=Name,Thy=Thy}
    end)

val _ = bring_fwd_ctors ``:MonitorProg$trm``
val _ = bring_fwd_ctors ``:MonitorProg$fml``
val _ = bring_fwd_ctors ``:MonitorProg$hp``

(* This is the final step that produces a monitor
  Here, we concretely instantiate the monitors with
  formulas from an input file *)

val _ = new_theory "botProg"

val _ = translation_extends "MonitorProg";

(*"*)
(* Helper functions *)

(* Parses a sequence of (non-det) assignments to a list of names *)
val parse_names_def = Define`
  (parse_names (Assign x NONE) = SOME [x]) ∧
  (parse_names (Seq p1 p2) =
    case parse_names p1 of
      NONE => NONE
    | SOME xs =>
    case parse_names p2 of
      NONE => NONE
    | SOME ys => SOME(xs++ys)) ∧
  (parse_names _ = NONE)`

(* Parses a sequence of (concrete) assignments to a list of (name,rhs) pairs *)
val parse_namevals_def = Define`
  (parse_namevals (Assign x (SOME e)) = SOME [(x,e)]) ∧
  (parse_namevals (Seq p1 p2) =
    case parse_namevals p1 of
      NONE => NONE
    | SOME xs =>
    case parse_namevals p2 of
      NONE => NONE
    | SOME ys => SOME(xs++ys)) ∧
  (parse_namevals _ = NONE)`

(* Expects 3 seqs at the top-level
  {Consts:=*};
  {Sensors:=*};
  {?Init}; ...
*)
val parse_header_def = Define`
  (parse_header (Seq c (Seq s (Seq (Test init) rest))) =
    case (parse_names c, parse_names s) of
      (SOME consts,SOME sensors) =>
        SOME (consts,sensors,init,rest)
    | _ => NONE) ∧
  (parse_header _ = NONE)`

(* Parses the RHS of defaults *)
val parse_default_def = Define`
  (parse_default [] = SOME []) ∧
  (parse_default (Const w::xs) =
    case parse_default xs of
      NONE => NONE
    | SOME vs => SOME(INL w :: vs)) ∧
  (parse_default (Var x::xs) =
    case parse_default xs of
      NONE => NONE
    | SOME vs => SOME(INR x :: vs)) ∧
  (parse_default _ = NONE)`

(* Parses the controller monitor and default
   We require the pattern
   {?ctrlmon; ctrl := ctrl+}
   U
   {?~ctrlmon;ctrl := def}

   Returns (c,c+,defaults,ctrlmon)
*)

val parse_choice_def = Define`
  (parse_choice (Choice (Seq (Test f) c) (Seq (Test nf) def)) =
  if Not(f) ≠ nf then NONE
  else
  case parse_namevals c of
    NONE => NONE
  | SOME ctrls =>
  case parse_namevals def of
    NONE => NONE
  | SOME defs =>
  (* Sanity checks *)
  if MAP FST ctrls = MAP FST defs then
    case parse_default (MAP SND defs) of
      NONE => NONE
    | SOME defaults => SOME (MAP FST ctrls,MAP SND ctrls,defaults,f)
  else
    NONE) ∧
  (parse_choice _ = NONE)`

(* Parse the first part of the sandboxing loop
  {Ctrl+:=*}
  {CtrlFixed:=*}
  {?...} U {? ...}
*)
val parse_loop1_def = Define`
  (parse_loop1 (Seq c (Seq c2 (Seq (ctrlmonchoice) rest))) =
  case parse_names c of
     NONE => NONE
  |  SOME ctrlplus =>
  case parse_namevals c2 of
     NONE => NONE
  |  SOME ctrlfixed =>
  case parse_default (MAP SND ctrlfixed) of
     NONE => NONE
  |  SOME ctrlfixed_rhs =>
  case parse_choice ctrlmonchoice of
     NONE => NONE
  |  SOME (ctrl,cplus,default,ctrlmon) =>
    if MAP Var ctrlplus = cplus then
      SOME(ctrl,ctrlplus,MAP FST ctrlfixed,ctrlfixed_rhs,default,ctrlmon,rest)
    else NONE) ∧
  (parse_loop1 _ = NONE)`

(* Parse the second part of the sandboxing loop *)
val parse_loop2_def = Define`
  (parse_loop2 (Seq s (Seq (Test plantmon) rest)) =
  case parse_names s of
     NONE => NONE
  |  SOME sensorplus =>
  case parse_namevals rest of
    NONE => NONE
  | SOME svals =>
  if MAP Var sensorplus = MAP SND svals then
     SOME(MAP FST svals, sensorplus,plantmon)
  else NONE) ∧
  (parse_loop2 _ = NONE)`

(* More sanity checks on the input *)
val fv_trm_def = Define`
  (fv_trm (Const _) = []) ∧
  (fv_trm (Var x) = [x]) ∧
  (fv_trm (Plus t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_trm (Times t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_trm (Max t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_trm (Min t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_trm (Neg t) = fv_trm t)`

val fv_fml_def = Define`
  (fv_fml (Le t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_fml (Leq t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_fml (Equals t1 t2) = fv_trm t1 ++ fv_trm t2) ∧
  (fv_fml (And f1 f2) = fv_fml f1 ++ fv_fml f2) ∧
  (fv_fml (Or f1 f2) = fv_fml f1 ++ fv_fml f2) ∧
  (fv_fml (Not f) = fv_fml f)`

val fv_ls_def = Define`
  (fv_ls [] = []) ∧
  (fv_ls (INR v :: xs) = v :: fv_ls xs) ∧
  (fv_ls (INL _ :: xs) = fv_ls xs)`

(* The sandbox pattern *)
val parse_hp_def = Define`
  parse_hp hp =
  (* Extract the header *)
  case parse_header hp of
    NONE => NONE
  | SOME (consts,sensors,init,hp) =>
  (case hp of
    Loop hp =>
      (case parse_loop1 hp of
      NONE => NONE
      | SOME (ctrl,ctrlplus,ctrlfixed,ctrlfixedrhs,default,ctrlmon,hp) =>
      (case parse_loop2 hp of
      NONE => NONE
      | SOME (ss,sensorplus,plantmon)=>
        if ss = sensors then
          if EVERY (λx. MEM x (consts++sensors)) (fv_fml init) ∧
             EVERY (λx. MEM x (consts++sensors++ctrlplus++ctrlfixed)) (fv_fml ctrlmon) ∧
             EVERY (λx. MEM x (consts++sensors++ctrl++sensorplus)) (fv_fml plantmon) ∧
             EVERY (λx. MEM x (consts++sensors)) (fv_ls default) ∧
             EVERY (λx. MEM x (consts++sensors)) (fv_ls ctrlfixedrhs)
          then
            SOME(consts,sensors,sensorplus,ctrl,ctrlplus,ctrlfixed,ctrlfixedrhs,default,init,ctrlmon,plantmon)
          else
            NONE
        else NONE))
    | _ => NONE)`

(* Sanity Checks
EVAL ``parse_choice
  (Choice (Seq (Test cmon) (Assign "ctrl1" (SOME (Var "ctrlplus1"))))
          (Seq (Test (Not(cmon))) (Assign "ctrl1" (SOME (Const 0w)))))``

EVAL ``parse_loop1
  (Seq (Assign "ctrlplus1" NONE)
  (Seq (Assign "ctrlfixed1" (SOME (Const 0w)))
  (Seq
  (Choice (Seq (Test cmon) (Assign "ctrl1" (SOME (Var "ctrlplus1"))))
          (Seq (Test (Not(cmon))) (Assign "ctrl1" (SOME (Const 0w)))))
  foo)))``

EVAL ``parse_loop2
  (Seq (Assign "sensorplus1" NONE)
  (Seq
  (Test pmon)
  (Assign "sensor1" (SOME (Var "sensorplus1")))))``
   *)

fun check_fv trm =
  let val fvs = free_vars trm  in
  if free_vars trm <> [] then
    raise ERR "" ("term has free variables: "^ String.concatWith " " (map term_to_string fvs))
  else
    ()
  end;

val parse_hp_tm = ``parse_hp``;
val hp_ty = ``:hp``;

fun check_hp_type trm =
  if type_of trm <> hp_ty then
    raise ERR "" ("term is not a HP: "^ term_to_string trm)
  else ();

fun split11 [i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11] = (i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11)
  | split11 _ = raise ERR "" "incorrect number of terms in list"

fun read_configuration config_filename  =
  let val config_file = TextIO.openIn config_filename;
      val stropt = TextIO.inputLine config_file in
  case stropt of
    NONE => raise ERR "read_config" ("Failed to read config file: "^config_filename)
  | SOME str =>
    let val trm = (Term ([QUOTE str])) handle (HOL_ERR _) => raise ERR "read_config" ("Failed to parse input as a HOL term: "^str)
        val _ = check_fv trm
        val _ = check_hp_type trm
        val opt = (rhs o concl o EVAL) (mk_comb (parse_hp_tm,trm))
    in
      if optionLib.is_some opt
      then
        split11 (pairSyntax.strip_pair (optionLib.dest_some opt))
      else
        raise ERR "read_config" ("Input HP is not of expected shape: "^(term_to_string trm))
    end
  end;

val (const_vars,sensor_vars,sensorplus_vars,ctrl_vars,ctrlplus_vars,ctrlfixed_vars,ctrlfixed_rhs,default,init_fml,ctrl_fml,plant_fml) =  read_configuration "sandbox.txt"

(* Define constant names for each of the required terms *)
val const_vars_def = Define`
  const_vars = ^const_vars`
val sensor_vars_def = Define`
  sensor_vars = ^sensor_vars`
val sensorplus_vars_def = Define`
  sensorplus_vars = ^sensorplus_vars`
val ctrl_vars_def = Define`
  ctrl_vars = ^ctrl_vars`
val ctrlplus_vars_def = Define`
  ctrlplus_vars = ^ctrlplus_vars`
val ctrlfixed_vars_def = Define`
  ctrlfixed_vars = ^ctrlfixed_vars`
val ctrlfixed_rhs_def = Define`
  ctrlfixed_rhs = ^ctrlfixed_rhs`

val init_fml_def = Define`
  init_fml = ^init_fml`

val ctrl_fml_def = Define`
  ctrl_fml = ^ctrl_fml`

val plant_fml_def = Define`
  plant_fml = ^plant_fml`

val default_def = Define`
  default = ^default`

(* Automatically turn the defs into CML implementations *)
val cml_const_th = translate const_vars_def;
val cml_sensor_th = translate sensor_vars_def;
val cml_sensorplus_th = translate sensorplus_vars_def;
val cml_ctrl_th = translate ctrl_vars_def;
val cml_ctrlplus_th = translate ctrlplus_vars_def;
val cml_ctrlfixed_th = translate ctrlfixed_vars_def;
val cml_ctrlfixed_rhs_th = translate ctrlfixed_rhs_def;

val cml_init_fml_th = translate init_fml_def;
val cml_ctrl_fml_th = translate ctrl_fml_def;
val cml_plant_fml_th = translate plant_fml_def;

val cml_default_th = translate default_def;

(* Finally, we define the top-level call *)
val bot_main = process_topdecs`
  fun bot_main u =
    monitor_loop init_fml plant_fml ctrl_fml const_vars sensor_vars ctrlplus_vars ctrl_vars sensorplus_vars ctrlfixed_vars ctrlfixed_rhs default`

val _ = append_prog bot_main;

val st = get_ml_prog_state();

val trans_th = [cml_const_th,cml_sensor_th,cml_sensorplus_th,cml_ctrl_th,cml_ctrlplus_th,cml_init_fml_th,cml_ctrl_fml_th,cml_plant_fml_th,cml_ctrlfixed_th,cml_ctrlfixed_rhs_th,cml_default_th]

val comp_eq = [mach_component_equality,
              mach_config_component_equality,
              mach_state_component_equality,
              mach_oracle_component_equality];

(* The sandbox configuration *)
val init_wc_def = Define`
  init_wc =
  <|  const_names      := const_vars;
      sensor_names     := sensor_vars;
      sensorplus_names := sensorplus_vars;
      ctrl_names       := ctrl_vars;
      ctrlplus_names   := ctrlplus_vars;
      init             := init_fml;
      ctrl_monitor     := ctrl_fml;
      plant_monitor    := plant_fml;
      ctrlfixed_names  := ctrlfixed_vars;
      ctrlfixed_rhs    := ctrlfixed_rhs;
      default          := default;
  |>`

val init_wf = EVAL ``wf_config init_wc``

(* Define the possible initial states w.r.t. to our formulas *)
val init_state_def = Define`
  init_state w <=>
  (w.wc = init_wc ∧
  w.tr = [] ∧
  good_default w ∧
  eventually $~ w.wo.step_oracle)`

val bot_main_spec = Q.store_thm("bot_main_spec",`
  init_state w ==>
  app (p:'ffi ffi_proj) ^(fetch_v "bot_main" st)
    [u]
  (IOBOT w)
  (POSTv uv.
    &UNIT_TYPE () uv * (
    (SEP_EXISTS w'. IOBOT w' *
     &(
      (* Either the initial machine violates init immediately *)
      (w = w' ∧ (¬init_sat w.wc w.ws) ) ∨
      (* Or we transition to a final machine,
         and good_mach guarantees that the actuation trace all
         satisfy the control monitor *)
      good_mach w' ∧
      (¬w'.wo.step_oracle 0 ∨
         good_plant_trace F w'.wc w'.tr w'.ws)))))`,
  rw[]>>
  xcf "bot_main" st>>
  fs[init_state_def]>>
  xapp>>
  qexists_tac`emp`>>qexists_tac`w`>>
  xsimpl>>fs[init_state_def,init_wf]>>
  fs[init_wc_def]>>fs trans_th>>
  fs[good_ctrl_trace_def,good_plant_trace_def]);

(* The rest of this automation produces a top-level theorem for CakeML semantics *)
val (ML_code (ss,envs,vs,th)) = get_ml_prog_state ();

val name = "bot_main"
val spec =  bot_main_spec |>
  Q.GEN`p` |> Q.ISPEC`(bot_proj1,bot_proj2)` |>
  Q.GEN`u` |> Q.ISPEC `Conv NONE []` |> UNDISCH

val th =
  call_main_thm_bot
    |> C MATCH_MP (th |> GEN_ALL |> ISPEC ``bot_ffi w``)
    |> SPEC(stringSyntax.fromMLstring name)
    |> CONV_RULE(QUANT_CONV(LAND_CONV(LAND_CONV EVAL THENC SIMP_CONV std_ss [])))
    |> CONV_RULE(HO_REWR_CONV UNWIND_FORALL_THM1)
    |> C HO_MATCH_MP spec;

val prog_with_snoc = th |> concl |> find_term listSyntax.is_snoc
val prog_rewrite = EVAL prog_with_snoc

val th = PURE_REWRITE_RULE[prog_rewrite] th
val (mods_tm,types_tm) = th |> concl |> dest_imp |> #1 |> dest_conj

val mods_thm =
  mods_tm |> (RAND_CONV EVAL THENC no_dup_mods_conv)
  |> EQT_ELIM

val types_thm =
  types_tm |> (RAND_CONV EVAL THENC no_dup_top_types_conv)
  |> EQT_ELIM
val th = MATCH_MP th (CONJ mods_thm types_thm)

val (split,precondh1) = th |> concl |> dest_imp |> #1 |> strip_exists |> #2 |> dest_conj
val precond = rator precondh1
val st = split |> rator |> rand

val SPLIT_exists = Q.store_thm ("SPLIT_exists",
  `∀s. A s /\ s ⊆ C
    ==> (?h1 h2. SPLIT C (h1, h2) /\ A h1)`,
  rw[]
  \\ qexists_tac `s` \\ qexists_tac `C DIFF s`
  \\ SPLIT_TAC
);

val SPLIT_SING = prove(
  ``SPLIT s ({x},t) <=> x IN s /\ t = s DELETE x``,
  fs [SPLIT_def,IN_DISJOINT,EXTENSION] \\ metis_tac []);

val SPLIT_th = Q.prove(`
  wf_mach w ⇒
  (∃h1 h2.
      SPLIT (st2heap (bot_proj1,bot_proj2) (auto_state_10 (bot_ffi w)))
        (h1,h2) ∧ IOBOT w h1)`,
  fs [IOBOT_def,SEP_CLAUSES,IOx_def,bot_ffi_part_def,
      IO_def,SEP_EXISTS_THM,PULL_EXISTS,one_def] >>
  rw[]>>simp[fetch "-""auto_state_10_def",cfStoreTheory.st2heap_def]>>
  fs [SPLIT_SING,cfAppTheory.FFI_part_NOT_IN_store2heap]
  \\ rw [cfStoreTheory.ffi2heap_def] \\ EVAL_TAC
  \\ fs [parts_ok_bot_ffi]);

val semantics_thm = MATCH_MP th (UNDISCH SPLIT_th) |> DISCH_ALL
val prog_tm = rhs(concl prog_rewrite)

val bot_prog_def = Define`bot_prog = ^prog_tm`;

val bot_semantics_thm =
  semantics_thm
  |> ONCE_REWRITE_RULE[GSYM bot_prog_def]
  |> DISCH_ALL
  |> SIMP_RULE std_ss [AND_IMP_INTRO]
  |> curry save_thm "bot_semantics_thm";

val _ = export_theory();
