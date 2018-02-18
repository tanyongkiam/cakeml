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
(* Helper functions for parsing the input sandbox *)

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

(* Parses the RHS of fixed controls *)
val parse_fixed_def = Define`
  (parse_fixed [] = SOME []) ∧
  (parse_fixed (Const w::xs) =
    case parse_fixed xs of
      NONE => NONE
    | SOME vs => SOME(INL w :: vs)) ∧
  (parse_fixed (Var x::xs) =
    case parse_fixed xs of
      NONE => NONE
    | SOME vs => SOME(INR x :: vs)) ∧
  (parse_fixed _ = NONE)`

(* Parses the controller monitor and default
   We require the pattern
   {?ctrlmon; ctrl := ctrl+}
   U
   {?~ctrlmon;ctrl := defs}

  return (ctrl,ctrl+,defs,rest)
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
  (* Sanity check *)
  if MAP FST ctrls = MAP FST defs then
    SOME (MAP FST ctrls,MAP SND ctrls,MAP SND defs,f)
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
  case parse_fixed (MAP SND ctrlfixed) of
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
             EVERY (λx. MEM x (consts)) (FLAT(MAP fv_trm default)) ∧
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

(* Helper functions for printing the C template *)
val header_lines =
  ["#include <csetjmp>",
  "#include <stdint.h>",
  "#include <assert.h>",
  "#include <string.h>",
  "",
  "// For calling to/from CakeML",
  "extern \"C\" int cml_main(int argc, char **argv);",
  "extern \"C\" void cml_exit(void);",
  "std::jmp_buf env;",
  "",
  "// Expose FFIs to CakeML",
  "extern \"C\" void ffiget_const (int32_t *c, long clen, int32_t *a, long alen);",
  "extern \"C\" void ffiget_sensor(int32_t *c, long clen, int32_t *a, long alen);",
  "extern \"C\" void ffiget_ctrl (int32_t *c, long clen, int32_t *a, long alen);",
  "extern \"C\" void ffiactuate(char *c, long clen, int32_t *a, long alen);",
  "extern \"C\" void ffihas_next(int32_t *c, long clen, int8_t *a, long alen);",
  "extern \"C\" void ffiviolation(char *c, long clen, int32_t *a, long alen);"];

fun arr_set_lines arr_name [] index = []
  | arr_set_lines arr_name (v::vs) index =
    ("  "^arr_name^"["^Int.toString index^"] = "^v^"; // sets "^v)::
    arr_set_lines arr_name vs (index+1);

fun arr_get_lines arr_name [] index = []
  | arr_get_lines arr_name (v::vs) index =
    ("  int32_t "^v^" = "^arr_name^"["^Int.toString index^"]; // the current "^v)::
    arr_get_lines arr_name vs (index+1);

fun const_lines consts =
  ["void ffiget_const (int32_t *c, long clen, int32_t *a, long alen) {",
  "  assert(clen == 0);",
  "  assert(alen == "^Int.toString (List.length consts)^" * 4);",
  "",
  " /*",
  "  * Insert code for computing the constants here",
  "  */",
  "",
  "  // Set the values of constants"] @
  arr_set_lines "a" consts 0 @
  ["}"];

fun sensor_lines sensors =
  ["void ffiget_sensor(int32_t *c, long clen, int32_t *a, long alen) {",
  "  assert(clen == 0);",
  "  assert(alen == "^Int.toString (List.length sensors)^" * 4);",
  "",
  " /*",
  "  * Insert code for computing the current sensor values here",
  "  */",
  "",
  "  // Set the current sensor values"] @
  arr_set_lines "a" sensors 0 @
  ["}"];

fun ctrl_lines consts sensors ctrls =
  ["void ffiget_ctrl(int32_t *c, long clen, int32_t *a, long alen) {",
  "  assert(clen == "^Int.toString (List.length consts + List.length sensors) ^" * 4);",
  "  assert(alen == "^Int.toString (List.length ctrls)^" * 4);",
  "",
  "  // the constants"] @
  arr_get_lines "c" consts 0 @
  ["  // the current sensor values"] @
  arr_get_lines "c" sensors (List.length consts) @
  ["",
  " /*",
  "  * Insert code for computing the (unverified) control values here",
  "  */",
  "",
  "  // Set the control values"] @
  arr_set_lines "a" ctrls 0 @
  ["}"];

fun actuate_lines ctrls =
  ["void ffiactuate(char *c, long clen, int32_t *a, long alen) {",
  "  assert(alen == "^Int.toString (List.length ctrls)^" * 4);",
  "",
  "  // the actuation values"] @
  arr_get_lines "a" ctrls 0 @
  ["",
  "  const char* how = (const char *)c; // distinguish between normal OK and fallback",
  "  if (strncmp(how,\"OK\",clen) == 0) {",
  "    // Control monitor OK",
  "  } else if (strncmp(how,\"Control Violation\",clen) == 0) {",
  "    // Control monitor violated",
  "  } else {",
  "    // Unknown string -- should never occur",
  "    assert(false);",
  "  }",
  "",
  " /*",
  "  * Insert code for actuating the controls",
  "  */",
  "}"];

val end_lines =
  ["void ffihas_next(int32_t *c, long clen, int8_t *a, long alen) {",
  "  assert(clen == 0);",
  "  assert(alen == 1);",
  "",
  "  bool has_next = true;",
  "",
  "  /*",
  "   * Insert code for deciding whether to continue running here",
  "   */",
  "",
  "  if (has_next)",
  "    a[0] = 1;",
  "  else",
  "    a[0] = 0;",
  "}",
  "",
  "void ffiviolation(char *c, long clen, int32_t *a, long alen) {",
  "  assert(alen == 0);",
  "",
  "  const char* how = (const char *)c; // distinguish between normal OK and fallback",
  "  if (strncmp(how,\"Init Violation\",clen) == 0) {",
  "    // Initial conditions violated",
  "  } else if (strncmp(how,\"Plant Violation\",clen) == 0) {",
  "    // Plant monitor violated",
  "  }  else {",
  "    // Unknown string -- should never occur",
  "    assert(false);",
  "  }",
  "",
  "  /*",
  "   * Insert code for handling violation here",
  "   */",
  "}",
  "",
  "",
  "void cml_exit(void) {",
  "  longjmp(env,1);",
  "}",
  "",
  "int main (int argc, char **argv) {",
  "",
  "  /*",
  "   * Insert initialization code here",
  "   */",
  "",
  "  // Passing control to CakeML",
  "  int sj = 0;",
  "  sj = setjmp(env);",
  "  if (sj == 0) {",
  "    int ret = cml_main(argc,argv);",
  "    // CakeML return value is stored in ret",
  "  }",
  "",
  "  /*",
  "   * Insert cleanup code here",
  "   */",
  "}"];

fun write_template template_filename const_vars sensor_vars ctrl_vars =
  let
    val out_file = TextIO.openOut template_filename;
    val consts = map stringSyntax.fromHOLstring (#1 (listSyntax.dest_list const_vars))
    val sensors = map stringSyntax.fromHOLstring (#1 (listSyntax.dest_list sensor_vars))
    val ctrls = map stringSyntax.fromHOLstring (#1 (listSyntax.dest_list ctrl_vars))
    val str = String.concatWith "\n" (header_lines @ ""::const_lines consts @ ""::sensor_lines sensors @ ""::ctrl_lines consts sensors ctrls @ ""::actuate_lines ctrls @ ""::end_lines)
  in
    TextIO.output(out_file,str); TextIO.flushOut out_file
  end;

val folder_str =
  Option.valOf (OS.Process.getEnv "SANDBOX_FOLDER")
  handle _ => ".";

val sandbox_str = "sandbox.hol";

(* Copy the sandbox file into the appropriate folder *)
val (const_vars,sensor_vars,sensorplus_vars,ctrl_vars,ctrlplus_vars,ctrlfixed_vars,ctrlfixed_rhs,default,init_fml,ctrl_fml,plant_fml) =  read_configuration sandbox_str;

val template_str = write_template (folder_str^"/bot_ffi.c") const_vars sensor_vars ctrl_vars;

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
