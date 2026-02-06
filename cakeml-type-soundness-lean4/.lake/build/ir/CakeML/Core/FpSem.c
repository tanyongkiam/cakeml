// Lean compiler output
// Module: CakeML.Core.FpSem
// Imports: Init CakeML.Lib.IEEE754 CakeML.Lib.Words CakeML.Core.Ast
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
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__13;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__11;
LEAN_EXPORT lean_object* l_CakeML_instBEqFp__uop;
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____boxed(lean_object*);
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_beqfp__cmp____x40_CakeML_Core_FpSem___hyg_194____boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_instDecidableEqFp__uop___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__top_ofNat(lean_object*);
LEAN_EXPORT uint8_t l___private_CakeML_Core_FpSem_0__CakeML_beqfp__cmp____x40_CakeML_Core_FpSem___hyg_194_(uint8_t, uint8_t);
LEAN_EXPORT lean_object* l_CakeML_fp__uop_toCtorIdx___boxed(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__bop__comp___rarg___boxed(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__3;
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14_(uint8_t, lean_object*);
static lean_object* l_CakeML_instReprFp__uop___closed__1;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__20;
static lean_object* l_CakeML_fp__cmp_noConfusion___rarg___closed__1;
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_noConfusion___rarg(uint8_t, uint8_t, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__28;
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_toCtorIdx(uint8_t);
LEAN_EXPORT lean_object* l_CakeML_fp__top_noConfusion___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__12;
LEAN_EXPORT uint8_t l___private_CakeML_Core_FpSem_0__CakeML_beqfp__top____x40_CakeML_Core_FpSem___hyg_906_(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_CakeML_instInhabitedFp__bop;
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_instBEqFp__cmp;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__17;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__8;
LEAN_EXPORT lean_object* l_CakeML_fp__top__comp(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__18;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__8;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__26;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__6;
LEAN_EXPORT lean_object* l_CakeML_fp__top_noConfusion___rarg___boxed(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_ofNat___boxed(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__top_ofNat___boxed(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__bop_toCtorIdx___boxed(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_instBEqFp__top;
LEAN_EXPORT uint8_t l_CakeML_instDecidableEqFp__top(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__14;
LEAN_EXPORT lean_object* l_CakeML_fp__cmp__comp___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__top__comp___rarg___boxed(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__10;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__3;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__22;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__19;
LEAN_EXPORT lean_object* l_CakeML_fp__bop_noConfusion___rarg(uint8_t, uint8_t, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__4;
LEAN_EXPORT lean_object* l_CakeML_fp__uop_noConfusion(lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__11;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__1;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__12;
LEAN_EXPORT uint8_t l_CakeML_instDecidableEqFp__uop(uint8_t, uint8_t);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__13;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__10;
LEAN_EXPORT lean_object* l_CakeML_fpfma___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__top_toCtorIdx___boxed(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__bop_ofNat___boxed(lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__19;
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_noConfusion___rarg___lambda__1(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fpfma___boxed(lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__31;
static lean_object* l_CakeML_roundTiesToEven___closed__1;
LEAN_EXPORT uint8_t l_CakeML_fp__cmp__comp(uint8_t, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__uop_noConfusion___rarg(uint8_t, uint8_t, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__12;
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_CakeML_instDecidableEqFp__bop(uint8_t, uint8_t);
LEAN_EXPORT lean_object* l_CakeML_fp__bop__comp___boxed(lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__14;
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_noConfusion___rarg___lambda__1___boxed(lean_object*);
lean_object* lean_nat_to_int(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__top_noConfusion___rarg(lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__1;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__6;
lean_object* l_BitVec_ofNat(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__32;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__15;
LEAN_EXPORT uint8_t l___private_CakeML_Core_FpSem_0__CakeML_beqfp__bop____x40_CakeML_Core_FpSem___hyg_722_(uint8_t, uint8_t);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__16;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__8;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__1;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__18;
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_noConfusion___rarg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fpfma(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_noConfusion(lean_object*);
static lean_object* l_CakeML_instBEqFp__cmp___closed__1;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__16;
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____boxed(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__9;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__1;
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____boxed(lean_object*, lean_object*);
static lean_object* l_CakeML_instBEqFp__top___closed__1;
LEAN_EXPORT lean_object* l_CakeML_fp__top_toCtorIdx(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__bop__comp___rarg(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__7;
LEAN_EXPORT lean_object* l_CakeML_instInhabitedFp__top;
LEAN_EXPORT lean_object* l_CakeML_instReprFp__top;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__24;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
LEAN_EXPORT lean_object* l_CakeML_instDecidableEqFp__bop___boxed(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__21;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__4;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__18;
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___boxed(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_instDecidableEqFp__top___boxed(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__4;
LEAN_EXPORT lean_object* l_CakeML_fp__bop__comp(uint8_t);
LEAN_EXPORT lean_object* l_CakeML_fp__uop_noConfusion___rarg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_CakeML_fp__cmp__def(uint8_t, lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__5;
LEAN_EXPORT uint8_t l_CakeML_fp__uop_ofNat(lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__3;
LEAN_EXPORT lean_object* l_CakeML_roundTiesToEven;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__2;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__25;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__24;
LEAN_EXPORT lean_object* l_CakeML_instReprFp__bop;
LEAN_EXPORT lean_object* l_CakeML_fp__cmp__def___boxed(lean_object*, lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__5;
LEAN_EXPORT lean_object* l_CakeML_fp__top__comp___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fpfma___rarg___boxed(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__17;
LEAN_EXPORT lean_object* l_CakeML_fp__bop_noConfusion(lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__14;
LEAN_EXPORT uint8_t l_CakeML_instInhabitedFp__uop;
LEAN_EXPORT uint8_t l_CakeML_fp__cmp_ofNat(lean_object*);
LEAN_EXPORT uint8_t l_CakeML_instDecidableEqFp__cmp(uint8_t, uint8_t);
LEAN_EXPORT lean_object* l_CakeML_fp__top__comp___rarg(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__23;
LEAN_EXPORT uint8_t l_CakeML_instInhabitedFp__cmp;
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326_(uint8_t, lean_object*);
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_beqfp__bop____x40_CakeML_Core_FpSem___hyg_722____boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__bop_noConfusion___rarg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__uop__comp(uint8_t);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__2;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__4;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__13;
static lean_object* l_CakeML_instReprFp__bop___closed__1;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__29;
lean_object* l_Repr_addAppParen(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__15;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__30;
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854_(lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__15;
LEAN_EXPORT lean_object* l_CakeML_fp__uop__comp___rarg(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_toCtorIdx___boxed(lean_object*);
LEAN_EXPORT uint8_t l_CakeML_fp__bop_ofNat(lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__23;
LEAN_EXPORT lean_object* l_CakeML_fp__uop__comp___rarg___boxed(lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__20;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__9;
LEAN_EXPORT lean_object* l_CakeML_instDecidableEqFp__cmp___boxed(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__7;
LEAN_EXPORT lean_object* l_CakeML_instBEqFp__bop;
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_instReprFp__cmp;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__2;
static lean_object* l_CakeML_instReprFp__cmp___closed__1;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__5;
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_beqfp__top____x40_CakeML_Core_FpSem___hyg_906____boxed(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__5;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__17;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__22;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__27;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__11;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__7;
LEAN_EXPORT lean_object* l_CakeML_fp__top_noConfusion(lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__16;
LEAN_EXPORT lean_object* l_CakeML_fp__uop_ofNat___boxed(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_fp__uop_toCtorIdx(uint8_t);
LEAN_EXPORT uint8_t l___private_CakeML_Core_FpSem_0__CakeML_beqfp__uop____x40_CakeML_Core_FpSem___hyg_442_(uint8_t, uint8_t);
static lean_object* l_CakeML_instBEqFp__bop___closed__1;
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_beqfp__uop____x40_CakeML_Core_FpSem___hyg_442____boxed(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__9;
LEAN_EXPORT lean_object* l_CakeML_fp__uop__comp___boxed(lean_object*);
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__2;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__6;
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_instReprFp__uop;
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__21;
static lean_object* l_CakeML_instReprFp__top___closed__1;
static lean_object* l_CakeML_instBEqFp__uop___closed__1;
LEAN_EXPORT lean_object* l_CakeML_fp__bop_toCtorIdx(uint8_t);
static lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__10;
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574_(uint8_t, lean_object*);
static lean_object* _init_l_CakeML_roundTiesToEven___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_unsigned_to_nat(64u);
x_2 = lean_unsigned_to_nat(0u);
x_3 = l_BitVec_ofNat(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_roundTiesToEven() {
_start:
{
lean_object* x_1; 
x_1 = l_CakeML_roundTiesToEven___closed__1;
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_toCtorIdx(uint8_t x_1) {
_start:
{
switch (x_1) {
case 0:
{
lean_object* x_2; 
x_2 = lean_unsigned_to_nat(0u);
return x_2;
}
case 1:
{
lean_object* x_3; 
x_3 = lean_unsigned_to_nat(1u);
return x_3;
}
case 2:
{
lean_object* x_4; 
x_4 = lean_unsigned_to_nat(2u);
return x_4;
}
case 3:
{
lean_object* x_5; 
x_5 = lean_unsigned_to_nat(3u);
return x_5;
}
default: 
{
lean_object* x_6; 
x_6 = lean_unsigned_to_nat(4u);
return x_6;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_toCtorIdx___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = lean_unbox(x_1);
lean_dec(x_1);
x_3 = l_CakeML_fp__cmp_toCtorIdx(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_noConfusion___rarg___lambda__1(lean_object* x_1) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
static lean_object* _init_l_CakeML_fp__cmp_noConfusion___rarg___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_CakeML_fp__cmp_noConfusion___rarg___lambda__1___boxed), 1, 0);
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_noConfusion___rarg(uint8_t x_1, uint8_t x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_CakeML_fp__cmp_noConfusion___rarg___closed__1;
return x_4;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_noConfusion(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_CakeML_fp__cmp_noConfusion___rarg___boxed), 3, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_noConfusion___rarg___lambda__1___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_CakeML_fp__cmp_noConfusion___rarg___lambda__1(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_noConfusion___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_4 = lean_unbox(x_1);
lean_dec(x_1);
x_5 = lean_unbox(x_2);
lean_dec(x_2);
x_6 = l_CakeML_fp__cmp_noConfusion___rarg(x_4, x_5, x_3);
return x_6;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_cmp.FP_Less", 21, 21);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__1;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(2u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__2;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__5() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__4;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(1u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__2;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__8() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__7;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__9() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_cmp.FP_LessEqual", 26, 26);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__10() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__9;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__10;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__12() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__11;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__13() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__10;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__14() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__13;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__15() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_cmp.FP_Greater", 24, 24);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__16() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__15;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__17() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__16;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__18() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__17;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__19() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__16;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__20() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__19;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__21() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_cmp.FP_GreaterEqual", 29, 29);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__22() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__21;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__23() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__22;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__24() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__23;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__25() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__22;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__26() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__25;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__27() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_cmp.FP_Equal", 22, 22);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__28() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__27;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__29() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__28;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__30() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__29;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__31() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__28;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__32() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__31;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14_(uint8_t x_1, lean_object* x_2) {
_start:
{
switch (x_1) {
case 0:
{
lean_object* x_3; uint8_t x_4; 
x_3 = lean_unsigned_to_nat(1024u);
x_4 = lean_nat_dec_le(x_3, x_2);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; 
x_5 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__5;
x_6 = l_Repr_addAppParen(x_5, x_2);
return x_6;
}
else
{
lean_object* x_7; lean_object* x_8; 
x_7 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__8;
x_8 = l_Repr_addAppParen(x_7, x_2);
return x_8;
}
}
case 1:
{
lean_object* x_9; uint8_t x_10; 
x_9 = lean_unsigned_to_nat(1024u);
x_10 = lean_nat_dec_le(x_9, x_2);
if (x_10 == 0)
{
lean_object* x_11; lean_object* x_12; 
x_11 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__12;
x_12 = l_Repr_addAppParen(x_11, x_2);
return x_12;
}
else
{
lean_object* x_13; lean_object* x_14; 
x_13 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__14;
x_14 = l_Repr_addAppParen(x_13, x_2);
return x_14;
}
}
case 2:
{
lean_object* x_15; uint8_t x_16; 
x_15 = lean_unsigned_to_nat(1024u);
x_16 = lean_nat_dec_le(x_15, x_2);
if (x_16 == 0)
{
lean_object* x_17; lean_object* x_18; 
x_17 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__18;
x_18 = l_Repr_addAppParen(x_17, x_2);
return x_18;
}
else
{
lean_object* x_19; lean_object* x_20; 
x_19 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__20;
x_20 = l_Repr_addAppParen(x_19, x_2);
return x_20;
}
}
case 3:
{
lean_object* x_21; uint8_t x_22; 
x_21 = lean_unsigned_to_nat(1024u);
x_22 = lean_nat_dec_le(x_21, x_2);
if (x_22 == 0)
{
lean_object* x_23; lean_object* x_24; 
x_23 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__24;
x_24 = l_Repr_addAppParen(x_23, x_2);
return x_24;
}
else
{
lean_object* x_25; lean_object* x_26; 
x_25 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__26;
x_26 = l_Repr_addAppParen(x_25, x_2);
return x_26;
}
}
default: 
{
lean_object* x_27; uint8_t x_28; 
x_27 = lean_unsigned_to_nat(1024u);
x_28 = lean_nat_dec_le(x_27, x_2);
if (x_28 == 0)
{
lean_object* x_29; lean_object* x_30; 
x_29 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__30;
x_30 = l_Repr_addAppParen(x_29, x_2);
return x_30;
}
else
{
lean_object* x_31; lean_object* x_32; 
x_31 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__32;
x_32 = l_Repr_addAppParen(x_31, x_2);
return x_32;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14_(x_3, x_2);
lean_dec(x_2);
return x_4;
}
}
static lean_object* _init_l_CakeML_instReprFp__cmp___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_CakeML_instReprFp__cmp() {
_start:
{
lean_object* x_1; 
x_1 = l_CakeML_instReprFp__cmp___closed__1;
return x_1;
}
}
LEAN_EXPORT uint8_t l___private_CakeML_Core_FpSem_0__CakeML_beqfp__cmp____x40_CakeML_Core_FpSem___hyg_194_(uint8_t x_1, uint8_t x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_3 = l_CakeML_fp__cmp_toCtorIdx(x_1);
x_4 = l_CakeML_fp__cmp_toCtorIdx(x_2);
x_5 = lean_nat_dec_eq(x_3, x_4);
lean_dec(x_4);
lean_dec(x_3);
return x_5;
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_beqfp__cmp____x40_CakeML_Core_FpSem___hyg_194____boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = lean_unbox(x_2);
lean_dec(x_2);
x_5 = l___private_CakeML_Core_FpSem_0__CakeML_beqfp__cmp____x40_CakeML_Core_FpSem___hyg_194_(x_3, x_4);
x_6 = lean_box(x_5);
return x_6;
}
}
static lean_object* _init_l_CakeML_instBEqFp__cmp___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l___private_CakeML_Core_FpSem_0__CakeML_beqfp__cmp____x40_CakeML_Core_FpSem___hyg_194____boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_CakeML_instBEqFp__cmp() {
_start:
{
lean_object* x_1; 
x_1 = l_CakeML_instBEqFp__cmp___closed__1;
return x_1;
}
}
static uint8_t _init_l_CakeML_instInhabitedFp__cmp() {
_start:
{
uint8_t x_1; 
x_1 = 0;
return x_1;
}
}
LEAN_EXPORT uint8_t l_CakeML_fp__cmp_ofNat(lean_object* x_1) {
_start:
{
lean_object* x_2; uint8_t x_3; 
x_2 = lean_unsigned_to_nat(2u);
x_3 = lean_nat_dec_le(x_2, x_1);
if (x_3 == 0)
{
lean_object* x_4; uint8_t x_5; 
x_4 = lean_unsigned_to_nat(0u);
x_5 = lean_nat_dec_eq(x_1, x_4);
if (x_5 == 0)
{
uint8_t x_6; 
x_6 = 1;
return x_6;
}
else
{
uint8_t x_7; 
x_7 = 0;
return x_7;
}
}
else
{
lean_object* x_8; uint8_t x_9; 
x_8 = lean_unsigned_to_nat(3u);
x_9 = lean_nat_dec_le(x_8, x_1);
if (x_9 == 0)
{
uint8_t x_10; 
x_10 = 2;
return x_10;
}
else
{
uint8_t x_11; 
x_11 = lean_nat_dec_eq(x_1, x_8);
if (x_11 == 0)
{
uint8_t x_12; 
x_12 = 4;
return x_12;
}
else
{
uint8_t x_13; 
x_13 = 3;
return x_13;
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__cmp_ofNat___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = l_CakeML_fp__cmp_ofNat(x_1);
lean_dec(x_1);
x_3 = lean_box(x_2);
return x_3;
}
}
LEAN_EXPORT uint8_t l_CakeML_instDecidableEqFp__cmp(uint8_t x_1, uint8_t x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_3 = l_CakeML_fp__cmp_toCtorIdx(x_1);
x_4 = l_CakeML_fp__cmp_toCtorIdx(x_2);
x_5 = lean_nat_dec_eq(x_3, x_4);
lean_dec(x_4);
lean_dec(x_3);
return x_5;
}
}
LEAN_EXPORT lean_object* l_CakeML_instDecidableEqFp__cmp___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = lean_unbox(x_2);
lean_dec(x_2);
x_5 = l_CakeML_instDecidableEqFp__cmp(x_3, x_4);
x_6 = lean_box(x_5);
return x_6;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__uop_toCtorIdx(uint8_t x_1) {
_start:
{
switch (x_1) {
case 0:
{
lean_object* x_2; 
x_2 = lean_unsigned_to_nat(0u);
return x_2;
}
case 1:
{
lean_object* x_3; 
x_3 = lean_unsigned_to_nat(1u);
return x_3;
}
default: 
{
lean_object* x_4; 
x_4 = lean_unsigned_to_nat(2u);
return x_4;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__uop_toCtorIdx___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = lean_unbox(x_1);
lean_dec(x_1);
x_3 = l_CakeML_fp__uop_toCtorIdx(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__uop_noConfusion___rarg(uint8_t x_1, uint8_t x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_CakeML_fp__cmp_noConfusion___rarg___closed__1;
return x_4;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__uop_noConfusion(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_CakeML_fp__uop_noConfusion___rarg___boxed), 3, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__uop_noConfusion___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_4 = lean_unbox(x_1);
lean_dec(x_1);
x_5 = lean_unbox(x_2);
lean_dec(x_2);
x_6 = l_CakeML_fp__uop_noConfusion___rarg(x_4, x_5, x_3);
return x_6;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_uop.FP_Abs", 20, 20);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__1;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__2;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__4() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__3;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__2;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__6() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__5;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__7() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_uop.FP_Neg", 20, 20);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__8() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__7;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__9() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__8;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__10() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__9;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__8;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__12() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__11;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__13() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_uop.FP_Sqrt", 21, 21);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__14() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__13;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__15() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__14;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__16() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__15;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__17() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__14;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__18() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__17;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326_(uint8_t x_1, lean_object* x_2) {
_start:
{
switch (x_1) {
case 0:
{
lean_object* x_3; uint8_t x_4; 
x_3 = lean_unsigned_to_nat(1024u);
x_4 = lean_nat_dec_le(x_3, x_2);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; 
x_5 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__4;
x_6 = l_Repr_addAppParen(x_5, x_2);
return x_6;
}
else
{
lean_object* x_7; lean_object* x_8; 
x_7 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__6;
x_8 = l_Repr_addAppParen(x_7, x_2);
return x_8;
}
}
case 1:
{
lean_object* x_9; uint8_t x_10; 
x_9 = lean_unsigned_to_nat(1024u);
x_10 = lean_nat_dec_le(x_9, x_2);
if (x_10 == 0)
{
lean_object* x_11; lean_object* x_12; 
x_11 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__10;
x_12 = l_Repr_addAppParen(x_11, x_2);
return x_12;
}
else
{
lean_object* x_13; lean_object* x_14; 
x_13 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__12;
x_14 = l_Repr_addAppParen(x_13, x_2);
return x_14;
}
}
default: 
{
lean_object* x_15; uint8_t x_16; 
x_15 = lean_unsigned_to_nat(1024u);
x_16 = lean_nat_dec_le(x_15, x_2);
if (x_16 == 0)
{
lean_object* x_17; lean_object* x_18; 
x_17 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__16;
x_18 = l_Repr_addAppParen(x_17, x_2);
return x_18;
}
else
{
lean_object* x_19; lean_object* x_20; 
x_19 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__18;
x_20 = l_Repr_addAppParen(x_19, x_2);
return x_20;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326_(x_3, x_2);
lean_dec(x_2);
return x_4;
}
}
static lean_object* _init_l_CakeML_instReprFp__uop___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_CakeML_instReprFp__uop() {
_start:
{
lean_object* x_1; 
x_1 = l_CakeML_instReprFp__uop___closed__1;
return x_1;
}
}
LEAN_EXPORT uint8_t l___private_CakeML_Core_FpSem_0__CakeML_beqfp__uop____x40_CakeML_Core_FpSem___hyg_442_(uint8_t x_1, uint8_t x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_3 = l_CakeML_fp__uop_toCtorIdx(x_1);
x_4 = l_CakeML_fp__uop_toCtorIdx(x_2);
x_5 = lean_nat_dec_eq(x_3, x_4);
lean_dec(x_4);
lean_dec(x_3);
return x_5;
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_beqfp__uop____x40_CakeML_Core_FpSem___hyg_442____boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = lean_unbox(x_2);
lean_dec(x_2);
x_5 = l___private_CakeML_Core_FpSem_0__CakeML_beqfp__uop____x40_CakeML_Core_FpSem___hyg_442_(x_3, x_4);
x_6 = lean_box(x_5);
return x_6;
}
}
static lean_object* _init_l_CakeML_instBEqFp__uop___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l___private_CakeML_Core_FpSem_0__CakeML_beqfp__uop____x40_CakeML_Core_FpSem___hyg_442____boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_CakeML_instBEqFp__uop() {
_start:
{
lean_object* x_1; 
x_1 = l_CakeML_instBEqFp__uop___closed__1;
return x_1;
}
}
static uint8_t _init_l_CakeML_instInhabitedFp__uop() {
_start:
{
uint8_t x_1; 
x_1 = 0;
return x_1;
}
}
LEAN_EXPORT uint8_t l_CakeML_fp__uop_ofNat(lean_object* x_1) {
_start:
{
lean_object* x_2; uint8_t x_3; 
x_2 = lean_unsigned_to_nat(1u);
x_3 = lean_nat_dec_le(x_2, x_1);
if (x_3 == 0)
{
uint8_t x_4; 
x_4 = 0;
return x_4;
}
else
{
uint8_t x_5; 
x_5 = lean_nat_dec_eq(x_1, x_2);
if (x_5 == 0)
{
uint8_t x_6; 
x_6 = 2;
return x_6;
}
else
{
uint8_t x_7; 
x_7 = 1;
return x_7;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__uop_ofNat___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = l_CakeML_fp__uop_ofNat(x_1);
lean_dec(x_1);
x_3 = lean_box(x_2);
return x_3;
}
}
LEAN_EXPORT uint8_t l_CakeML_instDecidableEqFp__uop(uint8_t x_1, uint8_t x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_3 = l_CakeML_fp__uop_toCtorIdx(x_1);
x_4 = l_CakeML_fp__uop_toCtorIdx(x_2);
x_5 = lean_nat_dec_eq(x_3, x_4);
lean_dec(x_4);
lean_dec(x_3);
return x_5;
}
}
LEAN_EXPORT lean_object* l_CakeML_instDecidableEqFp__uop___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = lean_unbox(x_2);
lean_dec(x_2);
x_5 = l_CakeML_instDecidableEqFp__uop(x_3, x_4);
x_6 = lean_box(x_5);
return x_6;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__bop_toCtorIdx(uint8_t x_1) {
_start:
{
switch (x_1) {
case 0:
{
lean_object* x_2; 
x_2 = lean_unsigned_to_nat(0u);
return x_2;
}
case 1:
{
lean_object* x_3; 
x_3 = lean_unsigned_to_nat(1u);
return x_3;
}
case 2:
{
lean_object* x_4; 
x_4 = lean_unsigned_to_nat(2u);
return x_4;
}
default: 
{
lean_object* x_5; 
x_5 = lean_unsigned_to_nat(3u);
return x_5;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__bop_toCtorIdx___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = lean_unbox(x_1);
lean_dec(x_1);
x_3 = l_CakeML_fp__bop_toCtorIdx(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__bop_noConfusion___rarg(uint8_t x_1, uint8_t x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_CakeML_fp__cmp_noConfusion___rarg___closed__1;
return x_4;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__bop_noConfusion(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_CakeML_fp__bop_noConfusion___rarg___boxed), 3, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__bop_noConfusion___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_4 = lean_unbox(x_1);
lean_dec(x_1);
x_5 = lean_unbox(x_2);
lean_dec(x_2);
x_6 = l_CakeML_fp__bop_noConfusion___rarg(x_4, x_5, x_3);
return x_6;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_bop.FP_Add", 20, 20);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__1;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__2;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__4() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__3;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__2;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__6() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__5;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__7() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_bop.FP_Sub", 20, 20);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__8() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__7;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__9() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__8;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__10() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__9;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__8;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__12() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__11;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__13() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_bop.FP_Mul", 20, 20);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__14() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__13;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__15() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__14;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__16() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__15;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__17() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__14;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__18() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__17;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__19() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_bop.FP_Div", 20, 20);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__20() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__19;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__21() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__20;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__22() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__21;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__23() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__20;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__24() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__23;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574_(uint8_t x_1, lean_object* x_2) {
_start:
{
switch (x_1) {
case 0:
{
lean_object* x_3; uint8_t x_4; 
x_3 = lean_unsigned_to_nat(1024u);
x_4 = lean_nat_dec_le(x_3, x_2);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; 
x_5 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__4;
x_6 = l_Repr_addAppParen(x_5, x_2);
return x_6;
}
else
{
lean_object* x_7; lean_object* x_8; 
x_7 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__6;
x_8 = l_Repr_addAppParen(x_7, x_2);
return x_8;
}
}
case 1:
{
lean_object* x_9; uint8_t x_10; 
x_9 = lean_unsigned_to_nat(1024u);
x_10 = lean_nat_dec_le(x_9, x_2);
if (x_10 == 0)
{
lean_object* x_11; lean_object* x_12; 
x_11 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__10;
x_12 = l_Repr_addAppParen(x_11, x_2);
return x_12;
}
else
{
lean_object* x_13; lean_object* x_14; 
x_13 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__12;
x_14 = l_Repr_addAppParen(x_13, x_2);
return x_14;
}
}
case 2:
{
lean_object* x_15; uint8_t x_16; 
x_15 = lean_unsigned_to_nat(1024u);
x_16 = lean_nat_dec_le(x_15, x_2);
if (x_16 == 0)
{
lean_object* x_17; lean_object* x_18; 
x_17 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__16;
x_18 = l_Repr_addAppParen(x_17, x_2);
return x_18;
}
else
{
lean_object* x_19; lean_object* x_20; 
x_19 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__18;
x_20 = l_Repr_addAppParen(x_19, x_2);
return x_20;
}
}
default: 
{
lean_object* x_21; uint8_t x_22; 
x_21 = lean_unsigned_to_nat(1024u);
x_22 = lean_nat_dec_le(x_21, x_2);
if (x_22 == 0)
{
lean_object* x_23; lean_object* x_24; 
x_23 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__22;
x_24 = l_Repr_addAppParen(x_23, x_2);
return x_24;
}
else
{
lean_object* x_25; lean_object* x_26; 
x_25 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__24;
x_26 = l_Repr_addAppParen(x_25, x_2);
return x_26;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574_(x_3, x_2);
lean_dec(x_2);
return x_4;
}
}
static lean_object* _init_l_CakeML_instReprFp__bop___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_CakeML_instReprFp__bop() {
_start:
{
lean_object* x_1; 
x_1 = l_CakeML_instReprFp__bop___closed__1;
return x_1;
}
}
LEAN_EXPORT uint8_t l___private_CakeML_Core_FpSem_0__CakeML_beqfp__bop____x40_CakeML_Core_FpSem___hyg_722_(uint8_t x_1, uint8_t x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_3 = l_CakeML_fp__bop_toCtorIdx(x_1);
x_4 = l_CakeML_fp__bop_toCtorIdx(x_2);
x_5 = lean_nat_dec_eq(x_3, x_4);
lean_dec(x_4);
lean_dec(x_3);
return x_5;
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_beqfp__bop____x40_CakeML_Core_FpSem___hyg_722____boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = lean_unbox(x_2);
lean_dec(x_2);
x_5 = l___private_CakeML_Core_FpSem_0__CakeML_beqfp__bop____x40_CakeML_Core_FpSem___hyg_722_(x_3, x_4);
x_6 = lean_box(x_5);
return x_6;
}
}
static lean_object* _init_l_CakeML_instBEqFp__bop___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l___private_CakeML_Core_FpSem_0__CakeML_beqfp__bop____x40_CakeML_Core_FpSem___hyg_722____boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_CakeML_instBEqFp__bop() {
_start:
{
lean_object* x_1; 
x_1 = l_CakeML_instBEqFp__bop___closed__1;
return x_1;
}
}
static uint8_t _init_l_CakeML_instInhabitedFp__bop() {
_start:
{
uint8_t x_1; 
x_1 = 0;
return x_1;
}
}
LEAN_EXPORT uint8_t l_CakeML_fp__bop_ofNat(lean_object* x_1) {
_start:
{
lean_object* x_2; uint8_t x_3; 
x_2 = lean_unsigned_to_nat(2u);
x_3 = lean_nat_dec_le(x_2, x_1);
if (x_3 == 0)
{
lean_object* x_4; uint8_t x_5; 
x_4 = lean_unsigned_to_nat(0u);
x_5 = lean_nat_dec_eq(x_1, x_4);
if (x_5 == 0)
{
uint8_t x_6; 
x_6 = 1;
return x_6;
}
else
{
uint8_t x_7; 
x_7 = 0;
return x_7;
}
}
else
{
uint8_t x_8; 
x_8 = lean_nat_dec_eq(x_1, x_2);
if (x_8 == 0)
{
uint8_t x_9; 
x_9 = 3;
return x_9;
}
else
{
uint8_t x_10; 
x_10 = 2;
return x_10;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__bop_ofNat___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = l_CakeML_fp__bop_ofNat(x_1);
lean_dec(x_1);
x_3 = lean_box(x_2);
return x_3;
}
}
LEAN_EXPORT uint8_t l_CakeML_instDecidableEqFp__bop(uint8_t x_1, uint8_t x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_3 = l_CakeML_fp__bop_toCtorIdx(x_1);
x_4 = l_CakeML_fp__bop_toCtorIdx(x_2);
x_5 = lean_nat_dec_eq(x_3, x_4);
lean_dec(x_4);
lean_dec(x_3);
return x_5;
}
}
LEAN_EXPORT lean_object* l_CakeML_instDecidableEqFp__bop___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = lean_unbox(x_2);
lean_dec(x_2);
x_5 = l_CakeML_instDecidableEqFp__bop(x_3, x_4);
x_6 = lean_box(x_5);
return x_6;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__top_toCtorIdx(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_unsigned_to_nat(0u);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__top_toCtorIdx___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_CakeML_fp__top_toCtorIdx(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__top_noConfusion___rarg(lean_object* x_1) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__top_noConfusion(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = lean_alloc_closure((void*)(l_CakeML_fp__top_noConfusion___rarg___boxed), 1, 0);
return x_5;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__top_noConfusion___rarg___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_CakeML_fp__top_noConfusion___rarg(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__top_noConfusion___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = l_CakeML_fp__top_noConfusion(x_1, x_2, x_3, x_4);
lean_dec(x_3);
lean_dec(x_2);
return x_5;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML.fp_top.FP_Fma", 20, 20);
return x_1;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__1;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__2;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__4() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__3;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6;
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__2;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__6() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__5;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg(lean_object* x_1) {
_start:
{
lean_object* x_2; uint8_t x_3; 
x_2 = lean_unsigned_to_nat(1024u);
x_3 = lean_nat_dec_le(x_2, x_1);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; 
x_4 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__4;
x_5 = l_Repr_addAppParen(x_4, x_1);
return x_5;
}
else
{
lean_object* x_6; lean_object* x_7; 
x_6 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__6;
x_7 = l_Repr_addAppParen(x_6, x_1);
return x_7;
}
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854_(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___boxed), 1, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854_(x_1);
lean_dec(x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_instReprFp__top___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____boxed), 1, 0);
return x_1;
}
}
static lean_object* _init_l_CakeML_instReprFp__top() {
_start:
{
lean_object* x_1; 
x_1 = l_CakeML_instReprFp__top___closed__1;
return x_1;
}
}
LEAN_EXPORT uint8_t l___private_CakeML_Core_FpSem_0__CakeML_beqfp__top____x40_CakeML_Core_FpSem___hyg_906_(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = 1;
return x_3;
}
}
LEAN_EXPORT lean_object* l___private_CakeML_Core_FpSem_0__CakeML_beqfp__top____x40_CakeML_Core_FpSem___hyg_906____boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l___private_CakeML_Core_FpSem_0__CakeML_beqfp__top____x40_CakeML_Core_FpSem___hyg_906_(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
static lean_object* _init_l_CakeML_instBEqFp__top___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l___private_CakeML_Core_FpSem_0__CakeML_beqfp__top____x40_CakeML_Core_FpSem___hyg_906____boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_CakeML_instBEqFp__top() {
_start:
{
lean_object* x_1; 
x_1 = l_CakeML_instBEqFp__top___closed__1;
return x_1;
}
}
static lean_object* _init_l_CakeML_instInhabitedFp__top() {
_start:
{
lean_object* x_1; 
x_1 = lean_box(0);
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__top_ofNat(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_box(0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__top_ofNat___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_CakeML_fp__top_ofNat(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT uint8_t l_CakeML_instDecidableEqFp__top(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = 1;
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_instDecidableEqFp__top___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_CakeML_instDecidableEqFp__top(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT uint8_t l_CakeML_fp__cmp__def(uint8_t x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
uint8_t x_4; 
x_4 = 0;
return x_4;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__cmp__def___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_4 = lean_unbox(x_1);
lean_dec(x_1);
x_5 = l_CakeML_fp__cmp__def(x_4, x_2, x_3);
lean_dec(x_3);
lean_dec(x_2);
x_6 = lean_box(x_5);
return x_6;
}
}
LEAN_EXPORT uint8_t l_CakeML_fp__cmp__comp(uint8_t x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
uint8_t x_4; 
x_4 = 0;
return x_4;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__cmp__comp___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
uint8_t x_4; uint8_t x_5; lean_object* x_6; 
x_4 = lean_unbox(x_1);
lean_dec(x_1);
x_5 = l_CakeML_fp__cmp__comp(x_4, x_2, x_3);
lean_dec(x_3);
lean_dec(x_2);
x_6 = lean_box(x_5);
return x_6;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__uop__comp___rarg(lean_object* x_1) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__uop__comp(uint8_t x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_CakeML_fp__uop__comp___rarg___boxed), 1, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__uop__comp___rarg___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_CakeML_fp__uop__comp___rarg(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__uop__comp___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = lean_unbox(x_1);
lean_dec(x_1);
x_3 = l_CakeML_fp__uop__comp(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__bop__comp___rarg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__bop__comp(uint8_t x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_CakeML_fp__bop__comp___rarg___boxed), 2, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__bop__comp___rarg___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_CakeML_fp__bop__comp___rarg(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__bop__comp___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = lean_unbox(x_1);
lean_dec(x_1);
x_3 = l_CakeML_fp__bop__comp(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_fpfma___rarg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_fpfma(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_CakeML_fpfma___rarg___boxed), 2, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fpfma___rarg___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_CakeML_fpfma___rarg(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_fpfma___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_CakeML_fpfma(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__top__comp___rarg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__top__comp(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_alloc_closure((void*)(l_CakeML_fp__top__comp___rarg___boxed), 2, 0);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__top__comp___rarg___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_CakeML_fp__top__comp___rarg(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_fp__top__comp___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_CakeML_fp__top__comp(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Lib_IEEE754(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Lib_Words(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Ast(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_CakeML_Core_FpSem(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Lib_IEEE754(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Lib_Words(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Ast(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_CakeML_roundTiesToEven___closed__1 = _init_l_CakeML_roundTiesToEven___closed__1();
lean_mark_persistent(l_CakeML_roundTiesToEven___closed__1);
l_CakeML_roundTiesToEven = _init_l_CakeML_roundTiesToEven();
lean_mark_persistent(l_CakeML_roundTiesToEven);
l_CakeML_fp__cmp_noConfusion___rarg___closed__1 = _init_l_CakeML_fp__cmp_noConfusion___rarg___closed__1();
lean_mark_persistent(l_CakeML_fp__cmp_noConfusion___rarg___closed__1);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__1 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__1();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__1);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__2 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__2();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__2);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__3);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__4 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__4();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__4);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__5 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__5();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__5);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__6);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__7 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__7();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__7);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__8 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__8();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__8);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__9 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__9();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__9);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__10 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__10();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__10);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__11 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__11();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__11);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__12 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__12();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__12);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__13 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__13();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__13);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__14 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__14();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__14);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__15 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__15();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__15);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__16 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__16();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__16);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__17 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__17();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__17);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__18 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__18();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__18);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__19 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__19();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__19);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__20 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__20();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__20);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__21 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__21();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__21);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__22 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__22();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__22);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__23 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__23();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__23);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__24 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__24();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__24);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__25 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__25();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__25);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__26 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__26();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__26);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__27 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__27();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__27);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__28 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__28();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__28);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__29 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__29();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__29);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__30 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__30();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__30);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__31 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__31();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__31);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__32 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__32();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__cmp____x40_CakeML_Core_FpSem___hyg_14____closed__32);
l_CakeML_instReprFp__cmp___closed__1 = _init_l_CakeML_instReprFp__cmp___closed__1();
lean_mark_persistent(l_CakeML_instReprFp__cmp___closed__1);
l_CakeML_instReprFp__cmp = _init_l_CakeML_instReprFp__cmp();
lean_mark_persistent(l_CakeML_instReprFp__cmp);
l_CakeML_instBEqFp__cmp___closed__1 = _init_l_CakeML_instBEqFp__cmp___closed__1();
lean_mark_persistent(l_CakeML_instBEqFp__cmp___closed__1);
l_CakeML_instBEqFp__cmp = _init_l_CakeML_instBEqFp__cmp();
lean_mark_persistent(l_CakeML_instBEqFp__cmp);
l_CakeML_instInhabitedFp__cmp = _init_l_CakeML_instInhabitedFp__cmp();
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__1 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__1();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__1);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__2 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__2();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__2);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__3 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__3();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__3);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__4 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__4();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__4);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__5 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__5();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__5);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__6 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__6();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__6);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__7 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__7();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__7);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__8 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__8();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__8);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__9 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__9();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__9);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__10 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__10();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__10);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__11 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__11();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__11);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__12 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__12();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__12);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__13 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__13();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__13);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__14 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__14();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__14);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__15 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__15();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__15);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__16 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__16();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__16);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__17 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__17();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__17);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__18 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__18();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__uop____x40_CakeML_Core_FpSem___hyg_326____closed__18);
l_CakeML_instReprFp__uop___closed__1 = _init_l_CakeML_instReprFp__uop___closed__1();
lean_mark_persistent(l_CakeML_instReprFp__uop___closed__1);
l_CakeML_instReprFp__uop = _init_l_CakeML_instReprFp__uop();
lean_mark_persistent(l_CakeML_instReprFp__uop);
l_CakeML_instBEqFp__uop___closed__1 = _init_l_CakeML_instBEqFp__uop___closed__1();
lean_mark_persistent(l_CakeML_instBEqFp__uop___closed__1);
l_CakeML_instBEqFp__uop = _init_l_CakeML_instBEqFp__uop();
lean_mark_persistent(l_CakeML_instBEqFp__uop);
l_CakeML_instInhabitedFp__uop = _init_l_CakeML_instInhabitedFp__uop();
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__1 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__1();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__1);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__2 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__2();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__2);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__3 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__3();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__3);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__4 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__4();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__4);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__5 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__5();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__5);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__6 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__6();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__6);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__7 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__7();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__7);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__8 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__8();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__8);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__9 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__9();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__9);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__10 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__10();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__10);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__11 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__11();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__11);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__12 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__12();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__12);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__13 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__13();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__13);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__14 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__14();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__14);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__15 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__15();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__15);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__16 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__16();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__16);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__17 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__17();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__17);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__18 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__18();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__18);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__19 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__19();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__19);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__20 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__20();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__20);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__21 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__21();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__21);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__22 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__22();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__22);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__23 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__23();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__23);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__24 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__24();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__bop____x40_CakeML_Core_FpSem___hyg_574____closed__24);
l_CakeML_instReprFp__bop___closed__1 = _init_l_CakeML_instReprFp__bop___closed__1();
lean_mark_persistent(l_CakeML_instReprFp__bop___closed__1);
l_CakeML_instReprFp__bop = _init_l_CakeML_instReprFp__bop();
lean_mark_persistent(l_CakeML_instReprFp__bop);
l_CakeML_instBEqFp__bop___closed__1 = _init_l_CakeML_instBEqFp__bop___closed__1();
lean_mark_persistent(l_CakeML_instBEqFp__bop___closed__1);
l_CakeML_instBEqFp__bop = _init_l_CakeML_instBEqFp__bop();
lean_mark_persistent(l_CakeML_instBEqFp__bop);
l_CakeML_instInhabitedFp__bop = _init_l_CakeML_instInhabitedFp__bop();
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__1 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__1();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__1);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__2 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__2();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__2);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__3 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__3();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__3);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__4 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__4();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__4);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__5 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__5();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__5);
l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__6 = _init_l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__6();
lean_mark_persistent(l___private_CakeML_Core_FpSem_0__CakeML_reprfp__top____x40_CakeML_Core_FpSem___hyg_854____rarg___closed__6);
l_CakeML_instReprFp__top___closed__1 = _init_l_CakeML_instReprFp__top___closed__1();
lean_mark_persistent(l_CakeML_instReprFp__top___closed__1);
l_CakeML_instReprFp__top = _init_l_CakeML_instReprFp__top();
lean_mark_persistent(l_CakeML_instReprFp__top);
l_CakeML_instBEqFp__top___closed__1 = _init_l_CakeML_instBEqFp__top___closed__1();
lean_mark_persistent(l_CakeML_instBEqFp__top___closed__1);
l_CakeML_instBEqFp__top = _init_l_CakeML_instBEqFp__top();
lean_mark_persistent(l_CakeML_instBEqFp__top);
l_CakeML_instInhabitedFp__top = _init_l_CakeML_instInhabitedFp__top();
lean_mark_persistent(l_CakeML_instInhabitedFp__top);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
