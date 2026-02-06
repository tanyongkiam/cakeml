// Lean compiler output
// Module: CakeML.Core.TypeSoundInvariants
// Imports: Init CakeML.Core.TypeSystem CakeML.Core.NamespaceProps
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
LEAN_EXPORT lean_object* l_CakeML_add__tenvE(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_instInhabitedStore__t;
LEAN_EXPORT lean_object* l_CakeML_add__tenvE___boxed(lean_object*, lean_object*);
lean_object* l_CakeML_nsBind___rarg(lean_object*, lean_object*, lean_object*);
static lean_object* _init_l_CakeML_instInhabitedStore__t() {
_start:
{
lean_object* x_1; 
x_1 = lean_box(1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_add__tenvE(lean_object* x_1, lean_object* x_2) {
_start:
{
switch (lean_obj_tag(x_1)) {
case 0:
{
lean_inc(x_2);
return x_2;
}
case 1:
{
lean_object* x_3; 
x_3 = lean_ctor_get(x_1, 1);
lean_inc(x_3);
lean_dec(x_1);
x_1 = x_3;
goto _start;
}
default: 
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; 
x_5 = lean_ctor_get(x_1, 0);
lean_inc(x_5);
x_6 = lean_ctor_get(x_1, 1);
lean_inc(x_6);
x_7 = lean_ctor_get(x_1, 2);
lean_inc(x_7);
x_8 = lean_ctor_get(x_1, 3);
lean_inc(x_8);
lean_dec(x_1);
x_9 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_9, 0, x_6);
lean_ctor_set(x_9, 1, x_7);
x_10 = l_CakeML_add__tenvE(x_8, x_2);
x_11 = l_CakeML_nsBind___rarg(x_5, x_9, x_10);
return x_11;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_add__tenvE___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_CakeML_add__tenvE(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_TypeSystem(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_NamespaceProps(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_CakeML_Core_TypeSoundInvariants(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_TypeSystem(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_NamespaceProps(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_CakeML_instInhabitedStore__t = _init_l_CakeML_instInhabitedStore__t();
lean_mark_persistent(l_CakeML_instInhabitedStore__t);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
