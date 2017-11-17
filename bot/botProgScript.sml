open preamble MonitorProgTheory MonitorProofTheory botFFITheory botFFIProofTheory
open ml_progLib ml_translatorLib
open basisFunctionsLib
open cfTacticsLib cfLetAutoLib semanticsLib
open cfHeapsBaseTheory

(* This is the final step that produces a monitor
  Here, we concretely instantiate the monitors with
  formulas from an input file *)

val _ = new_theory "botProg"

val _ = translation_extends "MonitorProg";

(*"*)
val reval = rconc o EVAL

fun do_input_term config_file prefix =
  let val stropt = TextIO.inputLine config_file in
  case stropt of
    NONE => raise ERR "" "Out of lines"
  | SOME str =>
    (* Ignore lines starting with # *)
    if String.isPrefix "#" str then
      do_input_term config_file prefix
    else
    if String.isPrefix (prefix^" =") str
    then
      (Term ([QUOTE (String.extract(str,String.size prefix + 2, NONE))]))
      handle (HOL_ERR _) => raise ERR str "Failed to parse"
    else raise ERR "" ("Failed to read config: "^prefix)
  end

val config_filename = "monitor_config.txt";
val config_file = TextIO.openIn config_filename;

val const_vars = reval(do_input_term config_file "const_vars");
val sensor_pre_vars = reval(do_input_term config_file "sensor_pre_vars");
val sensor_vars = reval(do_input_term config_file "sensor_vars");
val ctrl_vars = reval(do_input_term config_file "ctrl_vars");

val bounds_fml = reval(do_input_term config_file "bounds_fml");
val init_fml = reval(do_input_term config_file "init_fml");
val ctrl_fml = reval(do_input_term config_file "ctrl_fml");
val plant_fml = reval(do_input_term config_file "plant_fml");

val default_body = reval(do_input_term config_file "default_body");

val const_vars_def = Define`
  const_vars = ^const_vars`
val sensor_pre_vars_def = Define`
  sensor_pre_vars = ^sensor_pre_vars`
val sensor_vars_def = Define`
  sensor_vars = ^sensor_vars`
val ctrl_vars_def = Define`
  ctrl_vars = ^ctrl_vars`

val bounds_fml_def = Define`
  bounds_fml = ^bounds_fml`

val init_fml_def = Define`
  init_fml = ^init_fml`

val ctrl_fml_def = Define`
  ctrl_fml = ^ctrl_fml`

val plant_fml_def = Define`
  plant_fml = ^plant_fml`

val default_def = Define`
  default (const_ls:word32 list) (sense_ls:word32 list) =
  ^(default_body |> SIMP_CONV std_ss[NULL_EQ] |> rconc)`

val cml_const_th = translate const_vars_def;
val cml_sensor_pre_th = translate sensor_pre_vars_def;
val cml_sensor_th = translate sensor_vars_def;
val cml_ctrl_th = translate ctrl_vars_def;

val cml_bounds_fml_th = translate bounds_fml_def;
val cml_init_fml_th = translate init_fml_def;
val cml_ctrl_fml_th = translate ctrl_fml_def;
val cml_plant_fml_th = translate plant_fml_def;

val cml_default_th = translate default_def;

val bot_main = process_topdecs`
  fun bot_main u =
    monitor_loop bounds_fml init_fml plant_fml ctrl_fml const_vars sensor_pre_vars sensor_vars ctrl_vars default`

val _ = append_prog bot_main;

val st = get_ml_prog_state();

val trans_th = [cml_const_th,cml_sensor_pre_th,cml_sensor_th,cml_ctrl_th,
               cml_bounds_fml_th, cml_init_fml_th,cml_ctrl_fml_th,cml_plant_fml_th,
               cml_default_th]

val comp_eq = [mach_component_equality,
              mach_config_component_equality,
              mach_state_component_equality,
              mach_oracle_component_equality];

(* Define all the possible initial states w.r.t. to our formulas *)
val init_state_def = Define`
  init_state w <=>
  ((w.wc = <|
      const_names      := const_vars;
      sensor_names     := sensor_vars;
      sensor_pre_names := sensor_pre_vars;
      ctrl_names       := ctrl_vars;
      bounds           := bounds_fml;
      init             := init_fml;
      ctrl_monitor     := ctrl_fml;
      plant_monitor    := plant_fml;
       |>)  (* Other two parts are ARB for this model *)
  ∧
  w.tr = [] ∧
  good_default default w ∧
  eventually $~ w.wo.step_oracle
  )`

val bot_main_spec = Q.store_thm("bot_main_spec",`
  init_state w ==>
  app (p:'ffi ffi_proj) ^(fetch_v "bot_main" st)
    [u]
  (IOBOT w)
  (POSTv uv.
    &UNIT_TYPE () uv * (
    (SEP_EXISTS w'. IOBOT w' *
     &(
      (* Either the initial machine violates init or bounds immediately *)
      (w = w' ∧ (¬init_sat w.wc w.ws ∨ ¬bounds_sat w.wc w.ws) ) ∨
      (* Or we transition to a final machine,
         and good_mach guarantees that the actuation trace all
         satisfy the control monitor *)
      good_mach default w' ∧
      (¬w'.wo.step_oracle 0 ∨
         good_plant_trace F w'.wc w'.tr w'.ws)))))`,
  rw[]>>
  xcf "bot_main" st>>
  fs[init_state_def]>>
  xapp>>
  qexists_tac`emp`>>qexists_tac`w`>>
  qexists_tac`default`>>
  xsimpl>>fs[init_state_def]>>
  fs trans_th>>
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
      SPLIT (st2heap (bot_proj1,bot_proj2) (auto_state_7 (bot_ffi w)))
        (h1,h2) ∧ IOBOT w h1)`,
  fs [IOBOT_def,SEP_CLAUSES,IOx_def,bot_ffi_part_def,
      IO_def,SEP_EXISTS_THM,PULL_EXISTS,one_def] >>
  rw[]>>simp[fetch "-""auto_state_7_def",cfStoreTheory.st2heap_def]>>
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
