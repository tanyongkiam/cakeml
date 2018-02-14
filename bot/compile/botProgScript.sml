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
  {?...} U {? ...}
*)
val parse_loop1_def = Define`
  (parse_loop1 (Seq c (Seq (ctrlmonchoice) rest)) =
  case parse_names c of
     NONE => NONE
  |  SOME ctrlplus =>
  case parse_choice ctrlmonchoice of
     NONE => NONE
  |  SOME (ctrl,cplus,default,ctrlmon) =>
    if MAP Var ctrlplus = cplus then
      SOME(ctrl,ctrlplus,default,ctrlmon,rest)
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

(* The sandbox pattern *)
val parse_hp_def = Define`
  parse_hp hp =
  (* Extract the header *)
  case parse_header hp of
    NONE => NONE
  | SOME (consts,sensors,init,hp) =>
  case hp of
    Loop hp =>
      (case parse_loop1 hp of
      NONE => NONE
      | SOME (ctrl,ctrlplus,default,ctrlmon,hp) =>
      case parse_loop2 hp of
      NONE => NONE
      | SOME (ss,sensorplus,plantmon)=>
        if ss = sensors then
          SOME(consts,sensors,sensorplus,ctrl,ctrlplus,default,init,ctrlmon,plantmon)
        else NONE)
    | _ => NONE
  | _=> NONE`

(* Sanity Checks
EVAL ``parse_choice
  (Choice (Seq (Test cmon) (Assign "ctrl1" (SOME (Var "ctrlplus1"))))
          (Seq (Test (Not(cmon))) (Assign "ctrl1" (SOME (Const 0w)))))``

EVAL ``parse_loop1
  (Seq (Assign "ctrlplus1" NONE)
  (Seq
  (Choice (Seq (Test cmon) (Assign "ctrl1" (SOME (Var "ctrlplus1"))))
          (Seq (Test (Not(cmon))) (Assign "ctrl1" (SOME (Const 0w)))))
  foo))``

EVAL ``parse_loop2
  (Seq (Assign "sensorplus1" NONE)
  (Seq
  (Test pmon)
  (Assign "sensor1" (SOME (Var "sensorplus1")))))``
   *)

val config_filename = "foo"
val config_file = TextIO.openIn config_filename;

fun check_fv trm =
  if free_vars trm ≠ [] then raise ERR "" "configuration has free variables"

fun read_configuration config_filename  =
  let val config_file = TextIO.openIn config_filename;
      val stropt = TextIO.inputLine config_file in
  case stropt of
    NONE => raise ERR "read_config" ("Failed to read config file: "^config_filename)
  | SOME str =>
    let val trm = (Term ([QUOTE str]))
      handle (HOL_ERR _) => raise ERR "read_config" ("Failed to parse input as a HOL term: "^str)
        val fvs = free_vars trm
    in
      trm
    end
  end

read_configuration "monitor_config.txt"
fun read_


(* Reads a term directly from the file *)
val hp_term = do_input_term config_file

EVAL``parse_hp ^hp_term``

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
