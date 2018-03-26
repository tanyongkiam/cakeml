open preamble MonitorProgTheory MonitorProofTheory botFFITheory botFFIProofTheory
open intervalArithTheory
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

val _ = bring_fwd_ctors ``:intervalArith$trm``
val _ = bring_fwd_ctors ``:intervalArith$fml``
val _ = bring_fwd_ctors ``:intervalArith$hp``

(* This is the final step that produces a monitor
  Here, we concretely instantiate the monitors with
  formulas from an input file *)

val _ = new_theory "botProg"

(* Invert AssignAnyPar *)
val parse_AssignAnyPar_def = Define`
  (parse_AssignAnyPar (Seq (Assign x NONE) p2) =
    case parse_AssignAnyPar p2 of
      NONE => NONE
    | SOME xs => SOME (x::xs)) ∧
  (parse_AssignAnyPar p =
    if p = Skip then SOME []
    else NONE)`

val parse_AssignAnyPar_inv = Q.prove(`
  ∀seq ls.
  parse_AssignAnyPar seq = SOME ls ⇒
  AssignAnyPar ls = seq`,
  ho_match_mp_tac (fetch "-" "parse_AssignAnyPar_ind")>>
  rw[]>>fs[parse_AssignAnyPar_def]>>
  EVERY_CASE_TAC>>rw[]>>fs[AssignAnyPar_def]);

(* Invert AssignPar *)
val parse_AssignPar_def = Define`
  (parse_AssignPar (Seq (Assign x (SOME t)) p2) =
    case parse_AssignPar p2 of
      NONE => NONE
    | SOME (xs,ts) => SOME (x::xs,t::ts)) ∧
  (parse_AssignPar p =
    if p = Skip then SOME ([],[])
    else NONE)`

val parse_AssignPar_inv = Q.prove(`
  ∀seq ls ts.
  parse_AssignPar seq = SOME (ls,ts) ⇒
  AssignPar ls ts = seq`,
  ho_match_mp_tac (fetch "-" "parse_AssignPar_ind")>>
  rw[]>>fs[parse_AssignPar_def]>>
  EVERY_CASE_TAC>>rw[]>>fs[AssignPar_def]);

val parse_AssignVarPar_def = Define`
  parse_AssignVarPar p =
  OPTION_JOIN (lift ( λ(xs,ts).
    lift (\vs.(xs,vs)) (OPT_MMAP (λt. case t of Var n => SOME n | _ => NONE) ts)
  )
  (parse_AssignPar p))`

(* Invert AssignVarPar *)
val parse_AssignVarPar_inv = Q.prove(`
  ∀seq ls ts.
  parse_AssignVarPar seq = SOME (ls,ts) ⇒
  AssignVarPar ls ts = seq`,
  rw[AssignVarPar_def,parse_AssignVarPar_def]>>
  fs[OPTION_JOIN_EQ_SOME]>>
  pairarg_tac>>fs[]>>
  drule parse_AssignPar_inv>>
  rw[]>>
  AP_TERM_TAC>>
  pop_assum mp_tac>>
  qid_spec_tac`ts'`>>
  qid_spec_tac`ts`>>
  pop_assum kall_tac>>
  Induct>>Cases_on`ts'`>>fs[]>>Cases_on`h`>>fs[OPT_MMAP_def]);

(* Parses the initialization block
  consts := *;
  sensors := *;
  ?Init;
*)
val parse_header_def = Define`
  parse_header p =
  case p of
  (Seq c (Seq s (Test init))) =>
    (case (parse_AssignAnyPar c, parse_AssignAnyPar s) of
      (SOME consts, SOME sensors) =>
      SOME (consts,sensors,init)
    | _ => NONE)
  | _ => NONE`

(* The body parsing is rather large, so we break it into two halves*)
val parse_body1_def = Define`
  parse_body1 p =
  case p of
    (Seq c (Seq c2 (Seq (Choice (Test ctrlmon) c3) rest))) =>
     (case parse_AssignAnyPar c, parse_AssignVarPar c2, parse_AssignPar c3 of
     (SOME ctrlplus, SOME (ctrlfixed,ctrlfixed_rhs), SOME(ctrldef,defaults)) =>
     if ctrlplus = ctrldef then
       SOME(ctrlplus,ctrlfixed,ctrlfixed_rhs,defaults,ctrlmon,rest)
     else NONE
     | _ => NONE)
  | _ => NONE`

val parse_body2_def = Define`
  parse_body2 p =
  case p of
    (Seq c (Seq c2 (Seq (Test plantmon) c3))) =>
     (case parse_AssignVarPar c, parse_AssignAnyPar c2, parse_AssignVarPar c3 of
     (SOME (ctrl,ctrlplus), SOME sensorplus, SOME(sensors,sensorplus2)) =>
     if sensorplus = sensorplus2 then
       SOME(ctrl,ctrlplus,sensorplus,sensors,plantmon)
     else NONE
     | _ => NONE)
  | _ => NONE`

val parse_body_def = Define`
  parse_body p =
  case parse_body1 p of
    SOME(ctrlplus,ctrlfixed,ctrlfixed_rhs,defaults,ctrlmon,rest) =>
  (case parse_body2 rest of
    SOME(ctrl,ctrlplus2,sensorplus,sensors,plantmon) =>
      if ctrlplus=ctrlplus2 then
        SOME(ctrl,ctrlplus,ctrlfixed,ctrlfixed_rhs,sensors,sensorplus,ctrlmon,plantmon,defaults)
      else NONE
    | NONE => NONE)
  | NONE => NONE`

val parse_sandbox_def = Define`
  (parse_sandbox p =
  case p of (Seq header (Loop body)) =>
  (case (parse_header header, parse_body body) of
    SOME(consts,sensors,init),SOME(ctrl,ctrlplus,ctrlfixed,ctrlfixed_rhs,sensors2,sensorplus,ctrlmon,plantmon,defaults) =>
    if sensors = sensors2 then
      SOME(consts,sensors,sensorplus,ctrl,ctrlplus,ctrlfixed,ctrlfixed_rhs,defaults,init,ctrlmon,plantmon)
    else NONE
    | _ => NONE)
  | _ => NONE)`

val mk_config_def = Define`
  mk_config (const_vars,sensor_vars,sensorplus_vars,ctrl_vars,ctrlplus_vars,ctrlfixed_vars,ctrlfixed_rhs,default,init_fml,ctrl_fml,plant_fml) =
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

val parse_sandbox_inv = Q.prove(`
  parse_sandbox p = SOME res ⇒
  p = full_sandbox T (mk_config res)`,
  fs[parse_sandbox_def,parse_header_def,parse_body_def,parse_body1_def,parse_body2_def]>>
  EVERY_CASE_TAC>>rw[]>>
  fs[mk_config_def,full_sandbox_def,init_sandbox_def,body_sandbox_def,hide_def]>>
  metis_tac[parse_AssignAnyPar_inv,parse_AssignPar_inv,parse_AssignVarPar_inv]);

fun check_fv trm =
  let val fvs = free_vars trm  in
  if free_vars trm <> [] then
    raise ERR "" ("term has free variables: "^ String.concatWith " " (map term_to_string fvs))
  else
    ()
  end;

val parse_hp_tm = ``parse_sandbox``;
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
        val th = EVAL (mk_comb (parse_hp_tm,trm))
        val opt = (rhs o concl) th
    in
      if optionLib.is_some opt
      then
        (th,trm,optionLib.dest_some opt)
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

val _ = translation_extends "MonitorProg";

val sandbox_str = "sandbox.hol";

val (parse_th, sandbox_tm, parse_opt) = read_configuration sandbox_str;

(* Split up the arguments for easier handling *)
val (const_vars,sensor_vars,sensorplus_vars,ctrl_vars,ctrlplus_vars,ctrlfixed_vars,ctrlfixed_rhs,default,init_fml,ctrl_fml,plant_fml) = (split11 o pairSyntax.strip_pair) parse_opt;

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
  init_wc = mk_config (const_vars,sensor_vars,sensorplus_vars,ctrl_vars,ctrlplus_vars,ctrlfixed_vars,ctrlfixed_rhs,default,init_fml,ctrl_fml,plant_fml)`

val init_wf = EVAL ``wf_config init_wc``;

(* The input sandbox program *)
val sandbox_hp_def = Define`
  sandbox_hp = ^sandbox_tm`

(* Define the possible initial FFI states w.r.t. to our formulas *)
val init_state_def = Define`
  init_state w <=>
  (w.wc = init_wc ∧
  eventually $~ w.wo.step_oracle)`

val init_state_imp_sandbox_hp = Q.prove(`
  init_state w ⇒
  sandbox_hp = full_sandbox T w.wc`,
  rw[init_state_def]>>
  simp[init_wc_def]>>
  match_mp_tac parse_sandbox_inv>>
  fs[sandbox_hp_def,parse_th]>>
  EVAL_TAC);

val bot_main_spec = Q.store_thm("bot_main_spec",`
  init_state w ∧
  state_rel_abs w st ⇒
  app (p:'ffi ffi_proj) ^(fetch_v "bot_main" st)
    [u]
  (IOBOT w)
  (POSTv uv.
    &UNIT_TYPE () uv * (
    (SEP_EXISTS w'. IOBOT w' *
     &(
      (* Case 1: the initial mach violates init immediately *)
      (w = w' ∧ init_step w = NONE) ∨
      ∃defaults.
      init_step w = SOME defaults ∧
      (
      (* Case 2: ran to completion, w' is obtained from w by RTC of body_step,
         and they correspond to a step of the full sandbox *)
      (¬w'.wo.step_oracle 0 ∧ body_loop defaults w w' ∧
        ∃st'. state_rel_abs w' st' ∧ wpsem sandbox_hp st st') ∨
      (* Case 3: ran the loop up until an intermediate state, but which
         then fails the body_step transition in the plant step *)
      ∃v sti.
        body_loop defaults w v ∧
        state_rel_abs v sti ∧
        wpsem sandbox_hp st sti ∧
        (* this can also be mapped into a HP, but this step is more precise *)
        body_step F defaults v w')))))`,
  rw[]>>
  imp_res_tac init_state_imp_sandbox_hp>>
  xcf "bot_main" st>>
  fs[init_state_def]>>
  xapp>>
  qexists_tac`emp`>>qexists_tac`w`>>qexists_tac`st`>>
  xsimpl>>
  fs[init_wf,init_wc_def,mk_config_def]>>fs trans_th);

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
