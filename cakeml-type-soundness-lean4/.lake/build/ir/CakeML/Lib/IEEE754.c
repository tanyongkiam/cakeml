// Lean compiler output
// Module: CakeML.Lib.IEEE754
// Imports: Init CakeML.Lib.Words
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
LEAN_EXPORT lean_object* l_HOL4_fp64__sub___boxed(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__mul___boxed(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__equal___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__lessEqual___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__to__int___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__sub(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_compress__word(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__sqrt(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__mul__add___rarg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__div___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__add___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__div___boxed(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__add(lean_object*);
static lean_object* l_HOL4_fp64__from__int___closed__1;
lean_object* l_BitVec_ofNat(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__negate(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__greaterThan___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__div___rarg___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__sqrt___rarg(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__mul__add(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__mul__add___boxed(lean_object*);
LEAN_EXPORT uint8_t l_HOL4_fp64__greaterEqual(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__mul___rarg___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_compress__word___boxed(lean_object*);
LEAN_EXPORT uint8_t l_HOL4_fp64__equal(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_HOL4_fp64__lessEqual(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__lessThan___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_HOL4_fp64__greaterThan(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__sqrt___rarg___boxed(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__add___rarg___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__sub___rarg___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__negate___boxed(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__sqrt___boxed(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__from__int___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__sub___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__mul__add___rarg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__abs(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__add___boxed(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__div(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__abs___boxed(lean_object*);
LEAN_EXPORT uint8_t l_HOL4_fp64__lessThan(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__to__int(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__from__int(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__mul___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__mul(lean_object*);
LEAN_EXPORT lean_object* l_HOL4_fp64__greaterEqual___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_HOL4_fp64__lessThan(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = 0;
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__lessThan___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_HOL4_fp64__lessThan(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT uint8_t l_HOL4_fp64__lessEqual(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = 0;
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__lessEqual___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_HOL4_fp64__lessEqual(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT uint8_t l_HOL4_fp64__greaterThan(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = 0;
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__greaterThan___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_HOL4_fp64__greaterThan(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT uint8_t l_HOL4_fp64__greaterEqual(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = 0;
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__greaterEqual___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_HOL4_fp64__greaterEqual(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT uint8_t l_HOL4_fp64__equal(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = 0;
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__equal___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_HOL4_fp64__equal(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__add___rarg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__add(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_HOL4_fp64__add___rarg___boxed), 2, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__add___rarg___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_HOL4_fp64__add___rarg(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__add___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_HOL4_fp64__add(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__sub___rarg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__sub(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_HOL4_fp64__sub___rarg___boxed), 2, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__sub___rarg___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_HOL4_fp64__sub___rarg(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__sub___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_HOL4_fp64__sub(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__mul___rarg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__mul(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_HOL4_fp64__mul___rarg___boxed), 2, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__mul___rarg___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_HOL4_fp64__mul___rarg(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__mul___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_HOL4_fp64__mul(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__div___rarg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__div(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_HOL4_fp64__div___rarg___boxed), 2, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__div___rarg___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_HOL4_fp64__div___rarg(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__div___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_HOL4_fp64__div(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__sqrt___rarg(lean_object* x_1) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__sqrt(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_HOL4_fp64__sqrt___rarg___boxed), 1, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__sqrt___rarg___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_HOL4_fp64__sqrt___rarg(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__sqrt___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_HOL4_fp64__sqrt(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__abs(lean_object* x_1) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__abs___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_HOL4_fp64__abs(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__negate(lean_object* x_1) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__negate___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_HOL4_fp64__negate(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__mul__add___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__mul__add(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_HOL4_fp64__mul__add___rarg___boxed), 3, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__mul__add___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_HOL4_fp64__mul__add___rarg(x_1, x_2, x_3);
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__mul__add___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_HOL4_fp64__mul__add(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__to__int(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_box(0);
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__to__int___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_HOL4_fp64__to__int(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
static lean_object* _init_l_HOL4_fp64__from__int___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_unsigned_to_nat(64u);
x_2 = lean_unsigned_to_nat(0u);
x_3 = l_BitVec_ofNat(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__from__int(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_HOL4_fp64__from__int___closed__1;
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_fp64__from__int___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_HOL4_fp64__from__int(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_HOL4_compress__word(lean_object* x_1) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_HOL4_compress__word___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_HOL4_compress__word(x_1);
lean_dec(x_1);
return x_2;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Lib_Words(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_CakeML_Lib_IEEE754(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Lib_Words(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_HOL4_fp64__from__int___closed__1 = _init_l_HOL4_fp64__from__int___closed__1();
lean_mark_persistent(l_HOL4_fp64__from__int___closed__1);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
