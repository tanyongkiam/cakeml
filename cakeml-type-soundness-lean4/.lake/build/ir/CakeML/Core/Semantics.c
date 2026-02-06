// Lean compiler output
// Module: CakeML.Core.Semantics
// Imports: Init CakeML.Core.LexerFun CakeML.Core.CmlPtreeConversion CakeML.Core.PrimTypes
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
static lean_object* l_CakeML_parse___closed__3;
static lean_object* l_CakeML_parse___closed__6;
static lean_object* l_CakeML_parse___closed__22;
static lean_object* l_CakeML_parse___closed__7;
LEAN_EXPORT lean_object* l_CakeML_semantics__init___rarg(lean_object*, lean_object*);
static lean_object* l_CakeML_parse___closed__14;
static lean_object* l_CakeML_parse___closed__12;
static lean_object* l_CakeML_semantics__init___rarg___closed__12;
static lean_object* l_CakeML_parse___closed__11;
static lean_object* l_CakeML_semantics__init___rarg___closed__7;
static lean_object* l_CakeML_parse___closed__19;
LEAN_EXPORT lean_object* l_CakeML_evaluate__prog__with__clock___rarg(lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l_CakeML_semantics__init___rarg___closed__10;
lean_object* lean_sorry(uint8_t);
static lean_object* l_CakeML_semantics__init___rarg___closed__9;
static lean_object* l_CakeML_parse___closed__4;
static lean_object* l_CakeML_parse___closed__20;
static lean_object* l_CakeML_semantics__init___rarg___closed__6;
LEAN_EXPORT lean_object* l_CakeML_semantics__init___boxed(lean_object*, lean_object*);
static lean_object* l_CakeML_parse___closed__10;
static lean_object* l_CakeML_semantics__init___rarg___closed__4;
static lean_object* l_CakeML_parse___closed__9;
lean_object* l_Lean_Name_num___override(lean_object*, lean_object*);
static lean_object* l_CakeML_parse___closed__15;
LEAN_EXPORT lean_object* l_CakeML_parse(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_evaluate__prog__with__clock(lean_object*);
static lean_object* l_CakeML_semantics__init___rarg___closed__2;
lean_object* l_Lean_Name_str___override(lean_object*, lean_object*);
static lean_object* l_CakeML_semantics__init___rarg___closed__3;
static lean_object* l_CakeML_parse___closed__17;
static lean_object* l_CakeML_parse___closed__8;
static lean_object* l_CakeML_semantics__init___rarg___closed__11;
LEAN_EXPORT lean_object* l_CakeML_semantics__init(lean_object*, lean_object*);
static lean_object* l_CakeML_parse___closed__16;
static lean_object* l_CakeML_semantics__init___rarg___closed__1;
static lean_object* l_CakeML_semantics__init___rarg___closed__5;
static lean_object* l_CakeML_semantics__init___rarg___closed__8;
LEAN_EXPORT lean_object* l_CakeML_parse___boxed(lean_object*);
static lean_object* l_CakeML_parse___closed__21;
static lean_object* l_CakeML_parse___closed__13;
static lean_object* l_CakeML_parse___closed__2;
static lean_object* l_CakeML_parse___closed__5;
static lean_object* l_CakeML_parse___closed__1;
lean_object* l_CakeML_evaluate__decs___rarg(lean_object*, lean_object*, lean_object*);
static lean_object* l_CakeML_parse___closed__18;
static lean_object* l_CakeML_semantics__init___rarg___closed__13;
static lean_object* _init_l_CakeML_parse___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("CakeML", 6, 6);
return x_1;
}
}
static lean_object* _init_l_CakeML_parse___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_CakeML_parse___closed__1;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__3() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("Core", 4, 4);
return x_1;
}
}
static lean_object* _init_l_CakeML_parse___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__2;
x_2 = l_CakeML_parse___closed__3;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__5() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("Semantics", 9, 9);
return x_1;
}
}
static lean_object* _init_l_CakeML_parse___closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__4;
x_2 = l_CakeML_parse___closed__5;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__6;
x_2 = lean_unsigned_to_nat(20u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__8() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__7;
x_2 = lean_unsigned_to_nat(2u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__9() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__8;
x_2 = lean_unsigned_to_nat(20u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__10() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__9;
x_2 = lean_unsigned_to_nat(7u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__10;
x_2 = lean_unsigned_to_nat(2u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__12() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__11;
x_2 = lean_unsigned_to_nat(7u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__13() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("_sorry", 6, 6);
return x_1;
}
}
static lean_object* _init_l_CakeML_parse___closed__14() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__12;
x_2 = l_CakeML_parse___closed__13;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__15() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("_@", 2, 2);
return x_1;
}
}
static lean_object* _init_l_CakeML_parse___closed__16() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__14;
x_2 = l_CakeML_parse___closed__15;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__17() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__16;
x_2 = l_CakeML_parse___closed__1;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__18() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__17;
x_2 = l_CakeML_parse___closed__3;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__19() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__18;
x_2 = l_CakeML_parse___closed__5;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__20() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("_hyg", 4, 4);
return x_1;
}
}
static lean_object* _init_l_CakeML_parse___closed__21() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__19;
x_2 = l_CakeML_parse___closed__20;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_parse___closed__22() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__21;
x_2 = lean_unsigned_to_nat(21u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_parse(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_2 = 0;
x_3 = l_CakeML_parse___closed__22;
x_4 = lean_sorry(x_2);
x_5 = lean_apply_1(x_4, x_3);
return x_5;
}
}
LEAN_EXPORT lean_object* l_CakeML_parse___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_CakeML_parse(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_evaluate__prog__with__clock___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; 
x_5 = !lean_is_exclusive(x_1);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; uint8_t x_8; 
x_6 = lean_ctor_get(x_1, 0);
lean_dec(x_6);
lean_ctor_set(x_1, 0, x_3);
x_7 = l_CakeML_evaluate__decs___rarg(x_1, x_2, x_4);
x_8 = !lean_is_exclusive(x_7);
if (x_8 == 0)
{
lean_object* x_9; lean_object* x_10; 
x_9 = lean_ctor_get(x_7, 0);
x_10 = lean_ctor_get(x_9, 2);
lean_inc(x_10);
lean_dec(x_9);
lean_ctor_set(x_7, 0, x_10);
return x_7;
}
else
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_11 = lean_ctor_get(x_7, 0);
x_12 = lean_ctor_get(x_7, 1);
lean_inc(x_12);
lean_inc(x_11);
lean_dec(x_7);
x_13 = lean_ctor_get(x_11, 2);
lean_inc(x_13);
lean_dec(x_11);
x_14 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_14, 0, x_13);
lean_ctor_set(x_14, 1, x_12);
return x_14;
}
}
else
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; lean_object* x_26; 
x_15 = lean_ctor_get(x_1, 1);
x_16 = lean_ctor_get(x_1, 2);
x_17 = lean_ctor_get(x_1, 3);
x_18 = lean_ctor_get(x_1, 4);
x_19 = lean_ctor_get(x_1, 5);
lean_inc(x_19);
lean_inc(x_18);
lean_inc(x_17);
lean_inc(x_16);
lean_inc(x_15);
lean_dec(x_1);
x_20 = lean_alloc_ctor(0, 6, 0);
lean_ctor_set(x_20, 0, x_3);
lean_ctor_set(x_20, 1, x_15);
lean_ctor_set(x_20, 2, x_16);
lean_ctor_set(x_20, 3, x_17);
lean_ctor_set(x_20, 4, x_18);
lean_ctor_set(x_20, 5, x_19);
x_21 = l_CakeML_evaluate__decs___rarg(x_20, x_2, x_4);
x_22 = lean_ctor_get(x_21, 0);
lean_inc(x_22);
x_23 = lean_ctor_get(x_21, 1);
lean_inc(x_23);
if (lean_is_exclusive(x_21)) {
 lean_ctor_release(x_21, 0);
 lean_ctor_release(x_21, 1);
 x_24 = x_21;
} else {
 lean_dec_ref(x_21);
 x_24 = lean_box(0);
}
x_25 = lean_ctor_get(x_22, 2);
lean_inc(x_25);
lean_dec(x_22);
if (lean_is_scalar(x_24)) {
 x_26 = lean_alloc_ctor(0, 2, 0);
} else {
 x_26 = x_24;
}
lean_ctor_set(x_26, 0, x_25);
lean_ctor_set(x_26, 1, x_23);
return x_26;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_evaluate__prog__with__clock(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_CakeML_evaluate__prog__with__clock___rarg), 4, 0);
return x_2;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_parse___closed__6;
x_2 = lean_unsigned_to_nat(68u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_semantics__init___rarg___closed__1;
x_2 = lean_unsigned_to_nat(2u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_semantics__init___rarg___closed__2;
x_2 = lean_unsigned_to_nat(68u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_semantics__init___rarg___closed__3;
x_2 = lean_unsigned_to_nat(7u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_semantics__init___rarg___closed__4;
x_2 = lean_unsigned_to_nat(2u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_semantics__init___rarg___closed__5;
x_2 = lean_unsigned_to_nat(7u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_semantics__init___rarg___closed__6;
x_2 = l_CakeML_parse___closed__13;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__8() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_semantics__init___rarg___closed__7;
x_2 = l_CakeML_parse___closed__15;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__9() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_semantics__init___rarg___closed__8;
x_2 = l_CakeML_parse___closed__1;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__10() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_semantics__init___rarg___closed__9;
x_2 = l_CakeML_parse___closed__3;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_semantics__init___rarg___closed__10;
x_2 = l_CakeML_parse___closed__5;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__12() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_semantics__init___rarg___closed__11;
x_2 = l_CakeML_parse___closed__20;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_semantics__init___rarg___closed__13() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_CakeML_semantics__init___rarg___closed__12;
x_2 = lean_unsigned_to_nat(282u);
x_3 = l_Lean_Name_num___override(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_semantics__init___rarg(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_3 = 0;
x_4 = l_CakeML_semantics__init___rarg___closed__13;
x_5 = lean_sorry(x_3);
x_6 = lean_apply_3(x_5, x_4, x_1, x_2);
return x_6;
}
}
LEAN_EXPORT lean_object* l_CakeML_semantics__init(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_alloc_closure((void*)(l_CakeML_semantics__init___rarg), 2, 0);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_semantics__init___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_CakeML_semantics__init(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_LexerFun(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_CmlPtreeConversion(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_PrimTypes(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_CakeML_Core_Semantics(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_LexerFun(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_CmlPtreeConversion(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_PrimTypes(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_CakeML_parse___closed__1 = _init_l_CakeML_parse___closed__1();
lean_mark_persistent(l_CakeML_parse___closed__1);
l_CakeML_parse___closed__2 = _init_l_CakeML_parse___closed__2();
lean_mark_persistent(l_CakeML_parse___closed__2);
l_CakeML_parse___closed__3 = _init_l_CakeML_parse___closed__3();
lean_mark_persistent(l_CakeML_parse___closed__3);
l_CakeML_parse___closed__4 = _init_l_CakeML_parse___closed__4();
lean_mark_persistent(l_CakeML_parse___closed__4);
l_CakeML_parse___closed__5 = _init_l_CakeML_parse___closed__5();
lean_mark_persistent(l_CakeML_parse___closed__5);
l_CakeML_parse___closed__6 = _init_l_CakeML_parse___closed__6();
lean_mark_persistent(l_CakeML_parse___closed__6);
l_CakeML_parse___closed__7 = _init_l_CakeML_parse___closed__7();
lean_mark_persistent(l_CakeML_parse___closed__7);
l_CakeML_parse___closed__8 = _init_l_CakeML_parse___closed__8();
lean_mark_persistent(l_CakeML_parse___closed__8);
l_CakeML_parse___closed__9 = _init_l_CakeML_parse___closed__9();
lean_mark_persistent(l_CakeML_parse___closed__9);
l_CakeML_parse___closed__10 = _init_l_CakeML_parse___closed__10();
lean_mark_persistent(l_CakeML_parse___closed__10);
l_CakeML_parse___closed__11 = _init_l_CakeML_parse___closed__11();
lean_mark_persistent(l_CakeML_parse___closed__11);
l_CakeML_parse___closed__12 = _init_l_CakeML_parse___closed__12();
lean_mark_persistent(l_CakeML_parse___closed__12);
l_CakeML_parse___closed__13 = _init_l_CakeML_parse___closed__13();
lean_mark_persistent(l_CakeML_parse___closed__13);
l_CakeML_parse___closed__14 = _init_l_CakeML_parse___closed__14();
lean_mark_persistent(l_CakeML_parse___closed__14);
l_CakeML_parse___closed__15 = _init_l_CakeML_parse___closed__15();
lean_mark_persistent(l_CakeML_parse___closed__15);
l_CakeML_parse___closed__16 = _init_l_CakeML_parse___closed__16();
lean_mark_persistent(l_CakeML_parse___closed__16);
l_CakeML_parse___closed__17 = _init_l_CakeML_parse___closed__17();
lean_mark_persistent(l_CakeML_parse___closed__17);
l_CakeML_parse___closed__18 = _init_l_CakeML_parse___closed__18();
lean_mark_persistent(l_CakeML_parse___closed__18);
l_CakeML_parse___closed__19 = _init_l_CakeML_parse___closed__19();
lean_mark_persistent(l_CakeML_parse___closed__19);
l_CakeML_parse___closed__20 = _init_l_CakeML_parse___closed__20();
lean_mark_persistent(l_CakeML_parse___closed__20);
l_CakeML_parse___closed__21 = _init_l_CakeML_parse___closed__21();
lean_mark_persistent(l_CakeML_parse___closed__21);
l_CakeML_parse___closed__22 = _init_l_CakeML_parse___closed__22();
lean_mark_persistent(l_CakeML_parse___closed__22);
l_CakeML_semantics__init___rarg___closed__1 = _init_l_CakeML_semantics__init___rarg___closed__1();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__1);
l_CakeML_semantics__init___rarg___closed__2 = _init_l_CakeML_semantics__init___rarg___closed__2();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__2);
l_CakeML_semantics__init___rarg___closed__3 = _init_l_CakeML_semantics__init___rarg___closed__3();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__3);
l_CakeML_semantics__init___rarg___closed__4 = _init_l_CakeML_semantics__init___rarg___closed__4();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__4);
l_CakeML_semantics__init___rarg___closed__5 = _init_l_CakeML_semantics__init___rarg___closed__5();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__5);
l_CakeML_semantics__init___rarg___closed__6 = _init_l_CakeML_semantics__init___rarg___closed__6();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__6);
l_CakeML_semantics__init___rarg___closed__7 = _init_l_CakeML_semantics__init___rarg___closed__7();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__7);
l_CakeML_semantics__init___rarg___closed__8 = _init_l_CakeML_semantics__init___rarg___closed__8();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__8);
l_CakeML_semantics__init___rarg___closed__9 = _init_l_CakeML_semantics__init___rarg___closed__9();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__9);
l_CakeML_semantics__init___rarg___closed__10 = _init_l_CakeML_semantics__init___rarg___closed__10();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__10);
l_CakeML_semantics__init___rarg___closed__11 = _init_l_CakeML_semantics__init___rarg___closed__11();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__11);
l_CakeML_semantics__init___rarg___closed__12 = _init_l_CakeML_semantics__init___rarg___closed__12();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__12);
l_CakeML_semantics__init___rarg___closed__13 = _init_l_CakeML_semantics__init___rarg___closed__13();
lean_mark_persistent(l_CakeML_semantics__init___rarg___closed__13);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
