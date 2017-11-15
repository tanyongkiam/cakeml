open preamble MonitorProgTheory MonitorProofTheory botFFITheory
open ml_progLib ml_translatorLib
open basisFunctionsLib
open cfTacticsLib cfLetAutoLib

(* Here, we concretely instantiate the monitors with
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
val plant_fml = reval(do_input_term config_file "plant_fml");
val ctrl_fml = reval(do_input_term config_file "ctrl_fml");

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

val comp_eq = [world_component_equality,
              world_config_component_equality,
              world_state_component_equality,
              world_oracle_component_equality];

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
  (* These specify what the inputs should be *)
  init_state w ==>
  app (p:'ffi ffi_proj) ^(fetch_v "bot_main" st)
    [u]
  (IOBOT w)
  (POSTv uv.
    &UNIT_TYPE () uv * (
    (SEP_EXISTS w'. IOBOT w' *
     &(
      (* Either the initial world violates init or bounds immediately *)
      (w = w' ∧ (¬init_sat w.wc w.ws ∨ ¬bounds_sat w.wc w.ws) ) ∨
      (* Or we transition to a final world,
         and good_world guarantees that the actuation trace all
         satisfy the control monitor *)
      good_world default w' ∧
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

val main = reval ``Tdec (Dlet unknown_loc (Pvar "u") (App Opapp [Var (Short "bot_main"); Con NONE []]))``

val (ML_code (ss,envs,vs,th)) = get_ml_prog_state ();

val prog = (rconc o EVAL) ``SNOC ^main ^(th |> concl |> strip_comb |> #2 |> el 3)``

val prog_def = Define`bot_prog = ^prog`;

(*
val spec = bot_main_spec |> SPEC_ALL |> UNDISCH_ALL
            |> SIMP_RULE std_ss [STDIO_def] |> add_basis_proj;
val name = "bot_main"

open compilationLib

(* Produce .S files *)
val x64 = compile_x64 500 500 "bot_x64" prog_def;
val arm6 = compile_arm6 100 100 "bot_arm6" prog_def;


(* ? broken *)
val (semantics_thm,prog_tm) = call_thm st name spec
val cat_prog_def = Define`cat_prog = ^prog_tm`;

val cat_semantics_thm =
  semantics_thm
  |> ONCE_REWRITE_RULE[GSYM cat_prog_def]
  |> DISCH_ALL
  |> SIMP_RULE(srw_ss())[STD_streams_add_stdout,AND_IMP_INTRO,GSYM CONJ_ASSOC]
  |> curry save_thm "cat_semantics_thm";



(* The looping control monitor program *)
val ctrl_bot_main =
  process_topdecs`
  fun bot_main u =
    ctrl_monitor_loop init_fml ctrl_fml const_vars sensor_vars ctrl_vars default`

val st = get_ml_prog_state();

val trans_th = [cml_ctrl_th,cml_init_fml_th,cml_sensor_th,cml_ctrl_th,cml_ctrl_fml_th,cml_const_th,cml_default_th]

val comp_eq = [world_component_equality,
              world_config_component_equality,
              world_state_component_equality,
              world_oracle_component_equality];

(* Define all the possible initial states w.r.t. to our formulas *)
val init_state_def = Define`
  init_state w <=>
  ((w.wc = <|
      const_names  := const_vars;
      sensor_names := sensor_vars;
      ctrl_names   := ctrl_vars;
      init         := init_fml;
      ctrl_monitor := ctrl_fml |>)  (* Other two parts are ARB for this model *)
  ∧
  w.tr = [] ∧
  good_default default w ∧
  eventually $~ w.wo.step_oracle
  )`

val bot_main_spec = Q.store_thm("bot_main_spec",`
  (* These specify what the inputs should be *)
  init_state w ==>
  app (p:'ffi ffi_proj) ^(fetch_v "bot_main" st)
    [u]
  (STDIO fs * IOBOT w)
  (POSTv uv.
    &UNIT_TYPE () uv * (STDIO fs *
    (SEP_EXISTS w'. IOBOT w' *
     &(
      (* Either the initial world violates init immediately *)
      (w = w' ∧ ¬init_sat w.wc w.ws) ∨
      (* Or we transition to a final world,
         and good_world guarantees that the actuation trace all
         satisfy the control monitor *)
      good_world default w' ∧
      ¬w'.wo.step_oracle 0))))`,
  rw[]>>
  xcf "bot_main" st>>
  fs[init_state_def]>>
  xapp>>
  qexists_tac`STDIO fs`>>qexists_tac`w`>>
  qexists_tac`default`>>
  xsimpl>>fs[init_state_def]>>
  fs (comp_eq@trans_th)>>xsimpl>>
  fs[good_ctrl_trace_def]>>
  rw[]>>
  fs (comp_eq@trans_th)>>xsimpl>>
  qexists_tac`x`>>fs[]>>xsimpl);

val spec = bot_main_spec |> SPEC_ALL |> UNDISCH_ALL
            |> SIMP_RULE std_ss [STDIO_def] |> add_basis_proj;
val name = "bot_main"

val main = reval ``Tdec (Dlet unknown_loc (Pvar "u") (App Opapp [Var (Short "bot_main"); Con NONE []]))``

val (ML_code (ss,envs,vs,th)) = get_ml_prog_state ();

val prog = (rconc o EVAL) ``SNOC ^main ^(th |> concl |> strip_comb |> #2 |> el 3)``

val prog_def = Define`bot_prog = ^prog`;

open compilationLib

(* Produce .S files *)
val x64 = compile_x64 500 500 "bot_x64" prog_def;
val arm6 = compile_arm6 100 100 "bot_arm6" prog_def;


(* ? broken *)
val (semantics_thm,prog_tm) = call_thm st name spec
val cat_prog_def = Define`cat_prog = ^prog_tm`;

val cat_semantics_thm =
  semantics_thm
  |> ONCE_REWRITE_RULE[GSYM cat_prog_def]
  |> DISCH_ALL
  |> SIMP_RULE(srw_ss())[STD_streams_add_stdout,AND_IMP_INTRO,GSYM CONJ_ASSOC]
  |> curry save_thm "cat_semantics_thm";
*)

val _ = export_theory();
