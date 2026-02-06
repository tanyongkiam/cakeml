// Lean compiler output
// Module: CakeML
// Imports: Init CakeML.Lib.HOL4Prelude CakeML.Lib.FiniteMap CakeML.Lib.Words CakeML.Lib.IEEE754 CakeML.Lib.Llist CakeML.Lib.LprefixLub CakeML.Lib.Grammar CakeML.Lib.Location CakeML.Core.Namespace CakeML.Core.Misc CakeML.Core.Mllist CakeML.Core.Mlstring CakeML.Core.Ffi CakeML.Core.Ast CakeML.Core.Tokens CakeML.Core.FpSem CakeML.Core.NamespaceProps CakeML.Core.TokenUtils CakeML.Core.Gram CakeML.Core.LexerFun CakeML.Core.SemanticPrimitives CakeML.Core.SemanticPrimitivesProps CakeML.Core.Evaluate CakeML.Core.EvaluateProps CakeML.Core.TypeSystem CakeML.Core.TypeSoundInvariants CakeML.Core.TypeSysProps CakeML.Core.PrimTypes CakeML.Core.Semantics CakeML.Core.CmlPtreeConversion CakeML.Core.PrimSemEnv CakeML.Core.Weakening CakeML.Core.TypeSound
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Lib_HOL4Prelude(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Lib_FiniteMap(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Lib_Words(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Lib_IEEE754(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Lib_Llist(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Lib_LprefixLub(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Lib_Grammar(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Lib_Location(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Namespace(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Misc(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Mllist(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Mlstring(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Ffi(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Ast(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Tokens(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_FpSem(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_NamespaceProps(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_TokenUtils(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Gram(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_LexerFun(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_SemanticPrimitives(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_SemanticPrimitivesProps(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Evaluate(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_EvaluateProps(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_TypeSystem(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_TypeSoundInvariants(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_TypeSysProps(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_PrimTypes(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Semantics(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_CmlPtreeConversion(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_PrimSemEnv(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Weakening(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_TypeSound(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_CakeML(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Lib_HOL4Prelude(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Lib_FiniteMap(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Lib_Words(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Lib_IEEE754(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Lib_Llist(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Lib_LprefixLub(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Lib_Grammar(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Lib_Location(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Namespace(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Misc(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Mllist(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Mlstring(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Ffi(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Ast(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Tokens(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_FpSem(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_NamespaceProps(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_TokenUtils(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Gram(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_LexerFun(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_SemanticPrimitives(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_SemanticPrimitivesProps(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Evaluate(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_EvaluateProps(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_TypeSystem(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_TypeSoundInvariants(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_TypeSysProps(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_PrimTypes(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Semantics(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_CmlPtreeConversion(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_PrimSemEnv(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Weakening(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_TypeSound(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
