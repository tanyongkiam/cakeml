// Lean compiler output
// Module: CakeML.Core.CmlPtreeConversion
// Imports: Init CakeML.Core.Ast CakeML.Core.Tokens CakeML.Core.Gram CakeML.Core.TokenUtils
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
LEAN_EXPORT lean_object* l_CakeML_tokcheckl___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__StructName(lean_object*);
static lean_object* l_CakeML_ptree__TopLevelDecs___closed__2;
static lean_object* l_CakeML_ptree__Pattern___closed__12;
LEAN_EXPORT lean_object* l_CakeML_ptree__TypeDec(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__Structure(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_optLannot(lean_object*, lean_object*);
static lean_object* l_CakeML_mk__binop___closed__3;
LEAN_EXPORT lean_object* l_CakeML_ptree__FDecl(lean_object*);
static lean_object* l_CakeML_ptree__PEsfx___closed__2;
LEAN_EXPORT lean_object* l_CakeML_ptree__Typelist2(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__UQTyop(lean_object*);
lean_object* l_CakeML_validAddSym___boxed(lean_object*);
static lean_object* l_CakeML_ptree__Structure___closed__3;
static lean_object* l_CakeML_ptree__Op___closed__19;
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__FDecl___spec__2(lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l_HOL4_ALOOKUP___at_CakeML_fixity__lookup___spec__1(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_maybe__handleRef(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__PEs(lean_object*);
static lean_object* l_CakeML_ptree__Pattern___closed__3;
LEAN_EXPORT lean_object* l_CakeML_ptree__linfix___rarg(uint8_t, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_Long__Short(lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__OptTypEqn___closed__1;
LEAN_EXPORT lean_object* l_CakeML_ptree__UQConstructorName(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__Eseq(lean_object*);
static lean_object* l_CakeML_ptree__OpID___closed__8;
LEAN_EXPORT lean_object* l_CakeML_ptree__Pattern___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_List_foldrTR___at_CakeML_ptree__FDecl___spec__1(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_dest__Conk___rarg(lean_object*, lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__LetDec___closed__1;
uint8_t l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(uint8_t, uint8_t);
LEAN_EXPORT lean_object* l_CakeML_ptree__linfix___rarg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__OpID___closed__7;
static lean_object* l_CakeML_ptree__Expr___closed__11;
LEAN_EXPORT lean_object* l_CakeML_ptree__LetDecs(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__ConstructorName(lean_object*);
static lean_object* l_CakeML_ptree__Expr___closed__5;
static lean_object* l_CakeML_ptree__Op___closed__33;
uint8_t lean_usize_dec_eq(size_t, size_t);
static lean_object* l_CakeML_ptree__SignatureValue___closed__1;
LEAN_EXPORT lean_object* l_CakeML_ptree__Decl(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__V(lean_object*);
static lean_object* l_CakeML_ptree__Pattern___closed__15;
LEAN_EXPORT lean_object* l_CakeML_ptree__Eliteral(lean_object*);
static lean_object* l_CakeML_ptree__TypeName___closed__1;
static lean_object* l_CakeML_ptree__Pattern___closed__4;
static lean_object* l_CakeML_ptree__Op___closed__23;
LEAN_EXPORT lean_object* l_CakeML_isSymbolicConstructor(lean_object*);
lean_object* l_CakeML_destCharT(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_mkAst__App___lambda__1(lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__16;
static lean_object* l_CakeML_maybe__handleRef___closed__1;
lean_object* l_List_head_x3f___rarg(lean_object*);
static lean_object* l_CakeML_isConstructor___closed__1;
LEAN_EXPORT lean_object* l_CakeML_fixity__lookup(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Pattern___spec__2___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Expr___spec__4(lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__PEsfx(lean_object*);
lean_object* l_List_head_x21___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ifM(lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__11;
LEAN_EXPORT lean_object* l_CakeML_tokcheck___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__FDecl___spec__2___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__6;
static lean_object* l_CakeML_ptree__Pattern___closed__9;
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Expr___spec__2___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_singleSymP(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_msetfix___lambda__1(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ifM___rarg(lean_object*, lean_object*, lean_object*);
static lean_object* l_CakeML_maybe__handleRef___closed__2;
lean_object* l_CakeML_destSymbolT(lean_object*);
static lean_object* l_CakeML_ptree__OpID___closed__3;
static lean_object* l_CakeML_ptree__Op___closed__27;
uint8_t l___private_CakeML_Core_Tokens_0__CakeML_beqtoken____x40_CakeML_Core_Tokens___hyg_2775_(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_mkAst__App(lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__35;
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Pattern___spec__2(lean_object*, size_t, size_t, lean_object*);
static lean_object* l_CakeML_ptree__OpID___closed__4;
static lean_object* l_CakeML_ptree__Op___closed__2;
static lean_object* l_CakeML_ptree__Op___closed__36;
lean_object* l_CakeML_destFFIT(lean_object*);
lean_object* l_List_appendTR___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__Exprlist(uint8_t);
static lean_object* l_CakeML_ptree__SpecLine___closed__3;
size_t lean_usize_of_nat(lean_object*);
lean_object* l_CakeML_destIntT(lean_object*);
extern lean_object* l_CakeML_instInhabitedToken;
lean_object* lean_string_data(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__Expr(uint8_t, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_letFromPat(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_List_foldrTR___at_CakeML_ptree__Expr___spec__1(lean_object*, lean_object*);
lean_object* l_CakeML_destAlphaT(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_mkAst__App___lambda__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__OpID(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__Plist(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__DtypeDecl(lean_object*);
lean_object* l_CakeML_merge__locs(lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__5;
static lean_object* l_CakeML_ptree__Expr___closed__3;
LEAN_EXPORT lean_object* l_CakeML_ptree__TypeList1(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_dePat(lean_object*, lean_object*);
uint8_t lean_uint32_dec_le(uint32_t, uint32_t);
LEAN_EXPORT lean_object* l_CakeML_ptree__SignatureValue(lean_object*);
static lean_object* l_CakeML_ptree__TypeDec___closed__1;
LEAN_EXPORT lean_object* l_CakeML_ptree__Decls(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__linfix(lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__25;
static lean_object* l_CakeML_ptree__Eliteral___closed__1;
LEAN_EXPORT lean_object* l_CakeML_ptree__TypeName(lean_object*);
lean_object* l_List_tail___rarg(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_EtoPat(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__SpeclineList(lean_object*);
lean_object* l_BitVec_ofNat(lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__37;
static lean_object* l_CakeML_ptree__Expr___closed__2;
lean_object* l_CakeML_destTyvarPT___rarg(lean_object*);
lean_object* l_HOL4_instInhabitedParsetree___rarg(lean_object*, lean_object*);
uint8_t l___private_Init_Data_Option_Basic_0__Option_beqOption____x40_Init_Data_Option_Basic___hyg_159____at___private_CakeML_Core_Ast_0__CakeML_beqpat____x40_CakeML_Core_Ast___hyg_8136____spec__1(lean_object*, lean_object*);
uint8_t l_List_isEmpty___rarg(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__NonETopLevelDecs(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__SpecLine(lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__1;
static lean_object* l_CakeML_ptree__Expr___closed__6;
static lean_object* l_CakeML_ptree__Op___closed__22;
LEAN_EXPORT lean_object* l_CakeML_ptree__Pattern(uint8_t, lean_object*);
static lean_object* l_CakeML_ptree__Pattern___closed__11;
static lean_object* l_CakeML_instInhabitedPCstate0___closed__1;
lean_object* l_CakeML_destTOK___rarg(lean_object*);
extern lean_object* l_CakeML_unknown__loc;
lean_object* l_List_lengthTRAux___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__Dconstructor(lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__3;
lean_object* l_CakeML_validListSym___boxed(lean_object*);
static lean_object* l_CakeML_dePat___closed__2;
static lean_object* l_CakeML_ptree__TbaseList___closed__1;
LEAN_EXPORT lean_object* l_CakeML_ptree__PTbase(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__TypeAbbrevDec(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_dest__Conk___rarg___boxed(lean_object*, lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__31;
LEAN_EXPORT lean_object* l_CakeML_merge__locsopt___boxed(lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Expr___closed__12;
static lean_object* l_CakeML_mk__binop___closed__1;
static lean_object* l_CakeML_ptree__SpecLine___closed__2;
LEAN_EXPORT lean_object* l_CakeML_ptree__TyvarN(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__TbaseList(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_mpop__namedscope___boxed(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_mkFun(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_mpopscope(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__Exprlist___rarg(lean_object*);
LEAN_EXPORT lean_object* l_List_foldrTR___at_CakeML_ptree__Expr___spec__3(lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Pattern___closed__6;
lean_object* l_CakeML_validMultSym___boxed(lean_object*);
static lean_object* l_CakeML_ptree__Pattern___closed__14;
LEAN_EXPORT lean_object* l_CakeML_ptree__Structure___lambda__1___boxed(lean_object*, lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__TopLevelDecs___closed__1;
static lean_object* l_CakeML_ptree__Op___closed__8;
LEAN_EXPORT lean_object* l_CakeML_strip__loc__expr(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_merge__locsopt(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__Structure___lambda__1(lean_object*, lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__18;
static lean_object* l_CakeML_mkAst__App___lambda__1___closed__2;
LEAN_EXPORT lean_object* l_CakeML_detuplify(lean_object*);
static lean_object* l_CakeML_ptree__Expr___closed__16;
lean_object* l_CakeML_destLf___rarg(lean_object*);
static lean_object* l_CakeML_ptree__Pattern___closed__8;
LEAN_EXPORT lean_object* l_CakeML_mpop__namedscope___rarg(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__Exprlist___boxed(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_bind__loc(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_mpop__namedscope(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__PE(lean_object*);
static lean_object* l_CakeML_ptree__Expr___closed__18;
static lean_object* l_CakeML_ptree__DtypeDecl___closed__1;
LEAN_EXPORT lean_object* l_CakeML_isConstructor(lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__32;
LEAN_EXPORT uint8_t l_CakeML_tokcheck(lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__9;
static lean_object* l_CakeML_ptree__Expr___closed__15;
static lean_object* l_CakeML_ptree__Pattern___closed__7;
static lean_object* l_CakeML_ptree__Op___closed__34;
static lean_object* l_CakeML_ptree__Op___closed__4;
LEAN_EXPORT lean_object* l_CakeML_mfixity__lookup(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__PbaseList1(lean_object*);
static lean_object* l_CakeML_mk__binop___closed__4;
LEAN_EXPORT lean_object* l_CakeML_ptree__Tyop(lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__10;
LEAN_EXPORT lean_object* l_CakeML_mk__binop(lean_object*, lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__14;
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__PType(lean_object*);
static lean_object* l_CakeML_ptree__Expr___closed__10;
LEAN_EXPORT lean_object* l_CakeML_tuplify(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__Expr___boxed(lean_object*, lean_object*);
uint8_t lean_nat_dec_lt(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_empty__PCstate0;
lean_object* l_CakeML_validRelSym___boxed(lean_object*);
uint8_t l_List_beq___at___private_CakeML_Core_Mlstring_0__CakeML_beqmlstring____x40_CakeML_Core_Mlstring___hyg_81____spec__1(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__Op(lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__12;
LEAN_EXPORT lean_object* l_CakeML_ptree__Type(uint8_t, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_optLannot___boxed(lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Decl___closed__1;
static lean_object* l_CakeML_ptree__Op___closed__21;
LEAN_EXPORT uint8_t l_CakeML_tokcheckl(lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__29;
static lean_object* l_CakeML_isConstructor___closed__2;
lean_object* l_CakeML_destLongidT(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_Eseq__encode___boxed(lean_object*);
static lean_object* l_CakeML_ptree__Expr___closed__7;
static lean_object* l_CakeML_ptree__Expr___closed__4;
static lean_object* l_CakeML_ptree__OpID___closed__6;
LEAN_EXPORT lean_object* l_List_foldrTR___at_CakeML_ptree__Pattern___spec__1(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_mFUPD__HD(lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__7;
static lean_object* l_CakeML_ptree__Op___closed__28;
static lean_object* l_CakeML_mk__binop___closed__2;
static lean_object* l_CakeML_ptree__Pattern___closed__5;
static lean_object* l_CakeML_ptree__OpID___closed__2;
static lean_object* l_CakeML_ptree__Structure___closed__2;
static lean_object* l_CakeML_ptree__Pattern___closed__13;
LEAN_EXPORT lean_object* l_CakeML_Papply(lean_object*, lean_object*);
static lean_object* l_CakeML_dePat___closed__1;
static lean_object* l_CakeML_ptree__Expr___closed__17;
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Expr___spec__4___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_Eseq__encode(lean_object*);
size_t lean_usize_sub(size_t, size_t);
lean_object* lean_array_mk(lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__30;
static lean_object* l_CakeML_ptree__OpID___closed__5;
static lean_object* l_CakeML_ptree__TopLevelDecs___closed__3;
static lean_object* l_CakeML_ptree__Op___closed__38;
lean_object* l_CakeML_destWordT(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_instInhabitedPCstate0;
static lean_object* l_CakeML_ptree__Structure___closed__1;
LEAN_EXPORT lean_object* l_CakeML_dest__Conk(lean_object*);
lean_object* lean_array_uget(lean_object*, size_t);
static lean_object* l_CakeML_ptree__Expr___closed__13;
static lean_object* l_CakeML_ptree__Op___closed__17;
static lean_object* l_CakeML_ptree__PEsfx___closed__1;
static lean_object* l_CakeML_ptree__Pattern___closed__2;
static lean_object* l_CakeML_ptree__Op___closed__13;
lean_object* l_CakeML_destStringT(lean_object*);
static lean_object* l_CakeML_ptree__Pattern___closed__10;
LEAN_EXPORT lean_object* l_CakeML_ptree__AndFDecls(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__FQV(lean_object*);
static lean_object* l_CakeML_ptree__OpID___closed__1;
lean_object* lean_array_get_size(lean_object*);
static lean_object* l_CakeML_mkAst__App___lambda__1___closed__1;
static lean_object* l_CakeML_ptree__Pattern___closed__1;
LEAN_EXPORT lean_object* l_CakeML_msetfix(lean_object*, lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__20;
static lean_object* l_CakeML_ptree__Op___closed__15;
LEAN_EXPORT lean_object* l_CakeML_ifM___rarg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Expr___spec__2(lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__Dconstructor___lambda__1(lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Expr___closed__9;
uint8_t l___private_CakeML_Core_Namespace_0__CakeML_beqid____x40_CakeML_Core_Namespace___hyg_213____at___private_CakeML_Core_Ast_0__CakeML_beqexp____x40_CakeML_Core_Ast___hyg_9727____spec__3(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CakeML_ptree__OptTypEqn(lean_object*);
static lean_object* l_CakeML_ptree__Op___closed__26;
static lean_object* l_CakeML_ptree__Expr___closed__1;
static lean_object* l_CakeML_ptree__Op___closed__24;
LEAN_EXPORT lean_object* l_CakeML_ptree__LetDec(lean_object*);
static lean_object* l_CakeML_ptree__SpecLine___closed__1;
LEAN_EXPORT lean_object* l_CakeML_ptree__TopLevelDecs(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_mpushPC__scope(lean_object*);
LEAN_EXPORT lean_object* l_CakeML_destFFIop(lean_object*);
static lean_object* l_CakeML_ptree__Expr___closed__14;
LEAN_EXPORT lean_object* l_CakeML_ptree__Type___boxed(lean_object*, lean_object*);
static lean_object* l_CakeML_ptree__Expr___closed__8;
static lean_object* _init_l_CakeML_instInhabitedPCstate0___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_box(0);
x_2 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_2, 0, x_1);
lean_ctor_set(x_2, 1, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_instInhabitedPCstate0() {
_start:
{
lean_object* x_1; 
x_1 = l_CakeML_instInhabitedPCstate0___closed__1;
return x_1;
}
}
static lean_object* _init_l_CakeML_empty__PCstate0() {
_start:
{
lean_object* x_1; 
x_1 = l_CakeML_instInhabitedPCstate0___closed__1;
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_mpushPC__scope(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_2 = l_CakeML_empty__PCstate0;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
x_4 = lean_box(0);
x_5 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_5, 0, x_4);
lean_ctor_set(x_5, 1, x_3);
x_6 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_6, 0, x_5);
return x_6;
}
}
LEAN_EXPORT lean_object* l_HOL4_ALOOKUP___at_CakeML_fixity__lookup___spec__1(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_3; 
lean_dec(x_2);
x_3 = lean_box(0);
return x_3;
}
else
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; uint8_t x_8; 
x_4 = lean_ctor_get(x_1, 0);
lean_inc(x_4);
x_5 = lean_ctor_get(x_1, 1);
lean_inc(x_5);
lean_dec(x_1);
x_6 = lean_ctor_get(x_4, 0);
lean_inc(x_6);
x_7 = lean_ctor_get(x_4, 1);
lean_inc(x_7);
lean_dec(x_4);
lean_inc(x_2);
x_8 = l_List_beq___at___private_CakeML_Core_Mlstring_0__CakeML_beqmlstring____x40_CakeML_Core_Mlstring___hyg_81____spec__1(x_6, x_2);
if (x_8 == 0)
{
lean_dec(x_7);
x_1 = x_5;
goto _start;
}
else
{
lean_object* x_10; 
lean_dec(x_5);
lean_dec(x_2);
x_10 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_10, 0, x_7);
return x_10;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_fixity__lookup(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_3; 
lean_dec(x_1);
x_3 = lean_box(0);
return x_3;
}
else
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; 
x_4 = lean_ctor_get(x_2, 0);
lean_inc(x_4);
x_5 = lean_ctor_get(x_2, 1);
lean_inc(x_5);
lean_dec(x_2);
x_6 = lean_ctor_get(x_4, 0);
lean_inc(x_6);
lean_dec(x_4);
lean_inc(x_1);
x_7 = l_HOL4_ALOOKUP___at_CakeML_fixity__lookup___spec__1(x_6, x_1);
if (lean_obj_tag(x_7) == 0)
{
x_2 = x_5;
goto _start;
}
else
{
lean_object* x_9; 
lean_dec(x_5);
lean_dec(x_1);
x_9 = lean_ctor_get(x_7, 0);
lean_inc(x_9);
lean_dec(x_7);
if (lean_obj_tag(x_9) == 0)
{
lean_object* x_10; 
x_10 = lean_box(0);
return x_10;
}
else
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_9);
if (x_11 == 0)
{
return x_9;
}
else
{
lean_object* x_12; lean_object* x_13; 
x_12 = lean_ctor_get(x_9, 0);
lean_inc(x_12);
lean_dec(x_9);
x_13 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_13, 0, x_12);
return x_13;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_mfixity__lookup(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
lean_inc(x_2);
x_3 = l_CakeML_fixity__lookup(x_1, x_2);
if (lean_obj_tag(x_3) == 0)
{
lean_object* x_4; 
lean_dec(x_2);
x_4 = lean_box(0);
return x_4;
}
else
{
uint8_t x_5; 
x_5 = !lean_is_exclusive(x_3);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; 
x_6 = lean_ctor_get(x_3, 0);
x_7 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_7, 0, x_6);
lean_ctor_set(x_7, 1, x_2);
lean_ctor_set(x_3, 0, x_7);
return x_3;
}
else
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; 
x_8 = lean_ctor_get(x_3, 0);
lean_inc(x_8);
lean_dec(x_3);
x_9 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_9, 0, x_8);
lean_ctor_set(x_9, 1, x_2);
x_10 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_10, 0, x_9);
return x_10;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_mFUPD__HD(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_3; 
lean_dec(x_1);
x_3 = lean_box(0);
return x_3;
}
else
{
uint8_t x_4; 
x_4 = !lean_is_exclusive(x_2);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_5 = lean_ctor_get(x_2, 0);
x_6 = lean_apply_1(x_1, x_5);
lean_ctor_set(x_2, 0, x_6);
x_7 = lean_box(0);
x_8 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_8, 0, x_7);
lean_ctor_set(x_8, 1, x_2);
x_9 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_9, 0, x_8);
return x_9;
}
else
{
lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; 
x_10 = lean_ctor_get(x_2, 0);
x_11 = lean_ctor_get(x_2, 1);
lean_inc(x_11);
lean_inc(x_10);
lean_dec(x_2);
x_12 = lean_apply_1(x_1, x_10);
x_13 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_13, 0, x_12);
lean_ctor_set(x_13, 1, x_11);
x_14 = lean_box(0);
x_15 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_15, 0, x_14);
lean_ctor_set(x_15, 1, x_13);
x_16 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_16, 0, x_15);
return x_16;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_msetfix___lambda__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; uint8_t x_5; 
x_4 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
x_5 = !lean_is_exclusive(x_3);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; 
x_6 = lean_ctor_get(x_3, 0);
x_7 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_7, 0, x_4);
lean_ctor_set(x_7, 1, x_6);
lean_ctor_set(x_3, 0, x_7);
return x_3;
}
else
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; 
x_8 = lean_ctor_get(x_3, 0);
x_9 = lean_ctor_get(x_3, 1);
lean_inc(x_9);
lean_inc(x_8);
lean_dec(x_3);
x_10 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_10, 0, x_4);
lean_ctor_set(x_10, 1, x_8);
x_11 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_11, 0, x_10);
lean_ctor_set(x_11, 1, x_9);
return x_11;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_msetfix(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; 
x_4 = lean_alloc_closure((void*)(l_CakeML_msetfix___lambda__1), 3, 2);
lean_closure_set(x_4, 0, x_1);
lean_closure_set(x_4, 1, x_2);
x_5 = l_CakeML_mFUPD__HD(x_4, x_3);
return x_5;
}
}
LEAN_EXPORT lean_object* l_CakeML_mpopscope(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
x_2 = lean_box(0);
return x_2;
}
else
{
uint8_t x_3; 
x_3 = !lean_is_exclusive(x_1);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = lean_ctor_get(x_1, 0);
lean_dec(x_4);
x_5 = lean_box(0);
lean_ctor_set_tag(x_1, 0);
lean_ctor_set(x_1, 0, x_5);
x_6 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_6, 0, x_1);
return x_6;
}
else
{
lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; 
x_7 = lean_ctor_get(x_1, 1);
lean_inc(x_7);
lean_dec(x_1);
x_8 = lean_box(0);
x_9 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_9, 0, x_8);
lean_ctor_set(x_9, 1, x_7);
x_10 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_10, 0, x_9);
return x_10;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_mpop__namedscope___rarg(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
x_2 = lean_box(0);
return x_2;
}
else
{
uint8_t x_3; 
x_3 = !lean_is_exclusive(x_1);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; 
x_4 = lean_ctor_get(x_1, 1);
x_5 = lean_ctor_get(x_1, 0);
lean_dec(x_5);
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_6; 
lean_free_object(x_1);
x_6 = lean_box(0);
return x_6;
}
else
{
uint8_t x_7; 
x_7 = !lean_is_exclusive(x_4);
if (x_7 == 0)
{
lean_object* x_8; lean_object* x_9; 
x_8 = lean_box(0);
lean_ctor_set_tag(x_1, 0);
lean_ctor_set(x_1, 0, x_8);
x_9 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_9, 0, x_1);
return x_9;
}
else
{
lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_10 = lean_ctor_get(x_4, 0);
x_11 = lean_ctor_get(x_4, 1);
lean_inc(x_11);
lean_inc(x_10);
lean_dec(x_4);
x_12 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_12, 0, x_10);
lean_ctor_set(x_12, 1, x_11);
x_13 = lean_box(0);
lean_ctor_set_tag(x_1, 0);
lean_ctor_set(x_1, 1, x_12);
lean_ctor_set(x_1, 0, x_13);
x_14 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_14, 0, x_1);
return x_14;
}
}
}
else
{
lean_object* x_15; 
x_15 = lean_ctor_get(x_1, 1);
lean_inc(x_15);
lean_dec(x_1);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
x_16 = lean_box(0);
return x_16;
}
else
{
lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; 
x_17 = lean_ctor_get(x_15, 0);
lean_inc(x_17);
x_18 = lean_ctor_get(x_15, 1);
lean_inc(x_18);
if (lean_is_exclusive(x_15)) {
 lean_ctor_release(x_15, 0);
 lean_ctor_release(x_15, 1);
 x_19 = x_15;
} else {
 lean_dec_ref(x_15);
 x_19 = lean_box(0);
}
if (lean_is_scalar(x_19)) {
 x_20 = lean_alloc_ctor(1, 2, 0);
} else {
 x_20 = x_19;
}
lean_ctor_set(x_20, 0, x_17);
lean_ctor_set(x_20, 1, x_18);
x_21 = lean_box(0);
x_22 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_22, 0, x_21);
lean_ctor_set(x_22, 1, x_20);
x_23 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_23, 0, x_22);
return x_23;
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_mpop__namedscope(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_CakeML_mpop__namedscope___rarg), 1, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_mpop__namedscope___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_CakeML_mpop__namedscope(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_ifM___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_4; 
x_4 = lean_box(0);
return x_4;
}
else
{
lean_object* x_5; uint8_t x_6; 
x_5 = lean_ctor_get(x_1, 0);
x_6 = lean_unbox(x_5);
if (x_6 == 0)
{
lean_inc(x_3);
return x_3;
}
else
{
lean_inc(x_2);
return x_2;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ifM(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_CakeML_ifM___rarg___boxed), 3, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_ifM___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_CakeML_ifM___rarg(x_1, x_2, x_3);
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
return x_4;
}
}
static lean_object* _init_l_CakeML_mk__binop___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("::", 2, 2);
return x_1;
}
}
static lean_object* _init_l_CakeML_mk__binop___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_mk__binop___closed__1;
x_2 = lean_string_data(x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_mk__binop___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_mk__binop___closed__2;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_mk__binop___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_mk__binop___closed__3;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_mk__binop(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; uint8_t x_5; 
x_4 = l_CakeML_mk__binop___closed__3;
lean_inc(x_1);
x_5 = l___private_CakeML_Core_Namespace_0__CakeML_beqid____x40_CakeML_Core_Namespace___hyg_213____at___private_CakeML_Core_Ast_0__CakeML_beqexp____x40_CakeML_Core_Ast___hyg_9727____spec__3(x_1, x_4);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_6 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_6, 0, x_1);
x_7 = lean_box(0);
x_8 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_8, 0, x_2);
lean_ctor_set(x_8, 1, x_7);
x_9 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_9, 0, x_6);
lean_ctor_set(x_9, 1, x_8);
x_10 = lean_box(5);
x_11 = lean_alloc_ctor(6, 2, 0);
lean_ctor_set(x_11, 0, x_10);
lean_ctor_set(x_11, 1, x_9);
x_12 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_12, 0, x_3);
lean_ctor_set(x_12, 1, x_7);
x_13 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_13, 0, x_11);
lean_ctor_set(x_13, 1, x_12);
x_14 = lean_alloc_ctor(6, 2, 0);
lean_ctor_set(x_14, 0, x_10);
lean_ctor_set(x_14, 1, x_13);
return x_14;
}
else
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; 
lean_dec(x_1);
x_15 = lean_box(0);
x_16 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_16, 0, x_3);
lean_ctor_set(x_16, 1, x_15);
x_17 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_17, 0, x_2);
lean_ctor_set(x_17, 1, x_16);
x_18 = l_CakeML_mk__binop___closed__4;
x_19 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_19, 0, x_18);
lean_ctor_set(x_19, 1, x_17);
return x_19;
}
}
}
LEAN_EXPORT uint8_t l_CakeML_tokcheck(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_CakeML_destLf___rarg(x_1);
if (lean_obj_tag(x_3) == 0)
{
uint8_t x_4; 
lean_dec(x_2);
x_4 = 0;
return x_4;
}
else
{
lean_object* x_5; lean_object* x_6; 
x_5 = lean_ctor_get(x_3, 0);
lean_inc(x_5);
lean_dec(x_3);
x_6 = l_CakeML_destTOK___rarg(x_5);
if (lean_obj_tag(x_6) == 0)
{
uint8_t x_7; 
lean_dec(x_2);
x_7 = 0;
return x_7;
}
else
{
lean_object* x_8; uint8_t x_9; 
x_8 = lean_ctor_get(x_6, 0);
lean_inc(x_8);
lean_dec(x_6);
x_9 = l___private_CakeML_Core_Tokens_0__CakeML_beqtoken____x40_CakeML_Core_Tokens___hyg_2775_(x_8, x_2);
return x_9;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_tokcheck___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_CakeML_tokcheck(x_1, x_2);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__UQTyop(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 0;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; lean_object* x_12; 
x_11 = lean_ctor_get(x_4, 0);
lean_inc(x_11);
lean_dec(x_4);
x_12 = l_CakeML_destLf___rarg(x_11);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
x_13 = lean_box(0);
return x_13;
}
else
{
lean_object* x_14; lean_object* x_15; 
x_14 = lean_ctor_get(x_12, 0);
lean_inc(x_14);
lean_dec(x_12);
x_15 = l_CakeML_destTOK___rarg(x_14);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
x_16 = lean_box(0);
return x_16;
}
else
{
lean_object* x_17; lean_object* x_18; 
x_17 = lean_ctor_get(x_15, 0);
lean_inc(x_17);
lean_dec(x_15);
lean_inc(x_17);
x_18 = l_CakeML_destSymbolT(x_17);
if (lean_obj_tag(x_18) == 0)
{
lean_object* x_19; 
x_19 = l_CakeML_destAlphaT(x_17);
return x_19;
}
else
{
uint8_t x_20; 
lean_dec(x_17);
x_20 = !lean_is_exclusive(x_18);
if (x_20 == 0)
{
return x_18;
}
else
{
lean_object* x_21; lean_object* x_22; 
x_21 = lean_ctor_get(x_18, 0);
lean_inc(x_21);
lean_dec(x_18);
x_22 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_22, 0, x_21);
return x_22;
}
}
}
}
}
else
{
lean_object* x_23; 
lean_dec(x_10);
lean_dec(x_4);
x_23 = lean_box(0);
return x_23;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__TyvarN(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 1;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; lean_object* x_12; 
x_11 = lean_ctor_get(x_4, 0);
lean_inc(x_11);
lean_dec(x_4);
x_12 = l_CakeML_destTyvarPT___rarg(x_11);
return x_12;
}
else
{
lean_object* x_13; 
lean_dec(x_10);
lean_dec(x_4);
x_13 = lean_box(0);
return x_13;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_Long__Short(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
uint8_t x_3; 
x_3 = !lean_is_exclusive(x_1);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; 
x_4 = lean_ctor_get(x_1, 1);
x_5 = l_CakeML_Long__Short(x_4, x_2);
lean_ctor_set_tag(x_1, 1);
lean_ctor_set(x_1, 1, x_5);
return x_1;
}
else
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_6 = lean_ctor_get(x_1, 0);
x_7 = lean_ctor_get(x_1, 1);
lean_inc(x_7);
lean_inc(x_6);
lean_dec(x_1);
x_8 = l_CakeML_Long__Short(x_7, x_2);
x_9 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_9, 0, x_6);
lean_ctor_set(x_9, 1, x_8);
return x_9;
}
}
else
{
lean_object* x_10; 
x_10 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_10, 0, x_2);
return x_10;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Tyop(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 2;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; lean_object* x_11; lean_object* x_12; 
x_10 = lean_ctor_get(x_4, 0);
lean_inc(x_10);
x_11 = lean_ctor_get(x_4, 1);
lean_inc(x_11);
lean_dec(x_4);
if (lean_obj_tag(x_11) == 0)
{
lean_object* x_22; 
lean_inc(x_10);
x_22 = l_CakeML_destLf___rarg(x_10);
if (lean_obj_tag(x_22) == 0)
{
lean_object* x_23; 
x_23 = lean_box(0);
x_12 = x_23;
goto block_21;
}
else
{
lean_object* x_24; lean_object* x_25; 
x_24 = lean_ctor_get(x_22, 0);
lean_inc(x_24);
lean_dec(x_22);
x_25 = l_CakeML_destTOK___rarg(x_24);
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_26; 
x_26 = lean_box(0);
x_12 = x_26;
goto block_21;
}
else
{
lean_object* x_27; lean_object* x_28; 
x_27 = lean_ctor_get(x_25, 0);
lean_inc(x_27);
lean_dec(x_25);
x_28 = l_CakeML_destLongidT(x_27);
if (lean_obj_tag(x_28) == 0)
{
lean_object* x_29; 
x_29 = lean_box(0);
x_12 = x_29;
goto block_21;
}
else
{
uint8_t x_30; 
lean_dec(x_10);
x_30 = !lean_is_exclusive(x_28);
if (x_30 == 0)
{
lean_object* x_31; lean_object* x_32; lean_object* x_33; lean_object* x_34; 
x_31 = lean_ctor_get(x_28, 0);
x_32 = lean_ctor_get(x_31, 0);
lean_inc(x_32);
x_33 = lean_ctor_get(x_31, 1);
lean_inc(x_33);
lean_dec(x_31);
x_34 = l_CakeML_Long__Short(x_32, x_33);
lean_ctor_set(x_28, 0, x_34);
return x_28;
}
else
{
lean_object* x_35; lean_object* x_36; lean_object* x_37; lean_object* x_38; lean_object* x_39; 
x_35 = lean_ctor_get(x_28, 0);
lean_inc(x_35);
lean_dec(x_28);
x_36 = lean_ctor_get(x_35, 0);
lean_inc(x_36);
x_37 = lean_ctor_get(x_35, 1);
lean_inc(x_37);
lean_dec(x_35);
x_38 = l_CakeML_Long__Short(x_36, x_37);
x_39 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_39, 0, x_38);
return x_39;
}
}
}
}
}
else
{
lean_object* x_40; 
lean_dec(x_11);
lean_dec(x_10);
x_40 = lean_box(0);
return x_40;
}
block_21:
{
lean_object* x_13; 
lean_dec(x_12);
x_13 = l_CakeML_ptree__UQTyop(x_10);
if (lean_obj_tag(x_13) == 0)
{
lean_object* x_14; 
x_14 = lean_box(0);
return x_14;
}
else
{
uint8_t x_15; 
x_15 = !lean_is_exclusive(x_13);
if (x_15 == 0)
{
lean_object* x_16; lean_object* x_17; 
x_16 = lean_ctor_get(x_13, 0);
x_17 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_17, 0, x_16);
lean_ctor_set(x_13, 0, x_17);
return x_13;
}
else
{
lean_object* x_18; lean_object* x_19; lean_object* x_20; 
x_18 = lean_ctor_get(x_13, 0);
lean_inc(x_18);
lean_dec(x_13);
x_19 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_19, 0, x_18);
x_20 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_20, 0, x_19);
return x_20;
}
}
}
}
}
}
}
}
LEAN_EXPORT uint8_t l_CakeML_tokcheckl(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
if (lean_obj_tag(x_2) == 0)
{
uint8_t x_3; 
x_3 = 1;
return x_3;
}
else
{
uint8_t x_4; 
lean_dec(x_2);
x_4 = 0;
return x_4;
}
}
else
{
if (lean_obj_tag(x_2) == 0)
{
uint8_t x_5; 
lean_dec(x_1);
x_5 = 0;
return x_5;
}
else
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; uint8_t x_10; 
x_6 = lean_ctor_get(x_1, 0);
lean_inc(x_6);
x_7 = lean_ctor_get(x_1, 1);
lean_inc(x_7);
lean_dec(x_1);
x_8 = lean_ctor_get(x_2, 0);
lean_inc(x_8);
x_9 = lean_ctor_get(x_2, 1);
lean_inc(x_9);
lean_dec(x_2);
x_10 = l_CakeML_tokcheck(x_6, x_8);
if (x_10 == 0)
{
uint8_t x_11; 
lean_dec(x_9);
lean_dec(x_7);
x_11 = 0;
return x_11;
}
else
{
x_1 = x_7;
x_2 = x_9;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_tokcheckl___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_CakeML_tokcheckl(x_1, x_2);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__linfix___rarg(uint8_t x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_5; 
lean_dec(x_4);
lean_dec(x_3);
lean_dec(x_2);
x_5 = lean_box(0);
return x_5;
}
else
{
lean_object* x_6; lean_object* x_7; uint8_t x_8; uint8_t x_9; 
x_6 = lean_ctor_get(x_4, 0);
lean_inc(x_6);
x_7 = lean_ctor_get(x_4, 1);
lean_inc(x_7);
lean_dec(x_4);
x_8 = lean_unbox(x_6);
lean_dec(x_6);
x_9 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_8, x_1);
if (x_9 == 0)
{
lean_object* x_10; 
lean_dec(x_7);
lean_dec(x_3);
lean_dec(x_2);
x_10 = lean_box(0);
return x_10;
}
else
{
if (lean_obj_tag(x_7) == 0)
{
lean_object* x_11; 
lean_dec(x_3);
lean_dec(x_2);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_7, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
uint8_t x_13; 
lean_dec(x_2);
x_13 = !lean_is_exclusive(x_7);
if (x_13 == 0)
{
lean_object* x_14; lean_object* x_15; lean_object* x_16; 
x_14 = lean_ctor_get(x_7, 0);
x_15 = lean_ctor_get(x_7, 1);
lean_dec(x_15);
x_16 = lean_apply_1(x_3, x_14);
if (lean_obj_tag(x_16) == 0)
{
lean_object* x_17; 
lean_free_object(x_7);
x_17 = lean_box(0);
return x_17;
}
else
{
uint8_t x_18; 
x_18 = !lean_is_exclusive(x_16);
if (x_18 == 0)
{
lean_object* x_19; lean_object* x_20; 
x_19 = lean_ctor_get(x_16, 0);
x_20 = lean_box(0);
lean_ctor_set(x_7, 1, x_20);
lean_ctor_set(x_7, 0, x_19);
lean_ctor_set(x_16, 0, x_7);
return x_16;
}
else
{
lean_object* x_21; lean_object* x_22; lean_object* x_23; 
x_21 = lean_ctor_get(x_16, 0);
lean_inc(x_21);
lean_dec(x_16);
x_22 = lean_box(0);
lean_ctor_set(x_7, 1, x_22);
lean_ctor_set(x_7, 0, x_21);
x_23 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_23, 0, x_7);
return x_23;
}
}
}
else
{
lean_object* x_24; lean_object* x_25; 
x_24 = lean_ctor_get(x_7, 0);
lean_inc(x_24);
lean_dec(x_7);
x_25 = lean_apply_1(x_3, x_24);
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_26; 
x_26 = lean_box(0);
return x_26;
}
else
{
lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; 
x_27 = lean_ctor_get(x_25, 0);
lean_inc(x_27);
if (lean_is_exclusive(x_25)) {
 lean_ctor_release(x_25, 0);
 x_28 = x_25;
} else {
 lean_dec_ref(x_25);
 x_28 = lean_box(0);
}
x_29 = lean_box(0);
x_30 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_30, 0, x_27);
lean_ctor_set(x_30, 1, x_29);
if (lean_is_scalar(x_28)) {
 x_31 = lean_alloc_ctor(1, 1, 0);
} else {
 x_31 = x_28;
}
lean_ctor_set(x_31, 0, x_30);
return x_31;
}
}
}
else
{
lean_object* x_32; 
x_32 = lean_ctor_get(x_12, 1);
lean_inc(x_32);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; 
lean_dec(x_12);
lean_dec(x_7);
lean_dec(x_3);
lean_dec(x_2);
x_33 = lean_box(0);
return x_33;
}
else
{
lean_object* x_34; 
x_34 = lean_ctor_get(x_32, 1);
lean_inc(x_34);
if (lean_obj_tag(x_34) == 0)
{
lean_object* x_35; lean_object* x_36; uint8_t x_37; 
x_35 = lean_ctor_get(x_7, 0);
lean_inc(x_35);
lean_dec(x_7);
x_36 = lean_ctor_get(x_12, 0);
lean_inc(x_36);
lean_dec(x_12);
x_37 = !lean_is_exclusive(x_32);
if (x_37 == 0)
{
lean_object* x_38; lean_object* x_39; uint8_t x_40; 
x_38 = lean_ctor_get(x_32, 0);
x_39 = lean_ctor_get(x_32, 1);
lean_dec(x_39);
lean_inc(x_2);
x_40 = l_CakeML_tokcheck(x_36, x_2);
if (x_40 == 0)
{
lean_object* x_41; 
lean_free_object(x_32);
lean_dec(x_38);
lean_dec(x_35);
lean_dec(x_3);
lean_dec(x_2);
x_41 = lean_box(0);
return x_41;
}
else
{
lean_object* x_42; 
lean_inc(x_3);
x_42 = l_CakeML_ptree__linfix___rarg(x_1, x_2, x_3, x_35);
if (lean_obj_tag(x_42) == 0)
{
lean_object* x_43; 
lean_free_object(x_32);
lean_dec(x_38);
lean_dec(x_3);
x_43 = lean_box(0);
return x_43;
}
else
{
lean_object* x_44; lean_object* x_45; 
x_44 = lean_ctor_get(x_42, 0);
lean_inc(x_44);
lean_dec(x_42);
x_45 = lean_apply_1(x_3, x_38);
if (lean_obj_tag(x_45) == 0)
{
lean_object* x_46; 
lean_dec(x_44);
lean_free_object(x_32);
x_46 = lean_box(0);
return x_46;
}
else
{
uint8_t x_47; 
x_47 = !lean_is_exclusive(x_45);
if (x_47 == 0)
{
lean_object* x_48; lean_object* x_49; lean_object* x_50; 
x_48 = lean_ctor_get(x_45, 0);
x_49 = lean_box(0);
lean_ctor_set(x_32, 1, x_49);
lean_ctor_set(x_32, 0, x_48);
x_50 = l_List_appendTR___rarg(x_44, x_32);
lean_ctor_set(x_45, 0, x_50);
return x_45;
}
else
{
lean_object* x_51; lean_object* x_52; lean_object* x_53; lean_object* x_54; 
x_51 = lean_ctor_get(x_45, 0);
lean_inc(x_51);
lean_dec(x_45);
x_52 = lean_box(0);
lean_ctor_set(x_32, 1, x_52);
lean_ctor_set(x_32, 0, x_51);
x_53 = l_List_appendTR___rarg(x_44, x_32);
x_54 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_54, 0, x_53);
return x_54;
}
}
}
}
}
else
{
lean_object* x_55; uint8_t x_56; 
x_55 = lean_ctor_get(x_32, 0);
lean_inc(x_55);
lean_dec(x_32);
lean_inc(x_2);
x_56 = l_CakeML_tokcheck(x_36, x_2);
if (x_56 == 0)
{
lean_object* x_57; 
lean_dec(x_55);
lean_dec(x_35);
lean_dec(x_3);
lean_dec(x_2);
x_57 = lean_box(0);
return x_57;
}
else
{
lean_object* x_58; 
lean_inc(x_3);
x_58 = l_CakeML_ptree__linfix___rarg(x_1, x_2, x_3, x_35);
if (lean_obj_tag(x_58) == 0)
{
lean_object* x_59; 
lean_dec(x_55);
lean_dec(x_3);
x_59 = lean_box(0);
return x_59;
}
else
{
lean_object* x_60; lean_object* x_61; 
x_60 = lean_ctor_get(x_58, 0);
lean_inc(x_60);
lean_dec(x_58);
x_61 = lean_apply_1(x_3, x_55);
if (lean_obj_tag(x_61) == 0)
{
lean_object* x_62; 
lean_dec(x_60);
x_62 = lean_box(0);
return x_62;
}
else
{
lean_object* x_63; lean_object* x_64; lean_object* x_65; lean_object* x_66; lean_object* x_67; lean_object* x_68; 
x_63 = lean_ctor_get(x_61, 0);
lean_inc(x_63);
if (lean_is_exclusive(x_61)) {
 lean_ctor_release(x_61, 0);
 x_64 = x_61;
} else {
 lean_dec_ref(x_61);
 x_64 = lean_box(0);
}
x_65 = lean_box(0);
x_66 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_66, 0, x_63);
lean_ctor_set(x_66, 1, x_65);
x_67 = l_List_appendTR___rarg(x_60, x_66);
if (lean_is_scalar(x_64)) {
 x_68 = lean_alloc_ctor(1, 1, 0);
} else {
 x_68 = x_64;
}
lean_ctor_set(x_68, 0, x_67);
return x_68;
}
}
}
}
}
else
{
lean_object* x_69; 
lean_dec(x_34);
lean_dec(x_32);
lean_dec(x_12);
lean_dec(x_7);
lean_dec(x_3);
lean_dec(x_2);
x_69 = lean_box(0);
return x_69;
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__linfix(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_CakeML_ptree__linfix___rarg___boxed), 4, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__linfix___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; lean_object* x_6; 
x_5 = lean_unbox(x_1);
lean_dec(x_1);
x_6 = l_CakeML_ptree__linfix___rarg(x_5, x_2, x_3, x_4);
return x_6;
}
}
LEAN_EXPORT lean_object* l_CakeML_tuplify(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; 
x_3 = lean_ctor_get(x_1, 1);
lean_inc(x_3);
if (lean_obj_tag(x_3) == 0)
{
lean_object* x_4; lean_object* x_5; 
x_4 = lean_ctor_get(x_1, 0);
lean_inc(x_4);
lean_dec(x_1);
x_5 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_5, 0, x_4);
return x_5;
}
else
{
lean_object* x_6; lean_object* x_7; 
lean_dec(x_3);
x_6 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_6, 0, x_1);
x_7 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_7, 0, x_6);
return x_7;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Type(uint8_t x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_3; 
lean_dec(x_2);
x_3 = lean_box(0);
return x_3;
}
else
{
lean_object* x_4; lean_object* x_5; uint8_t x_6; uint8_t x_7; 
x_4 = lean_ctor_get(x_2, 0);
lean_inc(x_4);
x_5 = lean_ctor_get(x_2, 1);
lean_inc(x_5);
lean_dec(x_2);
x_6 = lean_unbox(x_4);
lean_dec(x_4);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_1);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_5);
x_8 = lean_box(0);
return x_8;
}
else
{
uint8_t x_9; uint8_t x_10; 
x_9 = 8;
x_10 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_1, x_9);
if (x_10 == 0)
{
uint8_t x_11; uint8_t x_12; 
x_11 = 6;
x_12 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_1, x_11);
if (x_12 == 0)
{
uint8_t x_13; uint8_t x_14; 
x_13 = 5;
x_14 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_1, x_13);
if (x_14 == 0)
{
lean_object* x_15; 
lean_dec(x_5);
x_15 = lean_box(0);
return x_15;
}
else
{
if (lean_obj_tag(x_5) == 0)
{
lean_object* x_16; 
x_16 = lean_box(0);
return x_16;
}
else
{
lean_object* x_17; 
x_17 = lean_ctor_get(x_5, 1);
lean_inc(x_17);
if (lean_obj_tag(x_17) == 0)
{
uint8_t x_18; 
x_18 = !lean_is_exclusive(x_5);
if (x_18 == 0)
{
lean_object* x_19; lean_object* x_20; lean_object* x_21; 
x_19 = lean_ctor_get(x_5, 0);
x_20 = lean_ctor_get(x_5, 1);
lean_dec(x_20);
lean_inc(x_19);
x_21 = l_CakeML_destTyvarPT___rarg(x_19);
if (lean_obj_tag(x_21) == 0)
{
lean_object* x_22; 
x_22 = l_CakeML_ptree__Tyop(x_19);
if (lean_obj_tag(x_22) == 0)
{
lean_object* x_23; 
lean_free_object(x_5);
x_23 = lean_box(0);
return x_23;
}
else
{
uint8_t x_24; 
x_24 = !lean_is_exclusive(x_22);
if (x_24 == 0)
{
lean_object* x_25; lean_object* x_26; 
x_25 = lean_ctor_get(x_22, 0);
x_26 = lean_box(0);
lean_ctor_set_tag(x_5, 3);
lean_ctor_set(x_5, 1, x_25);
lean_ctor_set(x_5, 0, x_26);
lean_ctor_set(x_22, 0, x_5);
return x_22;
}
else
{
lean_object* x_27; lean_object* x_28; lean_object* x_29; 
x_27 = lean_ctor_get(x_22, 0);
lean_inc(x_27);
lean_dec(x_22);
x_28 = lean_box(0);
lean_ctor_set_tag(x_5, 3);
lean_ctor_set(x_5, 1, x_27);
lean_ctor_set(x_5, 0, x_28);
x_29 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_29, 0, x_5);
return x_29;
}
}
}
else
{
uint8_t x_30; 
lean_free_object(x_5);
lean_dec(x_19);
x_30 = !lean_is_exclusive(x_21);
if (x_30 == 0)
{
lean_object* x_31; lean_object* x_32; 
x_31 = lean_ctor_get(x_21, 0);
x_32 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_32, 0, x_31);
lean_ctor_set(x_21, 0, x_32);
return x_21;
}
else
{
lean_object* x_33; lean_object* x_34; lean_object* x_35; 
x_33 = lean_ctor_get(x_21, 0);
lean_inc(x_33);
lean_dec(x_21);
x_34 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_34, 0, x_33);
x_35 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_35, 0, x_34);
return x_35;
}
}
}
else
{
lean_object* x_36; lean_object* x_37; 
x_36 = lean_ctor_get(x_5, 0);
lean_inc(x_36);
lean_dec(x_5);
lean_inc(x_36);
x_37 = l_CakeML_destTyvarPT___rarg(x_36);
if (lean_obj_tag(x_37) == 0)
{
lean_object* x_38; 
x_38 = l_CakeML_ptree__Tyop(x_36);
if (lean_obj_tag(x_38) == 0)
{
lean_object* x_39; 
x_39 = lean_box(0);
return x_39;
}
else
{
lean_object* x_40; lean_object* x_41; lean_object* x_42; lean_object* x_43; lean_object* x_44; 
x_40 = lean_ctor_get(x_38, 0);
lean_inc(x_40);
if (lean_is_exclusive(x_38)) {
 lean_ctor_release(x_38, 0);
 x_41 = x_38;
} else {
 lean_dec_ref(x_38);
 x_41 = lean_box(0);
}
x_42 = lean_box(0);
x_43 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_43, 0, x_42);
lean_ctor_set(x_43, 1, x_40);
if (lean_is_scalar(x_41)) {
 x_44 = lean_alloc_ctor(1, 1, 0);
} else {
 x_44 = x_41;
}
lean_ctor_set(x_44, 0, x_43);
return x_44;
}
}
else
{
lean_object* x_45; lean_object* x_46; lean_object* x_47; lean_object* x_48; 
lean_dec(x_36);
x_45 = lean_ctor_get(x_37, 0);
lean_inc(x_45);
if (lean_is_exclusive(x_37)) {
 lean_ctor_release(x_37, 0);
 x_46 = x_37;
} else {
 lean_dec_ref(x_37);
 x_46 = lean_box(0);
}
x_47 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_47, 0, x_45);
if (lean_is_scalar(x_46)) {
 x_48 = lean_alloc_ctor(1, 1, 0);
} else {
 x_48 = x_46;
}
lean_ctor_set(x_48, 0, x_47);
return x_48;
}
}
}
else
{
lean_object* x_49; 
x_49 = lean_ctor_get(x_17, 1);
lean_inc(x_49);
if (lean_obj_tag(x_49) == 0)
{
lean_object* x_50; 
lean_dec(x_17);
lean_dec(x_5);
x_50 = lean_box(0);
return x_50;
}
else
{
lean_object* x_51; 
x_51 = lean_ctor_get(x_49, 1);
lean_inc(x_51);
if (lean_obj_tag(x_51) == 0)
{
lean_object* x_52; lean_object* x_53; lean_object* x_54; lean_object* x_55; uint8_t x_56; 
x_52 = lean_ctor_get(x_5, 0);
lean_inc(x_52);
lean_dec(x_5);
x_53 = lean_ctor_get(x_17, 0);
lean_inc(x_53);
lean_dec(x_17);
x_54 = lean_ctor_get(x_49, 0);
lean_inc(x_54);
lean_dec(x_49);
x_55 = lean_box(4);
x_56 = l_CakeML_tokcheck(x_52, x_55);
if (x_56 == 0)
{
lean_object* x_57; 
lean_dec(x_54);
lean_dec(x_53);
x_57 = lean_box(0);
return x_57;
}
else
{
lean_object* x_58; uint8_t x_59; 
x_58 = lean_box(5);
x_59 = l_CakeML_tokcheck(x_54, x_58);
if (x_59 == 0)
{
lean_object* x_60; 
lean_dec(x_53);
x_60 = lean_box(0);
return x_60;
}
else
{
x_1 = x_9;
x_2 = x_53;
goto _start;
}
}
}
else
{
lean_object* x_62; 
x_62 = lean_ctor_get(x_51, 1);
lean_inc(x_62);
if (lean_obj_tag(x_62) == 0)
{
lean_object* x_63; lean_object* x_64; lean_object* x_65; uint8_t x_66; 
x_63 = lean_ctor_get(x_5, 0);
lean_inc(x_63);
lean_dec(x_5);
x_64 = lean_ctor_get(x_17, 0);
lean_inc(x_64);
lean_dec(x_17);
x_65 = lean_ctor_get(x_49, 0);
lean_inc(x_65);
lean_dec(x_49);
x_66 = !lean_is_exclusive(x_51);
if (x_66 == 0)
{
lean_object* x_67; lean_object* x_68; lean_object* x_69; uint8_t x_70; 
x_67 = lean_ctor_get(x_51, 0);
x_68 = lean_ctor_get(x_51, 1);
lean_dec(x_68);
x_69 = lean_box(4);
x_70 = l_CakeML_tokcheck(x_63, x_69);
if (x_70 == 0)
{
lean_object* x_71; 
lean_free_object(x_51);
lean_dec(x_67);
lean_dec(x_65);
lean_dec(x_64);
x_71 = lean_box(0);
return x_71;
}
else
{
lean_object* x_72; uint8_t x_73; 
x_72 = lean_box(5);
x_73 = l_CakeML_tokcheck(x_65, x_72);
if (x_73 == 0)
{
lean_object* x_74; 
lean_free_object(x_51);
lean_dec(x_67);
lean_dec(x_64);
x_74 = lean_box(0);
return x_74;
}
else
{
lean_object* x_75; 
x_75 = l_CakeML_ptree__Typelist2(x_64);
if (lean_obj_tag(x_75) == 0)
{
lean_object* x_76; 
lean_free_object(x_51);
lean_dec(x_67);
x_76 = lean_box(0);
return x_76;
}
else
{
lean_object* x_77; lean_object* x_78; 
x_77 = lean_ctor_get(x_75, 0);
lean_inc(x_77);
lean_dec(x_75);
x_78 = l_CakeML_ptree__Tyop(x_67);
if (lean_obj_tag(x_78) == 0)
{
lean_object* x_79; 
lean_dec(x_77);
lean_free_object(x_51);
x_79 = lean_box(0);
return x_79;
}
else
{
uint8_t x_80; 
x_80 = !lean_is_exclusive(x_78);
if (x_80 == 0)
{
lean_object* x_81; 
x_81 = lean_ctor_get(x_78, 0);
lean_ctor_set_tag(x_51, 3);
lean_ctor_set(x_51, 1, x_81);
lean_ctor_set(x_51, 0, x_77);
lean_ctor_set(x_78, 0, x_51);
return x_78;
}
else
{
lean_object* x_82; lean_object* x_83; 
x_82 = lean_ctor_get(x_78, 0);
lean_inc(x_82);
lean_dec(x_78);
lean_ctor_set_tag(x_51, 3);
lean_ctor_set(x_51, 1, x_82);
lean_ctor_set(x_51, 0, x_77);
x_83 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_83, 0, x_51);
return x_83;
}
}
}
}
}
}
else
{
lean_object* x_84; lean_object* x_85; uint8_t x_86; 
x_84 = lean_ctor_get(x_51, 0);
lean_inc(x_84);
lean_dec(x_51);
x_85 = lean_box(4);
x_86 = l_CakeML_tokcheck(x_63, x_85);
if (x_86 == 0)
{
lean_object* x_87; 
lean_dec(x_84);
lean_dec(x_65);
lean_dec(x_64);
x_87 = lean_box(0);
return x_87;
}
else
{
lean_object* x_88; uint8_t x_89; 
x_88 = lean_box(5);
x_89 = l_CakeML_tokcheck(x_65, x_88);
if (x_89 == 0)
{
lean_object* x_90; 
lean_dec(x_84);
lean_dec(x_64);
x_90 = lean_box(0);
return x_90;
}
else
{
lean_object* x_91; 
x_91 = l_CakeML_ptree__Typelist2(x_64);
if (lean_obj_tag(x_91) == 0)
{
lean_object* x_92; 
lean_dec(x_84);
x_92 = lean_box(0);
return x_92;
}
else
{
lean_object* x_93; lean_object* x_94; 
x_93 = lean_ctor_get(x_91, 0);
lean_inc(x_93);
lean_dec(x_91);
x_94 = l_CakeML_ptree__Tyop(x_84);
if (lean_obj_tag(x_94) == 0)
{
lean_object* x_95; 
lean_dec(x_93);
x_95 = lean_box(0);
return x_95;
}
else
{
lean_object* x_96; lean_object* x_97; lean_object* x_98; lean_object* x_99; 
x_96 = lean_ctor_get(x_94, 0);
lean_inc(x_96);
if (lean_is_exclusive(x_94)) {
 lean_ctor_release(x_94, 0);
 x_97 = x_94;
} else {
 lean_dec_ref(x_94);
 x_97 = lean_box(0);
}
x_98 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_98, 0, x_93);
lean_ctor_set(x_98, 1, x_96);
if (lean_is_scalar(x_97)) {
 x_99 = lean_alloc_ctor(1, 1, 0);
} else {
 x_99 = x_97;
}
lean_ctor_set(x_99, 0, x_98);
return x_99;
}
}
}
}
}
}
else
{
lean_object* x_100; 
lean_dec(x_62);
lean_dec(x_51);
lean_dec(x_49);
lean_dec(x_17);
lean_dec(x_5);
x_100 = lean_box(0);
return x_100;
}
}
}
}
}
}
}
else
{
if (lean_obj_tag(x_5) == 0)
{
lean_object* x_101; 
x_101 = lean_box(0);
return x_101;
}
else
{
lean_object* x_102; 
x_102 = lean_ctor_get(x_5, 1);
lean_inc(x_102);
if (lean_obj_tag(x_102) == 0)
{
lean_object* x_103; uint8_t x_104; 
x_103 = lean_ctor_get(x_5, 0);
lean_inc(x_103);
lean_dec(x_5);
x_104 = 5;
x_1 = x_104;
x_2 = x_103;
goto _start;
}
else
{
lean_object* x_106; 
x_106 = lean_ctor_get(x_102, 1);
lean_inc(x_106);
if (lean_obj_tag(x_106) == 0)
{
uint8_t x_107; 
x_107 = !lean_is_exclusive(x_5);
if (x_107 == 0)
{
lean_object* x_108; lean_object* x_109; uint8_t x_110; 
x_108 = lean_ctor_get(x_5, 0);
x_109 = lean_ctor_get(x_5, 1);
lean_dec(x_109);
x_110 = !lean_is_exclusive(x_102);
if (x_110 == 0)
{
lean_object* x_111; lean_object* x_112; lean_object* x_113; 
x_111 = lean_ctor_get(x_102, 0);
x_112 = lean_ctor_get(x_102, 1);
lean_dec(x_112);
x_113 = l_CakeML_ptree__Type(x_11, x_108);
if (lean_obj_tag(x_113) == 0)
{
lean_object* x_114; 
lean_free_object(x_102);
lean_dec(x_111);
lean_free_object(x_5);
x_114 = lean_box(0);
return x_114;
}
else
{
lean_object* x_115; lean_object* x_116; 
x_115 = lean_ctor_get(x_113, 0);
lean_inc(x_115);
lean_dec(x_113);
x_116 = l_CakeML_ptree__Tyop(x_111);
if (lean_obj_tag(x_116) == 0)
{
lean_object* x_117; 
lean_dec(x_115);
lean_free_object(x_102);
lean_free_object(x_5);
x_117 = lean_box(0);
return x_117;
}
else
{
uint8_t x_118; 
x_118 = !lean_is_exclusive(x_116);
if (x_118 == 0)
{
lean_object* x_119; lean_object* x_120; 
x_119 = lean_ctor_get(x_116, 0);
x_120 = lean_box(0);
lean_ctor_set(x_102, 1, x_120);
lean_ctor_set(x_102, 0, x_115);
lean_ctor_set_tag(x_5, 3);
lean_ctor_set(x_5, 1, x_119);
lean_ctor_set(x_5, 0, x_102);
lean_ctor_set(x_116, 0, x_5);
return x_116;
}
else
{
lean_object* x_121; lean_object* x_122; lean_object* x_123; 
x_121 = lean_ctor_get(x_116, 0);
lean_inc(x_121);
lean_dec(x_116);
x_122 = lean_box(0);
lean_ctor_set(x_102, 1, x_122);
lean_ctor_set(x_102, 0, x_115);
lean_ctor_set_tag(x_5, 3);
lean_ctor_set(x_5, 1, x_121);
lean_ctor_set(x_5, 0, x_102);
x_123 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_123, 0, x_5);
return x_123;
}
}
}
}
else
{
lean_object* x_124; lean_object* x_125; 
x_124 = lean_ctor_get(x_102, 0);
lean_inc(x_124);
lean_dec(x_102);
x_125 = l_CakeML_ptree__Type(x_11, x_108);
if (lean_obj_tag(x_125) == 0)
{
lean_object* x_126; 
lean_dec(x_124);
lean_free_object(x_5);
x_126 = lean_box(0);
return x_126;
}
else
{
lean_object* x_127; lean_object* x_128; 
x_127 = lean_ctor_get(x_125, 0);
lean_inc(x_127);
lean_dec(x_125);
x_128 = l_CakeML_ptree__Tyop(x_124);
if (lean_obj_tag(x_128) == 0)
{
lean_object* x_129; 
lean_dec(x_127);
lean_free_object(x_5);
x_129 = lean_box(0);
return x_129;
}
else
{
lean_object* x_130; lean_object* x_131; lean_object* x_132; lean_object* x_133; lean_object* x_134; 
x_130 = lean_ctor_get(x_128, 0);
lean_inc(x_130);
if (lean_is_exclusive(x_128)) {
 lean_ctor_release(x_128, 0);
 x_131 = x_128;
} else {
 lean_dec_ref(x_128);
 x_131 = lean_box(0);
}
x_132 = lean_box(0);
x_133 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_133, 0, x_127);
lean_ctor_set(x_133, 1, x_132);
lean_ctor_set_tag(x_5, 3);
lean_ctor_set(x_5, 1, x_130);
lean_ctor_set(x_5, 0, x_133);
if (lean_is_scalar(x_131)) {
 x_134 = lean_alloc_ctor(1, 1, 0);
} else {
 x_134 = x_131;
}
lean_ctor_set(x_134, 0, x_5);
return x_134;
}
}
}
}
else
{
lean_object* x_135; lean_object* x_136; lean_object* x_137; lean_object* x_138; 
x_135 = lean_ctor_get(x_5, 0);
lean_inc(x_135);
lean_dec(x_5);
x_136 = lean_ctor_get(x_102, 0);
lean_inc(x_136);
if (lean_is_exclusive(x_102)) {
 lean_ctor_release(x_102, 0);
 lean_ctor_release(x_102, 1);
 x_137 = x_102;
} else {
 lean_dec_ref(x_102);
 x_137 = lean_box(0);
}
x_138 = l_CakeML_ptree__Type(x_11, x_135);
if (lean_obj_tag(x_138) == 0)
{
lean_object* x_139; 
lean_dec(x_137);
lean_dec(x_136);
x_139 = lean_box(0);
return x_139;
}
else
{
lean_object* x_140; lean_object* x_141; 
x_140 = lean_ctor_get(x_138, 0);
lean_inc(x_140);
lean_dec(x_138);
x_141 = l_CakeML_ptree__Tyop(x_136);
if (lean_obj_tag(x_141) == 0)
{
lean_object* x_142; 
lean_dec(x_140);
lean_dec(x_137);
x_142 = lean_box(0);
return x_142;
}
else
{
lean_object* x_143; lean_object* x_144; lean_object* x_145; lean_object* x_146; lean_object* x_147; lean_object* x_148; 
x_143 = lean_ctor_get(x_141, 0);
lean_inc(x_143);
if (lean_is_exclusive(x_141)) {
 lean_ctor_release(x_141, 0);
 x_144 = x_141;
} else {
 lean_dec_ref(x_141);
 x_144 = lean_box(0);
}
x_145 = lean_box(0);
if (lean_is_scalar(x_137)) {
 x_146 = lean_alloc_ctor(1, 2, 0);
} else {
 x_146 = x_137;
}
lean_ctor_set(x_146, 0, x_140);
lean_ctor_set(x_146, 1, x_145);
x_147 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_147, 0, x_146);
lean_ctor_set(x_147, 1, x_143);
if (lean_is_scalar(x_144)) {
 x_148 = lean_alloc_ctor(1, 1, 0);
} else {
 x_148 = x_144;
}
lean_ctor_set(x_148, 0, x_147);
return x_148;
}
}
}
}
else
{
lean_object* x_149; 
lean_dec(x_106);
lean_dec(x_102);
lean_dec(x_5);
x_149 = lean_box(0);
return x_149;
}
}
}
}
}
else
{
if (lean_obj_tag(x_5) == 0)
{
lean_object* x_150; 
x_150 = lean_box(0);
return x_150;
}
else
{
lean_object* x_151; 
x_151 = lean_ctor_get(x_5, 1);
lean_inc(x_151);
if (lean_obj_tag(x_151) == 0)
{
lean_object* x_152; lean_object* x_153; 
x_152 = lean_ctor_get(x_5, 0);
lean_inc(x_152);
lean_dec(x_5);
x_153 = l_CakeML_ptree__PType(x_152);
if (lean_obj_tag(x_153) == 0)
{
lean_object* x_154; 
x_154 = lean_box(0);
return x_154;
}
else
{
lean_object* x_155; lean_object* x_156; 
x_155 = lean_ctor_get(x_153, 0);
lean_inc(x_155);
lean_dec(x_153);
x_156 = l_CakeML_tuplify(x_155);
return x_156;
}
}
else
{
lean_object* x_157; 
x_157 = lean_ctor_get(x_151, 1);
lean_inc(x_157);
if (lean_obj_tag(x_157) == 0)
{
lean_object* x_158; 
lean_dec(x_151);
lean_dec(x_5);
x_158 = lean_box(0);
return x_158;
}
else
{
lean_object* x_159; 
x_159 = lean_ctor_get(x_157, 1);
lean_inc(x_159);
if (lean_obj_tag(x_159) == 0)
{
lean_object* x_160; lean_object* x_161; uint8_t x_162; 
x_160 = lean_ctor_get(x_5, 0);
lean_inc(x_160);
lean_dec(x_5);
x_161 = lean_ctor_get(x_151, 0);
lean_inc(x_161);
lean_dec(x_151);
x_162 = !lean_is_exclusive(x_157);
if (x_162 == 0)
{
lean_object* x_163; lean_object* x_164; lean_object* x_165; uint8_t x_166; 
x_163 = lean_ctor_get(x_157, 0);
x_164 = lean_ctor_get(x_157, 1);
lean_dec(x_164);
x_165 = lean_box(8);
x_166 = l_CakeML_tokcheck(x_161, x_165);
if (x_166 == 0)
{
lean_object* x_167; 
lean_free_object(x_157);
lean_dec(x_163);
lean_dec(x_160);
x_167 = lean_box(0);
return x_167;
}
else
{
lean_object* x_168; 
x_168 = l_CakeML_ptree__PType(x_160);
if (lean_obj_tag(x_168) == 0)
{
lean_object* x_169; 
lean_free_object(x_157);
lean_dec(x_163);
x_169 = lean_box(0);
return x_169;
}
else
{
lean_object* x_170; lean_object* x_171; 
x_170 = lean_ctor_get(x_168, 0);
lean_inc(x_170);
lean_dec(x_168);
x_171 = l_CakeML_tuplify(x_170);
if (lean_obj_tag(x_171) == 0)
{
lean_object* x_172; 
lean_free_object(x_157);
lean_dec(x_163);
x_172 = lean_box(0);
return x_172;
}
else
{
lean_object* x_173; lean_object* x_174; 
x_173 = lean_ctor_get(x_171, 0);
lean_inc(x_173);
lean_dec(x_171);
x_174 = l_CakeML_ptree__Type(x_9, x_163);
if (lean_obj_tag(x_174) == 0)
{
lean_object* x_175; 
lean_dec(x_173);
lean_free_object(x_157);
x_175 = lean_box(0);
return x_175;
}
else
{
uint8_t x_176; 
x_176 = !lean_is_exclusive(x_174);
if (x_176 == 0)
{
lean_object* x_177; 
x_177 = lean_ctor_get(x_174, 0);
lean_ctor_set(x_157, 1, x_177);
lean_ctor_set(x_157, 0, x_173);
lean_ctor_set(x_174, 0, x_157);
return x_174;
}
else
{
lean_object* x_178; lean_object* x_179; 
x_178 = lean_ctor_get(x_174, 0);
lean_inc(x_178);
lean_dec(x_174);
lean_ctor_set(x_157, 1, x_178);
lean_ctor_set(x_157, 0, x_173);
x_179 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_179, 0, x_157);
return x_179;
}
}
}
}
}
}
else
{
lean_object* x_180; lean_object* x_181; uint8_t x_182; 
x_180 = lean_ctor_get(x_157, 0);
lean_inc(x_180);
lean_dec(x_157);
x_181 = lean_box(8);
x_182 = l_CakeML_tokcheck(x_161, x_181);
if (x_182 == 0)
{
lean_object* x_183; 
lean_dec(x_180);
lean_dec(x_160);
x_183 = lean_box(0);
return x_183;
}
else
{
lean_object* x_184; 
x_184 = l_CakeML_ptree__PType(x_160);
if (lean_obj_tag(x_184) == 0)
{
lean_object* x_185; 
lean_dec(x_180);
x_185 = lean_box(0);
return x_185;
}
else
{
lean_object* x_186; lean_object* x_187; 
x_186 = lean_ctor_get(x_184, 0);
lean_inc(x_186);
lean_dec(x_184);
x_187 = l_CakeML_tuplify(x_186);
if (lean_obj_tag(x_187) == 0)
{
lean_object* x_188; 
lean_dec(x_180);
x_188 = lean_box(0);
return x_188;
}
else
{
lean_object* x_189; lean_object* x_190; 
x_189 = lean_ctor_get(x_187, 0);
lean_inc(x_189);
lean_dec(x_187);
x_190 = l_CakeML_ptree__Type(x_9, x_180);
if (lean_obj_tag(x_190) == 0)
{
lean_object* x_191; 
lean_dec(x_189);
x_191 = lean_box(0);
return x_191;
}
else
{
lean_object* x_192; lean_object* x_193; lean_object* x_194; lean_object* x_195; 
x_192 = lean_ctor_get(x_190, 0);
lean_inc(x_192);
if (lean_is_exclusive(x_190)) {
 lean_ctor_release(x_190, 0);
 x_193 = x_190;
} else {
 lean_dec_ref(x_190);
 x_193 = lean_box(0);
}
x_194 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_194, 0, x_189);
lean_ctor_set(x_194, 1, x_192);
if (lean_is_scalar(x_193)) {
 x_195 = lean_alloc_ctor(1, 1, 0);
} else {
 x_195 = x_193;
}
lean_ctor_set(x_195, 0, x_194);
return x_195;
}
}
}
}
}
}
else
{
lean_object* x_196; 
lean_dec(x_159);
lean_dec(x_157);
lean_dec(x_151);
lean_dec(x_5);
x_196 = lean_box(0);
return x_196;
}
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Typelist2(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 4;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
lean_dec(x_10);
lean_dec(x_4);
x_13 = lean_box(0);
return x_13;
}
else
{
lean_object* x_14; 
x_14 = lean_ctor_get(x_12, 1);
lean_inc(x_14);
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_15; lean_object* x_16; uint8_t x_17; 
x_15 = lean_ctor_get(x_4, 0);
lean_inc(x_15);
lean_dec(x_4);
x_16 = lean_ctor_get(x_10, 0);
lean_inc(x_16);
lean_dec(x_10);
x_17 = !lean_is_exclusive(x_12);
if (x_17 == 0)
{
lean_object* x_18; lean_object* x_19; lean_object* x_20; uint8_t x_21; 
x_18 = lean_ctor_get(x_12, 0);
x_19 = lean_ctor_get(x_12, 1);
lean_dec(x_19);
x_20 = lean_box(7);
x_21 = l_CakeML_tokcheck(x_16, x_20);
if (x_21 == 0)
{
lean_object* x_22; 
lean_free_object(x_12);
lean_dec(x_18);
lean_dec(x_15);
x_22 = lean_box(0);
return x_22;
}
else
{
uint8_t x_23; lean_object* x_24; 
x_23 = 8;
x_24 = l_CakeML_ptree__Type(x_23, x_15);
if (lean_obj_tag(x_24) == 0)
{
lean_object* x_25; 
lean_free_object(x_12);
lean_dec(x_18);
x_25 = lean_box(0);
return x_25;
}
else
{
lean_object* x_26; lean_object* x_27; 
x_26 = lean_ctor_get(x_24, 0);
lean_inc(x_26);
lean_dec(x_24);
x_27 = l_CakeML_ptree__TypeList1(x_18);
if (lean_obj_tag(x_27) == 0)
{
lean_object* x_28; 
lean_dec(x_26);
lean_free_object(x_12);
x_28 = lean_box(0);
return x_28;
}
else
{
uint8_t x_29; 
x_29 = !lean_is_exclusive(x_27);
if (x_29 == 0)
{
lean_object* x_30; 
x_30 = lean_ctor_get(x_27, 0);
lean_ctor_set(x_12, 1, x_30);
lean_ctor_set(x_12, 0, x_26);
lean_ctor_set(x_27, 0, x_12);
return x_27;
}
else
{
lean_object* x_31; lean_object* x_32; 
x_31 = lean_ctor_get(x_27, 0);
lean_inc(x_31);
lean_dec(x_27);
lean_ctor_set(x_12, 1, x_31);
lean_ctor_set(x_12, 0, x_26);
x_32 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_32, 0, x_12);
return x_32;
}
}
}
}
}
else
{
lean_object* x_33; lean_object* x_34; uint8_t x_35; 
x_33 = lean_ctor_get(x_12, 0);
lean_inc(x_33);
lean_dec(x_12);
x_34 = lean_box(7);
x_35 = l_CakeML_tokcheck(x_16, x_34);
if (x_35 == 0)
{
lean_object* x_36; 
lean_dec(x_33);
lean_dec(x_15);
x_36 = lean_box(0);
return x_36;
}
else
{
uint8_t x_37; lean_object* x_38; 
x_37 = 8;
x_38 = l_CakeML_ptree__Type(x_37, x_15);
if (lean_obj_tag(x_38) == 0)
{
lean_object* x_39; 
lean_dec(x_33);
x_39 = lean_box(0);
return x_39;
}
else
{
lean_object* x_40; lean_object* x_41; 
x_40 = lean_ctor_get(x_38, 0);
lean_inc(x_40);
lean_dec(x_38);
x_41 = l_CakeML_ptree__TypeList1(x_33);
if (lean_obj_tag(x_41) == 0)
{
lean_object* x_42; 
lean_dec(x_40);
x_42 = lean_box(0);
return x_42;
}
else
{
lean_object* x_43; lean_object* x_44; lean_object* x_45; lean_object* x_46; 
x_43 = lean_ctor_get(x_41, 0);
lean_inc(x_43);
if (lean_is_exclusive(x_41)) {
 lean_ctor_release(x_41, 0);
 x_44 = x_41;
} else {
 lean_dec_ref(x_41);
 x_44 = lean_box(0);
}
x_45 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_45, 0, x_40);
lean_ctor_set(x_45, 1, x_43);
if (lean_is_scalar(x_44)) {
 x_46 = lean_alloc_ctor(1, 1, 0);
} else {
 x_46 = x_44;
}
lean_ctor_set(x_46, 0, x_45);
return x_46;
}
}
}
}
}
else
{
lean_object* x_47; 
lean_dec(x_14);
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_47 = lean_box(0);
return x_47;
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__TypeList1(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 3;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_4);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; uint8_t x_14; lean_object* x_15; 
x_12 = lean_ctor_get(x_4, 0);
x_13 = lean_ctor_get(x_4, 1);
lean_dec(x_13);
x_14 = 8;
x_15 = l_CakeML_ptree__Type(x_14, x_12);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
lean_free_object(x_4);
x_16 = lean_box(0);
return x_16;
}
else
{
uint8_t x_17; 
x_17 = !lean_is_exclusive(x_15);
if (x_17 == 0)
{
lean_object* x_18; lean_object* x_19; 
x_18 = lean_ctor_get(x_15, 0);
x_19 = lean_box(0);
lean_ctor_set(x_4, 1, x_19);
lean_ctor_set(x_4, 0, x_18);
lean_ctor_set(x_15, 0, x_4);
return x_15;
}
else
{
lean_object* x_20; lean_object* x_21; lean_object* x_22; 
x_20 = lean_ctor_get(x_15, 0);
lean_inc(x_20);
lean_dec(x_15);
x_21 = lean_box(0);
lean_ctor_set(x_4, 1, x_21);
lean_ctor_set(x_4, 0, x_20);
x_22 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_22, 0, x_4);
return x_22;
}
}
}
else
{
lean_object* x_23; uint8_t x_24; lean_object* x_25; 
x_23 = lean_ctor_get(x_4, 0);
lean_inc(x_23);
lean_dec(x_4);
x_24 = 8;
x_25 = l_CakeML_ptree__Type(x_24, x_23);
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_26; 
x_26 = lean_box(0);
return x_26;
}
else
{
lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; 
x_27 = lean_ctor_get(x_25, 0);
lean_inc(x_27);
if (lean_is_exclusive(x_25)) {
 lean_ctor_release(x_25, 0);
 x_28 = x_25;
} else {
 lean_dec_ref(x_25);
 x_28 = lean_box(0);
}
x_29 = lean_box(0);
x_30 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_30, 0, x_27);
lean_ctor_set(x_30, 1, x_29);
if (lean_is_scalar(x_28)) {
 x_31 = lean_alloc_ctor(1, 1, 0);
} else {
 x_31 = x_28;
}
lean_ctor_set(x_31, 0, x_30);
return x_31;
}
}
}
else
{
lean_object* x_32; 
x_32 = lean_ctor_get(x_10, 1);
lean_inc(x_32);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; 
lean_dec(x_10);
lean_dec(x_4);
x_33 = lean_box(0);
return x_33;
}
else
{
lean_object* x_34; 
x_34 = lean_ctor_get(x_32, 1);
lean_inc(x_34);
if (lean_obj_tag(x_34) == 0)
{
lean_object* x_35; lean_object* x_36; uint8_t x_37; 
x_35 = lean_ctor_get(x_4, 0);
lean_inc(x_35);
lean_dec(x_4);
x_36 = lean_ctor_get(x_10, 0);
lean_inc(x_36);
lean_dec(x_10);
x_37 = !lean_is_exclusive(x_32);
if (x_37 == 0)
{
lean_object* x_38; lean_object* x_39; lean_object* x_40; uint8_t x_41; 
x_38 = lean_ctor_get(x_32, 0);
x_39 = lean_ctor_get(x_32, 1);
lean_dec(x_39);
x_40 = lean_box(7);
x_41 = l_CakeML_tokcheck(x_36, x_40);
if (x_41 == 0)
{
lean_object* x_42; 
lean_free_object(x_32);
lean_dec(x_38);
lean_dec(x_35);
x_42 = lean_box(0);
return x_42;
}
else
{
uint8_t x_43; lean_object* x_44; 
x_43 = 8;
x_44 = l_CakeML_ptree__Type(x_43, x_35);
if (lean_obj_tag(x_44) == 0)
{
lean_object* x_45; 
lean_free_object(x_32);
lean_dec(x_38);
x_45 = lean_box(0);
return x_45;
}
else
{
lean_object* x_46; lean_object* x_47; 
x_46 = lean_ctor_get(x_44, 0);
lean_inc(x_46);
lean_dec(x_44);
x_47 = l_CakeML_ptree__TypeList1(x_38);
if (lean_obj_tag(x_47) == 0)
{
lean_object* x_48; 
lean_dec(x_46);
lean_free_object(x_32);
x_48 = lean_box(0);
return x_48;
}
else
{
uint8_t x_49; 
x_49 = !lean_is_exclusive(x_47);
if (x_49 == 0)
{
lean_object* x_50; 
x_50 = lean_ctor_get(x_47, 0);
lean_ctor_set(x_32, 1, x_50);
lean_ctor_set(x_32, 0, x_46);
lean_ctor_set(x_47, 0, x_32);
return x_47;
}
else
{
lean_object* x_51; lean_object* x_52; 
x_51 = lean_ctor_get(x_47, 0);
lean_inc(x_51);
lean_dec(x_47);
lean_ctor_set(x_32, 1, x_51);
lean_ctor_set(x_32, 0, x_46);
x_52 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_52, 0, x_32);
return x_52;
}
}
}
}
}
else
{
lean_object* x_53; lean_object* x_54; uint8_t x_55; 
x_53 = lean_ctor_get(x_32, 0);
lean_inc(x_53);
lean_dec(x_32);
x_54 = lean_box(7);
x_55 = l_CakeML_tokcheck(x_36, x_54);
if (x_55 == 0)
{
lean_object* x_56; 
lean_dec(x_53);
lean_dec(x_35);
x_56 = lean_box(0);
return x_56;
}
else
{
uint8_t x_57; lean_object* x_58; 
x_57 = 8;
x_58 = l_CakeML_ptree__Type(x_57, x_35);
if (lean_obj_tag(x_58) == 0)
{
lean_object* x_59; 
lean_dec(x_53);
x_59 = lean_box(0);
return x_59;
}
else
{
lean_object* x_60; lean_object* x_61; 
x_60 = lean_ctor_get(x_58, 0);
lean_inc(x_60);
lean_dec(x_58);
x_61 = l_CakeML_ptree__TypeList1(x_53);
if (lean_obj_tag(x_61) == 0)
{
lean_object* x_62; 
lean_dec(x_60);
x_62 = lean_box(0);
return x_62;
}
else
{
lean_object* x_63; lean_object* x_64; lean_object* x_65; lean_object* x_66; 
x_63 = lean_ctor_get(x_61, 0);
lean_inc(x_63);
if (lean_is_exclusive(x_61)) {
 lean_ctor_release(x_61, 0);
 x_64 = x_61;
} else {
 lean_dec_ref(x_61);
 x_64 = lean_box(0);
}
x_65 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_65, 0, x_60);
lean_ctor_set(x_65, 1, x_63);
if (lean_is_scalar(x_64)) {
 x_66 = lean_alloc_ctor(1, 1, 0);
} else {
 x_66 = x_64;
}
lean_ctor_set(x_66, 0, x_65);
return x_66;
}
}
}
}
}
else
{
lean_object* x_67; 
lean_dec(x_34);
lean_dec(x_32);
lean_dec(x_10);
lean_dec(x_4);
x_67 = lean_box(0);
return x_67;
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__PType(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 7;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_4);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; uint8_t x_14; lean_object* x_15; 
x_12 = lean_ctor_get(x_4, 0);
x_13 = lean_ctor_get(x_4, 1);
lean_dec(x_13);
x_14 = 6;
x_15 = l_CakeML_ptree__Type(x_14, x_12);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
lean_free_object(x_4);
x_16 = lean_box(0);
return x_16;
}
else
{
uint8_t x_17; 
x_17 = !lean_is_exclusive(x_15);
if (x_17 == 0)
{
lean_object* x_18; lean_object* x_19; 
x_18 = lean_ctor_get(x_15, 0);
x_19 = lean_box(0);
lean_ctor_set(x_4, 1, x_19);
lean_ctor_set(x_4, 0, x_18);
lean_ctor_set(x_15, 0, x_4);
return x_15;
}
else
{
lean_object* x_20; lean_object* x_21; lean_object* x_22; 
x_20 = lean_ctor_get(x_15, 0);
lean_inc(x_20);
lean_dec(x_15);
x_21 = lean_box(0);
lean_ctor_set(x_4, 1, x_21);
lean_ctor_set(x_4, 0, x_20);
x_22 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_22, 0, x_4);
return x_22;
}
}
}
else
{
lean_object* x_23; uint8_t x_24; lean_object* x_25; 
x_23 = lean_ctor_get(x_4, 0);
lean_inc(x_23);
lean_dec(x_4);
x_24 = 6;
x_25 = l_CakeML_ptree__Type(x_24, x_23);
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_26; 
x_26 = lean_box(0);
return x_26;
}
else
{
lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; 
x_27 = lean_ctor_get(x_25, 0);
lean_inc(x_27);
if (lean_is_exclusive(x_25)) {
 lean_ctor_release(x_25, 0);
 x_28 = x_25;
} else {
 lean_dec_ref(x_25);
 x_28 = lean_box(0);
}
x_29 = lean_box(0);
x_30 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_30, 0, x_27);
lean_ctor_set(x_30, 1, x_29);
if (lean_is_scalar(x_28)) {
 x_31 = lean_alloc_ctor(1, 1, 0);
} else {
 x_31 = x_28;
}
lean_ctor_set(x_31, 0, x_30);
return x_31;
}
}
}
else
{
lean_object* x_32; 
x_32 = lean_ctor_get(x_10, 1);
lean_inc(x_32);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; 
lean_dec(x_10);
lean_dec(x_4);
x_33 = lean_box(0);
return x_33;
}
else
{
lean_object* x_34; 
x_34 = lean_ctor_get(x_32, 1);
lean_inc(x_34);
if (lean_obj_tag(x_34) == 0)
{
lean_object* x_35; lean_object* x_36; uint8_t x_37; 
x_35 = lean_ctor_get(x_4, 0);
lean_inc(x_35);
lean_dec(x_4);
x_36 = lean_ctor_get(x_10, 0);
lean_inc(x_36);
lean_dec(x_10);
x_37 = !lean_is_exclusive(x_32);
if (x_37 == 0)
{
lean_object* x_38; lean_object* x_39; lean_object* x_40; uint8_t x_41; 
x_38 = lean_ctor_get(x_32, 0);
x_39 = lean_ctor_get(x_32, 1);
lean_dec(x_39);
x_40 = lean_box(6);
x_41 = l_CakeML_tokcheck(x_36, x_40);
if (x_41 == 0)
{
lean_object* x_42; 
lean_free_object(x_32);
lean_dec(x_38);
lean_dec(x_35);
x_42 = lean_box(0);
return x_42;
}
else
{
uint8_t x_43; lean_object* x_44; 
x_43 = 6;
x_44 = l_CakeML_ptree__Type(x_43, x_35);
if (lean_obj_tag(x_44) == 0)
{
lean_object* x_45; 
lean_free_object(x_32);
lean_dec(x_38);
x_45 = lean_box(0);
return x_45;
}
else
{
lean_object* x_46; lean_object* x_47; 
x_46 = lean_ctor_get(x_44, 0);
lean_inc(x_46);
lean_dec(x_44);
x_47 = l_CakeML_ptree__PType(x_38);
if (lean_obj_tag(x_47) == 0)
{
lean_object* x_48; 
lean_dec(x_46);
lean_free_object(x_32);
x_48 = lean_box(0);
return x_48;
}
else
{
uint8_t x_49; 
x_49 = !lean_is_exclusive(x_47);
if (x_49 == 0)
{
lean_object* x_50; 
x_50 = lean_ctor_get(x_47, 0);
lean_ctor_set(x_32, 1, x_50);
lean_ctor_set(x_32, 0, x_46);
lean_ctor_set(x_47, 0, x_32);
return x_47;
}
else
{
lean_object* x_51; lean_object* x_52; 
x_51 = lean_ctor_get(x_47, 0);
lean_inc(x_51);
lean_dec(x_47);
lean_ctor_set(x_32, 1, x_51);
lean_ctor_set(x_32, 0, x_46);
x_52 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_52, 0, x_32);
return x_52;
}
}
}
}
}
else
{
lean_object* x_53; lean_object* x_54; uint8_t x_55; 
x_53 = lean_ctor_get(x_32, 0);
lean_inc(x_53);
lean_dec(x_32);
x_54 = lean_box(6);
x_55 = l_CakeML_tokcheck(x_36, x_54);
if (x_55 == 0)
{
lean_object* x_56; 
lean_dec(x_53);
lean_dec(x_35);
x_56 = lean_box(0);
return x_56;
}
else
{
uint8_t x_57; lean_object* x_58; 
x_57 = 6;
x_58 = l_CakeML_ptree__Type(x_57, x_35);
if (lean_obj_tag(x_58) == 0)
{
lean_object* x_59; 
lean_dec(x_53);
x_59 = lean_box(0);
return x_59;
}
else
{
lean_object* x_60; lean_object* x_61; 
x_60 = lean_ctor_get(x_58, 0);
lean_inc(x_60);
lean_dec(x_58);
x_61 = l_CakeML_ptree__PType(x_53);
if (lean_obj_tag(x_61) == 0)
{
lean_object* x_62; 
lean_dec(x_60);
x_62 = lean_box(0);
return x_62;
}
else
{
lean_object* x_63; lean_object* x_64; lean_object* x_65; lean_object* x_66; 
x_63 = lean_ctor_get(x_61, 0);
lean_inc(x_63);
if (lean_is_exclusive(x_61)) {
 lean_ctor_release(x_61, 0);
 x_64 = x_61;
} else {
 lean_dec_ref(x_61);
 x_64 = lean_box(0);
}
x_65 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_65, 0, x_60);
lean_ctor_set(x_65, 1, x_63);
if (lean_is_scalar(x_64)) {
 x_66 = lean_alloc_ctor(1, 1, 0);
} else {
 x_66 = x_64;
}
lean_ctor_set(x_66, 0, x_65);
return x_66;
}
}
}
}
}
else
{
lean_object* x_67; 
lean_dec(x_34);
lean_dec(x_32);
lean_dec(x_10);
lean_dec(x_4);
x_67 = lean_box(0);
return x_67;
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Type___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = l_CakeML_ptree__Type(x_3, x_2);
return x_4;
}
}
static lean_object* _init_l_CakeML_ptree__TypeName___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_CakeML_ptree__TyvarN), 1, 0);
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__TypeName(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 11;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_4);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_12 = lean_ctor_get(x_4, 0);
x_13 = lean_ctor_get(x_4, 1);
lean_dec(x_13);
x_14 = l_CakeML_ptree__UQTyop(x_12);
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_15; 
lean_free_object(x_4);
x_15 = lean_box(0);
return x_15;
}
else
{
uint8_t x_16; 
x_16 = !lean_is_exclusive(x_14);
if (x_16 == 0)
{
lean_object* x_17; lean_object* x_18; 
x_17 = lean_ctor_get(x_14, 0);
x_18 = lean_box(0);
lean_ctor_set_tag(x_4, 0);
lean_ctor_set(x_4, 1, x_17);
lean_ctor_set(x_4, 0, x_18);
lean_ctor_set(x_14, 0, x_4);
return x_14;
}
else
{
lean_object* x_19; lean_object* x_20; lean_object* x_21; 
x_19 = lean_ctor_get(x_14, 0);
lean_inc(x_19);
lean_dec(x_14);
x_20 = lean_box(0);
lean_ctor_set_tag(x_4, 0);
lean_ctor_set(x_4, 1, x_19);
lean_ctor_set(x_4, 0, x_20);
x_21 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_21, 0, x_4);
return x_21;
}
}
}
else
{
lean_object* x_22; lean_object* x_23; 
x_22 = lean_ctor_get(x_4, 0);
lean_inc(x_22);
lean_dec(x_4);
x_23 = l_CakeML_ptree__UQTyop(x_22);
if (lean_obj_tag(x_23) == 0)
{
lean_object* x_24; 
x_24 = lean_box(0);
return x_24;
}
else
{
lean_object* x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; 
x_25 = lean_ctor_get(x_23, 0);
lean_inc(x_25);
if (lean_is_exclusive(x_23)) {
 lean_ctor_release(x_23, 0);
 x_26 = x_23;
} else {
 lean_dec_ref(x_23);
 x_26 = lean_box(0);
}
x_27 = lean_box(0);
x_28 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_28, 0, x_27);
lean_ctor_set(x_28, 1, x_25);
if (lean_is_scalar(x_26)) {
 x_29 = lean_alloc_ctor(1, 1, 0);
} else {
 x_29 = x_26;
}
lean_ctor_set(x_29, 0, x_28);
return x_29;
}
}
}
else
{
lean_object* x_30; 
x_30 = lean_ctor_get(x_10, 1);
lean_inc(x_30);
if (lean_obj_tag(x_30) == 0)
{
uint8_t x_31; 
x_31 = !lean_is_exclusive(x_4);
if (x_31 == 0)
{
lean_object* x_32; lean_object* x_33; uint8_t x_34; 
x_32 = lean_ctor_get(x_4, 0);
x_33 = lean_ctor_get(x_4, 1);
lean_dec(x_33);
x_34 = !lean_is_exclusive(x_10);
if (x_34 == 0)
{
lean_object* x_35; lean_object* x_36; lean_object* x_37; 
x_35 = lean_ctor_get(x_10, 0);
x_36 = lean_ctor_get(x_10, 1);
lean_dec(x_36);
x_37 = l_CakeML_destTyvarPT___rarg(x_32);
if (lean_obj_tag(x_37) == 0)
{
lean_object* x_38; 
lean_free_object(x_10);
lean_dec(x_35);
lean_free_object(x_4);
x_38 = lean_box(0);
return x_38;
}
else
{
lean_object* x_39; lean_object* x_40; 
x_39 = lean_ctor_get(x_37, 0);
lean_inc(x_39);
lean_dec(x_37);
x_40 = l_CakeML_ptree__UQTyop(x_35);
if (lean_obj_tag(x_40) == 0)
{
lean_object* x_41; 
lean_dec(x_39);
lean_free_object(x_10);
lean_free_object(x_4);
x_41 = lean_box(0);
return x_41;
}
else
{
uint8_t x_42; 
x_42 = !lean_is_exclusive(x_40);
if (x_42 == 0)
{
lean_object* x_43; lean_object* x_44; 
x_43 = lean_ctor_get(x_40, 0);
x_44 = lean_box(0);
lean_ctor_set(x_10, 1, x_44);
lean_ctor_set(x_10, 0, x_39);
lean_ctor_set_tag(x_4, 0);
lean_ctor_set(x_4, 1, x_43);
lean_ctor_set(x_4, 0, x_10);
lean_ctor_set(x_40, 0, x_4);
return x_40;
}
else
{
lean_object* x_45; lean_object* x_46; lean_object* x_47; 
x_45 = lean_ctor_get(x_40, 0);
lean_inc(x_45);
lean_dec(x_40);
x_46 = lean_box(0);
lean_ctor_set(x_10, 1, x_46);
lean_ctor_set(x_10, 0, x_39);
lean_ctor_set_tag(x_4, 0);
lean_ctor_set(x_4, 1, x_45);
lean_ctor_set(x_4, 0, x_10);
x_47 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_47, 0, x_4);
return x_47;
}
}
}
}
else
{
lean_object* x_48; lean_object* x_49; 
x_48 = lean_ctor_get(x_10, 0);
lean_inc(x_48);
lean_dec(x_10);
x_49 = l_CakeML_destTyvarPT___rarg(x_32);
if (lean_obj_tag(x_49) == 0)
{
lean_object* x_50; 
lean_dec(x_48);
lean_free_object(x_4);
x_50 = lean_box(0);
return x_50;
}
else
{
lean_object* x_51; lean_object* x_52; 
x_51 = lean_ctor_get(x_49, 0);
lean_inc(x_51);
lean_dec(x_49);
x_52 = l_CakeML_ptree__UQTyop(x_48);
if (lean_obj_tag(x_52) == 0)
{
lean_object* x_53; 
lean_dec(x_51);
lean_free_object(x_4);
x_53 = lean_box(0);
return x_53;
}
else
{
lean_object* x_54; lean_object* x_55; lean_object* x_56; lean_object* x_57; lean_object* x_58; 
x_54 = lean_ctor_get(x_52, 0);
lean_inc(x_54);
if (lean_is_exclusive(x_52)) {
 lean_ctor_release(x_52, 0);
 x_55 = x_52;
} else {
 lean_dec_ref(x_52);
 x_55 = lean_box(0);
}
x_56 = lean_box(0);
x_57 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_57, 0, x_51);
lean_ctor_set(x_57, 1, x_56);
lean_ctor_set_tag(x_4, 0);
lean_ctor_set(x_4, 1, x_54);
lean_ctor_set(x_4, 0, x_57);
if (lean_is_scalar(x_55)) {
 x_58 = lean_alloc_ctor(1, 1, 0);
} else {
 x_58 = x_55;
}
lean_ctor_set(x_58, 0, x_4);
return x_58;
}
}
}
}
else
{
lean_object* x_59; lean_object* x_60; lean_object* x_61; lean_object* x_62; 
x_59 = lean_ctor_get(x_4, 0);
lean_inc(x_59);
lean_dec(x_4);
x_60 = lean_ctor_get(x_10, 0);
lean_inc(x_60);
if (lean_is_exclusive(x_10)) {
 lean_ctor_release(x_10, 0);
 lean_ctor_release(x_10, 1);
 x_61 = x_10;
} else {
 lean_dec_ref(x_10);
 x_61 = lean_box(0);
}
x_62 = l_CakeML_destTyvarPT___rarg(x_59);
if (lean_obj_tag(x_62) == 0)
{
lean_object* x_63; 
lean_dec(x_61);
lean_dec(x_60);
x_63 = lean_box(0);
return x_63;
}
else
{
lean_object* x_64; lean_object* x_65; 
x_64 = lean_ctor_get(x_62, 0);
lean_inc(x_64);
lean_dec(x_62);
x_65 = l_CakeML_ptree__UQTyop(x_60);
if (lean_obj_tag(x_65) == 0)
{
lean_object* x_66; 
lean_dec(x_64);
lean_dec(x_61);
x_66 = lean_box(0);
return x_66;
}
else
{
lean_object* x_67; lean_object* x_68; lean_object* x_69; lean_object* x_70; lean_object* x_71; lean_object* x_72; 
x_67 = lean_ctor_get(x_65, 0);
lean_inc(x_67);
if (lean_is_exclusive(x_65)) {
 lean_ctor_release(x_65, 0);
 x_68 = x_65;
} else {
 lean_dec_ref(x_65);
 x_68 = lean_box(0);
}
x_69 = lean_box(0);
if (lean_is_scalar(x_61)) {
 x_70 = lean_alloc_ctor(1, 2, 0);
} else {
 x_70 = x_61;
}
lean_ctor_set(x_70, 0, x_64);
lean_ctor_set(x_70, 1, x_69);
x_71 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_71, 0, x_70);
lean_ctor_set(x_71, 1, x_67);
if (lean_is_scalar(x_68)) {
 x_72 = lean_alloc_ctor(1, 1, 0);
} else {
 x_72 = x_68;
}
lean_ctor_set(x_72, 0, x_71);
return x_72;
}
}
}
}
else
{
lean_object* x_73; 
x_73 = lean_ctor_get(x_30, 1);
lean_inc(x_73);
if (lean_obj_tag(x_73) == 0)
{
lean_object* x_74; 
lean_dec(x_30);
lean_dec(x_10);
lean_dec(x_4);
x_74 = lean_box(0);
return x_74;
}
else
{
lean_object* x_75; 
x_75 = lean_ctor_get(x_73, 1);
lean_inc(x_75);
if (lean_obj_tag(x_75) == 0)
{
lean_object* x_76; lean_object* x_77; lean_object* x_78; uint8_t x_79; 
x_76 = lean_ctor_get(x_4, 0);
lean_inc(x_76);
lean_dec(x_4);
x_77 = lean_ctor_get(x_10, 0);
lean_inc(x_77);
lean_dec(x_10);
x_78 = lean_ctor_get(x_30, 0);
lean_inc(x_78);
lean_dec(x_30);
x_79 = !lean_is_exclusive(x_73);
if (x_79 == 0)
{
lean_object* x_80; lean_object* x_81; lean_object* x_82; uint8_t x_83; 
x_80 = lean_ctor_get(x_73, 0);
x_81 = lean_ctor_get(x_73, 1);
lean_dec(x_81);
x_82 = lean_box(4);
x_83 = l_CakeML_tokcheck(x_76, x_82);
if (x_83 == 0)
{
lean_object* x_84; 
lean_free_object(x_73);
lean_dec(x_80);
lean_dec(x_78);
lean_dec(x_77);
x_84 = lean_box(0);
return x_84;
}
else
{
lean_object* x_85; uint8_t x_86; 
x_85 = lean_box(5);
x_86 = l_CakeML_tokcheck(x_78, x_85);
if (x_86 == 0)
{
lean_object* x_87; 
lean_free_object(x_73);
lean_dec(x_80);
lean_dec(x_77);
x_87 = lean_box(0);
return x_87;
}
else
{
uint8_t x_88; lean_object* x_89; lean_object* x_90; lean_object* x_91; 
x_88 = 12;
x_89 = lean_box(7);
x_90 = l_CakeML_ptree__TypeName___closed__1;
x_91 = l_CakeML_ptree__linfix___rarg(x_88, x_89, x_90, x_77);
if (lean_obj_tag(x_91) == 0)
{
lean_object* x_92; 
lean_free_object(x_73);
lean_dec(x_80);
x_92 = lean_box(0);
return x_92;
}
else
{
lean_object* x_93; lean_object* x_94; 
x_93 = lean_ctor_get(x_91, 0);
lean_inc(x_93);
lean_dec(x_91);
x_94 = l_CakeML_ptree__UQTyop(x_80);
if (lean_obj_tag(x_94) == 0)
{
lean_object* x_95; 
lean_dec(x_93);
lean_free_object(x_73);
x_95 = lean_box(0);
return x_95;
}
else
{
uint8_t x_96; 
x_96 = !lean_is_exclusive(x_94);
if (x_96 == 0)
{
lean_object* x_97; 
x_97 = lean_ctor_get(x_94, 0);
lean_ctor_set_tag(x_73, 0);
lean_ctor_set(x_73, 1, x_97);
lean_ctor_set(x_73, 0, x_93);
lean_ctor_set(x_94, 0, x_73);
return x_94;
}
else
{
lean_object* x_98; lean_object* x_99; 
x_98 = lean_ctor_get(x_94, 0);
lean_inc(x_98);
lean_dec(x_94);
lean_ctor_set_tag(x_73, 0);
lean_ctor_set(x_73, 1, x_98);
lean_ctor_set(x_73, 0, x_93);
x_99 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_99, 0, x_73);
return x_99;
}
}
}
}
}
}
else
{
lean_object* x_100; lean_object* x_101; uint8_t x_102; 
x_100 = lean_ctor_get(x_73, 0);
lean_inc(x_100);
lean_dec(x_73);
x_101 = lean_box(4);
x_102 = l_CakeML_tokcheck(x_76, x_101);
if (x_102 == 0)
{
lean_object* x_103; 
lean_dec(x_100);
lean_dec(x_78);
lean_dec(x_77);
x_103 = lean_box(0);
return x_103;
}
else
{
lean_object* x_104; uint8_t x_105; 
x_104 = lean_box(5);
x_105 = l_CakeML_tokcheck(x_78, x_104);
if (x_105 == 0)
{
lean_object* x_106; 
lean_dec(x_100);
lean_dec(x_77);
x_106 = lean_box(0);
return x_106;
}
else
{
uint8_t x_107; lean_object* x_108; lean_object* x_109; lean_object* x_110; 
x_107 = 12;
x_108 = lean_box(7);
x_109 = l_CakeML_ptree__TypeName___closed__1;
x_110 = l_CakeML_ptree__linfix___rarg(x_107, x_108, x_109, x_77);
if (lean_obj_tag(x_110) == 0)
{
lean_object* x_111; 
lean_dec(x_100);
x_111 = lean_box(0);
return x_111;
}
else
{
lean_object* x_112; lean_object* x_113; 
x_112 = lean_ctor_get(x_110, 0);
lean_inc(x_112);
lean_dec(x_110);
x_113 = l_CakeML_ptree__UQTyop(x_100);
if (lean_obj_tag(x_113) == 0)
{
lean_object* x_114; 
lean_dec(x_112);
x_114 = lean_box(0);
return x_114;
}
else
{
lean_object* x_115; lean_object* x_116; lean_object* x_117; lean_object* x_118; 
x_115 = lean_ctor_get(x_113, 0);
lean_inc(x_115);
if (lean_is_exclusive(x_113)) {
 lean_ctor_release(x_113, 0);
 x_116 = x_113;
} else {
 lean_dec_ref(x_113);
 x_116 = lean_box(0);
}
x_117 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_117, 0, x_112);
lean_ctor_set(x_117, 1, x_115);
if (lean_is_scalar(x_116)) {
 x_118 = lean_alloc_ctor(1, 1, 0);
} else {
 x_118 = x_116;
}
lean_ctor_set(x_118, 0, x_117);
return x_118;
}
}
}
}
}
}
else
{
lean_object* x_119; 
lean_dec(x_75);
lean_dec(x_73);
lean_dec(x_30);
lean_dec(x_10);
lean_dec(x_4);
x_119 = lean_box(0);
return x_119;
}
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__UQConstructorName(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 19;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; lean_object* x_12; 
x_11 = lean_ctor_get(x_4, 0);
lean_inc(x_11);
lean_dec(x_4);
x_12 = l_CakeML_destLf___rarg(x_11);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
x_13 = lean_box(0);
return x_13;
}
else
{
lean_object* x_14; lean_object* x_15; 
x_14 = lean_ctor_get(x_12, 0);
lean_inc(x_14);
lean_dec(x_12);
x_15 = l_CakeML_destTOK___rarg(x_14);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
x_16 = lean_box(0);
return x_16;
}
else
{
lean_object* x_17; lean_object* x_18; 
x_17 = lean_ctor_get(x_15, 0);
lean_inc(x_17);
lean_dec(x_15);
x_18 = l_CakeML_destAlphaT(x_17);
return x_18;
}
}
}
else
{
lean_object* x_19; 
lean_dec(x_10);
lean_dec(x_4);
x_19 = lean_box(0);
return x_19;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__ConstructorName(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 20;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; lean_object* x_12; 
x_11 = lean_ctor_get(x_4, 0);
lean_inc(x_11);
lean_dec(x_4);
lean_inc(x_11);
x_12 = l_CakeML_ptree__UQConstructorName(x_11);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
x_13 = l_CakeML_destLf___rarg(x_11);
if (lean_obj_tag(x_13) == 0)
{
lean_object* x_14; 
x_14 = lean_box(0);
return x_14;
}
else
{
lean_object* x_15; lean_object* x_16; 
x_15 = lean_ctor_get(x_13, 0);
lean_inc(x_15);
lean_dec(x_13);
x_16 = l_CakeML_destTOK___rarg(x_15);
if (lean_obj_tag(x_16) == 0)
{
lean_object* x_17; 
x_17 = lean_box(0);
return x_17;
}
else
{
lean_object* x_18; lean_object* x_19; 
x_18 = lean_ctor_get(x_16, 0);
lean_inc(x_18);
lean_dec(x_16);
x_19 = l_CakeML_destLongidT(x_18);
if (lean_obj_tag(x_19) == 0)
{
lean_object* x_20; 
x_20 = lean_box(0);
return x_20;
}
else
{
uint8_t x_21; 
x_21 = !lean_is_exclusive(x_19);
if (x_21 == 0)
{
lean_object* x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; 
x_22 = lean_ctor_get(x_19, 0);
x_23 = lean_ctor_get(x_22, 0);
lean_inc(x_23);
x_24 = lean_ctor_get(x_22, 1);
lean_inc(x_24);
lean_dec(x_22);
x_25 = l_CakeML_Long__Short(x_23, x_24);
lean_ctor_set(x_19, 0, x_25);
return x_19;
}
else
{
lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; 
x_26 = lean_ctor_get(x_19, 0);
lean_inc(x_26);
lean_dec(x_19);
x_27 = lean_ctor_get(x_26, 0);
lean_inc(x_27);
x_28 = lean_ctor_get(x_26, 1);
lean_inc(x_28);
lean_dec(x_26);
x_29 = l_CakeML_Long__Short(x_27, x_28);
x_30 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_30, 0, x_29);
return x_30;
}
}
}
}
}
else
{
uint8_t x_31; 
lean_dec(x_11);
x_31 = !lean_is_exclusive(x_12);
if (x_31 == 0)
{
lean_object* x_32; lean_object* x_33; 
x_32 = lean_ctor_get(x_12, 0);
x_33 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_33, 0, x_32);
lean_ctor_set(x_12, 0, x_33);
return x_12;
}
else
{
lean_object* x_34; lean_object* x_35; lean_object* x_36; 
x_34 = lean_ctor_get(x_12, 0);
lean_inc(x_34);
lean_dec(x_12);
x_35 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_35, 0, x_34);
x_36 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_36, 0, x_35);
return x_36;
}
}
}
else
{
lean_object* x_37; 
lean_dec(x_10);
lean_dec(x_4);
x_37 = lean_box(0);
return x_37;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_detuplify(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 2)
{
lean_object* x_2; 
x_2 = lean_ctor_get(x_1, 0);
lean_inc(x_2);
lean_dec(x_1);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_box(0);
x_4 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_3);
return x_4;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__PTbase(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 10;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_4);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_12 = lean_ctor_get(x_4, 0);
x_13 = lean_ctor_get(x_4, 1);
lean_dec(x_13);
lean_inc(x_12);
x_14 = l_CakeML_destTyvarPT___rarg(x_12);
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_15; 
x_15 = l_CakeML_ptree__Tyop(x_12);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
lean_free_object(x_4);
x_16 = lean_box(0);
return x_16;
}
else
{
uint8_t x_17; 
x_17 = !lean_is_exclusive(x_15);
if (x_17 == 0)
{
lean_object* x_18; lean_object* x_19; 
x_18 = lean_ctor_get(x_15, 0);
x_19 = lean_box(0);
lean_ctor_set_tag(x_4, 3);
lean_ctor_set(x_4, 1, x_18);
lean_ctor_set(x_4, 0, x_19);
lean_ctor_set(x_15, 0, x_4);
return x_15;
}
else
{
lean_object* x_20; lean_object* x_21; lean_object* x_22; 
x_20 = lean_ctor_get(x_15, 0);
lean_inc(x_20);
lean_dec(x_15);
x_21 = lean_box(0);
lean_ctor_set_tag(x_4, 3);
lean_ctor_set(x_4, 1, x_20);
lean_ctor_set(x_4, 0, x_21);
x_22 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_22, 0, x_4);
return x_22;
}
}
}
else
{
uint8_t x_23; 
lean_free_object(x_4);
lean_dec(x_12);
x_23 = !lean_is_exclusive(x_14);
if (x_23 == 0)
{
lean_object* x_24; lean_object* x_25; 
x_24 = lean_ctor_get(x_14, 0);
x_25 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_25, 0, x_24);
lean_ctor_set(x_14, 0, x_25);
return x_14;
}
else
{
lean_object* x_26; lean_object* x_27; lean_object* x_28; 
x_26 = lean_ctor_get(x_14, 0);
lean_inc(x_26);
lean_dec(x_14);
x_27 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_27, 0, x_26);
x_28 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_28, 0, x_27);
return x_28;
}
}
}
else
{
lean_object* x_29; lean_object* x_30; 
x_29 = lean_ctor_get(x_4, 0);
lean_inc(x_29);
lean_dec(x_4);
lean_inc(x_29);
x_30 = l_CakeML_destTyvarPT___rarg(x_29);
if (lean_obj_tag(x_30) == 0)
{
lean_object* x_31; 
x_31 = l_CakeML_ptree__Tyop(x_29);
if (lean_obj_tag(x_31) == 0)
{
lean_object* x_32; 
x_32 = lean_box(0);
return x_32;
}
else
{
lean_object* x_33; lean_object* x_34; lean_object* x_35; lean_object* x_36; lean_object* x_37; 
x_33 = lean_ctor_get(x_31, 0);
lean_inc(x_33);
if (lean_is_exclusive(x_31)) {
 lean_ctor_release(x_31, 0);
 x_34 = x_31;
} else {
 lean_dec_ref(x_31);
 x_34 = lean_box(0);
}
x_35 = lean_box(0);
x_36 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_36, 0, x_35);
lean_ctor_set(x_36, 1, x_33);
if (lean_is_scalar(x_34)) {
 x_37 = lean_alloc_ctor(1, 1, 0);
} else {
 x_37 = x_34;
}
lean_ctor_set(x_37, 0, x_36);
return x_37;
}
}
else
{
lean_object* x_38; lean_object* x_39; lean_object* x_40; lean_object* x_41; 
lean_dec(x_29);
x_38 = lean_ctor_get(x_30, 0);
lean_inc(x_38);
if (lean_is_exclusive(x_30)) {
 lean_ctor_release(x_30, 0);
 x_39 = x_30;
} else {
 lean_dec_ref(x_30);
 x_39 = lean_box(0);
}
x_40 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_40, 0, x_38);
if (lean_is_scalar(x_39)) {
 x_41 = lean_alloc_ctor(1, 1, 0);
} else {
 x_41 = x_39;
}
lean_ctor_set(x_41, 0, x_40);
return x_41;
}
}
}
else
{
lean_object* x_42; 
x_42 = lean_ctor_get(x_10, 1);
lean_inc(x_42);
if (lean_obj_tag(x_42) == 0)
{
lean_object* x_43; 
lean_dec(x_10);
lean_dec(x_4);
x_43 = lean_box(0);
return x_43;
}
else
{
lean_object* x_44; 
x_44 = lean_ctor_get(x_42, 1);
lean_inc(x_44);
if (lean_obj_tag(x_44) == 0)
{
lean_object* x_45; lean_object* x_46; lean_object* x_47; lean_object* x_48; uint8_t x_49; 
x_45 = lean_ctor_get(x_4, 0);
lean_inc(x_45);
lean_dec(x_4);
x_46 = lean_ctor_get(x_10, 0);
lean_inc(x_46);
lean_dec(x_10);
x_47 = lean_ctor_get(x_42, 0);
lean_inc(x_47);
lean_dec(x_42);
x_48 = lean_box(4);
x_49 = l_CakeML_tokcheck(x_45, x_48);
if (x_49 == 0)
{
lean_object* x_50; 
lean_dec(x_47);
lean_dec(x_46);
x_50 = lean_box(0);
return x_50;
}
else
{
lean_object* x_51; uint8_t x_52; 
x_51 = lean_box(5);
x_52 = l_CakeML_tokcheck(x_47, x_51);
if (x_52 == 0)
{
lean_object* x_53; 
lean_dec(x_46);
x_53 = lean_box(0);
return x_53;
}
else
{
uint8_t x_54; lean_object* x_55; 
x_54 = 8;
x_55 = l_CakeML_ptree__Type(x_54, x_46);
return x_55;
}
}
}
else
{
lean_object* x_56; 
lean_dec(x_44);
lean_dec(x_42);
lean_dec(x_10);
lean_dec(x_4);
x_56 = lean_box(0);
return x_56;
}
}
}
}
}
}
}
}
static lean_object* _init_l_CakeML_ptree__TbaseList___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_box(0);
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__TbaseList(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 9;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = l_CakeML_ptree__TbaseList___closed__1;
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; uint8_t x_14; 
x_13 = lean_ctor_get(x_4, 0);
lean_inc(x_13);
lean_dec(x_4);
x_14 = !lean_is_exclusive(x_10);
if (x_14 == 0)
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; 
x_15 = lean_ctor_get(x_10, 0);
x_16 = lean_ctor_get(x_10, 1);
lean_dec(x_16);
x_17 = l_CakeML_ptree__PTbase(x_13);
if (lean_obj_tag(x_17) == 0)
{
lean_object* x_18; 
lean_free_object(x_10);
lean_dec(x_15);
x_18 = lean_box(0);
return x_18;
}
else
{
lean_object* x_19; lean_object* x_20; 
x_19 = lean_ctor_get(x_17, 0);
lean_inc(x_19);
lean_dec(x_17);
x_20 = l_CakeML_ptree__TbaseList(x_15);
if (lean_obj_tag(x_20) == 0)
{
lean_object* x_21; 
lean_dec(x_19);
lean_free_object(x_10);
x_21 = lean_box(0);
return x_21;
}
else
{
uint8_t x_22; 
x_22 = !lean_is_exclusive(x_20);
if (x_22 == 0)
{
lean_object* x_23; 
x_23 = lean_ctor_get(x_20, 0);
lean_ctor_set(x_10, 1, x_23);
lean_ctor_set(x_10, 0, x_19);
lean_ctor_set(x_20, 0, x_10);
return x_20;
}
else
{
lean_object* x_24; lean_object* x_25; 
x_24 = lean_ctor_get(x_20, 0);
lean_inc(x_24);
lean_dec(x_20);
lean_ctor_set(x_10, 1, x_24);
lean_ctor_set(x_10, 0, x_19);
x_25 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_25, 0, x_10);
return x_25;
}
}
}
}
else
{
lean_object* x_26; lean_object* x_27; 
x_26 = lean_ctor_get(x_10, 0);
lean_inc(x_26);
lean_dec(x_10);
x_27 = l_CakeML_ptree__PTbase(x_13);
if (lean_obj_tag(x_27) == 0)
{
lean_object* x_28; 
lean_dec(x_26);
x_28 = lean_box(0);
return x_28;
}
else
{
lean_object* x_29; lean_object* x_30; 
x_29 = lean_ctor_get(x_27, 0);
lean_inc(x_29);
lean_dec(x_27);
x_30 = l_CakeML_ptree__TbaseList(x_26);
if (lean_obj_tag(x_30) == 0)
{
lean_object* x_31; 
lean_dec(x_29);
x_31 = lean_box(0);
return x_31;
}
else
{
lean_object* x_32; lean_object* x_33; lean_object* x_34; lean_object* x_35; 
x_32 = lean_ctor_get(x_30, 0);
lean_inc(x_32);
if (lean_is_exclusive(x_30)) {
 lean_ctor_release(x_30, 0);
 x_33 = x_30;
} else {
 lean_dec_ref(x_30);
 x_33 = lean_box(0);
}
x_34 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_34, 0, x_29);
lean_ctor_set(x_34, 1, x_32);
if (lean_is_scalar(x_33)) {
 x_35 = lean_alloc_ctor(1, 1, 0);
} else {
 x_35 = x_33;
}
lean_ctor_set(x_35, 0, x_34);
return x_35;
}
}
}
}
else
{
lean_object* x_36; 
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_36 = lean_box(0);
return x_36;
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Dconstructor___lambda__1(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
x_4 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_4, 0, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Dconstructor(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 13;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; lean_object* x_11; lean_object* x_12; 
x_10 = lean_ctor_get(x_4, 0);
lean_inc(x_10);
x_11 = lean_ctor_get(x_4, 1);
lean_inc(x_11);
lean_dec(x_4);
x_12 = l_CakeML_ptree__UQConstructorName(x_10);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
lean_dec(x_11);
x_13 = lean_box(0);
return x_13;
}
else
{
if (lean_obj_tag(x_11) == 0)
{
lean_object* x_14; 
lean_dec(x_12);
x_14 = lean_box(0);
return x_14;
}
else
{
lean_object* x_15; 
x_15 = lean_ctor_get(x_11, 1);
lean_inc(x_15);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; lean_object* x_17; lean_object* x_18; 
x_16 = lean_ctor_get(x_12, 0);
lean_inc(x_16);
lean_dec(x_12);
x_17 = lean_ctor_get(x_11, 0);
lean_inc(x_17);
lean_dec(x_11);
x_18 = l_CakeML_ptree__TbaseList(x_17);
if (lean_obj_tag(x_18) == 0)
{
lean_object* x_19; 
lean_dec(x_16);
x_19 = lean_box(0);
return x_19;
}
else
{
lean_object* x_20; lean_object* x_21; 
x_20 = lean_ctor_get(x_18, 0);
lean_inc(x_20);
lean_dec(x_18);
x_21 = l_CakeML_ptree__Dconstructor___lambda__1(x_16, x_20);
return x_21;
}
}
else
{
lean_object* x_22; 
lean_dec(x_15);
lean_dec(x_12);
lean_dec(x_11);
x_22 = lean_box(0);
return x_22;
}
}
}
}
}
}
}
}
static lean_object* _init_l_CakeML_ptree__DtypeDecl___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_CakeML_ptree__Dconstructor), 1, 0);
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__DtypeDecl(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 15;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
lean_dec(x_10);
lean_dec(x_4);
x_13 = lean_box(0);
return x_13;
}
else
{
lean_object* x_14; 
x_14 = lean_ctor_get(x_12, 1);
lean_inc(x_14);
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_15; lean_object* x_16; uint8_t x_17; 
x_15 = lean_ctor_get(x_4, 0);
lean_inc(x_15);
lean_dec(x_4);
x_16 = lean_ctor_get(x_10, 0);
lean_inc(x_16);
lean_dec(x_10);
x_17 = !lean_is_exclusive(x_12);
if (x_17 == 0)
{
lean_object* x_18; lean_object* x_19; lean_object* x_20; uint8_t x_21; 
x_18 = lean_ctor_get(x_12, 0);
x_19 = lean_ctor_get(x_12, 1);
lean_dec(x_19);
x_20 = lean_box(13);
x_21 = l_CakeML_tokcheck(x_16, x_20);
if (x_21 == 0)
{
lean_object* x_22; 
lean_free_object(x_12);
lean_dec(x_18);
lean_dec(x_15);
x_22 = lean_box(0);
return x_22;
}
else
{
lean_object* x_23; 
x_23 = l_CakeML_ptree__TypeName(x_15);
if (lean_obj_tag(x_23) == 0)
{
lean_object* x_24; 
lean_free_object(x_12);
lean_dec(x_18);
x_24 = lean_box(0);
return x_24;
}
else
{
lean_object* x_25; uint8_t x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; 
x_25 = lean_ctor_get(x_23, 0);
lean_inc(x_25);
lean_dec(x_23);
x_26 = 14;
x_27 = lean_box(19);
x_28 = l_CakeML_ptree__DtypeDecl___closed__1;
x_29 = l_CakeML_ptree__linfix___rarg(x_26, x_27, x_28, x_18);
if (lean_obj_tag(x_29) == 0)
{
lean_object* x_30; 
lean_dec(x_25);
lean_free_object(x_12);
x_30 = lean_box(0);
return x_30;
}
else
{
uint8_t x_31; 
x_31 = !lean_is_exclusive(x_29);
if (x_31 == 0)
{
uint8_t x_32; 
x_32 = !lean_is_exclusive(x_25);
if (x_32 == 0)
{
lean_object* x_33; lean_object* x_34; lean_object* x_35; 
x_33 = lean_ctor_get(x_29, 0);
x_34 = lean_ctor_get(x_25, 0);
x_35 = lean_ctor_get(x_25, 1);
lean_ctor_set(x_25, 1, x_33);
lean_ctor_set(x_25, 0, x_35);
lean_ctor_set_tag(x_12, 0);
lean_ctor_set(x_12, 1, x_25);
lean_ctor_set(x_12, 0, x_34);
lean_ctor_set(x_29, 0, x_12);
return x_29;
}
else
{
lean_object* x_36; lean_object* x_37; lean_object* x_38; lean_object* x_39; 
x_36 = lean_ctor_get(x_29, 0);
x_37 = lean_ctor_get(x_25, 0);
x_38 = lean_ctor_get(x_25, 1);
lean_inc(x_38);
lean_inc(x_37);
lean_dec(x_25);
x_39 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_39, 0, x_38);
lean_ctor_set(x_39, 1, x_36);
lean_ctor_set_tag(x_12, 0);
lean_ctor_set(x_12, 1, x_39);
lean_ctor_set(x_12, 0, x_37);
lean_ctor_set(x_29, 0, x_12);
return x_29;
}
}
else
{
lean_object* x_40; lean_object* x_41; lean_object* x_42; lean_object* x_43; lean_object* x_44; lean_object* x_45; 
x_40 = lean_ctor_get(x_29, 0);
lean_inc(x_40);
lean_dec(x_29);
x_41 = lean_ctor_get(x_25, 0);
lean_inc(x_41);
x_42 = lean_ctor_get(x_25, 1);
lean_inc(x_42);
if (lean_is_exclusive(x_25)) {
 lean_ctor_release(x_25, 0);
 lean_ctor_release(x_25, 1);
 x_43 = x_25;
} else {
 lean_dec_ref(x_25);
 x_43 = lean_box(0);
}
if (lean_is_scalar(x_43)) {
 x_44 = lean_alloc_ctor(0, 2, 0);
} else {
 x_44 = x_43;
}
lean_ctor_set(x_44, 0, x_42);
lean_ctor_set(x_44, 1, x_40);
lean_ctor_set_tag(x_12, 0);
lean_ctor_set(x_12, 1, x_44);
lean_ctor_set(x_12, 0, x_41);
x_45 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_45, 0, x_12);
return x_45;
}
}
}
}
}
else
{
lean_object* x_46; lean_object* x_47; uint8_t x_48; 
x_46 = lean_ctor_get(x_12, 0);
lean_inc(x_46);
lean_dec(x_12);
x_47 = lean_box(13);
x_48 = l_CakeML_tokcheck(x_16, x_47);
if (x_48 == 0)
{
lean_object* x_49; 
lean_dec(x_46);
lean_dec(x_15);
x_49 = lean_box(0);
return x_49;
}
else
{
lean_object* x_50; 
x_50 = l_CakeML_ptree__TypeName(x_15);
if (lean_obj_tag(x_50) == 0)
{
lean_object* x_51; 
lean_dec(x_46);
x_51 = lean_box(0);
return x_51;
}
else
{
lean_object* x_52; uint8_t x_53; lean_object* x_54; lean_object* x_55; lean_object* x_56; 
x_52 = lean_ctor_get(x_50, 0);
lean_inc(x_52);
lean_dec(x_50);
x_53 = 14;
x_54 = lean_box(19);
x_55 = l_CakeML_ptree__DtypeDecl___closed__1;
x_56 = l_CakeML_ptree__linfix___rarg(x_53, x_54, x_55, x_46);
if (lean_obj_tag(x_56) == 0)
{
lean_object* x_57; 
lean_dec(x_52);
x_57 = lean_box(0);
return x_57;
}
else
{
lean_object* x_58; lean_object* x_59; lean_object* x_60; lean_object* x_61; lean_object* x_62; lean_object* x_63; lean_object* x_64; lean_object* x_65; 
x_58 = lean_ctor_get(x_56, 0);
lean_inc(x_58);
if (lean_is_exclusive(x_56)) {
 lean_ctor_release(x_56, 0);
 x_59 = x_56;
} else {
 lean_dec_ref(x_56);
 x_59 = lean_box(0);
}
x_60 = lean_ctor_get(x_52, 0);
lean_inc(x_60);
x_61 = lean_ctor_get(x_52, 1);
lean_inc(x_61);
if (lean_is_exclusive(x_52)) {
 lean_ctor_release(x_52, 0);
 lean_ctor_release(x_52, 1);
 x_62 = x_52;
} else {
 lean_dec_ref(x_52);
 x_62 = lean_box(0);
}
if (lean_is_scalar(x_62)) {
 x_63 = lean_alloc_ctor(0, 2, 0);
} else {
 x_63 = x_62;
}
lean_ctor_set(x_63, 0, x_61);
lean_ctor_set(x_63, 1, x_58);
x_64 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_64, 0, x_60);
lean_ctor_set(x_64, 1, x_63);
if (lean_is_scalar(x_59)) {
 x_65 = lean_alloc_ctor(1, 1, 0);
} else {
 x_65 = x_59;
}
lean_ctor_set(x_65, 0, x_64);
return x_65;
}
}
}
}
}
else
{
lean_object* x_66; 
lean_dec(x_14);
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_66 = lean_box(0);
return x_66;
}
}
}
}
}
}
}
}
static lean_object* _init_l_CakeML_ptree__TypeDec___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_CakeML_ptree__DtypeDecl), 1, 0);
return x_1;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__TypeDec(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 17;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; lean_object* x_14; lean_object* x_15; uint8_t x_16; 
x_13 = lean_ctor_get(x_4, 0);
lean_inc(x_13);
lean_dec(x_4);
x_14 = lean_ctor_get(x_10, 0);
lean_inc(x_14);
lean_dec(x_10);
x_15 = lean_box(25);
x_16 = l_CakeML_tokcheck(x_13, x_15);
if (x_16 == 0)
{
lean_object* x_17; 
lean_dec(x_14);
x_17 = lean_box(0);
return x_17;
}
else
{
uint8_t x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; 
x_18 = 16;
x_19 = lean_box(21);
x_20 = l_CakeML_ptree__TypeDec___closed__1;
x_21 = l_CakeML_ptree__linfix___rarg(x_18, x_19, x_20, x_14);
return x_21;
}
}
else
{
lean_object* x_22; 
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_22 = lean_box(0);
return x_22;
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__TypeAbbrevDec(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 18;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
lean_dec(x_10);
lean_dec(x_4);
x_13 = lean_box(0);
return x_13;
}
else
{
lean_object* x_14; 
x_14 = lean_ctor_get(x_12, 1);
lean_inc(x_14);
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_15; 
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_15 = lean_box(0);
return x_15;
}
else
{
lean_object* x_16; 
x_16 = lean_ctor_get(x_14, 1);
lean_inc(x_16);
if (lean_obj_tag(x_16) == 0)
{
lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; uint8_t x_22; 
x_17 = lean_ctor_get(x_4, 0);
lean_inc(x_17);
lean_dec(x_4);
x_18 = lean_ctor_get(x_10, 0);
lean_inc(x_18);
lean_dec(x_10);
x_19 = lean_ctor_get(x_12, 0);
lean_inc(x_19);
lean_dec(x_12);
x_20 = lean_ctor_get(x_14, 0);
lean_inc(x_20);
lean_dec(x_14);
x_21 = lean_box(50);
x_22 = l_CakeML_tokcheck(x_17, x_21);
if (x_22 == 0)
{
lean_object* x_23; 
lean_dec(x_20);
lean_dec(x_19);
lean_dec(x_18);
x_23 = lean_box(0);
return x_23;
}
else
{
lean_object* x_24; uint8_t x_25; 
x_24 = lean_box(13);
x_25 = l_CakeML_tokcheck(x_19, x_24);
if (x_25 == 0)
{
lean_object* x_26; 
lean_dec(x_20);
lean_dec(x_18);
x_26 = lean_box(0);
return x_26;
}
else
{
lean_object* x_27; 
x_27 = l_CakeML_ptree__TypeName(x_18);
if (lean_obj_tag(x_27) == 0)
{
lean_object* x_28; 
lean_dec(x_20);
x_28 = lean_box(0);
return x_28;
}
else
{
lean_object* x_29; lean_object* x_30; lean_object* x_31; uint8_t x_32; lean_object* x_33; 
x_29 = lean_ctor_get(x_27, 0);
lean_inc(x_29);
lean_dec(x_27);
x_30 = lean_ctor_get(x_29, 0);
lean_inc(x_30);
x_31 = lean_ctor_get(x_29, 1);
lean_inc(x_31);
lean_dec(x_29);
x_32 = 8;
x_33 = l_CakeML_ptree__Type(x_32, x_20);
if (lean_obj_tag(x_33) == 0)
{
lean_object* x_34; 
lean_dec(x_31);
lean_dec(x_30);
x_34 = lean_box(0);
return x_34;
}
else
{
uint8_t x_35; 
x_35 = !lean_is_exclusive(x_33);
if (x_35 == 0)
{
lean_object* x_36; lean_object* x_37; lean_object* x_38; 
x_36 = lean_ctor_get(x_33, 0);
x_37 = l_CakeML_unknown__loc;
x_38 = lean_alloc_ctor(3, 4, 0);
lean_ctor_set(x_38, 0, x_37);
lean_ctor_set(x_38, 1, x_30);
lean_ctor_set(x_38, 2, x_31);
lean_ctor_set(x_38, 3, x_36);
lean_ctor_set(x_33, 0, x_38);
return x_33;
}
else
{
lean_object* x_39; lean_object* x_40; lean_object* x_41; lean_object* x_42; 
x_39 = lean_ctor_get(x_33, 0);
lean_inc(x_39);
lean_dec(x_33);
x_40 = l_CakeML_unknown__loc;
x_41 = lean_alloc_ctor(3, 4, 0);
lean_ctor_set(x_41, 0, x_40);
lean_ctor_set(x_41, 1, x_30);
lean_ctor_set(x_41, 2, x_31);
lean_ctor_set(x_41, 3, x_39);
x_42 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_42, 0, x_41);
return x_42;
}
}
}
}
}
}
else
{
lean_object* x_43; 
lean_dec(x_16);
lean_dec(x_14);
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_43 = lean_box(0);
return x_43;
}
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_singleSymP(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_3; 
lean_dec(x_1);
x_3 = lean_box(0);
return x_3;
}
else
{
lean_object* x_4; 
x_4 = lean_ctor_get(x_2, 1);
lean_inc(x_4);
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_5; lean_object* x_6; 
x_5 = lean_ctor_get(x_2, 0);
lean_inc(x_5);
lean_dec(x_2);
x_6 = l_CakeML_destLf___rarg(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_7; 
lean_dec(x_1);
x_7 = lean_box(0);
return x_7;
}
else
{
lean_object* x_8; lean_object* x_9; 
x_8 = lean_ctor_get(x_6, 0);
lean_inc(x_8);
lean_dec(x_6);
x_9 = l_CakeML_destTOK___rarg(x_8);
if (lean_obj_tag(x_9) == 0)
{
lean_object* x_10; 
lean_dec(x_1);
x_10 = lean_box(0);
return x_10;
}
else
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_9);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; 
x_12 = lean_ctor_get(x_9, 0);
x_13 = l_CakeML_destSymbolT(x_12);
if (lean_obj_tag(x_13) == 0)
{
lean_object* x_14; 
lean_free_object(x_9);
lean_dec(x_1);
x_14 = lean_box(0);
return x_14;
}
else
{
uint8_t x_15; 
x_15 = !lean_is_exclusive(x_13);
if (x_15 == 0)
{
lean_object* x_16; lean_object* x_17; uint8_t x_18; 
x_16 = lean_ctor_get(x_13, 0);
lean_inc(x_16);
x_17 = lean_apply_1(x_1, x_16);
x_18 = lean_unbox(x_17);
lean_dec(x_17);
if (x_18 == 0)
{
lean_object* x_19; 
lean_free_object(x_13);
lean_dec(x_16);
lean_free_object(x_9);
x_19 = lean_box(0);
return x_19;
}
else
{
lean_ctor_set_tag(x_9, 0);
lean_ctor_set(x_9, 0, x_16);
lean_ctor_set(x_13, 0, x_9);
return x_13;
}
}
else
{
lean_object* x_20; lean_object* x_21; uint8_t x_22; 
x_20 = lean_ctor_get(x_13, 0);
lean_inc(x_20);
lean_dec(x_13);
lean_inc(x_20);
x_21 = lean_apply_1(x_1, x_20);
x_22 = lean_unbox(x_21);
lean_dec(x_21);
if (x_22 == 0)
{
lean_object* x_23; 
lean_dec(x_20);
lean_free_object(x_9);
x_23 = lean_box(0);
return x_23;
}
else
{
lean_object* x_24; 
lean_ctor_set_tag(x_9, 0);
lean_ctor_set(x_9, 0, x_20);
x_24 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_24, 0, x_9);
return x_24;
}
}
}
}
else
{
lean_object* x_25; lean_object* x_26; 
x_25 = lean_ctor_get(x_9, 0);
lean_inc(x_25);
lean_dec(x_9);
x_26 = l_CakeML_destSymbolT(x_25);
if (lean_obj_tag(x_26) == 0)
{
lean_object* x_27; 
lean_dec(x_1);
x_27 = lean_box(0);
return x_27;
}
else
{
lean_object* x_28; lean_object* x_29; lean_object* x_30; uint8_t x_31; 
x_28 = lean_ctor_get(x_26, 0);
lean_inc(x_28);
if (lean_is_exclusive(x_26)) {
 lean_ctor_release(x_26, 0);
 x_29 = x_26;
} else {
 lean_dec_ref(x_26);
 x_29 = lean_box(0);
}
lean_inc(x_28);
x_30 = lean_apply_1(x_1, x_28);
x_31 = lean_unbox(x_30);
lean_dec(x_30);
if (x_31 == 0)
{
lean_object* x_32; 
lean_dec(x_29);
lean_dec(x_28);
x_32 = lean_box(0);
return x_32;
}
else
{
lean_object* x_33; lean_object* x_34; 
x_33 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_33, 0, x_28);
if (lean_is_scalar(x_29)) {
 x_34 = lean_alloc_ctor(1, 1, 0);
} else {
 x_34 = x_29;
}
lean_ctor_set(x_34, 0, x_33);
return x_34;
}
}
}
}
}
}
else
{
lean_object* x_35; 
lean_dec(x_4);
lean_dec(x_2);
lean_dec(x_1);
x_35 = lean_box(0);
return x_35;
}
}
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked(":=", 2, 2);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__1;
x_2 = lean_string_data(x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__2;
x_2 = lean_alloc_ctor(64, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_CakeML_ptree__Op___closed__3;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__5() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("o", 1, 1);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__5;
x_2 = lean_string_data(x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__6;
x_2 = lean_alloc_ctor(63, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__8() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_CakeML_ptree__Op___closed__7;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__9() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__6;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__10() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__9;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__2;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__12() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__11;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__13() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_CakeML_validRelSym___boxed), 1, 0);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__14() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_box(13);
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__15() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("=", 1, 1);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__16() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__15;
x_2 = lean_string_data(x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__17() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__16;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__18() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__17;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__19() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_CakeML_validListSym___boxed), 1, 0);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__20() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_CakeML_validAddSym___boxed), 1, 0);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__21() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_box(6);
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__22() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("mod", 3, 3);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__23() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__22;
x_2 = lean_string_data(x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__24() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__23;
x_2 = lean_alloc_ctor(63, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__25() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_CakeML_ptree__Op___closed__24;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__26() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("div", 3, 3);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__27() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__26;
x_2 = lean_string_data(x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__28() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__27;
x_2 = lean_alloc_ctor(63, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__29() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_CakeML_ptree__Op___closed__28;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__30() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_CakeML_validMultSym___boxed), 1, 0);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__31() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__27;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__32() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__31;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__33() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__23;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__34() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__33;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__35() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("*", 1, 1);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__36() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__35;
x_2 = lean_string_data(x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__37() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__36;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Op___closed__38() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__37;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Op(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 31;
x_6 = lean_unbox(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
uint8_t x_8; uint8_t x_9; uint8_t x_10; 
x_8 = 32;
x_9 = lean_unbox(x_3);
x_10 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_9, x_8);
if (x_10 == 0)
{
uint8_t x_11; uint8_t x_12; uint8_t x_13; 
x_11 = 35;
x_12 = lean_unbox(x_3);
x_13 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_12, x_11);
if (x_13 == 0)
{
uint8_t x_14; uint8_t x_15; uint8_t x_16; 
x_14 = 33;
x_15 = lean_unbox(x_3);
x_16 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_15, x_14);
if (x_16 == 0)
{
uint8_t x_17; uint8_t x_18; uint8_t x_19; 
x_17 = 34;
x_18 = lean_unbox(x_3);
lean_dec(x_3);
x_19 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_18, x_17);
if (x_19 == 0)
{
lean_object* x_20; 
lean_dec(x_4);
x_20 = lean_box(0);
return x_20;
}
else
{
lean_object* x_21; uint8_t x_22; 
x_21 = l_CakeML_ptree__Op___closed__4;
lean_inc(x_4);
x_22 = l_CakeML_tokcheckl(x_4, x_21);
if (x_22 == 0)
{
lean_object* x_23; uint8_t x_24; 
x_23 = l_CakeML_ptree__Op___closed__8;
x_24 = l_CakeML_tokcheckl(x_4, x_23);
if (x_24 == 0)
{
lean_object* x_25; 
x_25 = lean_box(0);
return x_25;
}
else
{
lean_object* x_26; 
x_26 = l_CakeML_ptree__Op___closed__10;
return x_26;
}
}
else
{
lean_object* x_27; 
lean_dec(x_4);
x_27 = l_CakeML_ptree__Op___closed__12;
return x_27;
}
}
}
else
{
lean_object* x_28; lean_object* x_29; 
lean_dec(x_3);
x_28 = l_CakeML_ptree__Op___closed__13;
lean_inc(x_4);
x_29 = l_CakeML_singleSymP(x_28, x_4);
if (lean_obj_tag(x_29) == 0)
{
lean_object* x_30; uint8_t x_31; 
x_30 = l_CakeML_ptree__Op___closed__14;
x_31 = l_CakeML_tokcheckl(x_4, x_30);
if (x_31 == 0)
{
lean_object* x_32; 
x_32 = lean_box(0);
return x_32;
}
else
{
lean_object* x_33; 
x_33 = l_CakeML_ptree__Op___closed__18;
return x_33;
}
}
else
{
uint8_t x_34; 
lean_dec(x_4);
x_34 = !lean_is_exclusive(x_29);
if (x_34 == 0)
{
return x_29;
}
else
{
lean_object* x_35; lean_object* x_36; 
x_35 = lean_ctor_get(x_29, 0);
lean_inc(x_35);
lean_dec(x_29);
x_36 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_36, 0, x_35);
return x_36;
}
}
}
}
else
{
lean_object* x_37; lean_object* x_38; 
lean_dec(x_3);
x_37 = l_CakeML_ptree__Op___closed__19;
x_38 = l_CakeML_singleSymP(x_37, x_4);
return x_38;
}
}
else
{
lean_object* x_39; lean_object* x_40; 
lean_dec(x_3);
x_39 = l_CakeML_ptree__Op___closed__20;
x_40 = l_CakeML_singleSymP(x_39, x_4);
return x_40;
}
}
else
{
lean_object* x_41; uint8_t x_42; 
lean_dec(x_3);
x_41 = l_CakeML_ptree__Op___closed__21;
lean_inc(x_4);
x_42 = l_CakeML_tokcheckl(x_4, x_41);
if (x_42 == 0)
{
lean_object* x_43; uint8_t x_44; 
x_43 = l_CakeML_ptree__Op___closed__25;
lean_inc(x_4);
x_44 = l_CakeML_tokcheckl(x_4, x_43);
if (x_44 == 0)
{
lean_object* x_45; uint8_t x_46; 
x_45 = l_CakeML_ptree__Op___closed__29;
lean_inc(x_4);
x_46 = l_CakeML_tokcheckl(x_4, x_45);
if (x_46 == 0)
{
lean_object* x_47; lean_object* x_48; 
x_47 = l_CakeML_ptree__Op___closed__30;
x_48 = l_CakeML_singleSymP(x_47, x_4);
return x_48;
}
else
{
lean_object* x_49; 
lean_dec(x_4);
x_49 = l_CakeML_ptree__Op___closed__32;
return x_49;
}
}
else
{
lean_object* x_50; 
lean_dec(x_4);
x_50 = l_CakeML_ptree__Op___closed__34;
return x_50;
}
}
else
{
lean_object* x_51; 
lean_dec(x_4);
x_51 = l_CakeML_ptree__Op___closed__38;
return x_51;
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__V(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 21;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; lean_object* x_12; 
x_11 = lean_ctor_get(x_4, 0);
lean_inc(x_11);
lean_dec(x_4);
x_12 = l_CakeML_destLf___rarg(x_11);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
x_13 = lean_box(0);
return x_13;
}
else
{
lean_object* x_14; lean_object* x_15; 
x_14 = lean_ctor_get(x_12, 0);
lean_inc(x_14);
lean_dec(x_12);
x_15 = l_CakeML_destTOK___rarg(x_14);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
x_16 = lean_box(0);
return x_16;
}
else
{
lean_object* x_17; lean_object* x_18; 
x_17 = lean_ctor_get(x_15, 0);
lean_inc(x_17);
lean_dec(x_15);
lean_inc(x_17);
x_18 = l_CakeML_destAlphaT(x_17);
if (lean_obj_tag(x_18) == 0)
{
lean_object* x_19; 
x_19 = l_CakeML_destSymbolT(x_17);
return x_19;
}
else
{
uint8_t x_20; 
lean_dec(x_17);
x_20 = !lean_is_exclusive(x_18);
if (x_20 == 0)
{
return x_18;
}
else
{
lean_object* x_21; lean_object* x_22; 
x_21 = lean_ctor_get(x_18, 0);
lean_inc(x_21);
lean_dec(x_18);
x_22 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_22, 0, x_21);
return x_22;
}
}
}
}
}
else
{
lean_object* x_23; 
lean_dec(x_10);
lean_dec(x_4);
x_23 = lean_box(0);
return x_23;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__FQV(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 22;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; lean_object* x_12; 
x_11 = lean_ctor_get(x_4, 0);
lean_inc(x_11);
lean_dec(x_4);
lean_inc(x_11);
x_12 = l_CakeML_ptree__V(x_11);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
x_13 = l_CakeML_destLf___rarg(x_11);
if (lean_obj_tag(x_13) == 0)
{
lean_object* x_14; 
x_14 = lean_box(0);
return x_14;
}
else
{
lean_object* x_15; lean_object* x_16; 
x_15 = lean_ctor_get(x_13, 0);
lean_inc(x_15);
lean_dec(x_13);
x_16 = l_CakeML_destTOK___rarg(x_15);
if (lean_obj_tag(x_16) == 0)
{
lean_object* x_17; 
x_17 = lean_box(0);
return x_17;
}
else
{
lean_object* x_18; lean_object* x_19; 
x_18 = lean_ctor_get(x_16, 0);
lean_inc(x_18);
lean_dec(x_16);
x_19 = l_CakeML_destLongidT(x_18);
if (lean_obj_tag(x_19) == 0)
{
lean_object* x_20; 
x_20 = lean_box(0);
return x_20;
}
else
{
uint8_t x_21; 
x_21 = !lean_is_exclusive(x_19);
if (x_21 == 0)
{
lean_object* x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; 
x_22 = lean_ctor_get(x_19, 0);
x_23 = lean_ctor_get(x_22, 0);
lean_inc(x_23);
x_24 = lean_ctor_get(x_22, 1);
lean_inc(x_24);
lean_dec(x_22);
x_25 = l_CakeML_Long__Short(x_23, x_24);
lean_ctor_set(x_19, 0, x_25);
return x_19;
}
else
{
lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; 
x_26 = lean_ctor_get(x_19, 0);
lean_inc(x_26);
lean_dec(x_19);
x_27 = lean_ctor_get(x_26, 0);
lean_inc(x_27);
x_28 = lean_ctor_get(x_26, 1);
lean_inc(x_28);
lean_dec(x_26);
x_29 = l_CakeML_Long__Short(x_27, x_28);
x_30 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_30, 0, x_29);
return x_30;
}
}
}
}
}
else
{
uint8_t x_31; 
lean_dec(x_11);
x_31 = !lean_is_exclusive(x_12);
if (x_31 == 0)
{
lean_object* x_32; lean_object* x_33; 
x_32 = lean_ctor_get(x_12, 0);
x_33 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_33, 0, x_32);
lean_ctor_set(x_12, 0, x_33);
return x_12;
}
else
{
lean_object* x_34; lean_object* x_35; lean_object* x_36; 
x_34 = lean_ctor_get(x_12, 0);
lean_inc(x_34);
lean_dec(x_12);
x_35 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_35, 0, x_34);
x_36 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_36, 0, x_35);
return x_36;
}
}
}
else
{
lean_object* x_37; 
lean_dec(x_10);
lean_dec(x_4);
x_37 = lean_box(0);
return x_37;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_isSymbolicConstructor(lean_object* x_1) {
_start:
{
lean_object* x_2; uint8_t x_3; lean_object* x_4; lean_object* x_5; 
x_2 = l_CakeML_mk__binop___closed__2;
x_3 = l_List_beq___at___private_CakeML_Core_Mlstring_0__CakeML_beqmlstring____x40_CakeML_Core_Mlstring___hyg_81____spec__1(x_1, x_2);
x_4 = lean_box(x_3);
x_5 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_5, 0, x_4);
return x_5;
}
}
static lean_object* _init_l_CakeML_isConstructor___closed__1() {
_start:
{
uint8_t x_1; lean_object* x_2; lean_object* x_3; 
x_1 = 0;
x_2 = lean_box(x_1);
x_3 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_3, 0, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_isConstructor___closed__2() {
_start:
{
uint8_t x_1; lean_object* x_2; lean_object* x_3; 
x_1 = 1;
x_2 = lean_box(x_1);
x_3 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_3, 0, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_isConstructor(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; uint8_t x_4; 
lean_inc(x_1);
x_2 = l_CakeML_isSymbolicConstructor(x_1);
x_3 = lean_ctor_get(x_2, 0);
lean_inc(x_3);
lean_dec(x_2);
x_4 = lean_unbox(x_3);
lean_dec(x_3);
if (x_4 == 0)
{
lean_object* x_5; 
x_5 = l_List_head_x3f___rarg(x_1);
lean_dec(x_1);
if (lean_obj_tag(x_5) == 0)
{
lean_object* x_6; 
x_6 = l_CakeML_isConstructor___closed__1;
return x_6;
}
else
{
lean_object* x_7; lean_object* x_8; lean_object* x_9; uint32_t x_20; uint32_t x_21; uint8_t x_22; 
x_7 = lean_ctor_get(x_5, 0);
lean_inc(x_7);
if (lean_is_exclusive(x_5)) {
 lean_ctor_release(x_5, 0);
 x_8 = x_5;
} else {
 lean_dec_ref(x_5);
 x_8 = lean_box(0);
}
x_20 = 65;
x_21 = lean_unbox_uint32(x_7);
x_22 = lean_uint32_dec_le(x_20, x_21);
if (x_22 == 0)
{
uint32_t x_23; uint32_t x_24; uint8_t x_25; 
x_23 = 97;
x_24 = lean_unbox_uint32(x_7);
x_25 = lean_uint32_dec_le(x_23, x_24);
if (x_25 == 0)
{
lean_object* x_26; 
lean_dec(x_8);
lean_dec(x_7);
x_26 = l_CakeML_isConstructor___closed__1;
return x_26;
}
else
{
uint32_t x_27; uint32_t x_28; uint8_t x_29; 
x_27 = 122;
x_28 = lean_unbox_uint32(x_7);
x_29 = lean_uint32_dec_le(x_28, x_27);
if (x_29 == 0)
{
lean_object* x_30; 
lean_dec(x_8);
lean_dec(x_7);
x_30 = l_CakeML_isConstructor___closed__1;
return x_30;
}
else
{
lean_object* x_31; 
x_31 = lean_box(0);
x_9 = x_31;
goto block_19;
}
}
}
else
{
uint32_t x_32; uint32_t x_33; uint8_t x_34; 
x_32 = 90;
x_33 = lean_unbox_uint32(x_7);
x_34 = lean_uint32_dec_le(x_33, x_32);
if (x_34 == 0)
{
uint32_t x_35; uint32_t x_36; uint8_t x_37; 
x_35 = 97;
x_36 = lean_unbox_uint32(x_7);
x_37 = lean_uint32_dec_le(x_35, x_36);
if (x_37 == 0)
{
lean_object* x_38; 
lean_dec(x_8);
lean_dec(x_7);
x_38 = l_CakeML_isConstructor___closed__1;
return x_38;
}
else
{
uint32_t x_39; uint32_t x_40; uint8_t x_41; 
x_39 = 122;
x_40 = lean_unbox_uint32(x_7);
x_41 = lean_uint32_dec_le(x_40, x_39);
if (x_41 == 0)
{
lean_object* x_42; 
lean_dec(x_8);
lean_dec(x_7);
x_42 = l_CakeML_isConstructor___closed__1;
return x_42;
}
else
{
lean_object* x_43; 
x_43 = lean_box(0);
x_9 = x_43;
goto block_19;
}
}
}
else
{
lean_object* x_44; 
x_44 = lean_box(0);
x_9 = x_44;
goto block_19;
}
}
block_19:
{
uint32_t x_10; uint32_t x_11; uint8_t x_12; 
lean_dec(x_9);
x_10 = 65;
x_11 = lean_unbox_uint32(x_7);
x_12 = lean_uint32_dec_le(x_10, x_11);
if (x_12 == 0)
{
lean_object* x_13; 
lean_dec(x_8);
lean_dec(x_7);
x_13 = l_CakeML_isConstructor___closed__1;
return x_13;
}
else
{
uint32_t x_14; uint32_t x_15; uint8_t x_16; lean_object* x_17; lean_object* x_18; 
x_14 = 90;
x_15 = lean_unbox_uint32(x_7);
lean_dec(x_7);
x_16 = lean_uint32_dec_le(x_15, x_14);
x_17 = lean_box(x_16);
if (lean_is_scalar(x_8)) {
 x_18 = lean_alloc_ctor(1, 1, 0);
} else {
 x_18 = x_8;
}
lean_ctor_set(x_18, 0, x_17);
return x_18;
}
}
}
}
else
{
lean_object* x_45; 
lean_dec(x_1);
x_45 = l_CakeML_isConstructor___closed__2;
return x_45;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_EtoPat(lean_object* x_1) {
_start:
{
switch (lean_obj_tag(x_1)) {
case 3:
{
uint8_t x_2; 
x_2 = !lean_is_exclusive(x_1);
if (x_2 == 0)
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_3 = lean_ctor_get(x_1, 0);
x_4 = lean_ctor_get(x_1, 1);
x_5 = l_List_isEmpty___rarg(x_4);
lean_dec(x_4);
if (x_5 == 0)
{
lean_object* x_6; 
lean_free_object(x_1);
lean_dec(x_3);
x_6 = lean_box(0);
return x_6;
}
else
{
lean_object* x_7; lean_object* x_8; 
x_7 = lean_box(0);
lean_ctor_set(x_1, 1, x_7);
x_8 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_8, 0, x_1);
return x_8;
}
}
else
{
lean_object* x_9; lean_object* x_10; uint8_t x_11; 
x_9 = lean_ctor_get(x_1, 0);
x_10 = lean_ctor_get(x_1, 1);
lean_inc(x_10);
lean_inc(x_9);
lean_dec(x_1);
x_11 = l_List_isEmpty___rarg(x_10);
lean_dec(x_10);
if (x_11 == 0)
{
lean_object* x_12; 
lean_dec(x_9);
x_12 = lean_box(0);
return x_12;
}
else
{
lean_object* x_13; lean_object* x_14; lean_object* x_15; 
x_13 = lean_box(0);
x_14 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_14, 0, x_9);
lean_ctor_set(x_14, 1, x_13);
x_15 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_15, 0, x_14);
return x_15;
}
}
}
case 4:
{
uint8_t x_16; 
x_16 = !lean_is_exclusive(x_1);
if (x_16 == 0)
{
lean_object* x_17; 
x_17 = lean_ctor_get(x_1, 0);
if (lean_obj_tag(x_17) == 0)
{
lean_object* x_18; lean_object* x_19; 
x_18 = lean_ctor_get(x_17, 0);
lean_inc(x_18);
lean_dec(x_17);
lean_ctor_set_tag(x_1, 1);
lean_ctor_set(x_1, 0, x_18);
x_19 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_19, 0, x_1);
return x_19;
}
else
{
uint8_t x_20; 
x_20 = !lean_is_exclusive(x_17);
if (x_20 == 0)
{
lean_object* x_21; lean_object* x_22; lean_object* x_23; 
lean_ctor_set_tag(x_1, 1);
x_21 = lean_box(0);
x_22 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_22, 0, x_1);
lean_ctor_set(x_22, 1, x_21);
x_23 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_23, 0, x_22);
return x_23;
}
else
{
lean_object* x_24; lean_object* x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; 
x_24 = lean_ctor_get(x_17, 0);
x_25 = lean_ctor_get(x_17, 1);
lean_inc(x_25);
lean_inc(x_24);
lean_dec(x_17);
x_26 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_26, 0, x_24);
lean_ctor_set(x_26, 1, x_25);
lean_ctor_set_tag(x_1, 1);
lean_ctor_set(x_1, 0, x_26);
x_27 = lean_box(0);
x_28 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_28, 0, x_1);
lean_ctor_set(x_28, 1, x_27);
x_29 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_29, 0, x_28);
return x_29;
}
}
}
else
{
lean_object* x_30; 
x_30 = lean_ctor_get(x_1, 0);
lean_inc(x_30);
lean_dec(x_1);
if (lean_obj_tag(x_30) == 0)
{
lean_object* x_31; lean_object* x_32; lean_object* x_33; 
x_31 = lean_ctor_get(x_30, 0);
lean_inc(x_31);
lean_dec(x_30);
x_32 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_32, 0, x_31);
x_33 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_33, 0, x_32);
return x_33;
}
else
{
lean_object* x_34; lean_object* x_35; lean_object* x_36; lean_object* x_37; lean_object* x_38; lean_object* x_39; lean_object* x_40; lean_object* x_41; 
x_34 = lean_ctor_get(x_30, 0);
lean_inc(x_34);
x_35 = lean_ctor_get(x_30, 1);
lean_inc(x_35);
if (lean_is_exclusive(x_30)) {
 lean_ctor_release(x_30, 0);
 lean_ctor_release(x_30, 1);
 x_36 = x_30;
} else {
 lean_dec_ref(x_30);
 x_36 = lean_box(0);
}
if (lean_is_scalar(x_36)) {
 x_37 = lean_alloc_ctor(1, 2, 0);
} else {
 x_37 = x_36;
}
lean_ctor_set(x_37, 0, x_34);
lean_ctor_set(x_37, 1, x_35);
x_38 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_38, 0, x_37);
x_39 = lean_box(0);
x_40 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_40, 0, x_38);
lean_ctor_set(x_40, 1, x_39);
x_41 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_41, 0, x_40);
return x_41;
}
}
}
default: 
{
lean_object* x_42; 
lean_dec(x_1);
x_42 = lean_box(0);
return x_42;
}
}
}
}
static lean_object* _init_l_CakeML_ptree__OpID___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__17;
x_2 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__OpID___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__OpID___closed__1;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__OpID___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__36;
x_2 = l_CakeML_isSymbolicConstructor(x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__OpID___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Op___closed__37;
x_2 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__OpID___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__OpID___closed__4;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__OpID___closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_CakeML_ptree__Op___closed__38;
x_3 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__OpID___closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__OpID___closed__6;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__OpID___closed__8() {
_start:
{
lean_object* x_1; lean_object* x_2; uint8_t x_3; 
x_1 = l_CakeML_ptree__OpID___closed__3;
x_2 = lean_ctor_get(x_1, 0);
lean_inc(x_2);
x_3 = lean_unbox(x_2);
lean_dec(x_2);
if (x_3 == 0)
{
lean_object* x_4; 
x_4 = l_CakeML_ptree__OpID___closed__5;
return x_4;
}
else
{
lean_object* x_5; 
x_5 = l_CakeML_ptree__OpID___closed__7;
return x_5;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__OpID(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
uint8_t x_3; 
x_3 = !lean_is_exclusive(x_1);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; uint8_t x_6; uint8_t x_7; uint8_t x_8; 
x_4 = lean_ctor_get(x_1, 0);
x_5 = lean_ctor_get(x_1, 1);
x_6 = 23;
x_7 = lean_unbox(x_4);
lean_dec(x_4);
x_8 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_7, x_6);
if (x_8 == 0)
{
lean_object* x_9; 
lean_free_object(x_1);
lean_dec(x_5);
x_9 = lean_box(0);
return x_9;
}
else
{
if (lean_obj_tag(x_5) == 0)
{
lean_object* x_10; 
lean_free_object(x_1);
x_10 = lean_box(0);
return x_10;
}
else
{
lean_object* x_11; 
x_11 = lean_ctor_get(x_5, 0);
lean_inc(x_11);
if (lean_obj_tag(x_11) == 0)
{
lean_object* x_12; lean_object* x_13; 
x_12 = lean_ctor_get(x_11, 0);
lean_inc(x_12);
if (lean_is_exclusive(x_11)) {
 lean_ctor_release(x_11, 0);
 x_13 = x_11;
} else {
 lean_dec_ref(x_11);
 x_13 = lean_box(0);
}
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_27; lean_object* x_81; 
x_14 = lean_ctor_get(x_5, 1);
lean_inc(x_14);
if (lean_is_exclusive(x_5)) {
 lean_ctor_release(x_5, 0);
 lean_ctor_release(x_5, 1);
 x_15 = x_5;
} else {
 lean_dec_ref(x_5);
 x_15 = lean_box(0);
}
x_16 = lean_ctor_get(x_12, 0);
lean_inc(x_16);
if (lean_is_exclusive(x_12)) {
 lean_ctor_release(x_12, 0);
 x_17 = x_12;
} else {
 lean_dec_ref(x_12);
 x_17 = lean_box(0);
}
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_118; 
lean_inc(x_16);
x_118 = l_CakeML_destAlphaT(x_16);
if (lean_obj_tag(x_118) == 0)
{
lean_object* x_119; 
lean_free_object(x_1);
x_119 = lean_box(0);
x_81 = x_119;
goto block_117;
}
else
{
uint8_t x_120; 
lean_dec(x_17);
lean_dec(x_16);
lean_dec(x_15);
lean_dec(x_13);
x_120 = !lean_is_exclusive(x_118);
if (x_120 == 0)
{
lean_object* x_121; lean_object* x_122; uint8_t x_123; 
x_121 = lean_ctor_get(x_118, 0);
lean_inc(x_121);
x_122 = l_CakeML_isConstructor(x_121);
x_123 = !lean_is_exclusive(x_122);
if (x_123 == 0)
{
lean_object* x_124; uint8_t x_125; 
x_124 = lean_ctor_get(x_122, 0);
x_125 = lean_unbox(x_124);
lean_dec(x_124);
if (x_125 == 0)
{
lean_object* x_126; lean_object* x_127; 
lean_free_object(x_118);
lean_free_object(x_1);
x_126 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_126, 0, x_121);
x_127 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_127, 0, x_126);
lean_ctor_set(x_122, 0, x_127);
return x_122;
}
else
{
lean_object* x_128; lean_object* x_129; 
x_128 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_128, 0, x_121);
lean_ctor_set(x_122, 0, x_128);
x_129 = lean_box(0);
lean_ctor_set_tag(x_1, 3);
lean_ctor_set(x_1, 1, x_129);
lean_ctor_set(x_1, 0, x_122);
lean_ctor_set(x_118, 0, x_1);
return x_118;
}
}
else
{
lean_object* x_130; uint8_t x_131; 
x_130 = lean_ctor_get(x_122, 0);
lean_inc(x_130);
lean_dec(x_122);
x_131 = lean_unbox(x_130);
lean_dec(x_130);
if (x_131 == 0)
{
lean_object* x_132; lean_object* x_133; lean_object* x_134; 
lean_free_object(x_118);
lean_free_object(x_1);
x_132 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_132, 0, x_121);
x_133 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_133, 0, x_132);
x_134 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_134, 0, x_133);
return x_134;
}
else
{
lean_object* x_135; lean_object* x_136; lean_object* x_137; 
x_135 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_135, 0, x_121);
x_136 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_136, 0, x_135);
x_137 = lean_box(0);
lean_ctor_set_tag(x_1, 3);
lean_ctor_set(x_1, 1, x_137);
lean_ctor_set(x_1, 0, x_136);
lean_ctor_set(x_118, 0, x_1);
return x_118;
}
}
}
else
{
lean_object* x_138; lean_object* x_139; lean_object* x_140; lean_object* x_141; uint8_t x_142; 
x_138 = lean_ctor_get(x_118, 0);
lean_inc(x_138);
lean_dec(x_118);
lean_inc(x_138);
x_139 = l_CakeML_isConstructor(x_138);
x_140 = lean_ctor_get(x_139, 0);
lean_inc(x_140);
if (lean_is_exclusive(x_139)) {
 lean_ctor_release(x_139, 0);
 x_141 = x_139;
} else {
 lean_dec_ref(x_139);
 x_141 = lean_box(0);
}
x_142 = lean_unbox(x_140);
lean_dec(x_140);
if (x_142 == 0)
{
lean_object* x_143; lean_object* x_144; lean_object* x_145; 
lean_free_object(x_1);
x_143 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_143, 0, x_138);
x_144 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_144, 0, x_143);
if (lean_is_scalar(x_141)) {
 x_145 = lean_alloc_ctor(1, 1, 0);
} else {
 x_145 = x_141;
}
lean_ctor_set(x_145, 0, x_144);
return x_145;
}
else
{
lean_object* x_146; lean_object* x_147; lean_object* x_148; lean_object* x_149; 
x_146 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_146, 0, x_138);
if (lean_is_scalar(x_141)) {
 x_147 = lean_alloc_ctor(1, 1, 0);
} else {
 x_147 = x_141;
}
lean_ctor_set(x_147, 0, x_146);
x_148 = lean_box(0);
lean_ctor_set_tag(x_1, 3);
lean_ctor_set(x_1, 1, x_148);
lean_ctor_set(x_1, 0, x_147);
x_149 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_149, 0, x_1);
return x_149;
}
}
}
}
else
{
lean_object* x_150; 
lean_dec(x_17);
lean_dec(x_16);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_13);
lean_free_object(x_1);
x_150 = lean_box(0);
return x_150;
}
block_26:
{
lean_object* x_19; uint8_t x_20; 
lean_dec(x_18);
x_19 = lean_box(6);
lean_inc(x_16);
x_20 = l___private_CakeML_Core_Tokens_0__CakeML_beqtoken____x40_CakeML_Core_Tokens___hyg_2775_(x_16, x_19);
if (x_20 == 0)
{
lean_object* x_21; uint8_t x_22; 
x_21 = lean_box(13);
x_22 = l___private_CakeML_Core_Tokens_0__CakeML_beqtoken____x40_CakeML_Core_Tokens___hyg_2775_(x_16, x_21);
if (x_22 == 0)
{
lean_object* x_23; 
x_23 = lean_box(0);
return x_23;
}
else
{
lean_object* x_24; 
x_24 = l_CakeML_ptree__OpID___closed__2;
return x_24;
}
}
else
{
lean_object* x_25; 
lean_dec(x_16);
x_25 = l_CakeML_ptree__OpID___closed__8;
return x_25;
}
}
block_80:
{
lean_object* x_28; 
lean_dec(x_27);
lean_inc(x_16);
x_28 = l_CakeML_destLongidT(x_16);
if (lean_obj_tag(x_28) == 0)
{
lean_object* x_29; 
lean_dec(x_17);
x_29 = lean_box(0);
x_18 = x_29;
goto block_26;
}
else
{
uint8_t x_30; 
lean_dec(x_16);
x_30 = !lean_is_exclusive(x_28);
if (x_30 == 0)
{
lean_object* x_31; uint8_t x_32; 
x_31 = lean_ctor_get(x_28, 0);
x_32 = !lean_is_exclusive(x_31);
if (x_32 == 0)
{
lean_object* x_33; lean_object* x_34; lean_object* x_35; uint8_t x_36; 
x_33 = lean_ctor_get(x_31, 0);
x_34 = lean_ctor_get(x_31, 1);
lean_inc(x_34);
x_35 = l_CakeML_isConstructor(x_34);
x_36 = !lean_is_exclusive(x_35);
if (x_36 == 0)
{
lean_object* x_37; uint8_t x_38; 
x_37 = lean_ctor_get(x_35, 0);
x_38 = lean_unbox(x_37);
lean_dec(x_37);
if (x_38 == 0)
{
lean_object* x_39; lean_object* x_40; 
lean_free_object(x_31);
lean_free_object(x_28);
x_39 = l_CakeML_Long__Short(x_33, x_34);
if (lean_is_scalar(x_17)) {
 x_40 = lean_alloc_ctor(4, 1, 0);
} else {
 x_40 = x_17;
 lean_ctor_set_tag(x_40, 4);
}
lean_ctor_set(x_40, 0, x_39);
lean_ctor_set(x_35, 0, x_40);
return x_35;
}
else
{
lean_object* x_41; lean_object* x_42; 
lean_dec(x_17);
x_41 = l_CakeML_Long__Short(x_33, x_34);
lean_ctor_set(x_35, 0, x_41);
x_42 = lean_box(0);
lean_ctor_set_tag(x_31, 3);
lean_ctor_set(x_31, 1, x_42);
lean_ctor_set(x_31, 0, x_35);
return x_28;
}
}
else
{
lean_object* x_43; uint8_t x_44; 
x_43 = lean_ctor_get(x_35, 0);
lean_inc(x_43);
lean_dec(x_35);
x_44 = lean_unbox(x_43);
lean_dec(x_43);
if (x_44 == 0)
{
lean_object* x_45; lean_object* x_46; lean_object* x_47; 
lean_free_object(x_31);
lean_free_object(x_28);
x_45 = l_CakeML_Long__Short(x_33, x_34);
if (lean_is_scalar(x_17)) {
 x_46 = lean_alloc_ctor(4, 1, 0);
} else {
 x_46 = x_17;
 lean_ctor_set_tag(x_46, 4);
}
lean_ctor_set(x_46, 0, x_45);
x_47 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_47, 0, x_46);
return x_47;
}
else
{
lean_object* x_48; lean_object* x_49; lean_object* x_50; 
lean_dec(x_17);
x_48 = l_CakeML_Long__Short(x_33, x_34);
x_49 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_49, 0, x_48);
x_50 = lean_box(0);
lean_ctor_set_tag(x_31, 3);
lean_ctor_set(x_31, 1, x_50);
lean_ctor_set(x_31, 0, x_49);
return x_28;
}
}
}
else
{
lean_object* x_51; lean_object* x_52; lean_object* x_53; lean_object* x_54; lean_object* x_55; uint8_t x_56; 
x_51 = lean_ctor_get(x_31, 0);
x_52 = lean_ctor_get(x_31, 1);
lean_inc(x_52);
lean_inc(x_51);
lean_dec(x_31);
lean_inc(x_52);
x_53 = l_CakeML_isConstructor(x_52);
x_54 = lean_ctor_get(x_53, 0);
lean_inc(x_54);
if (lean_is_exclusive(x_53)) {
 lean_ctor_release(x_53, 0);
 x_55 = x_53;
} else {
 lean_dec_ref(x_53);
 x_55 = lean_box(0);
}
x_56 = lean_unbox(x_54);
lean_dec(x_54);
if (x_56 == 0)
{
lean_object* x_57; lean_object* x_58; lean_object* x_59; 
lean_free_object(x_28);
x_57 = l_CakeML_Long__Short(x_51, x_52);
if (lean_is_scalar(x_17)) {
 x_58 = lean_alloc_ctor(4, 1, 0);
} else {
 x_58 = x_17;
 lean_ctor_set_tag(x_58, 4);
}
lean_ctor_set(x_58, 0, x_57);
if (lean_is_scalar(x_55)) {
 x_59 = lean_alloc_ctor(1, 1, 0);
} else {
 x_59 = x_55;
}
lean_ctor_set(x_59, 0, x_58);
return x_59;
}
else
{
lean_object* x_60; lean_object* x_61; lean_object* x_62; lean_object* x_63; 
lean_dec(x_17);
x_60 = l_CakeML_Long__Short(x_51, x_52);
if (lean_is_scalar(x_55)) {
 x_61 = lean_alloc_ctor(1, 1, 0);
} else {
 x_61 = x_55;
}
lean_ctor_set(x_61, 0, x_60);
x_62 = lean_box(0);
x_63 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_63, 0, x_61);
lean_ctor_set(x_63, 1, x_62);
lean_ctor_set(x_28, 0, x_63);
return x_28;
}
}
}
else
{
lean_object* x_64; lean_object* x_65; lean_object* x_66; lean_object* x_67; lean_object* x_68; lean_object* x_69; lean_object* x_70; uint8_t x_71; 
x_64 = lean_ctor_get(x_28, 0);
lean_inc(x_64);
lean_dec(x_28);
x_65 = lean_ctor_get(x_64, 0);
lean_inc(x_65);
x_66 = lean_ctor_get(x_64, 1);
lean_inc(x_66);
if (lean_is_exclusive(x_64)) {
 lean_ctor_release(x_64, 0);
 lean_ctor_release(x_64, 1);
 x_67 = x_64;
} else {
 lean_dec_ref(x_64);
 x_67 = lean_box(0);
}
lean_inc(x_66);
x_68 = l_CakeML_isConstructor(x_66);
x_69 = lean_ctor_get(x_68, 0);
lean_inc(x_69);
if (lean_is_exclusive(x_68)) {
 lean_ctor_release(x_68, 0);
 x_70 = x_68;
} else {
 lean_dec_ref(x_68);
 x_70 = lean_box(0);
}
x_71 = lean_unbox(x_69);
lean_dec(x_69);
if (x_71 == 0)
{
lean_object* x_72; lean_object* x_73; lean_object* x_74; 
lean_dec(x_67);
x_72 = l_CakeML_Long__Short(x_65, x_66);
if (lean_is_scalar(x_17)) {
 x_73 = lean_alloc_ctor(4, 1, 0);
} else {
 x_73 = x_17;
 lean_ctor_set_tag(x_73, 4);
}
lean_ctor_set(x_73, 0, x_72);
if (lean_is_scalar(x_70)) {
 x_74 = lean_alloc_ctor(1, 1, 0);
} else {
 x_74 = x_70;
}
lean_ctor_set(x_74, 0, x_73);
return x_74;
}
else
{
lean_object* x_75; lean_object* x_76; lean_object* x_77; lean_object* x_78; lean_object* x_79; 
lean_dec(x_17);
x_75 = l_CakeML_Long__Short(x_65, x_66);
if (lean_is_scalar(x_70)) {
 x_76 = lean_alloc_ctor(1, 1, 0);
} else {
 x_76 = x_70;
}
lean_ctor_set(x_76, 0, x_75);
x_77 = lean_box(0);
if (lean_is_scalar(x_67)) {
 x_78 = lean_alloc_ctor(3, 2, 0);
} else {
 x_78 = x_67;
 lean_ctor_set_tag(x_78, 3);
}
lean_ctor_set(x_78, 0, x_76);
lean_ctor_set(x_78, 1, x_77);
x_79 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_79, 0, x_78);
return x_79;
}
}
}
}
block_117:
{
lean_object* x_82; 
lean_dec(x_81);
lean_inc(x_16);
x_82 = l_CakeML_destSymbolT(x_16);
if (lean_obj_tag(x_82) == 0)
{
lean_object* x_83; 
lean_dec(x_15);
lean_dec(x_13);
x_83 = lean_box(0);
x_27 = x_83;
goto block_80;
}
else
{
uint8_t x_84; 
lean_dec(x_17);
lean_dec(x_16);
x_84 = !lean_is_exclusive(x_82);
if (x_84 == 0)
{
lean_object* x_85; lean_object* x_86; uint8_t x_87; 
x_85 = lean_ctor_get(x_82, 0);
lean_inc(x_85);
x_86 = l_CakeML_isSymbolicConstructor(x_85);
x_87 = !lean_is_exclusive(x_86);
if (x_87 == 0)
{
lean_object* x_88; uint8_t x_89; 
x_88 = lean_ctor_get(x_86, 0);
x_89 = lean_unbox(x_88);
lean_dec(x_88);
if (x_89 == 0)
{
lean_object* x_90; lean_object* x_91; 
lean_free_object(x_82);
lean_dec(x_15);
if (lean_is_scalar(x_13)) {
 x_90 = lean_alloc_ctor(0, 1, 0);
} else {
 x_90 = x_13;
}
lean_ctor_set(x_90, 0, x_85);
x_91 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_91, 0, x_90);
lean_ctor_set(x_86, 0, x_91);
return x_86;
}
else
{
lean_object* x_92; lean_object* x_93; lean_object* x_94; 
if (lean_is_scalar(x_13)) {
 x_92 = lean_alloc_ctor(0, 1, 0);
} else {
 x_92 = x_13;
}
lean_ctor_set(x_92, 0, x_85);
lean_ctor_set(x_86, 0, x_92);
x_93 = lean_box(0);
if (lean_is_scalar(x_15)) {
 x_94 = lean_alloc_ctor(3, 2, 0);
} else {
 x_94 = x_15;
 lean_ctor_set_tag(x_94, 3);
}
lean_ctor_set(x_94, 0, x_86);
lean_ctor_set(x_94, 1, x_93);
lean_ctor_set(x_82, 0, x_94);
return x_82;
}
}
else
{
lean_object* x_95; uint8_t x_96; 
x_95 = lean_ctor_get(x_86, 0);
lean_inc(x_95);
lean_dec(x_86);
x_96 = lean_unbox(x_95);
lean_dec(x_95);
if (x_96 == 0)
{
lean_object* x_97; lean_object* x_98; lean_object* x_99; 
lean_free_object(x_82);
lean_dec(x_15);
if (lean_is_scalar(x_13)) {
 x_97 = lean_alloc_ctor(0, 1, 0);
} else {
 x_97 = x_13;
}
lean_ctor_set(x_97, 0, x_85);
x_98 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_98, 0, x_97);
x_99 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_99, 0, x_98);
return x_99;
}
else
{
lean_object* x_100; lean_object* x_101; lean_object* x_102; lean_object* x_103; 
if (lean_is_scalar(x_13)) {
 x_100 = lean_alloc_ctor(0, 1, 0);
} else {
 x_100 = x_13;
}
lean_ctor_set(x_100, 0, x_85);
x_101 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_101, 0, x_100);
x_102 = lean_box(0);
if (lean_is_scalar(x_15)) {
 x_103 = lean_alloc_ctor(3, 2, 0);
} else {
 x_103 = x_15;
 lean_ctor_set_tag(x_103, 3);
}
lean_ctor_set(x_103, 0, x_101);
lean_ctor_set(x_103, 1, x_102);
lean_ctor_set(x_82, 0, x_103);
return x_82;
}
}
}
else
{
lean_object* x_104; lean_object* x_105; lean_object* x_106; lean_object* x_107; uint8_t x_108; 
x_104 = lean_ctor_get(x_82, 0);
lean_inc(x_104);
lean_dec(x_82);
lean_inc(x_104);
x_105 = l_CakeML_isSymbolicConstructor(x_104);
x_106 = lean_ctor_get(x_105, 0);
lean_inc(x_106);
if (lean_is_exclusive(x_105)) {
 lean_ctor_release(x_105, 0);
 x_107 = x_105;
} else {
 lean_dec_ref(x_105);
 x_107 = lean_box(0);
}
x_108 = lean_unbox(x_106);
lean_dec(x_106);
if (x_108 == 0)
{
lean_object* x_109; lean_object* x_110; lean_object* x_111; 
lean_dec(x_15);
if (lean_is_scalar(x_13)) {
 x_109 = lean_alloc_ctor(0, 1, 0);
} else {
 x_109 = x_13;
}
lean_ctor_set(x_109, 0, x_104);
x_110 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_110, 0, x_109);
if (lean_is_scalar(x_107)) {
 x_111 = lean_alloc_ctor(1, 1, 0);
} else {
 x_111 = x_107;
}
lean_ctor_set(x_111, 0, x_110);
return x_111;
}
else
{
lean_object* x_112; lean_object* x_113; lean_object* x_114; lean_object* x_115; lean_object* x_116; 
if (lean_is_scalar(x_13)) {
 x_112 = lean_alloc_ctor(0, 1, 0);
} else {
 x_112 = x_13;
}
lean_ctor_set(x_112, 0, x_104);
if (lean_is_scalar(x_107)) {
 x_113 = lean_alloc_ctor(1, 1, 0);
} else {
 x_113 = x_107;
}
lean_ctor_set(x_113, 0, x_112);
x_114 = lean_box(0);
if (lean_is_scalar(x_15)) {
 x_115 = lean_alloc_ctor(3, 2, 0);
} else {
 x_115 = x_15;
 lean_ctor_set_tag(x_115, 3);
}
lean_ctor_set(x_115, 0, x_113);
lean_ctor_set(x_115, 1, x_114);
x_116 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_116, 0, x_115);
return x_116;
}
}
}
}
}
else
{
lean_object* x_151; 
lean_dec(x_13);
lean_dec(x_12);
lean_free_object(x_1);
lean_dec(x_5);
x_151 = lean_box(0);
return x_151;
}
}
else
{
lean_object* x_152; 
lean_dec(x_11);
lean_free_object(x_1);
lean_dec(x_5);
x_152 = lean_box(0);
return x_152;
}
}
}
}
else
{
lean_object* x_153; lean_object* x_154; uint8_t x_155; uint8_t x_156; uint8_t x_157; 
x_153 = lean_ctor_get(x_1, 0);
x_154 = lean_ctor_get(x_1, 1);
lean_inc(x_154);
lean_inc(x_153);
lean_dec(x_1);
x_155 = 23;
x_156 = lean_unbox(x_153);
lean_dec(x_153);
x_157 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_156, x_155);
if (x_157 == 0)
{
lean_object* x_158; 
lean_dec(x_154);
x_158 = lean_box(0);
return x_158;
}
else
{
if (lean_obj_tag(x_154) == 0)
{
lean_object* x_159; 
x_159 = lean_box(0);
return x_159;
}
else
{
lean_object* x_160; 
x_160 = lean_ctor_get(x_154, 0);
lean_inc(x_160);
if (lean_obj_tag(x_160) == 0)
{
lean_object* x_161; lean_object* x_162; 
x_161 = lean_ctor_get(x_160, 0);
lean_inc(x_161);
if (lean_is_exclusive(x_160)) {
 lean_ctor_release(x_160, 0);
 x_162 = x_160;
} else {
 lean_dec_ref(x_160);
 x_162 = lean_box(0);
}
if (lean_obj_tag(x_161) == 0)
{
lean_object* x_163; lean_object* x_164; lean_object* x_165; lean_object* x_166; lean_object* x_167; lean_object* x_176; lean_object* x_197; 
x_163 = lean_ctor_get(x_154, 1);
lean_inc(x_163);
if (lean_is_exclusive(x_154)) {
 lean_ctor_release(x_154, 0);
 lean_ctor_release(x_154, 1);
 x_164 = x_154;
} else {
 lean_dec_ref(x_154);
 x_164 = lean_box(0);
}
x_165 = lean_ctor_get(x_161, 0);
lean_inc(x_165);
if (lean_is_exclusive(x_161)) {
 lean_ctor_release(x_161, 0);
 x_166 = x_161;
} else {
 lean_dec_ref(x_161);
 x_166 = lean_box(0);
}
if (lean_obj_tag(x_163) == 0)
{
lean_object* x_215; 
lean_inc(x_165);
x_215 = l_CakeML_destAlphaT(x_165);
if (lean_obj_tag(x_215) == 0)
{
lean_object* x_216; 
x_216 = lean_box(0);
x_197 = x_216;
goto block_214;
}
else
{
lean_object* x_217; lean_object* x_218; lean_object* x_219; lean_object* x_220; lean_object* x_221; uint8_t x_222; 
lean_dec(x_166);
lean_dec(x_165);
lean_dec(x_164);
lean_dec(x_162);
x_217 = lean_ctor_get(x_215, 0);
lean_inc(x_217);
if (lean_is_exclusive(x_215)) {
 lean_ctor_release(x_215, 0);
 x_218 = x_215;
} else {
 lean_dec_ref(x_215);
 x_218 = lean_box(0);
}
lean_inc(x_217);
x_219 = l_CakeML_isConstructor(x_217);
x_220 = lean_ctor_get(x_219, 0);
lean_inc(x_220);
if (lean_is_exclusive(x_219)) {
 lean_ctor_release(x_219, 0);
 x_221 = x_219;
} else {
 lean_dec_ref(x_219);
 x_221 = lean_box(0);
}
x_222 = lean_unbox(x_220);
lean_dec(x_220);
if (x_222 == 0)
{
lean_object* x_223; lean_object* x_224; lean_object* x_225; 
lean_dec(x_218);
x_223 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_223, 0, x_217);
x_224 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_224, 0, x_223);
if (lean_is_scalar(x_221)) {
 x_225 = lean_alloc_ctor(1, 1, 0);
} else {
 x_225 = x_221;
}
lean_ctor_set(x_225, 0, x_224);
return x_225;
}
else
{
lean_object* x_226; lean_object* x_227; lean_object* x_228; lean_object* x_229; lean_object* x_230; 
x_226 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_226, 0, x_217);
if (lean_is_scalar(x_221)) {
 x_227 = lean_alloc_ctor(1, 1, 0);
} else {
 x_227 = x_221;
}
lean_ctor_set(x_227, 0, x_226);
x_228 = lean_box(0);
x_229 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_229, 0, x_227);
lean_ctor_set(x_229, 1, x_228);
if (lean_is_scalar(x_218)) {
 x_230 = lean_alloc_ctor(1, 1, 0);
} else {
 x_230 = x_218;
}
lean_ctor_set(x_230, 0, x_229);
return x_230;
}
}
}
else
{
lean_object* x_231; 
lean_dec(x_166);
lean_dec(x_165);
lean_dec(x_164);
lean_dec(x_163);
lean_dec(x_162);
x_231 = lean_box(0);
return x_231;
}
block_175:
{
lean_object* x_168; uint8_t x_169; 
lean_dec(x_167);
x_168 = lean_box(6);
lean_inc(x_165);
x_169 = l___private_CakeML_Core_Tokens_0__CakeML_beqtoken____x40_CakeML_Core_Tokens___hyg_2775_(x_165, x_168);
if (x_169 == 0)
{
lean_object* x_170; uint8_t x_171; 
x_170 = lean_box(13);
x_171 = l___private_CakeML_Core_Tokens_0__CakeML_beqtoken____x40_CakeML_Core_Tokens___hyg_2775_(x_165, x_170);
if (x_171 == 0)
{
lean_object* x_172; 
x_172 = lean_box(0);
return x_172;
}
else
{
lean_object* x_173; 
x_173 = l_CakeML_ptree__OpID___closed__2;
return x_173;
}
}
else
{
lean_object* x_174; 
lean_dec(x_165);
x_174 = l_CakeML_ptree__OpID___closed__8;
return x_174;
}
}
block_196:
{
lean_object* x_177; 
lean_dec(x_176);
lean_inc(x_165);
x_177 = l_CakeML_destLongidT(x_165);
if (lean_obj_tag(x_177) == 0)
{
lean_object* x_178; 
lean_dec(x_166);
x_178 = lean_box(0);
x_167 = x_178;
goto block_175;
}
else
{
lean_object* x_179; lean_object* x_180; lean_object* x_181; lean_object* x_182; lean_object* x_183; lean_object* x_184; lean_object* x_185; lean_object* x_186; uint8_t x_187; 
lean_dec(x_165);
x_179 = lean_ctor_get(x_177, 0);
lean_inc(x_179);
if (lean_is_exclusive(x_177)) {
 lean_ctor_release(x_177, 0);
 x_180 = x_177;
} else {
 lean_dec_ref(x_177);
 x_180 = lean_box(0);
}
x_181 = lean_ctor_get(x_179, 0);
lean_inc(x_181);
x_182 = lean_ctor_get(x_179, 1);
lean_inc(x_182);
if (lean_is_exclusive(x_179)) {
 lean_ctor_release(x_179, 0);
 lean_ctor_release(x_179, 1);
 x_183 = x_179;
} else {
 lean_dec_ref(x_179);
 x_183 = lean_box(0);
}
lean_inc(x_182);
x_184 = l_CakeML_isConstructor(x_182);
x_185 = lean_ctor_get(x_184, 0);
lean_inc(x_185);
if (lean_is_exclusive(x_184)) {
 lean_ctor_release(x_184, 0);
 x_186 = x_184;
} else {
 lean_dec_ref(x_184);
 x_186 = lean_box(0);
}
x_187 = lean_unbox(x_185);
lean_dec(x_185);
if (x_187 == 0)
{
lean_object* x_188; lean_object* x_189; lean_object* x_190; 
lean_dec(x_183);
lean_dec(x_180);
x_188 = l_CakeML_Long__Short(x_181, x_182);
if (lean_is_scalar(x_166)) {
 x_189 = lean_alloc_ctor(4, 1, 0);
} else {
 x_189 = x_166;
 lean_ctor_set_tag(x_189, 4);
}
lean_ctor_set(x_189, 0, x_188);
if (lean_is_scalar(x_186)) {
 x_190 = lean_alloc_ctor(1, 1, 0);
} else {
 x_190 = x_186;
}
lean_ctor_set(x_190, 0, x_189);
return x_190;
}
else
{
lean_object* x_191; lean_object* x_192; lean_object* x_193; lean_object* x_194; lean_object* x_195; 
lean_dec(x_166);
x_191 = l_CakeML_Long__Short(x_181, x_182);
if (lean_is_scalar(x_186)) {
 x_192 = lean_alloc_ctor(1, 1, 0);
} else {
 x_192 = x_186;
}
lean_ctor_set(x_192, 0, x_191);
x_193 = lean_box(0);
if (lean_is_scalar(x_183)) {
 x_194 = lean_alloc_ctor(3, 2, 0);
} else {
 x_194 = x_183;
 lean_ctor_set_tag(x_194, 3);
}
lean_ctor_set(x_194, 0, x_192);
lean_ctor_set(x_194, 1, x_193);
if (lean_is_scalar(x_180)) {
 x_195 = lean_alloc_ctor(1, 1, 0);
} else {
 x_195 = x_180;
}
lean_ctor_set(x_195, 0, x_194);
return x_195;
}
}
}
block_214:
{
lean_object* x_198; 
lean_dec(x_197);
lean_inc(x_165);
x_198 = l_CakeML_destSymbolT(x_165);
if (lean_obj_tag(x_198) == 0)
{
lean_object* x_199; 
lean_dec(x_164);
lean_dec(x_162);
x_199 = lean_box(0);
x_176 = x_199;
goto block_196;
}
else
{
lean_object* x_200; lean_object* x_201; lean_object* x_202; lean_object* x_203; lean_object* x_204; uint8_t x_205; 
lean_dec(x_166);
lean_dec(x_165);
x_200 = lean_ctor_get(x_198, 0);
lean_inc(x_200);
if (lean_is_exclusive(x_198)) {
 lean_ctor_release(x_198, 0);
 x_201 = x_198;
} else {
 lean_dec_ref(x_198);
 x_201 = lean_box(0);
}
lean_inc(x_200);
x_202 = l_CakeML_isSymbolicConstructor(x_200);
x_203 = lean_ctor_get(x_202, 0);
lean_inc(x_203);
if (lean_is_exclusive(x_202)) {
 lean_ctor_release(x_202, 0);
 x_204 = x_202;
} else {
 lean_dec_ref(x_202);
 x_204 = lean_box(0);
}
x_205 = lean_unbox(x_203);
lean_dec(x_203);
if (x_205 == 0)
{
lean_object* x_206; lean_object* x_207; lean_object* x_208; 
lean_dec(x_201);
lean_dec(x_164);
if (lean_is_scalar(x_162)) {
 x_206 = lean_alloc_ctor(0, 1, 0);
} else {
 x_206 = x_162;
}
lean_ctor_set(x_206, 0, x_200);
x_207 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_207, 0, x_206);
if (lean_is_scalar(x_204)) {
 x_208 = lean_alloc_ctor(1, 1, 0);
} else {
 x_208 = x_204;
}
lean_ctor_set(x_208, 0, x_207);
return x_208;
}
else
{
lean_object* x_209; lean_object* x_210; lean_object* x_211; lean_object* x_212; lean_object* x_213; 
if (lean_is_scalar(x_162)) {
 x_209 = lean_alloc_ctor(0, 1, 0);
} else {
 x_209 = x_162;
}
lean_ctor_set(x_209, 0, x_200);
if (lean_is_scalar(x_204)) {
 x_210 = lean_alloc_ctor(1, 1, 0);
} else {
 x_210 = x_204;
}
lean_ctor_set(x_210, 0, x_209);
x_211 = lean_box(0);
if (lean_is_scalar(x_164)) {
 x_212 = lean_alloc_ctor(3, 2, 0);
} else {
 x_212 = x_164;
 lean_ctor_set_tag(x_212, 3);
}
lean_ctor_set(x_212, 0, x_210);
lean_ctor_set(x_212, 1, x_211);
if (lean_is_scalar(x_201)) {
 x_213 = lean_alloc_ctor(1, 1, 0);
} else {
 x_213 = x_201;
}
lean_ctor_set(x_213, 0, x_212);
return x_213;
}
}
}
}
else
{
lean_object* x_232; 
lean_dec(x_162);
lean_dec(x_161);
lean_dec(x_154);
x_232 = lean_box(0);
return x_232;
}
}
else
{
lean_object* x_233; 
lean_dec(x_160);
lean_dec(x_154);
x_233 = lean_box(0);
return x_233;
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_Papply(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 3)
{
uint8_t x_3; 
x_3 = !lean_is_exclusive(x_1);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; 
x_4 = lean_ctor_get(x_1, 1);
x_5 = lean_box(0);
x_6 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_6, 0, x_2);
lean_ctor_set(x_6, 1, x_5);
x_7 = l_List_appendTR___rarg(x_4, x_6);
lean_ctor_set(x_1, 1, x_7);
return x_1;
}
else
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; 
x_8 = lean_ctor_get(x_1, 0);
x_9 = lean_ctor_get(x_1, 1);
lean_inc(x_9);
lean_inc(x_8);
lean_dec(x_1);
x_10 = lean_box(0);
x_11 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_11, 0, x_2);
lean_ctor_set(x_11, 1, x_10);
x_12 = l_List_appendTR___rarg(x_9, x_11);
x_13 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_13, 0, x_8);
lean_ctor_set(x_13, 1, x_12);
return x_13;
}
}
else
{
lean_dec(x_2);
return x_1;
}
}
}
static lean_object* _init_l_CakeML_maybe__handleRef___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("Ref", 3, 3);
return x_1;
}
}
static lean_object* _init_l_CakeML_maybe__handleRef___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_maybe__handleRef___closed__1;
x_2 = lean_string_data(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_maybe__handleRef(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 3)
{
lean_object* x_2; 
x_2 = lean_ctor_get(x_1, 0);
lean_inc(x_2);
if (lean_obj_tag(x_2) == 0)
{
return x_1;
}
else
{
uint8_t x_3; 
x_3 = !lean_is_exclusive(x_2);
if (x_3 == 0)
{
lean_object* x_4; 
x_4 = lean_ctor_get(x_2, 0);
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_5; 
x_5 = lean_ctor_get(x_1, 1);
lean_inc(x_5);
if (lean_obj_tag(x_5) == 0)
{
lean_free_object(x_2);
lean_dec(x_4);
return x_1;
}
else
{
lean_object* x_6; 
x_6 = lean_ctor_get(x_5, 1);
lean_inc(x_6);
if (lean_obj_tag(x_6) == 0)
{
uint8_t x_7; 
x_7 = !lean_is_exclusive(x_1);
if (x_7 == 0)
{
lean_object* x_8; lean_object* x_9; uint8_t x_10; 
x_8 = lean_ctor_get(x_1, 1);
lean_dec(x_8);
x_9 = lean_ctor_get(x_1, 0);
lean_dec(x_9);
x_10 = !lean_is_exclusive(x_4);
if (x_10 == 0)
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_5);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; uint8_t x_16; 
x_12 = lean_ctor_get(x_4, 0);
x_13 = lean_ctor_get(x_5, 0);
x_14 = lean_ctor_get(x_5, 1);
lean_dec(x_14);
x_15 = l_CakeML_maybe__handleRef___closed__2;
lean_inc(x_12);
x_16 = l_List_beq___at___private_CakeML_Core_Mlstring_0__CakeML_beqmlstring____x40_CakeML_Core_Mlstring___hyg_81____spec__1(x_12, x_15);
if (x_16 == 0)
{
lean_object* x_17; 
x_17 = lean_box(0);
lean_ctor_set(x_5, 1, x_17);
return x_1;
}
else
{
lean_object* x_18; 
lean_free_object(x_5);
lean_free_object(x_4);
lean_dec(x_12);
lean_free_object(x_1);
lean_free_object(x_2);
x_18 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_18, 0, x_13);
return x_18;
}
}
else
{
lean_object* x_19; lean_object* x_20; lean_object* x_21; uint8_t x_22; 
x_19 = lean_ctor_get(x_4, 0);
x_20 = lean_ctor_get(x_5, 0);
lean_inc(x_20);
lean_dec(x_5);
x_21 = l_CakeML_maybe__handleRef___closed__2;
lean_inc(x_19);
x_22 = l_List_beq___at___private_CakeML_Core_Mlstring_0__CakeML_beqmlstring____x40_CakeML_Core_Mlstring___hyg_81____spec__1(x_19, x_21);
if (x_22 == 0)
{
lean_object* x_23; lean_object* x_24; 
x_23 = lean_box(0);
x_24 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_24, 0, x_20);
lean_ctor_set(x_24, 1, x_23);
lean_ctor_set(x_1, 1, x_24);
return x_1;
}
else
{
lean_object* x_25; 
lean_free_object(x_4);
lean_dec(x_19);
lean_free_object(x_1);
lean_free_object(x_2);
x_25 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_25, 0, x_20);
return x_25;
}
}
}
else
{
lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; uint8_t x_30; 
x_26 = lean_ctor_get(x_4, 0);
lean_inc(x_26);
lean_dec(x_4);
x_27 = lean_ctor_get(x_5, 0);
lean_inc(x_27);
if (lean_is_exclusive(x_5)) {
 lean_ctor_release(x_5, 0);
 lean_ctor_release(x_5, 1);
 x_28 = x_5;
} else {
 lean_dec_ref(x_5);
 x_28 = lean_box(0);
}
x_29 = l_CakeML_maybe__handleRef___closed__2;
lean_inc(x_26);
x_30 = l_List_beq___at___private_CakeML_Core_Mlstring_0__CakeML_beqmlstring____x40_CakeML_Core_Mlstring___hyg_81____spec__1(x_26, x_29);
if (x_30 == 0)
{
lean_object* x_31; lean_object* x_32; lean_object* x_33; 
x_31 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_31, 0, x_26);
lean_ctor_set(x_2, 0, x_31);
x_32 = lean_box(0);
if (lean_is_scalar(x_28)) {
 x_33 = lean_alloc_ctor(1, 2, 0);
} else {
 x_33 = x_28;
}
lean_ctor_set(x_33, 0, x_27);
lean_ctor_set(x_33, 1, x_32);
lean_ctor_set(x_1, 1, x_33);
return x_1;
}
else
{
lean_object* x_34; 
lean_dec(x_28);
lean_dec(x_26);
lean_free_object(x_1);
lean_free_object(x_2);
x_34 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_34, 0, x_27);
return x_34;
}
}
}
else
{
lean_object* x_35; lean_object* x_36; lean_object* x_37; lean_object* x_38; lean_object* x_39; uint8_t x_40; 
lean_dec(x_1);
x_35 = lean_ctor_get(x_4, 0);
lean_inc(x_35);
if (lean_is_exclusive(x_4)) {
 lean_ctor_release(x_4, 0);
 x_36 = x_4;
} else {
 lean_dec_ref(x_4);
 x_36 = lean_box(0);
}
x_37 = lean_ctor_get(x_5, 0);
lean_inc(x_37);
if (lean_is_exclusive(x_5)) {
 lean_ctor_release(x_5, 0);
 lean_ctor_release(x_5, 1);
 x_38 = x_5;
} else {
 lean_dec_ref(x_5);
 x_38 = lean_box(0);
}
x_39 = l_CakeML_maybe__handleRef___closed__2;
lean_inc(x_35);
x_40 = l_List_beq___at___private_CakeML_Core_Mlstring_0__CakeML_beqmlstring____x40_CakeML_Core_Mlstring___hyg_81____spec__1(x_35, x_39);
if (x_40 == 0)
{
lean_object* x_41; lean_object* x_42; lean_object* x_43; lean_object* x_44; 
if (lean_is_scalar(x_36)) {
 x_41 = lean_alloc_ctor(0, 1, 0);
} else {
 x_41 = x_36;
}
lean_ctor_set(x_41, 0, x_35);
lean_ctor_set(x_2, 0, x_41);
x_42 = lean_box(0);
if (lean_is_scalar(x_38)) {
 x_43 = lean_alloc_ctor(1, 2, 0);
} else {
 x_43 = x_38;
}
lean_ctor_set(x_43, 0, x_37);
lean_ctor_set(x_43, 1, x_42);
x_44 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_44, 0, x_2);
lean_ctor_set(x_44, 1, x_43);
return x_44;
}
else
{
lean_object* x_45; 
lean_dec(x_38);
lean_dec(x_36);
lean_dec(x_35);
lean_free_object(x_2);
x_45 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_45, 0, x_37);
return x_45;
}
}
}
else
{
lean_dec(x_6);
lean_dec(x_5);
lean_free_object(x_2);
lean_dec(x_4);
return x_1;
}
}
}
else
{
lean_free_object(x_2);
lean_dec(x_4);
return x_1;
}
}
else
{
lean_object* x_46; 
x_46 = lean_ctor_get(x_2, 0);
lean_inc(x_46);
lean_dec(x_2);
if (lean_obj_tag(x_46) == 0)
{
lean_object* x_47; 
x_47 = lean_ctor_get(x_1, 1);
lean_inc(x_47);
if (lean_obj_tag(x_47) == 0)
{
lean_dec(x_46);
return x_1;
}
else
{
lean_object* x_48; 
x_48 = lean_ctor_get(x_47, 1);
lean_inc(x_48);
if (lean_obj_tag(x_48) == 0)
{
lean_object* x_49; lean_object* x_50; lean_object* x_51; lean_object* x_52; lean_object* x_53; lean_object* x_54; uint8_t x_55; 
if (lean_is_exclusive(x_1)) {
 lean_ctor_release(x_1, 0);
 lean_ctor_release(x_1, 1);
 x_49 = x_1;
} else {
 lean_dec_ref(x_1);
 x_49 = lean_box(0);
}
x_50 = lean_ctor_get(x_46, 0);
lean_inc(x_50);
if (lean_is_exclusive(x_46)) {
 lean_ctor_release(x_46, 0);
 x_51 = x_46;
} else {
 lean_dec_ref(x_46);
 x_51 = lean_box(0);
}
x_52 = lean_ctor_get(x_47, 0);
lean_inc(x_52);
if (lean_is_exclusive(x_47)) {
 lean_ctor_release(x_47, 0);
 lean_ctor_release(x_47, 1);
 x_53 = x_47;
} else {
 lean_dec_ref(x_47);
 x_53 = lean_box(0);
}
x_54 = l_CakeML_maybe__handleRef___closed__2;
lean_inc(x_50);
x_55 = l_List_beq___at___private_CakeML_Core_Mlstring_0__CakeML_beqmlstring____x40_CakeML_Core_Mlstring___hyg_81____spec__1(x_50, x_54);
if (x_55 == 0)
{
lean_object* x_56; lean_object* x_57; lean_object* x_58; lean_object* x_59; lean_object* x_60; 
if (lean_is_scalar(x_51)) {
 x_56 = lean_alloc_ctor(0, 1, 0);
} else {
 x_56 = x_51;
}
lean_ctor_set(x_56, 0, x_50);
x_57 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_57, 0, x_56);
x_58 = lean_box(0);
if (lean_is_scalar(x_53)) {
 x_59 = lean_alloc_ctor(1, 2, 0);
} else {
 x_59 = x_53;
}
lean_ctor_set(x_59, 0, x_52);
lean_ctor_set(x_59, 1, x_58);
if (lean_is_scalar(x_49)) {
 x_60 = lean_alloc_ctor(3, 2, 0);
} else {
 x_60 = x_49;
}
lean_ctor_set(x_60, 0, x_57);
lean_ctor_set(x_60, 1, x_59);
return x_60;
}
else
{
lean_object* x_61; 
lean_dec(x_53);
lean_dec(x_51);
lean_dec(x_50);
lean_dec(x_49);
x_61 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_61, 0, x_52);
return x_61;
}
}
else
{
lean_dec(x_48);
lean_dec(x_47);
lean_dec(x_46);
return x_1;
}
}
}
else
{
lean_dec(x_46);
return x_1;
}
}
}
}
else
{
return x_1;
}
}
}
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Pattern___spec__2(lean_object* x_1, size_t x_2, size_t x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; 
x_5 = lean_usize_dec_eq(x_2, x_3);
if (x_5 == 0)
{
size_t x_6; size_t x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; 
x_6 = 1;
x_7 = lean_usize_sub(x_2, x_6);
x_8 = lean_array_uget(x_1, x_7);
x_9 = lean_box(0);
x_10 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_10, 0, x_4);
lean_ctor_set(x_10, 1, x_9);
x_11 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_11, 0, x_8);
lean_ctor_set(x_11, 1, x_10);
x_12 = l_CakeML_mk__binop___closed__4;
x_13 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_13, 0, x_12);
lean_ctor_set(x_13, 1, x_11);
x_2 = x_7;
x_4 = x_13;
goto _start;
}
else
{
return x_4;
}
}
}
LEAN_EXPORT lean_object* l_List_foldrTR___at_CakeML_ptree__Pattern___spec__1(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; uint8_t x_6; 
x_3 = lean_array_mk(x_2);
x_4 = lean_array_get_size(x_3);
x_5 = lean_unsigned_to_nat(0u);
x_6 = lean_nat_dec_lt(x_5, x_4);
if (x_6 == 0)
{
lean_dec(x_4);
lean_dec(x_3);
return x_1;
}
else
{
size_t x_7; size_t x_8; lean_object* x_9; 
x_7 = lean_usize_of_nat(x_4);
lean_dec(x_4);
x_8 = 0;
x_9 = l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Pattern___spec__2(x_3, x_7, x_8, x_1);
lean_dec(x_3);
return x_9;
}
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_box(5);
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(4);
x_2 = l_CakeML_ptree__Pattern___closed__1;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_box(0);
x_3 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Pattern___closed__3;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_mk__binop___closed__2;
x_2 = lean_alloc_ctor(64, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_box(0);
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_box(16);
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__8() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(15);
x_2 = l_CakeML_ptree__Pattern___closed__7;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__9() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_box(39);
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__10() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("[]", 2, 2);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Pattern___closed__10;
x_2 = lean_string_data(x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__12() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Pattern___closed__11;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__13() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Pattern___closed__12;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__14() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_CakeML_ptree__Pattern___closed__13;
x_3 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Pattern___closed__15() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Pattern___closed__14;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Pattern(uint8_t x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_3; 
lean_dec(x_2);
x_3 = lean_box(0);
return x_3;
}
else
{
uint8_t x_4; 
x_4 = !lean_is_exclusive(x_2);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; uint8_t x_7; uint8_t x_8; 
x_5 = lean_ctor_get(x_2, 0);
x_6 = lean_ctor_get(x_2, 1);
x_7 = lean_unbox(x_5);
x_8 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_1, x_7);
if (x_8 == 0)
{
lean_object* x_9; 
lean_free_object(x_2);
lean_dec(x_6);
lean_dec(x_5);
x_9 = lean_box(0);
return x_9;
}
else
{
uint8_t x_10; uint8_t x_11; uint8_t x_12; 
x_10 = 51;
x_11 = lean_unbox(x_5);
x_12 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_11, x_10);
if (x_12 == 0)
{
uint8_t x_13; uint8_t x_14; uint8_t x_15; 
x_13 = 52;
x_14 = lean_unbox(x_5);
x_15 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_14, x_13);
if (x_15 == 0)
{
uint8_t x_16; uint8_t x_17; uint8_t x_18; 
x_16 = 53;
x_17 = lean_unbox(x_5);
x_18 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_17, x_16);
if (x_18 == 0)
{
uint8_t x_19; uint8_t x_20; uint8_t x_21; 
x_19 = 54;
x_20 = lean_unbox(x_5);
x_21 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_20, x_19);
if (x_21 == 0)
{
uint8_t x_22; uint8_t x_23; uint8_t x_24; 
lean_free_object(x_2);
x_22 = 55;
x_23 = lean_unbox(x_5);
x_24 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_23, x_22);
if (x_24 == 0)
{
uint8_t x_25; uint8_t x_26; uint8_t x_27; 
x_25 = 56;
x_26 = lean_unbox(x_5);
x_27 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_26, x_25);
if (x_27 == 0)
{
uint8_t x_28; uint8_t x_29; uint8_t x_30; 
x_28 = 57;
x_29 = lean_unbox(x_5);
lean_dec(x_5);
x_30 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_29, x_28);
if (x_30 == 0)
{
lean_object* x_31; 
lean_dec(x_6);
x_31 = lean_box(0);
return x_31;
}
else
{
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_32; 
x_32 = lean_box(0);
return x_32;
}
else
{
lean_object* x_33; 
x_33 = lean_ctor_get(x_6, 1);
lean_inc(x_33);
if (lean_obj_tag(x_33) == 0)
{
lean_object* x_34; 
lean_dec(x_6);
x_34 = lean_box(0);
return x_34;
}
else
{
lean_object* x_35; 
x_35 = lean_ctor_get(x_33, 1);
lean_inc(x_35);
if (lean_obj_tag(x_35) == 0)
{
uint8_t x_36; 
x_36 = !lean_is_exclusive(x_6);
if (x_36 == 0)
{
lean_object* x_37; uint8_t x_38; 
x_37 = lean_ctor_get(x_6, 1);
lean_dec(x_37);
x_38 = !lean_is_exclusive(x_33);
if (x_38 == 0)
{
lean_object* x_39; lean_object* x_40; lean_object* x_41; uint8_t x_42; 
x_39 = lean_ctor_get(x_33, 1);
lean_dec(x_39);
x_40 = lean_box(0);
lean_ctor_set(x_33, 1, x_40);
x_41 = l_CakeML_ptree__Pattern___closed__2;
x_42 = l_CakeML_tokcheckl(x_6, x_41);
if (x_42 == 0)
{
lean_object* x_43; 
x_43 = lean_box(0);
return x_43;
}
else
{
lean_object* x_44; 
x_44 = l_CakeML_ptree__Pattern___closed__4;
return x_44;
}
}
else
{
lean_object* x_45; lean_object* x_46; lean_object* x_47; lean_object* x_48; uint8_t x_49; 
x_45 = lean_ctor_get(x_33, 0);
lean_inc(x_45);
lean_dec(x_33);
x_46 = lean_box(0);
x_47 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_47, 0, x_45);
lean_ctor_set(x_47, 1, x_46);
lean_ctor_set(x_6, 1, x_47);
x_48 = l_CakeML_ptree__Pattern___closed__2;
x_49 = l_CakeML_tokcheckl(x_6, x_48);
if (x_49 == 0)
{
lean_object* x_50; 
x_50 = lean_box(0);
return x_50;
}
else
{
lean_object* x_51; 
x_51 = l_CakeML_ptree__Pattern___closed__4;
return x_51;
}
}
}
else
{
lean_object* x_52; lean_object* x_53; lean_object* x_54; lean_object* x_55; lean_object* x_56; lean_object* x_57; lean_object* x_58; uint8_t x_59; 
x_52 = lean_ctor_get(x_6, 0);
lean_inc(x_52);
lean_dec(x_6);
x_53 = lean_ctor_get(x_33, 0);
lean_inc(x_53);
if (lean_is_exclusive(x_33)) {
 lean_ctor_release(x_33, 0);
 lean_ctor_release(x_33, 1);
 x_54 = x_33;
} else {
 lean_dec_ref(x_33);
 x_54 = lean_box(0);
}
x_55 = lean_box(0);
if (lean_is_scalar(x_54)) {
 x_56 = lean_alloc_ctor(1, 2, 0);
} else {
 x_56 = x_54;
}
lean_ctor_set(x_56, 0, x_53);
lean_ctor_set(x_56, 1, x_55);
x_57 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_57, 0, x_52);
lean_ctor_set(x_57, 1, x_56);
x_58 = l_CakeML_ptree__Pattern___closed__2;
x_59 = l_CakeML_tokcheckl(x_57, x_58);
if (x_59 == 0)
{
lean_object* x_60; 
x_60 = lean_box(0);
return x_60;
}
else
{
lean_object* x_61; 
x_61 = l_CakeML_ptree__Pattern___closed__4;
return x_61;
}
}
}
else
{
lean_object* x_62; 
x_62 = lean_ctor_get(x_35, 1);
lean_inc(x_62);
if (lean_obj_tag(x_62) == 0)
{
lean_object* x_63; uint8_t x_64; 
x_63 = lean_ctor_get(x_6, 0);
lean_inc(x_63);
lean_dec(x_6);
x_64 = !lean_is_exclusive(x_33);
if (x_64 == 0)
{
lean_object* x_65; lean_object* x_66; uint8_t x_67; 
x_65 = lean_ctor_get(x_33, 0);
x_66 = lean_ctor_get(x_33, 1);
lean_dec(x_66);
x_67 = !lean_is_exclusive(x_35);
if (x_67 == 0)
{
lean_object* x_68; lean_object* x_69; lean_object* x_70; uint8_t x_71; 
x_68 = lean_ctor_get(x_35, 1);
lean_dec(x_68);
x_69 = lean_box(0);
lean_ctor_set(x_35, 1, x_69);
lean_ctor_set(x_33, 0, x_63);
x_70 = l_CakeML_ptree__Pattern___closed__2;
x_71 = l_CakeML_tokcheckl(x_33, x_70);
if (x_71 == 0)
{
lean_object* x_72; 
lean_dec(x_65);
x_72 = lean_box(0);
return x_72;
}
else
{
lean_object* x_73; 
x_73 = l_CakeML_ptree__Plist(x_65);
if (lean_obj_tag(x_73) == 0)
{
lean_object* x_74; 
x_74 = lean_box(0);
return x_74;
}
else
{
uint8_t x_75; 
x_75 = !lean_is_exclusive(x_73);
if (x_75 == 0)
{
lean_object* x_76; lean_object* x_77; 
x_76 = lean_ctor_get(x_73, 0);
x_77 = lean_ctor_get(x_76, 1);
lean_inc(x_77);
if (lean_obj_tag(x_77) == 0)
{
lean_object* x_78; 
x_78 = lean_ctor_get(x_76, 0);
lean_inc(x_78);
lean_dec(x_76);
lean_ctor_set(x_73, 0, x_78);
return x_73;
}
else
{
uint8_t x_79; 
x_79 = !lean_is_exclusive(x_77);
if (x_79 == 0)
{
lean_object* x_80; lean_object* x_81; lean_object* x_82; 
x_80 = lean_ctor_get(x_77, 1);
lean_dec(x_80);
x_81 = lean_ctor_get(x_77, 0);
lean_dec(x_81);
x_82 = lean_box(0);
lean_ctor_set_tag(x_77, 3);
lean_ctor_set(x_77, 1, x_76);
lean_ctor_set(x_77, 0, x_82);
lean_ctor_set(x_73, 0, x_77);
return x_73;
}
else
{
lean_object* x_83; lean_object* x_84; 
lean_dec(x_77);
x_83 = lean_box(0);
x_84 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_84, 0, x_83);
lean_ctor_set(x_84, 1, x_76);
lean_ctor_set(x_73, 0, x_84);
return x_73;
}
}
}
else
{
lean_object* x_85; lean_object* x_86; 
x_85 = lean_ctor_get(x_73, 0);
lean_inc(x_85);
lean_dec(x_73);
x_86 = lean_ctor_get(x_85, 1);
lean_inc(x_86);
if (lean_obj_tag(x_86) == 0)
{
lean_object* x_87; lean_object* x_88; 
x_87 = lean_ctor_get(x_85, 0);
lean_inc(x_87);
lean_dec(x_85);
x_88 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_88, 0, x_87);
return x_88;
}
else
{
lean_object* x_89; lean_object* x_90; lean_object* x_91; lean_object* x_92; 
if (lean_is_exclusive(x_86)) {
 lean_ctor_release(x_86, 0);
 lean_ctor_release(x_86, 1);
 x_89 = x_86;
} else {
 lean_dec_ref(x_86);
 x_89 = lean_box(0);
}
x_90 = lean_box(0);
if (lean_is_scalar(x_89)) {
 x_91 = lean_alloc_ctor(3, 2, 0);
} else {
 x_91 = x_89;
 lean_ctor_set_tag(x_91, 3);
}
lean_ctor_set(x_91, 0, x_90);
lean_ctor_set(x_91, 1, x_85);
x_92 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_92, 0, x_91);
return x_92;
}
}
}
}
}
else
{
lean_object* x_93; lean_object* x_94; lean_object* x_95; lean_object* x_96; uint8_t x_97; 
x_93 = lean_ctor_get(x_35, 0);
lean_inc(x_93);
lean_dec(x_35);
x_94 = lean_box(0);
x_95 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_95, 0, x_93);
lean_ctor_set(x_95, 1, x_94);
lean_ctor_set(x_33, 1, x_95);
lean_ctor_set(x_33, 0, x_63);
x_96 = l_CakeML_ptree__Pattern___closed__2;
x_97 = l_CakeML_tokcheckl(x_33, x_96);
if (x_97 == 0)
{
lean_object* x_98; 
lean_dec(x_65);
x_98 = lean_box(0);
return x_98;
}
else
{
lean_object* x_99; 
x_99 = l_CakeML_ptree__Plist(x_65);
if (lean_obj_tag(x_99) == 0)
{
lean_object* x_100; 
x_100 = lean_box(0);
return x_100;
}
else
{
lean_object* x_101; lean_object* x_102; lean_object* x_103; 
x_101 = lean_ctor_get(x_99, 0);
lean_inc(x_101);
if (lean_is_exclusive(x_99)) {
 lean_ctor_release(x_99, 0);
 x_102 = x_99;
} else {
 lean_dec_ref(x_99);
 x_102 = lean_box(0);
}
x_103 = lean_ctor_get(x_101, 1);
lean_inc(x_103);
if (lean_obj_tag(x_103) == 0)
{
lean_object* x_104; lean_object* x_105; 
x_104 = lean_ctor_get(x_101, 0);
lean_inc(x_104);
lean_dec(x_101);
if (lean_is_scalar(x_102)) {
 x_105 = lean_alloc_ctor(1, 1, 0);
} else {
 x_105 = x_102;
}
lean_ctor_set(x_105, 0, x_104);
return x_105;
}
else
{
lean_object* x_106; lean_object* x_107; lean_object* x_108; lean_object* x_109; 
if (lean_is_exclusive(x_103)) {
 lean_ctor_release(x_103, 0);
 lean_ctor_release(x_103, 1);
 x_106 = x_103;
} else {
 lean_dec_ref(x_103);
 x_106 = lean_box(0);
}
x_107 = lean_box(0);
if (lean_is_scalar(x_106)) {
 x_108 = lean_alloc_ctor(3, 2, 0);
} else {
 x_108 = x_106;
 lean_ctor_set_tag(x_108, 3);
}
lean_ctor_set(x_108, 0, x_107);
lean_ctor_set(x_108, 1, x_101);
if (lean_is_scalar(x_102)) {
 x_109 = lean_alloc_ctor(1, 1, 0);
} else {
 x_109 = x_102;
}
lean_ctor_set(x_109, 0, x_108);
return x_109;
}
}
}
}
}
else
{
lean_object* x_110; lean_object* x_111; lean_object* x_112; lean_object* x_113; lean_object* x_114; lean_object* x_115; lean_object* x_116; uint8_t x_117; 
x_110 = lean_ctor_get(x_33, 0);
lean_inc(x_110);
lean_dec(x_33);
x_111 = lean_ctor_get(x_35, 0);
lean_inc(x_111);
if (lean_is_exclusive(x_35)) {
 lean_ctor_release(x_35, 0);
 lean_ctor_release(x_35, 1);
 x_112 = x_35;
} else {
 lean_dec_ref(x_35);
 x_112 = lean_box(0);
}
x_113 = lean_box(0);
if (lean_is_scalar(x_112)) {
 x_114 = lean_alloc_ctor(1, 2, 0);
} else {
 x_114 = x_112;
}
lean_ctor_set(x_114, 0, x_111);
lean_ctor_set(x_114, 1, x_113);
x_115 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_115, 0, x_63);
lean_ctor_set(x_115, 1, x_114);
x_116 = l_CakeML_ptree__Pattern___closed__2;
x_117 = l_CakeML_tokcheckl(x_115, x_116);
if (x_117 == 0)
{
lean_object* x_118; 
lean_dec(x_110);
x_118 = lean_box(0);
return x_118;
}
else
{
lean_object* x_119; 
x_119 = l_CakeML_ptree__Plist(x_110);
if (lean_obj_tag(x_119) == 0)
{
lean_object* x_120; 
x_120 = lean_box(0);
return x_120;
}
else
{
lean_object* x_121; lean_object* x_122; lean_object* x_123; 
x_121 = lean_ctor_get(x_119, 0);
lean_inc(x_121);
if (lean_is_exclusive(x_119)) {
 lean_ctor_release(x_119, 0);
 x_122 = x_119;
} else {
 lean_dec_ref(x_119);
 x_122 = lean_box(0);
}
x_123 = lean_ctor_get(x_121, 1);
lean_inc(x_123);
if (lean_obj_tag(x_123) == 0)
{
lean_object* x_124; lean_object* x_125; 
x_124 = lean_ctor_get(x_121, 0);
lean_inc(x_124);
lean_dec(x_121);
if (lean_is_scalar(x_122)) {
 x_125 = lean_alloc_ctor(1, 1, 0);
} else {
 x_125 = x_122;
}
lean_ctor_set(x_125, 0, x_124);
return x_125;
}
else
{
lean_object* x_126; lean_object* x_127; lean_object* x_128; lean_object* x_129; 
if (lean_is_exclusive(x_123)) {
 lean_ctor_release(x_123, 0);
 lean_ctor_release(x_123, 1);
 x_126 = x_123;
} else {
 lean_dec_ref(x_123);
 x_126 = lean_box(0);
}
x_127 = lean_box(0);
if (lean_is_scalar(x_126)) {
 x_128 = lean_alloc_ctor(3, 2, 0);
} else {
 x_128 = x_126;
 lean_ctor_set_tag(x_128, 3);
}
lean_ctor_set(x_128, 0, x_127);
lean_ctor_set(x_128, 1, x_121);
if (lean_is_scalar(x_122)) {
 x_129 = lean_alloc_ctor(1, 1, 0);
} else {
 x_129 = x_122;
}
lean_ctor_set(x_129, 0, x_128);
return x_129;
}
}
}
}
}
else
{
lean_object* x_130; 
lean_dec(x_62);
lean_dec(x_35);
lean_dec(x_33);
lean_dec(x_6);
x_130 = lean_box(0);
return x_130;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_131; 
x_131 = lean_box(0);
return x_131;
}
else
{
lean_object* x_132; 
x_132 = lean_ctor_get(x_6, 1);
lean_inc(x_132);
if (lean_obj_tag(x_132) == 0)
{
lean_object* x_133; 
x_133 = lean_ctor_get(x_6, 0);
lean_inc(x_133);
lean_dec(x_6);
x_1 = x_22;
x_2 = x_133;
goto _start;
}
else
{
lean_object* x_135; 
x_135 = lean_ctor_get(x_132, 1);
lean_inc(x_135);
if (lean_obj_tag(x_135) == 0)
{
lean_object* x_136; 
lean_dec(x_132);
lean_dec(x_6);
x_136 = lean_box(0);
return x_136;
}
else
{
lean_object* x_137; 
x_137 = lean_ctor_get(x_135, 1);
lean_inc(x_137);
if (lean_obj_tag(x_137) == 0)
{
lean_object* x_138; lean_object* x_139; uint8_t x_140; 
x_138 = lean_ctor_get(x_6, 0);
lean_inc(x_138);
lean_dec(x_6);
x_139 = lean_ctor_get(x_132, 0);
lean_inc(x_139);
lean_dec(x_132);
x_140 = !lean_is_exclusive(x_135);
if (x_140 == 0)
{
lean_object* x_141; lean_object* x_142; lean_object* x_143; uint8_t x_144; 
x_141 = lean_ctor_get(x_135, 0);
x_142 = lean_ctor_get(x_135, 1);
lean_dec(x_142);
x_143 = lean_box(10);
x_144 = l_CakeML_tokcheck(x_139, x_143);
if (x_144 == 0)
{
lean_object* x_145; 
lean_free_object(x_135);
lean_dec(x_141);
lean_dec(x_138);
x_145 = lean_box(0);
return x_145;
}
else
{
lean_object* x_146; 
x_146 = l_CakeML_ptree__Pattern(x_22, x_138);
if (lean_obj_tag(x_146) == 0)
{
lean_object* x_147; 
lean_free_object(x_135);
lean_dec(x_141);
x_147 = lean_box(0);
return x_147;
}
else
{
lean_object* x_148; uint8_t x_149; lean_object* x_150; 
x_148 = lean_ctor_get(x_146, 0);
lean_inc(x_148);
lean_dec(x_146);
x_149 = 8;
x_150 = l_CakeML_ptree__Type(x_149, x_141);
if (lean_obj_tag(x_150) == 0)
{
lean_object* x_151; 
lean_dec(x_148);
lean_free_object(x_135);
x_151 = lean_box(0);
return x_151;
}
else
{
uint8_t x_152; 
x_152 = !lean_is_exclusive(x_150);
if (x_152 == 0)
{
lean_object* x_153; 
x_153 = lean_ctor_get(x_150, 0);
lean_ctor_set_tag(x_135, 6);
lean_ctor_set(x_135, 1, x_153);
lean_ctor_set(x_135, 0, x_148);
lean_ctor_set(x_150, 0, x_135);
return x_150;
}
else
{
lean_object* x_154; lean_object* x_155; 
x_154 = lean_ctor_get(x_150, 0);
lean_inc(x_154);
lean_dec(x_150);
lean_ctor_set_tag(x_135, 6);
lean_ctor_set(x_135, 1, x_154);
lean_ctor_set(x_135, 0, x_148);
x_155 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_155, 0, x_135);
return x_155;
}
}
}
}
}
else
{
lean_object* x_156; lean_object* x_157; uint8_t x_158; 
x_156 = lean_ctor_get(x_135, 0);
lean_inc(x_156);
lean_dec(x_135);
x_157 = lean_box(10);
x_158 = l_CakeML_tokcheck(x_139, x_157);
if (x_158 == 0)
{
lean_object* x_159; 
lean_dec(x_156);
lean_dec(x_138);
x_159 = lean_box(0);
return x_159;
}
else
{
lean_object* x_160; 
x_160 = l_CakeML_ptree__Pattern(x_22, x_138);
if (lean_obj_tag(x_160) == 0)
{
lean_object* x_161; 
lean_dec(x_156);
x_161 = lean_box(0);
return x_161;
}
else
{
lean_object* x_162; uint8_t x_163; lean_object* x_164; 
x_162 = lean_ctor_get(x_160, 0);
lean_inc(x_162);
lean_dec(x_160);
x_163 = 8;
x_164 = l_CakeML_ptree__Type(x_163, x_156);
if (lean_obj_tag(x_164) == 0)
{
lean_object* x_165; 
lean_dec(x_162);
x_165 = lean_box(0);
return x_165;
}
else
{
lean_object* x_166; lean_object* x_167; lean_object* x_168; lean_object* x_169; 
x_166 = lean_ctor_get(x_164, 0);
lean_inc(x_166);
if (lean_is_exclusive(x_164)) {
 lean_ctor_release(x_164, 0);
 x_167 = x_164;
} else {
 lean_dec_ref(x_164);
 x_167 = lean_box(0);
}
x_168 = lean_alloc_ctor(6, 2, 0);
lean_ctor_set(x_168, 0, x_162);
lean_ctor_set(x_168, 1, x_166);
if (lean_is_scalar(x_167)) {
 x_169 = lean_alloc_ctor(1, 1, 0);
} else {
 x_169 = x_167;
}
lean_ctor_set(x_169, 0, x_168);
return x_169;
}
}
}
}
}
else
{
lean_object* x_170; 
lean_dec(x_137);
lean_dec(x_135);
lean_dec(x_132);
lean_dec(x_6);
x_170 = lean_box(0);
return x_170;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_171; 
x_171 = lean_box(0);
return x_171;
}
else
{
lean_object* x_172; 
x_172 = lean_ctor_get(x_6, 1);
lean_inc(x_172);
if (lean_obj_tag(x_172) == 0)
{
lean_object* x_173; 
x_173 = lean_ctor_get(x_6, 0);
lean_inc(x_173);
lean_dec(x_6);
x_1 = x_19;
x_2 = x_173;
goto _start;
}
else
{
lean_object* x_175; 
x_175 = lean_ctor_get(x_172, 1);
lean_inc(x_175);
if (lean_obj_tag(x_175) == 0)
{
lean_object* x_176; 
lean_dec(x_172);
lean_dec(x_6);
x_176 = lean_box(0);
return x_176;
}
else
{
lean_object* x_177; 
x_177 = lean_ctor_get(x_175, 1);
lean_inc(x_177);
if (lean_obj_tag(x_177) == 0)
{
lean_object* x_178; lean_object* x_179; uint8_t x_180; 
x_178 = lean_ctor_get(x_6, 0);
lean_inc(x_178);
lean_dec(x_6);
x_179 = lean_ctor_get(x_172, 0);
lean_inc(x_179);
lean_dec(x_172);
x_180 = !lean_is_exclusive(x_175);
if (x_180 == 0)
{
lean_object* x_181; lean_object* x_182; lean_object* x_183; uint8_t x_184; 
x_181 = lean_ctor_get(x_175, 0);
x_182 = lean_ctor_get(x_175, 1);
lean_dec(x_182);
x_183 = lean_box(23);
x_184 = l_CakeML_tokcheck(x_179, x_183);
if (x_184 == 0)
{
lean_object* x_185; 
lean_free_object(x_175);
lean_dec(x_181);
lean_dec(x_178);
x_185 = lean_box(0);
return x_185;
}
else
{
lean_object* x_186; 
x_186 = l_CakeML_ptree__Pattern(x_19, x_181);
if (lean_obj_tag(x_186) == 0)
{
lean_object* x_187; 
lean_free_object(x_175);
lean_dec(x_178);
x_187 = lean_box(0);
return x_187;
}
else
{
lean_object* x_188; lean_object* x_189; 
x_188 = lean_ctor_get(x_186, 0);
lean_inc(x_188);
lean_dec(x_186);
x_189 = l_CakeML_ptree__V(x_178);
if (lean_obj_tag(x_189) == 0)
{
lean_object* x_190; 
lean_dec(x_188);
lean_free_object(x_175);
x_190 = lean_box(0);
return x_190;
}
else
{
uint8_t x_191; 
x_191 = !lean_is_exclusive(x_189);
if (x_191 == 0)
{
lean_object* x_192; 
x_192 = lean_ctor_get(x_189, 0);
lean_ctor_set_tag(x_175, 5);
lean_ctor_set(x_175, 1, x_192);
lean_ctor_set(x_175, 0, x_188);
lean_ctor_set(x_189, 0, x_175);
return x_189;
}
else
{
lean_object* x_193; lean_object* x_194; 
x_193 = lean_ctor_get(x_189, 0);
lean_inc(x_193);
lean_dec(x_189);
lean_ctor_set_tag(x_175, 5);
lean_ctor_set(x_175, 1, x_193);
lean_ctor_set(x_175, 0, x_188);
x_194 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_194, 0, x_175);
return x_194;
}
}
}
}
}
else
{
lean_object* x_195; lean_object* x_196; uint8_t x_197; 
x_195 = lean_ctor_get(x_175, 0);
lean_inc(x_195);
lean_dec(x_175);
x_196 = lean_box(23);
x_197 = l_CakeML_tokcheck(x_179, x_196);
if (x_197 == 0)
{
lean_object* x_198; 
lean_dec(x_195);
lean_dec(x_178);
x_198 = lean_box(0);
return x_198;
}
else
{
lean_object* x_199; 
x_199 = l_CakeML_ptree__Pattern(x_19, x_195);
if (lean_obj_tag(x_199) == 0)
{
lean_object* x_200; 
lean_dec(x_178);
x_200 = lean_box(0);
return x_200;
}
else
{
lean_object* x_201; lean_object* x_202; 
x_201 = lean_ctor_get(x_199, 0);
lean_inc(x_201);
lean_dec(x_199);
x_202 = l_CakeML_ptree__V(x_178);
if (lean_obj_tag(x_202) == 0)
{
lean_object* x_203; 
lean_dec(x_201);
x_203 = lean_box(0);
return x_203;
}
else
{
lean_object* x_204; lean_object* x_205; lean_object* x_206; lean_object* x_207; 
x_204 = lean_ctor_get(x_202, 0);
lean_inc(x_204);
if (lean_is_exclusive(x_202)) {
 lean_ctor_release(x_202, 0);
 x_205 = x_202;
} else {
 lean_dec_ref(x_202);
 x_205 = lean_box(0);
}
x_206 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_206, 0, x_201);
lean_ctor_set(x_206, 1, x_204);
if (lean_is_scalar(x_205)) {
 x_207 = lean_alloc_ctor(1, 1, 0);
} else {
 x_207 = x_205;
}
lean_ctor_set(x_207, 0, x_206);
return x_207;
}
}
}
}
}
else
{
lean_object* x_208; 
lean_dec(x_177);
lean_dec(x_175);
lean_dec(x_172);
lean_dec(x_6);
x_208 = lean_box(0);
return x_208;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_209; 
lean_free_object(x_2);
x_209 = lean_box(0);
return x_209;
}
else
{
lean_object* x_210; 
x_210 = lean_ctor_get(x_6, 1);
lean_inc(x_210);
if (lean_obj_tag(x_210) == 0)
{
lean_object* x_211; 
lean_free_object(x_2);
x_211 = lean_ctor_get(x_6, 0);
lean_inc(x_211);
lean_dec(x_6);
x_1 = x_16;
x_2 = x_211;
goto _start;
}
else
{
lean_object* x_213; 
x_213 = lean_ctor_get(x_210, 1);
lean_inc(x_213);
if (lean_obj_tag(x_213) == 0)
{
lean_object* x_214; 
lean_dec(x_210);
lean_free_object(x_2);
lean_dec(x_6);
x_214 = lean_box(0);
return x_214;
}
else
{
lean_object* x_215; 
x_215 = lean_ctor_get(x_213, 1);
lean_inc(x_215);
if (lean_obj_tag(x_215) == 0)
{
lean_object* x_216; uint8_t x_217; 
x_216 = lean_ctor_get(x_6, 0);
lean_inc(x_216);
lean_dec(x_6);
x_217 = !lean_is_exclusive(x_210);
if (x_217 == 0)
{
lean_object* x_218; lean_object* x_219; uint8_t x_220; 
x_218 = lean_ctor_get(x_210, 0);
x_219 = lean_ctor_get(x_210, 1);
lean_dec(x_219);
x_220 = !lean_is_exclusive(x_213);
if (x_220 == 0)
{
lean_object* x_221; lean_object* x_222; lean_object* x_223; uint8_t x_224; 
x_221 = lean_ctor_get(x_213, 0);
x_222 = lean_ctor_get(x_213, 1);
lean_dec(x_222);
x_223 = l_CakeML_ptree__Pattern___closed__5;
x_224 = l_CakeML_tokcheck(x_218, x_223);
if (x_224 == 0)
{
lean_object* x_225; 
lean_free_object(x_213);
lean_dec(x_221);
lean_free_object(x_210);
lean_dec(x_216);
lean_free_object(x_2);
x_225 = lean_box(0);
return x_225;
}
else
{
lean_object* x_226; 
x_226 = l_CakeML_ptree__Pattern(x_16, x_216);
if (lean_obj_tag(x_226) == 0)
{
lean_object* x_227; 
lean_free_object(x_213);
lean_dec(x_221);
lean_free_object(x_210);
lean_free_object(x_2);
x_227 = lean_box(0);
return x_227;
}
else
{
lean_object* x_228; lean_object* x_229; 
x_228 = lean_ctor_get(x_226, 0);
lean_inc(x_228);
lean_dec(x_226);
x_229 = l_CakeML_ptree__Pattern(x_19, x_221);
if (lean_obj_tag(x_229) == 0)
{
lean_object* x_230; 
lean_dec(x_228);
lean_free_object(x_213);
lean_free_object(x_210);
lean_free_object(x_2);
x_230 = lean_box(0);
return x_230;
}
else
{
uint8_t x_231; 
x_231 = !lean_is_exclusive(x_229);
if (x_231 == 0)
{
lean_object* x_232; lean_object* x_233; lean_object* x_234; 
x_232 = lean_ctor_get(x_229, 0);
x_233 = lean_box(0);
lean_ctor_set(x_213, 1, x_233);
lean_ctor_set(x_213, 0, x_232);
lean_ctor_set(x_210, 0, x_228);
x_234 = l_CakeML_mk__binop___closed__4;
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_210);
lean_ctor_set(x_2, 0, x_234);
lean_ctor_set(x_229, 0, x_2);
return x_229;
}
else
{
lean_object* x_235; lean_object* x_236; lean_object* x_237; lean_object* x_238; 
x_235 = lean_ctor_get(x_229, 0);
lean_inc(x_235);
lean_dec(x_229);
x_236 = lean_box(0);
lean_ctor_set(x_213, 1, x_236);
lean_ctor_set(x_213, 0, x_235);
lean_ctor_set(x_210, 0, x_228);
x_237 = l_CakeML_mk__binop___closed__4;
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_210);
lean_ctor_set(x_2, 0, x_237);
x_238 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_238, 0, x_2);
return x_238;
}
}
}
}
}
else
{
lean_object* x_239; lean_object* x_240; uint8_t x_241; 
x_239 = lean_ctor_get(x_213, 0);
lean_inc(x_239);
lean_dec(x_213);
x_240 = l_CakeML_ptree__Pattern___closed__5;
x_241 = l_CakeML_tokcheck(x_218, x_240);
if (x_241 == 0)
{
lean_object* x_242; 
lean_dec(x_239);
lean_free_object(x_210);
lean_dec(x_216);
lean_free_object(x_2);
x_242 = lean_box(0);
return x_242;
}
else
{
lean_object* x_243; 
x_243 = l_CakeML_ptree__Pattern(x_16, x_216);
if (lean_obj_tag(x_243) == 0)
{
lean_object* x_244; 
lean_dec(x_239);
lean_free_object(x_210);
lean_free_object(x_2);
x_244 = lean_box(0);
return x_244;
}
else
{
lean_object* x_245; lean_object* x_246; 
x_245 = lean_ctor_get(x_243, 0);
lean_inc(x_245);
lean_dec(x_243);
x_246 = l_CakeML_ptree__Pattern(x_19, x_239);
if (lean_obj_tag(x_246) == 0)
{
lean_object* x_247; 
lean_dec(x_245);
lean_free_object(x_210);
lean_free_object(x_2);
x_247 = lean_box(0);
return x_247;
}
else
{
lean_object* x_248; lean_object* x_249; lean_object* x_250; lean_object* x_251; lean_object* x_252; lean_object* x_253; 
x_248 = lean_ctor_get(x_246, 0);
lean_inc(x_248);
if (lean_is_exclusive(x_246)) {
 lean_ctor_release(x_246, 0);
 x_249 = x_246;
} else {
 lean_dec_ref(x_246);
 x_249 = lean_box(0);
}
x_250 = lean_box(0);
x_251 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_251, 0, x_248);
lean_ctor_set(x_251, 1, x_250);
lean_ctor_set(x_210, 1, x_251);
lean_ctor_set(x_210, 0, x_245);
x_252 = l_CakeML_mk__binop___closed__4;
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_210);
lean_ctor_set(x_2, 0, x_252);
if (lean_is_scalar(x_249)) {
 x_253 = lean_alloc_ctor(1, 1, 0);
} else {
 x_253 = x_249;
}
lean_ctor_set(x_253, 0, x_2);
return x_253;
}
}
}
}
}
else
{
lean_object* x_254; lean_object* x_255; lean_object* x_256; lean_object* x_257; uint8_t x_258; 
x_254 = lean_ctor_get(x_210, 0);
lean_inc(x_254);
lean_dec(x_210);
x_255 = lean_ctor_get(x_213, 0);
lean_inc(x_255);
if (lean_is_exclusive(x_213)) {
 lean_ctor_release(x_213, 0);
 lean_ctor_release(x_213, 1);
 x_256 = x_213;
} else {
 lean_dec_ref(x_213);
 x_256 = lean_box(0);
}
x_257 = l_CakeML_ptree__Pattern___closed__5;
x_258 = l_CakeML_tokcheck(x_254, x_257);
if (x_258 == 0)
{
lean_object* x_259; 
lean_dec(x_256);
lean_dec(x_255);
lean_dec(x_216);
lean_free_object(x_2);
x_259 = lean_box(0);
return x_259;
}
else
{
lean_object* x_260; 
x_260 = l_CakeML_ptree__Pattern(x_16, x_216);
if (lean_obj_tag(x_260) == 0)
{
lean_object* x_261; 
lean_dec(x_256);
lean_dec(x_255);
lean_free_object(x_2);
x_261 = lean_box(0);
return x_261;
}
else
{
lean_object* x_262; lean_object* x_263; 
x_262 = lean_ctor_get(x_260, 0);
lean_inc(x_262);
lean_dec(x_260);
x_263 = l_CakeML_ptree__Pattern(x_19, x_255);
if (lean_obj_tag(x_263) == 0)
{
lean_object* x_264; 
lean_dec(x_262);
lean_dec(x_256);
lean_free_object(x_2);
x_264 = lean_box(0);
return x_264;
}
else
{
lean_object* x_265; lean_object* x_266; lean_object* x_267; lean_object* x_268; lean_object* x_269; lean_object* x_270; lean_object* x_271; 
x_265 = lean_ctor_get(x_263, 0);
lean_inc(x_265);
if (lean_is_exclusive(x_263)) {
 lean_ctor_release(x_263, 0);
 x_266 = x_263;
} else {
 lean_dec_ref(x_263);
 x_266 = lean_box(0);
}
x_267 = lean_box(0);
if (lean_is_scalar(x_256)) {
 x_268 = lean_alloc_ctor(1, 2, 0);
} else {
 x_268 = x_256;
}
lean_ctor_set(x_268, 0, x_265);
lean_ctor_set(x_268, 1, x_267);
x_269 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_269, 0, x_262);
lean_ctor_set(x_269, 1, x_268);
x_270 = l_CakeML_mk__binop___closed__4;
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_269);
lean_ctor_set(x_2, 0, x_270);
if (lean_is_scalar(x_266)) {
 x_271 = lean_alloc_ctor(1, 1, 0);
} else {
 x_271 = x_266;
}
lean_ctor_set(x_271, 0, x_2);
return x_271;
}
}
}
}
}
else
{
lean_object* x_272; 
lean_dec(x_215);
lean_dec(x_213);
lean_dec(x_210);
lean_free_object(x_2);
lean_dec(x_6);
x_272 = lean_box(0);
return x_272;
}
}
}
}
}
}
else
{
lean_free_object(x_2);
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_273; 
x_273 = lean_box(0);
return x_273;
}
else
{
lean_object* x_274; 
x_274 = lean_ctor_get(x_6, 1);
lean_inc(x_274);
if (lean_obj_tag(x_274) == 0)
{
lean_object* x_275; 
x_275 = lean_ctor_get(x_6, 0);
lean_inc(x_275);
lean_dec(x_6);
x_1 = x_10;
x_2 = x_275;
goto _start;
}
else
{
lean_object* x_277; 
x_277 = lean_ctor_get(x_274, 1);
lean_inc(x_277);
if (lean_obj_tag(x_277) == 0)
{
lean_object* x_278; lean_object* x_279; lean_object* x_280; 
x_278 = lean_ctor_get(x_6, 0);
lean_inc(x_278);
lean_dec(x_6);
x_279 = lean_ctor_get(x_274, 0);
lean_inc(x_279);
lean_dec(x_274);
x_280 = l_CakeML_ptree__Pattern(x_13, x_278);
if (lean_obj_tag(x_280) == 0)
{
lean_object* x_281; 
lean_dec(x_279);
x_281 = lean_box(0);
return x_281;
}
else
{
lean_object* x_282; lean_object* x_283; 
x_282 = lean_ctor_get(x_280, 0);
lean_inc(x_282);
lean_dec(x_280);
x_283 = l_CakeML_ptree__Pattern(x_10, x_279);
if (lean_obj_tag(x_283) == 0)
{
lean_object* x_284; 
lean_dec(x_282);
x_284 = lean_box(0);
return x_284;
}
else
{
uint8_t x_285; 
x_285 = !lean_is_exclusive(x_283);
if (x_285 == 0)
{
lean_object* x_286; lean_object* x_287; lean_object* x_288; 
x_286 = lean_ctor_get(x_283, 0);
x_287 = l_CakeML_Papply(x_282, x_286);
x_288 = l_CakeML_maybe__handleRef(x_287);
lean_ctor_set(x_283, 0, x_288);
return x_283;
}
else
{
lean_object* x_289; lean_object* x_290; lean_object* x_291; lean_object* x_292; 
x_289 = lean_ctor_get(x_283, 0);
lean_inc(x_289);
lean_dec(x_283);
x_290 = l_CakeML_Papply(x_282, x_289);
x_291 = l_CakeML_maybe__handleRef(x_290);
x_292 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_292, 0, x_291);
return x_292;
}
}
}
}
else
{
lean_object* x_293; 
lean_dec(x_277);
lean_dec(x_274);
lean_dec(x_6);
x_293 = lean_box(0);
return x_293;
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_294; 
lean_free_object(x_2);
x_294 = lean_box(0);
return x_294;
}
else
{
lean_object* x_295; 
x_295 = lean_ctor_get(x_6, 1);
lean_inc(x_295);
if (lean_obj_tag(x_295) == 0)
{
lean_object* x_296; lean_object* x_297; 
x_296 = lean_ctor_get(x_6, 0);
lean_inc(x_296);
lean_dec(x_6);
x_297 = l_CakeML_ptree__ConstructorName(x_296);
if (lean_obj_tag(x_297) == 0)
{
lean_object* x_298; 
lean_free_object(x_2);
x_298 = lean_box(0);
return x_298;
}
else
{
uint8_t x_299; 
x_299 = !lean_is_exclusive(x_297);
if (x_299 == 0)
{
lean_object* x_300; lean_object* x_301; 
x_300 = lean_box(0);
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_300);
lean_ctor_set(x_2, 0, x_297);
x_301 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_301, 0, x_2);
return x_301;
}
else
{
lean_object* x_302; lean_object* x_303; lean_object* x_304; lean_object* x_305; 
x_302 = lean_ctor_get(x_297, 0);
lean_inc(x_302);
lean_dec(x_297);
x_303 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_303, 0, x_302);
x_304 = lean_box(0);
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_304);
lean_ctor_set(x_2, 0, x_303);
x_305 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_305, 0, x_2);
return x_305;
}
}
}
else
{
lean_object* x_306; 
lean_free_object(x_2);
x_306 = lean_ctor_get(x_295, 1);
lean_inc(x_306);
if (lean_obj_tag(x_306) == 0)
{
lean_object* x_307; lean_object* x_308; lean_object* x_309; 
x_307 = lean_ctor_get(x_6, 0);
lean_inc(x_307);
lean_dec(x_6);
x_308 = lean_ctor_get(x_295, 0);
lean_inc(x_308);
lean_dec(x_295);
x_309 = l_CakeML_ptree__Pattern(x_13, x_307);
if (lean_obj_tag(x_309) == 0)
{
lean_object* x_310; 
lean_dec(x_308);
x_310 = lean_box(0);
return x_310;
}
else
{
lean_object* x_311; lean_object* x_312; 
x_311 = lean_ctor_get(x_309, 0);
lean_inc(x_311);
lean_dec(x_309);
x_312 = l_CakeML_ptree__Pattern(x_10, x_308);
if (lean_obj_tag(x_312) == 0)
{
lean_object* x_313; 
lean_dec(x_311);
x_313 = lean_box(0);
return x_313;
}
else
{
uint8_t x_314; 
x_314 = !lean_is_exclusive(x_312);
if (x_314 == 0)
{
lean_object* x_315; lean_object* x_316; 
x_315 = lean_ctor_get(x_312, 0);
x_316 = l_CakeML_Papply(x_311, x_315);
lean_ctor_set(x_312, 0, x_316);
return x_312;
}
else
{
lean_object* x_317; lean_object* x_318; lean_object* x_319; 
x_317 = lean_ctor_get(x_312, 0);
lean_inc(x_317);
lean_dec(x_312);
x_318 = l_CakeML_Papply(x_311, x_317);
x_319 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_319, 0, x_318);
return x_319;
}
}
}
}
else
{
lean_object* x_320; 
lean_dec(x_306);
lean_dec(x_295);
lean_dec(x_6);
x_320 = lean_box(0);
return x_320;
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_321; 
lean_free_object(x_2);
x_321 = lean_box(0);
return x_321;
}
else
{
lean_object* x_322; 
x_322 = lean_ctor_get(x_6, 1);
lean_inc(x_322);
if (lean_obj_tag(x_322) == 0)
{
lean_object* x_323; uint8_t x_324; lean_object* x_325; 
x_323 = lean_ctor_get(x_6, 0);
lean_inc(x_323);
lean_dec(x_6);
x_324 = 57;
lean_inc(x_323);
x_325 = l_CakeML_ptree__Pattern(x_324, x_323);
if (lean_obj_tag(x_325) == 0)
{
lean_object* x_326; 
lean_inc(x_323);
x_326 = l_CakeML_ptree__ConstructorName(x_323);
if (lean_obj_tag(x_326) == 0)
{
lean_object* x_327; 
lean_free_object(x_2);
lean_inc(x_323);
x_327 = l_CakeML_ptree__V(x_323);
if (lean_obj_tag(x_327) == 0)
{
lean_object* x_328; 
lean_inc(x_323);
x_328 = l_CakeML_destLf___rarg(x_323);
if (lean_obj_tag(x_328) == 0)
{
lean_object* x_329; uint8_t x_330; 
x_329 = lean_box(17);
x_330 = l_CakeML_tokcheck(x_323, x_329);
if (x_330 == 0)
{
lean_object* x_331; 
x_331 = lean_box(0);
return x_331;
}
else
{
lean_object* x_332; 
x_332 = l_CakeML_ptree__Pattern___closed__6;
return x_332;
}
}
else
{
uint8_t x_333; 
x_333 = !lean_is_exclusive(x_328);
if (x_333 == 0)
{
lean_object* x_334; lean_object* x_335; 
x_334 = lean_ctor_get(x_328, 0);
x_335 = l_CakeML_destTOK___rarg(x_334);
if (lean_obj_tag(x_335) == 0)
{
lean_object* x_336; uint8_t x_337; 
lean_free_object(x_328);
x_336 = lean_box(17);
x_337 = l_CakeML_tokcheck(x_323, x_336);
if (x_337 == 0)
{
lean_object* x_338; 
x_338 = lean_box(0);
return x_338;
}
else
{
lean_object* x_339; 
x_339 = l_CakeML_ptree__Pattern___closed__6;
return x_339;
}
}
else
{
uint8_t x_340; 
x_340 = !lean_is_exclusive(x_335);
if (x_340 == 0)
{
lean_object* x_341; lean_object* x_342; 
x_341 = lean_ctor_get(x_335, 0);
lean_inc(x_341);
x_342 = l_CakeML_destIntT(x_341);
if (lean_obj_tag(x_342) == 0)
{
lean_object* x_343; 
lean_inc(x_341);
x_343 = l_CakeML_destStringT(x_341);
if (lean_obj_tag(x_343) == 0)
{
lean_object* x_344; 
x_344 = l_CakeML_destCharT(x_341);
if (lean_obj_tag(x_344) == 0)
{
lean_object* x_345; uint8_t x_346; 
lean_free_object(x_335);
lean_free_object(x_328);
x_345 = lean_box(17);
x_346 = l_CakeML_tokcheck(x_323, x_345);
if (x_346 == 0)
{
lean_object* x_347; 
x_347 = lean_box(0);
return x_347;
}
else
{
lean_object* x_348; 
x_348 = l_CakeML_ptree__Pattern___closed__6;
return x_348;
}
}
else
{
uint8_t x_349; 
lean_dec(x_323);
x_349 = !lean_is_exclusive(x_344);
if (x_349 == 0)
{
lean_object* x_350; 
x_350 = lean_ctor_get(x_344, 0);
lean_ctor_set(x_335, 0, x_350);
lean_ctor_set_tag(x_328, 2);
lean_ctor_set(x_328, 0, x_335);
lean_ctor_set(x_344, 0, x_328);
return x_344;
}
else
{
lean_object* x_351; lean_object* x_352; 
x_351 = lean_ctor_get(x_344, 0);
lean_inc(x_351);
lean_dec(x_344);
lean_ctor_set(x_335, 0, x_351);
lean_ctor_set_tag(x_328, 2);
lean_ctor_set(x_328, 0, x_335);
x_352 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_352, 0, x_328);
return x_352;
}
}
}
else
{
uint8_t x_353; 
lean_dec(x_341);
lean_dec(x_323);
x_353 = !lean_is_exclusive(x_343);
if (x_353 == 0)
{
lean_object* x_354; 
x_354 = lean_ctor_get(x_343, 0);
lean_ctor_set_tag(x_335, 2);
lean_ctor_set(x_335, 0, x_354);
lean_ctor_set_tag(x_328, 2);
lean_ctor_set(x_328, 0, x_335);
lean_ctor_set(x_343, 0, x_328);
return x_343;
}
else
{
lean_object* x_355; lean_object* x_356; 
x_355 = lean_ctor_get(x_343, 0);
lean_inc(x_355);
lean_dec(x_343);
lean_ctor_set_tag(x_335, 2);
lean_ctor_set(x_335, 0, x_355);
lean_ctor_set_tag(x_328, 2);
lean_ctor_set(x_328, 0, x_335);
x_356 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_356, 0, x_328);
return x_356;
}
}
}
else
{
uint8_t x_357; 
lean_dec(x_341);
lean_dec(x_323);
x_357 = !lean_is_exclusive(x_342);
if (x_357 == 0)
{
lean_object* x_358; 
x_358 = lean_ctor_get(x_342, 0);
lean_ctor_set_tag(x_335, 0);
lean_ctor_set(x_335, 0, x_358);
lean_ctor_set_tag(x_328, 2);
lean_ctor_set(x_328, 0, x_335);
lean_ctor_set(x_342, 0, x_328);
return x_342;
}
else
{
lean_object* x_359; lean_object* x_360; 
x_359 = lean_ctor_get(x_342, 0);
lean_inc(x_359);
lean_dec(x_342);
lean_ctor_set_tag(x_335, 0);
lean_ctor_set(x_335, 0, x_359);
lean_ctor_set_tag(x_328, 2);
lean_ctor_set(x_328, 0, x_335);
x_360 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_360, 0, x_328);
return x_360;
}
}
}
else
{
lean_object* x_361; lean_object* x_362; 
x_361 = lean_ctor_get(x_335, 0);
lean_inc(x_361);
lean_dec(x_335);
lean_inc(x_361);
x_362 = l_CakeML_destIntT(x_361);
if (lean_obj_tag(x_362) == 0)
{
lean_object* x_363; 
lean_inc(x_361);
x_363 = l_CakeML_destStringT(x_361);
if (lean_obj_tag(x_363) == 0)
{
lean_object* x_364; 
x_364 = l_CakeML_destCharT(x_361);
if (lean_obj_tag(x_364) == 0)
{
lean_object* x_365; uint8_t x_366; 
lean_free_object(x_328);
x_365 = lean_box(17);
x_366 = l_CakeML_tokcheck(x_323, x_365);
if (x_366 == 0)
{
lean_object* x_367; 
x_367 = lean_box(0);
return x_367;
}
else
{
lean_object* x_368; 
x_368 = l_CakeML_ptree__Pattern___closed__6;
return x_368;
}
}
else
{
lean_object* x_369; lean_object* x_370; lean_object* x_371; lean_object* x_372; 
lean_dec(x_323);
x_369 = lean_ctor_get(x_364, 0);
lean_inc(x_369);
if (lean_is_exclusive(x_364)) {
 lean_ctor_release(x_364, 0);
 x_370 = x_364;
} else {
 lean_dec_ref(x_364);
 x_370 = lean_box(0);
}
x_371 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_371, 0, x_369);
lean_ctor_set_tag(x_328, 2);
lean_ctor_set(x_328, 0, x_371);
if (lean_is_scalar(x_370)) {
 x_372 = lean_alloc_ctor(1, 1, 0);
} else {
 x_372 = x_370;
}
lean_ctor_set(x_372, 0, x_328);
return x_372;
}
}
else
{
lean_object* x_373; lean_object* x_374; lean_object* x_375; lean_object* x_376; 
lean_dec(x_361);
lean_dec(x_323);
x_373 = lean_ctor_get(x_363, 0);
lean_inc(x_373);
if (lean_is_exclusive(x_363)) {
 lean_ctor_release(x_363, 0);
 x_374 = x_363;
} else {
 lean_dec_ref(x_363);
 x_374 = lean_box(0);
}
x_375 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_375, 0, x_373);
lean_ctor_set_tag(x_328, 2);
lean_ctor_set(x_328, 0, x_375);
if (lean_is_scalar(x_374)) {
 x_376 = lean_alloc_ctor(1, 1, 0);
} else {
 x_376 = x_374;
}
lean_ctor_set(x_376, 0, x_328);
return x_376;
}
}
else
{
lean_object* x_377; lean_object* x_378; lean_object* x_379; lean_object* x_380; 
lean_dec(x_361);
lean_dec(x_323);
x_377 = lean_ctor_get(x_362, 0);
lean_inc(x_377);
if (lean_is_exclusive(x_362)) {
 lean_ctor_release(x_362, 0);
 x_378 = x_362;
} else {
 lean_dec_ref(x_362);
 x_378 = lean_box(0);
}
x_379 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_379, 0, x_377);
lean_ctor_set_tag(x_328, 2);
lean_ctor_set(x_328, 0, x_379);
if (lean_is_scalar(x_378)) {
 x_380 = lean_alloc_ctor(1, 1, 0);
} else {
 x_380 = x_378;
}
lean_ctor_set(x_380, 0, x_328);
return x_380;
}
}
}
}
else
{
lean_object* x_381; lean_object* x_382; 
x_381 = lean_ctor_get(x_328, 0);
lean_inc(x_381);
lean_dec(x_328);
x_382 = l_CakeML_destTOK___rarg(x_381);
if (lean_obj_tag(x_382) == 0)
{
lean_object* x_383; uint8_t x_384; 
x_383 = lean_box(17);
x_384 = l_CakeML_tokcheck(x_323, x_383);
if (x_384 == 0)
{
lean_object* x_385; 
x_385 = lean_box(0);
return x_385;
}
else
{
lean_object* x_386; 
x_386 = l_CakeML_ptree__Pattern___closed__6;
return x_386;
}
}
else
{
lean_object* x_387; lean_object* x_388; lean_object* x_389; 
x_387 = lean_ctor_get(x_382, 0);
lean_inc(x_387);
if (lean_is_exclusive(x_382)) {
 lean_ctor_release(x_382, 0);
 x_388 = x_382;
} else {
 lean_dec_ref(x_382);
 x_388 = lean_box(0);
}
lean_inc(x_387);
x_389 = l_CakeML_destIntT(x_387);
if (lean_obj_tag(x_389) == 0)
{
lean_object* x_390; 
lean_inc(x_387);
x_390 = l_CakeML_destStringT(x_387);
if (lean_obj_tag(x_390) == 0)
{
lean_object* x_391; 
x_391 = l_CakeML_destCharT(x_387);
if (lean_obj_tag(x_391) == 0)
{
lean_object* x_392; uint8_t x_393; 
lean_dec(x_388);
x_392 = lean_box(17);
x_393 = l_CakeML_tokcheck(x_323, x_392);
if (x_393 == 0)
{
lean_object* x_394; 
x_394 = lean_box(0);
return x_394;
}
else
{
lean_object* x_395; 
x_395 = l_CakeML_ptree__Pattern___closed__6;
return x_395;
}
}
else
{
lean_object* x_396; lean_object* x_397; lean_object* x_398; lean_object* x_399; lean_object* x_400; 
lean_dec(x_323);
x_396 = lean_ctor_get(x_391, 0);
lean_inc(x_396);
if (lean_is_exclusive(x_391)) {
 lean_ctor_release(x_391, 0);
 x_397 = x_391;
} else {
 lean_dec_ref(x_391);
 x_397 = lean_box(0);
}
if (lean_is_scalar(x_388)) {
 x_398 = lean_alloc_ctor(1, 1, 0);
} else {
 x_398 = x_388;
}
lean_ctor_set(x_398, 0, x_396);
x_399 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_399, 0, x_398);
if (lean_is_scalar(x_397)) {
 x_400 = lean_alloc_ctor(1, 1, 0);
} else {
 x_400 = x_397;
}
lean_ctor_set(x_400, 0, x_399);
return x_400;
}
}
else
{
lean_object* x_401; lean_object* x_402; lean_object* x_403; lean_object* x_404; lean_object* x_405; 
lean_dec(x_387);
lean_dec(x_323);
x_401 = lean_ctor_get(x_390, 0);
lean_inc(x_401);
if (lean_is_exclusive(x_390)) {
 lean_ctor_release(x_390, 0);
 x_402 = x_390;
} else {
 lean_dec_ref(x_390);
 x_402 = lean_box(0);
}
if (lean_is_scalar(x_388)) {
 x_403 = lean_alloc_ctor(2, 1, 0);
} else {
 x_403 = x_388;
 lean_ctor_set_tag(x_403, 2);
}
lean_ctor_set(x_403, 0, x_401);
x_404 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_404, 0, x_403);
if (lean_is_scalar(x_402)) {
 x_405 = lean_alloc_ctor(1, 1, 0);
} else {
 x_405 = x_402;
}
lean_ctor_set(x_405, 0, x_404);
return x_405;
}
}
else
{
lean_object* x_406; lean_object* x_407; lean_object* x_408; lean_object* x_409; lean_object* x_410; 
lean_dec(x_387);
lean_dec(x_323);
x_406 = lean_ctor_get(x_389, 0);
lean_inc(x_406);
if (lean_is_exclusive(x_389)) {
 lean_ctor_release(x_389, 0);
 x_407 = x_389;
} else {
 lean_dec_ref(x_389);
 x_407 = lean_box(0);
}
if (lean_is_scalar(x_388)) {
 x_408 = lean_alloc_ctor(0, 1, 0);
} else {
 x_408 = x_388;
 lean_ctor_set_tag(x_408, 0);
}
lean_ctor_set(x_408, 0, x_406);
x_409 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_409, 0, x_408);
if (lean_is_scalar(x_407)) {
 x_410 = lean_alloc_ctor(1, 1, 0);
} else {
 x_410 = x_407;
}
lean_ctor_set(x_410, 0, x_409);
return x_410;
}
}
}
}
}
else
{
uint8_t x_411; 
lean_dec(x_323);
x_411 = !lean_is_exclusive(x_327);
if (x_411 == 0)
{
lean_object* x_412; lean_object* x_413; 
x_412 = lean_ctor_get(x_327, 0);
x_413 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_413, 0, x_412);
lean_ctor_set(x_327, 0, x_413);
return x_327;
}
else
{
lean_object* x_414; lean_object* x_415; lean_object* x_416; 
x_414 = lean_ctor_get(x_327, 0);
lean_inc(x_414);
lean_dec(x_327);
x_415 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_415, 0, x_414);
x_416 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_416, 0, x_415);
return x_416;
}
}
}
else
{
uint8_t x_417; 
lean_dec(x_323);
x_417 = !lean_is_exclusive(x_326);
if (x_417 == 0)
{
lean_object* x_418; lean_object* x_419; 
x_418 = lean_box(0);
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_418);
lean_ctor_set(x_2, 0, x_326);
x_419 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_419, 0, x_2);
return x_419;
}
else
{
lean_object* x_420; lean_object* x_421; lean_object* x_422; lean_object* x_423; 
x_420 = lean_ctor_get(x_326, 0);
lean_inc(x_420);
lean_dec(x_326);
x_421 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_421, 0, x_420);
x_422 = lean_box(0);
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_422);
lean_ctor_set(x_2, 0, x_421);
x_423 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_423, 0, x_2);
return x_423;
}
}
}
else
{
uint8_t x_424; 
lean_dec(x_323);
lean_free_object(x_2);
x_424 = !lean_is_exclusive(x_325);
if (x_424 == 0)
{
return x_325;
}
else
{
lean_object* x_425; lean_object* x_426; 
x_425 = lean_ctor_get(x_325, 0);
lean_inc(x_425);
lean_dec(x_325);
x_426 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_426, 0, x_425);
return x_426;
}
}
}
else
{
lean_object* x_427; 
lean_free_object(x_2);
x_427 = lean_ctor_get(x_322, 1);
lean_inc(x_427);
if (lean_obj_tag(x_427) == 0)
{
lean_object* x_428; uint8_t x_429; 
x_428 = lean_ctor_get(x_6, 0);
lean_inc(x_428);
x_429 = !lean_is_exclusive(x_322);
if (x_429 == 0)
{
lean_object* x_430; lean_object* x_431; lean_object* x_432; lean_object* x_433; uint8_t x_434; 
x_430 = lean_ctor_get(x_322, 0);
x_431 = lean_ctor_get(x_322, 1);
lean_dec(x_431);
x_432 = lean_box(0);
x_433 = l_CakeML_ptree__Pattern___closed__8;
x_434 = l_CakeML_tokcheckl(x_6, x_433);
if (x_434 == 0)
{
lean_object* x_435; uint8_t x_436; 
lean_ctor_set(x_322, 1, x_432);
lean_ctor_set(x_322, 0, x_428);
x_435 = l_CakeML_ptree__Pattern___closed__9;
x_436 = l_CakeML_tokcheckl(x_322, x_435);
if (x_436 == 0)
{
lean_object* x_437; 
lean_dec(x_430);
x_437 = lean_box(0);
return x_437;
}
else
{
lean_object* x_438; 
x_438 = l_CakeML_ptree__OpID(x_430);
if (lean_obj_tag(x_438) == 0)
{
lean_object* x_439; 
x_439 = lean_box(0);
return x_439;
}
else
{
lean_object* x_440; lean_object* x_441; 
x_440 = lean_ctor_get(x_438, 0);
lean_inc(x_440);
lean_dec(x_438);
x_441 = l_CakeML_EtoPat(x_440);
return x_441;
}
}
}
else
{
lean_object* x_442; 
lean_free_object(x_322);
lean_dec(x_430);
lean_dec(x_428);
x_442 = l_CakeML_ptree__Pattern___closed__15;
return x_442;
}
}
else
{
lean_object* x_443; lean_object* x_444; lean_object* x_445; uint8_t x_446; 
x_443 = lean_ctor_get(x_322, 0);
lean_inc(x_443);
lean_dec(x_322);
x_444 = lean_box(0);
x_445 = l_CakeML_ptree__Pattern___closed__8;
x_446 = l_CakeML_tokcheckl(x_6, x_445);
if (x_446 == 0)
{
lean_object* x_447; lean_object* x_448; uint8_t x_449; 
x_447 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_447, 0, x_428);
lean_ctor_set(x_447, 1, x_444);
x_448 = l_CakeML_ptree__Pattern___closed__9;
x_449 = l_CakeML_tokcheckl(x_447, x_448);
if (x_449 == 0)
{
lean_object* x_450; 
lean_dec(x_443);
x_450 = lean_box(0);
return x_450;
}
else
{
lean_object* x_451; 
x_451 = l_CakeML_ptree__OpID(x_443);
if (lean_obj_tag(x_451) == 0)
{
lean_object* x_452; 
x_452 = lean_box(0);
return x_452;
}
else
{
lean_object* x_453; lean_object* x_454; 
x_453 = lean_ctor_get(x_451, 0);
lean_inc(x_453);
lean_dec(x_451);
x_454 = l_CakeML_EtoPat(x_453);
return x_454;
}
}
}
else
{
lean_object* x_455; 
lean_dec(x_443);
lean_dec(x_428);
x_455 = l_CakeML_ptree__Pattern___closed__15;
return x_455;
}
}
}
else
{
lean_object* x_456; 
x_456 = lean_ctor_get(x_427, 1);
lean_inc(x_456);
if (lean_obj_tag(x_456) == 0)
{
lean_object* x_457; uint8_t x_458; 
x_457 = lean_ctor_get(x_6, 0);
lean_inc(x_457);
lean_dec(x_6);
x_458 = !lean_is_exclusive(x_322);
if (x_458 == 0)
{
lean_object* x_459; lean_object* x_460; uint8_t x_461; 
x_459 = lean_ctor_get(x_322, 0);
x_460 = lean_ctor_get(x_322, 1);
lean_dec(x_460);
x_461 = !lean_is_exclusive(x_427);
if (x_461 == 0)
{
lean_object* x_462; lean_object* x_463; lean_object* x_464; uint8_t x_465; 
x_462 = lean_ctor_get(x_427, 1);
lean_dec(x_462);
x_463 = lean_box(0);
lean_ctor_set(x_427, 1, x_463);
lean_ctor_set(x_322, 0, x_457);
x_464 = l_CakeML_ptree__Pattern___closed__8;
x_465 = l_CakeML_tokcheckl(x_322, x_464);
if (x_465 == 0)
{
lean_object* x_466; 
lean_dec(x_459);
x_466 = lean_box(0);
return x_466;
}
else
{
lean_object* x_467; 
x_467 = l_CakeML_ptree__Plist(x_459);
if (lean_obj_tag(x_467) == 0)
{
lean_object* x_468; 
x_468 = lean_box(0);
return x_468;
}
else
{
uint8_t x_469; 
x_469 = !lean_is_exclusive(x_467);
if (x_469 == 0)
{
lean_object* x_470; lean_object* x_471; lean_object* x_472; 
x_470 = lean_ctor_get(x_467, 0);
x_471 = l_CakeML_ptree__Pattern___closed__14;
x_472 = l_List_foldrTR___at_CakeML_ptree__Pattern___spec__1(x_471, x_470);
lean_ctor_set(x_467, 0, x_472);
return x_467;
}
else
{
lean_object* x_473; lean_object* x_474; lean_object* x_475; lean_object* x_476; 
x_473 = lean_ctor_get(x_467, 0);
lean_inc(x_473);
lean_dec(x_467);
x_474 = l_CakeML_ptree__Pattern___closed__14;
x_475 = l_List_foldrTR___at_CakeML_ptree__Pattern___spec__1(x_474, x_473);
x_476 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_476, 0, x_475);
return x_476;
}
}
}
}
else
{
lean_object* x_477; lean_object* x_478; lean_object* x_479; lean_object* x_480; uint8_t x_481; 
x_477 = lean_ctor_get(x_427, 0);
lean_inc(x_477);
lean_dec(x_427);
x_478 = lean_box(0);
x_479 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_479, 0, x_477);
lean_ctor_set(x_479, 1, x_478);
lean_ctor_set(x_322, 1, x_479);
lean_ctor_set(x_322, 0, x_457);
x_480 = l_CakeML_ptree__Pattern___closed__8;
x_481 = l_CakeML_tokcheckl(x_322, x_480);
if (x_481 == 0)
{
lean_object* x_482; 
lean_dec(x_459);
x_482 = lean_box(0);
return x_482;
}
else
{
lean_object* x_483; 
x_483 = l_CakeML_ptree__Plist(x_459);
if (lean_obj_tag(x_483) == 0)
{
lean_object* x_484; 
x_484 = lean_box(0);
return x_484;
}
else
{
lean_object* x_485; lean_object* x_486; lean_object* x_487; lean_object* x_488; lean_object* x_489; 
x_485 = lean_ctor_get(x_483, 0);
lean_inc(x_485);
if (lean_is_exclusive(x_483)) {
 lean_ctor_release(x_483, 0);
 x_486 = x_483;
} else {
 lean_dec_ref(x_483);
 x_486 = lean_box(0);
}
x_487 = l_CakeML_ptree__Pattern___closed__14;
x_488 = l_List_foldrTR___at_CakeML_ptree__Pattern___spec__1(x_487, x_485);
if (lean_is_scalar(x_486)) {
 x_489 = lean_alloc_ctor(1, 1, 0);
} else {
 x_489 = x_486;
}
lean_ctor_set(x_489, 0, x_488);
return x_489;
}
}
}
}
else
{
lean_object* x_490; lean_object* x_491; lean_object* x_492; lean_object* x_493; lean_object* x_494; lean_object* x_495; lean_object* x_496; uint8_t x_497; 
x_490 = lean_ctor_get(x_322, 0);
lean_inc(x_490);
lean_dec(x_322);
x_491 = lean_ctor_get(x_427, 0);
lean_inc(x_491);
if (lean_is_exclusive(x_427)) {
 lean_ctor_release(x_427, 0);
 lean_ctor_release(x_427, 1);
 x_492 = x_427;
} else {
 lean_dec_ref(x_427);
 x_492 = lean_box(0);
}
x_493 = lean_box(0);
if (lean_is_scalar(x_492)) {
 x_494 = lean_alloc_ctor(1, 2, 0);
} else {
 x_494 = x_492;
}
lean_ctor_set(x_494, 0, x_491);
lean_ctor_set(x_494, 1, x_493);
x_495 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_495, 0, x_457);
lean_ctor_set(x_495, 1, x_494);
x_496 = l_CakeML_ptree__Pattern___closed__8;
x_497 = l_CakeML_tokcheckl(x_495, x_496);
if (x_497 == 0)
{
lean_object* x_498; 
lean_dec(x_490);
x_498 = lean_box(0);
return x_498;
}
else
{
lean_object* x_499; 
x_499 = l_CakeML_ptree__Plist(x_490);
if (lean_obj_tag(x_499) == 0)
{
lean_object* x_500; 
x_500 = lean_box(0);
return x_500;
}
else
{
lean_object* x_501; lean_object* x_502; lean_object* x_503; lean_object* x_504; lean_object* x_505; 
x_501 = lean_ctor_get(x_499, 0);
lean_inc(x_501);
if (lean_is_exclusive(x_499)) {
 lean_ctor_release(x_499, 0);
 x_502 = x_499;
} else {
 lean_dec_ref(x_499);
 x_502 = lean_box(0);
}
x_503 = l_CakeML_ptree__Pattern___closed__14;
x_504 = l_List_foldrTR___at_CakeML_ptree__Pattern___spec__1(x_503, x_501);
if (lean_is_scalar(x_502)) {
 x_505 = lean_alloc_ctor(1, 1, 0);
} else {
 x_505 = x_502;
}
lean_ctor_set(x_505, 0, x_504);
return x_505;
}
}
}
}
else
{
lean_object* x_506; 
lean_dec(x_456);
lean_dec(x_427);
lean_dec(x_322);
lean_dec(x_6);
x_506 = lean_box(0);
return x_506;
}
}
}
}
}
}
}
else
{
lean_object* x_507; lean_object* x_508; uint8_t x_509; uint8_t x_510; 
x_507 = lean_ctor_get(x_2, 0);
x_508 = lean_ctor_get(x_2, 1);
lean_inc(x_508);
lean_inc(x_507);
lean_dec(x_2);
x_509 = lean_unbox(x_507);
x_510 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_1, x_509);
if (x_510 == 0)
{
lean_object* x_511; 
lean_dec(x_508);
lean_dec(x_507);
x_511 = lean_box(0);
return x_511;
}
else
{
uint8_t x_512; uint8_t x_513; uint8_t x_514; 
x_512 = 51;
x_513 = lean_unbox(x_507);
x_514 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_513, x_512);
if (x_514 == 0)
{
uint8_t x_515; uint8_t x_516; uint8_t x_517; 
x_515 = 52;
x_516 = lean_unbox(x_507);
x_517 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_516, x_515);
if (x_517 == 0)
{
uint8_t x_518; uint8_t x_519; uint8_t x_520; 
x_518 = 53;
x_519 = lean_unbox(x_507);
x_520 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_519, x_518);
if (x_520 == 0)
{
uint8_t x_521; uint8_t x_522; uint8_t x_523; 
x_521 = 54;
x_522 = lean_unbox(x_507);
x_523 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_522, x_521);
if (x_523 == 0)
{
uint8_t x_524; uint8_t x_525; uint8_t x_526; 
x_524 = 55;
x_525 = lean_unbox(x_507);
x_526 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_525, x_524);
if (x_526 == 0)
{
uint8_t x_527; uint8_t x_528; uint8_t x_529; 
x_527 = 56;
x_528 = lean_unbox(x_507);
x_529 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_528, x_527);
if (x_529 == 0)
{
uint8_t x_530; uint8_t x_531; uint8_t x_532; 
x_530 = 57;
x_531 = lean_unbox(x_507);
lean_dec(x_507);
x_532 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_531, x_530);
if (x_532 == 0)
{
lean_object* x_533; 
lean_dec(x_508);
x_533 = lean_box(0);
return x_533;
}
else
{
if (lean_obj_tag(x_508) == 0)
{
lean_object* x_534; 
x_534 = lean_box(0);
return x_534;
}
else
{
lean_object* x_535; 
x_535 = lean_ctor_get(x_508, 1);
lean_inc(x_535);
if (lean_obj_tag(x_535) == 0)
{
lean_object* x_536; 
lean_dec(x_508);
x_536 = lean_box(0);
return x_536;
}
else
{
lean_object* x_537; 
x_537 = lean_ctor_get(x_535, 1);
lean_inc(x_537);
if (lean_obj_tag(x_537) == 0)
{
lean_object* x_538; lean_object* x_539; lean_object* x_540; lean_object* x_541; lean_object* x_542; lean_object* x_543; lean_object* x_544; lean_object* x_545; uint8_t x_546; 
x_538 = lean_ctor_get(x_508, 0);
lean_inc(x_538);
if (lean_is_exclusive(x_508)) {
 lean_ctor_release(x_508, 0);
 lean_ctor_release(x_508, 1);
 x_539 = x_508;
} else {
 lean_dec_ref(x_508);
 x_539 = lean_box(0);
}
x_540 = lean_ctor_get(x_535, 0);
lean_inc(x_540);
if (lean_is_exclusive(x_535)) {
 lean_ctor_release(x_535, 0);
 lean_ctor_release(x_535, 1);
 x_541 = x_535;
} else {
 lean_dec_ref(x_535);
 x_541 = lean_box(0);
}
x_542 = lean_box(0);
if (lean_is_scalar(x_541)) {
 x_543 = lean_alloc_ctor(1, 2, 0);
} else {
 x_543 = x_541;
}
lean_ctor_set(x_543, 0, x_540);
lean_ctor_set(x_543, 1, x_542);
if (lean_is_scalar(x_539)) {
 x_544 = lean_alloc_ctor(1, 2, 0);
} else {
 x_544 = x_539;
}
lean_ctor_set(x_544, 0, x_538);
lean_ctor_set(x_544, 1, x_543);
x_545 = l_CakeML_ptree__Pattern___closed__2;
x_546 = l_CakeML_tokcheckl(x_544, x_545);
if (x_546 == 0)
{
lean_object* x_547; 
x_547 = lean_box(0);
return x_547;
}
else
{
lean_object* x_548; 
x_548 = l_CakeML_ptree__Pattern___closed__4;
return x_548;
}
}
else
{
lean_object* x_549; 
x_549 = lean_ctor_get(x_537, 1);
lean_inc(x_549);
if (lean_obj_tag(x_549) == 0)
{
lean_object* x_550; lean_object* x_551; lean_object* x_552; lean_object* x_553; lean_object* x_554; lean_object* x_555; lean_object* x_556; lean_object* x_557; lean_object* x_558; uint8_t x_559; 
x_550 = lean_ctor_get(x_508, 0);
lean_inc(x_550);
lean_dec(x_508);
x_551 = lean_ctor_get(x_535, 0);
lean_inc(x_551);
if (lean_is_exclusive(x_535)) {
 lean_ctor_release(x_535, 0);
 lean_ctor_release(x_535, 1);
 x_552 = x_535;
} else {
 lean_dec_ref(x_535);
 x_552 = lean_box(0);
}
x_553 = lean_ctor_get(x_537, 0);
lean_inc(x_553);
if (lean_is_exclusive(x_537)) {
 lean_ctor_release(x_537, 0);
 lean_ctor_release(x_537, 1);
 x_554 = x_537;
} else {
 lean_dec_ref(x_537);
 x_554 = lean_box(0);
}
x_555 = lean_box(0);
if (lean_is_scalar(x_554)) {
 x_556 = lean_alloc_ctor(1, 2, 0);
} else {
 x_556 = x_554;
}
lean_ctor_set(x_556, 0, x_553);
lean_ctor_set(x_556, 1, x_555);
if (lean_is_scalar(x_552)) {
 x_557 = lean_alloc_ctor(1, 2, 0);
} else {
 x_557 = x_552;
}
lean_ctor_set(x_557, 0, x_550);
lean_ctor_set(x_557, 1, x_556);
x_558 = l_CakeML_ptree__Pattern___closed__2;
x_559 = l_CakeML_tokcheckl(x_557, x_558);
if (x_559 == 0)
{
lean_object* x_560; 
lean_dec(x_551);
x_560 = lean_box(0);
return x_560;
}
else
{
lean_object* x_561; 
x_561 = l_CakeML_ptree__Plist(x_551);
if (lean_obj_tag(x_561) == 0)
{
lean_object* x_562; 
x_562 = lean_box(0);
return x_562;
}
else
{
lean_object* x_563; lean_object* x_564; lean_object* x_565; 
x_563 = lean_ctor_get(x_561, 0);
lean_inc(x_563);
if (lean_is_exclusive(x_561)) {
 lean_ctor_release(x_561, 0);
 x_564 = x_561;
} else {
 lean_dec_ref(x_561);
 x_564 = lean_box(0);
}
x_565 = lean_ctor_get(x_563, 1);
lean_inc(x_565);
if (lean_obj_tag(x_565) == 0)
{
lean_object* x_566; lean_object* x_567; 
x_566 = lean_ctor_get(x_563, 0);
lean_inc(x_566);
lean_dec(x_563);
if (lean_is_scalar(x_564)) {
 x_567 = lean_alloc_ctor(1, 1, 0);
} else {
 x_567 = x_564;
}
lean_ctor_set(x_567, 0, x_566);
return x_567;
}
else
{
lean_object* x_568; lean_object* x_569; lean_object* x_570; lean_object* x_571; 
if (lean_is_exclusive(x_565)) {
 lean_ctor_release(x_565, 0);
 lean_ctor_release(x_565, 1);
 x_568 = x_565;
} else {
 lean_dec_ref(x_565);
 x_568 = lean_box(0);
}
x_569 = lean_box(0);
if (lean_is_scalar(x_568)) {
 x_570 = lean_alloc_ctor(3, 2, 0);
} else {
 x_570 = x_568;
 lean_ctor_set_tag(x_570, 3);
}
lean_ctor_set(x_570, 0, x_569);
lean_ctor_set(x_570, 1, x_563);
if (lean_is_scalar(x_564)) {
 x_571 = lean_alloc_ctor(1, 1, 0);
} else {
 x_571 = x_564;
}
lean_ctor_set(x_571, 0, x_570);
return x_571;
}
}
}
}
else
{
lean_object* x_572; 
lean_dec(x_549);
lean_dec(x_537);
lean_dec(x_535);
lean_dec(x_508);
x_572 = lean_box(0);
return x_572;
}
}
}
}
}
}
else
{
lean_dec(x_507);
if (lean_obj_tag(x_508) == 0)
{
lean_object* x_573; 
x_573 = lean_box(0);
return x_573;
}
else
{
lean_object* x_574; 
x_574 = lean_ctor_get(x_508, 1);
lean_inc(x_574);
if (lean_obj_tag(x_574) == 0)
{
lean_object* x_575; 
x_575 = lean_ctor_get(x_508, 0);
lean_inc(x_575);
lean_dec(x_508);
x_1 = x_524;
x_2 = x_575;
goto _start;
}
else
{
lean_object* x_577; 
x_577 = lean_ctor_get(x_574, 1);
lean_inc(x_577);
if (lean_obj_tag(x_577) == 0)
{
lean_object* x_578; 
lean_dec(x_574);
lean_dec(x_508);
x_578 = lean_box(0);
return x_578;
}
else
{
lean_object* x_579; 
x_579 = lean_ctor_get(x_577, 1);
lean_inc(x_579);
if (lean_obj_tag(x_579) == 0)
{
lean_object* x_580; lean_object* x_581; lean_object* x_582; lean_object* x_583; lean_object* x_584; uint8_t x_585; 
x_580 = lean_ctor_get(x_508, 0);
lean_inc(x_580);
lean_dec(x_508);
x_581 = lean_ctor_get(x_574, 0);
lean_inc(x_581);
lean_dec(x_574);
x_582 = lean_ctor_get(x_577, 0);
lean_inc(x_582);
if (lean_is_exclusive(x_577)) {
 lean_ctor_release(x_577, 0);
 lean_ctor_release(x_577, 1);
 x_583 = x_577;
} else {
 lean_dec_ref(x_577);
 x_583 = lean_box(0);
}
x_584 = lean_box(10);
x_585 = l_CakeML_tokcheck(x_581, x_584);
if (x_585 == 0)
{
lean_object* x_586; 
lean_dec(x_583);
lean_dec(x_582);
lean_dec(x_580);
x_586 = lean_box(0);
return x_586;
}
else
{
lean_object* x_587; 
x_587 = l_CakeML_ptree__Pattern(x_524, x_580);
if (lean_obj_tag(x_587) == 0)
{
lean_object* x_588; 
lean_dec(x_583);
lean_dec(x_582);
x_588 = lean_box(0);
return x_588;
}
else
{
lean_object* x_589; uint8_t x_590; lean_object* x_591; 
x_589 = lean_ctor_get(x_587, 0);
lean_inc(x_589);
lean_dec(x_587);
x_590 = 8;
x_591 = l_CakeML_ptree__Type(x_590, x_582);
if (lean_obj_tag(x_591) == 0)
{
lean_object* x_592; 
lean_dec(x_589);
lean_dec(x_583);
x_592 = lean_box(0);
return x_592;
}
else
{
lean_object* x_593; lean_object* x_594; lean_object* x_595; lean_object* x_596; 
x_593 = lean_ctor_get(x_591, 0);
lean_inc(x_593);
if (lean_is_exclusive(x_591)) {
 lean_ctor_release(x_591, 0);
 x_594 = x_591;
} else {
 lean_dec_ref(x_591);
 x_594 = lean_box(0);
}
if (lean_is_scalar(x_583)) {
 x_595 = lean_alloc_ctor(6, 2, 0);
} else {
 x_595 = x_583;
 lean_ctor_set_tag(x_595, 6);
}
lean_ctor_set(x_595, 0, x_589);
lean_ctor_set(x_595, 1, x_593);
if (lean_is_scalar(x_594)) {
 x_596 = lean_alloc_ctor(1, 1, 0);
} else {
 x_596 = x_594;
}
lean_ctor_set(x_596, 0, x_595);
return x_596;
}
}
}
}
else
{
lean_object* x_597; 
lean_dec(x_579);
lean_dec(x_577);
lean_dec(x_574);
lean_dec(x_508);
x_597 = lean_box(0);
return x_597;
}
}
}
}
}
}
else
{
lean_dec(x_507);
if (lean_obj_tag(x_508) == 0)
{
lean_object* x_598; 
x_598 = lean_box(0);
return x_598;
}
else
{
lean_object* x_599; 
x_599 = lean_ctor_get(x_508, 1);
lean_inc(x_599);
if (lean_obj_tag(x_599) == 0)
{
lean_object* x_600; 
x_600 = lean_ctor_get(x_508, 0);
lean_inc(x_600);
lean_dec(x_508);
x_1 = x_521;
x_2 = x_600;
goto _start;
}
else
{
lean_object* x_602; 
x_602 = lean_ctor_get(x_599, 1);
lean_inc(x_602);
if (lean_obj_tag(x_602) == 0)
{
lean_object* x_603; 
lean_dec(x_599);
lean_dec(x_508);
x_603 = lean_box(0);
return x_603;
}
else
{
lean_object* x_604; 
x_604 = lean_ctor_get(x_602, 1);
lean_inc(x_604);
if (lean_obj_tag(x_604) == 0)
{
lean_object* x_605; lean_object* x_606; lean_object* x_607; lean_object* x_608; lean_object* x_609; uint8_t x_610; 
x_605 = lean_ctor_get(x_508, 0);
lean_inc(x_605);
lean_dec(x_508);
x_606 = lean_ctor_get(x_599, 0);
lean_inc(x_606);
lean_dec(x_599);
x_607 = lean_ctor_get(x_602, 0);
lean_inc(x_607);
if (lean_is_exclusive(x_602)) {
 lean_ctor_release(x_602, 0);
 lean_ctor_release(x_602, 1);
 x_608 = x_602;
} else {
 lean_dec_ref(x_602);
 x_608 = lean_box(0);
}
x_609 = lean_box(23);
x_610 = l_CakeML_tokcheck(x_606, x_609);
if (x_610 == 0)
{
lean_object* x_611; 
lean_dec(x_608);
lean_dec(x_607);
lean_dec(x_605);
x_611 = lean_box(0);
return x_611;
}
else
{
lean_object* x_612; 
x_612 = l_CakeML_ptree__Pattern(x_521, x_607);
if (lean_obj_tag(x_612) == 0)
{
lean_object* x_613; 
lean_dec(x_608);
lean_dec(x_605);
x_613 = lean_box(0);
return x_613;
}
else
{
lean_object* x_614; lean_object* x_615; 
x_614 = lean_ctor_get(x_612, 0);
lean_inc(x_614);
lean_dec(x_612);
x_615 = l_CakeML_ptree__V(x_605);
if (lean_obj_tag(x_615) == 0)
{
lean_object* x_616; 
lean_dec(x_614);
lean_dec(x_608);
x_616 = lean_box(0);
return x_616;
}
else
{
lean_object* x_617; lean_object* x_618; lean_object* x_619; lean_object* x_620; 
x_617 = lean_ctor_get(x_615, 0);
lean_inc(x_617);
if (lean_is_exclusive(x_615)) {
 lean_ctor_release(x_615, 0);
 x_618 = x_615;
} else {
 lean_dec_ref(x_615);
 x_618 = lean_box(0);
}
if (lean_is_scalar(x_608)) {
 x_619 = lean_alloc_ctor(5, 2, 0);
} else {
 x_619 = x_608;
 lean_ctor_set_tag(x_619, 5);
}
lean_ctor_set(x_619, 0, x_614);
lean_ctor_set(x_619, 1, x_617);
if (lean_is_scalar(x_618)) {
 x_620 = lean_alloc_ctor(1, 1, 0);
} else {
 x_620 = x_618;
}
lean_ctor_set(x_620, 0, x_619);
return x_620;
}
}
}
}
else
{
lean_object* x_621; 
lean_dec(x_604);
lean_dec(x_602);
lean_dec(x_599);
lean_dec(x_508);
x_621 = lean_box(0);
return x_621;
}
}
}
}
}
}
else
{
lean_dec(x_507);
if (lean_obj_tag(x_508) == 0)
{
lean_object* x_622; 
x_622 = lean_box(0);
return x_622;
}
else
{
lean_object* x_623; 
x_623 = lean_ctor_get(x_508, 1);
lean_inc(x_623);
if (lean_obj_tag(x_623) == 0)
{
lean_object* x_624; 
x_624 = lean_ctor_get(x_508, 0);
lean_inc(x_624);
lean_dec(x_508);
x_1 = x_518;
x_2 = x_624;
goto _start;
}
else
{
lean_object* x_626; 
x_626 = lean_ctor_get(x_623, 1);
lean_inc(x_626);
if (lean_obj_tag(x_626) == 0)
{
lean_object* x_627; 
lean_dec(x_623);
lean_dec(x_508);
x_627 = lean_box(0);
return x_627;
}
else
{
lean_object* x_628; 
x_628 = lean_ctor_get(x_626, 1);
lean_inc(x_628);
if (lean_obj_tag(x_628) == 0)
{
lean_object* x_629; lean_object* x_630; lean_object* x_631; lean_object* x_632; lean_object* x_633; lean_object* x_634; uint8_t x_635; 
x_629 = lean_ctor_get(x_508, 0);
lean_inc(x_629);
lean_dec(x_508);
x_630 = lean_ctor_get(x_623, 0);
lean_inc(x_630);
if (lean_is_exclusive(x_623)) {
 lean_ctor_release(x_623, 0);
 lean_ctor_release(x_623, 1);
 x_631 = x_623;
} else {
 lean_dec_ref(x_623);
 x_631 = lean_box(0);
}
x_632 = lean_ctor_get(x_626, 0);
lean_inc(x_632);
if (lean_is_exclusive(x_626)) {
 lean_ctor_release(x_626, 0);
 lean_ctor_release(x_626, 1);
 x_633 = x_626;
} else {
 lean_dec_ref(x_626);
 x_633 = lean_box(0);
}
x_634 = l_CakeML_ptree__Pattern___closed__5;
x_635 = l_CakeML_tokcheck(x_630, x_634);
if (x_635 == 0)
{
lean_object* x_636; 
lean_dec(x_633);
lean_dec(x_632);
lean_dec(x_631);
lean_dec(x_629);
x_636 = lean_box(0);
return x_636;
}
else
{
lean_object* x_637; 
x_637 = l_CakeML_ptree__Pattern(x_518, x_629);
if (lean_obj_tag(x_637) == 0)
{
lean_object* x_638; 
lean_dec(x_633);
lean_dec(x_632);
lean_dec(x_631);
x_638 = lean_box(0);
return x_638;
}
else
{
lean_object* x_639; lean_object* x_640; 
x_639 = lean_ctor_get(x_637, 0);
lean_inc(x_639);
lean_dec(x_637);
x_640 = l_CakeML_ptree__Pattern(x_521, x_632);
if (lean_obj_tag(x_640) == 0)
{
lean_object* x_641; 
lean_dec(x_639);
lean_dec(x_633);
lean_dec(x_631);
x_641 = lean_box(0);
return x_641;
}
else
{
lean_object* x_642; lean_object* x_643; lean_object* x_644; lean_object* x_645; lean_object* x_646; lean_object* x_647; lean_object* x_648; lean_object* x_649; 
x_642 = lean_ctor_get(x_640, 0);
lean_inc(x_642);
if (lean_is_exclusive(x_640)) {
 lean_ctor_release(x_640, 0);
 x_643 = x_640;
} else {
 lean_dec_ref(x_640);
 x_643 = lean_box(0);
}
x_644 = lean_box(0);
if (lean_is_scalar(x_633)) {
 x_645 = lean_alloc_ctor(1, 2, 0);
} else {
 x_645 = x_633;
}
lean_ctor_set(x_645, 0, x_642);
lean_ctor_set(x_645, 1, x_644);
if (lean_is_scalar(x_631)) {
 x_646 = lean_alloc_ctor(1, 2, 0);
} else {
 x_646 = x_631;
}
lean_ctor_set(x_646, 0, x_639);
lean_ctor_set(x_646, 1, x_645);
x_647 = l_CakeML_mk__binop___closed__4;
x_648 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_648, 0, x_647);
lean_ctor_set(x_648, 1, x_646);
if (lean_is_scalar(x_643)) {
 x_649 = lean_alloc_ctor(1, 1, 0);
} else {
 x_649 = x_643;
}
lean_ctor_set(x_649, 0, x_648);
return x_649;
}
}
}
}
else
{
lean_object* x_650; 
lean_dec(x_628);
lean_dec(x_626);
lean_dec(x_623);
lean_dec(x_508);
x_650 = lean_box(0);
return x_650;
}
}
}
}
}
}
else
{
lean_dec(x_507);
if (lean_obj_tag(x_508) == 0)
{
lean_object* x_651; 
x_651 = lean_box(0);
return x_651;
}
else
{
lean_object* x_652; 
x_652 = lean_ctor_get(x_508, 1);
lean_inc(x_652);
if (lean_obj_tag(x_652) == 0)
{
lean_object* x_653; 
x_653 = lean_ctor_get(x_508, 0);
lean_inc(x_653);
lean_dec(x_508);
x_1 = x_512;
x_2 = x_653;
goto _start;
}
else
{
lean_object* x_655; 
x_655 = lean_ctor_get(x_652, 1);
lean_inc(x_655);
if (lean_obj_tag(x_655) == 0)
{
lean_object* x_656; lean_object* x_657; lean_object* x_658; 
x_656 = lean_ctor_get(x_508, 0);
lean_inc(x_656);
lean_dec(x_508);
x_657 = lean_ctor_get(x_652, 0);
lean_inc(x_657);
lean_dec(x_652);
x_658 = l_CakeML_ptree__Pattern(x_515, x_656);
if (lean_obj_tag(x_658) == 0)
{
lean_object* x_659; 
lean_dec(x_657);
x_659 = lean_box(0);
return x_659;
}
else
{
lean_object* x_660; lean_object* x_661; 
x_660 = lean_ctor_get(x_658, 0);
lean_inc(x_660);
lean_dec(x_658);
x_661 = l_CakeML_ptree__Pattern(x_512, x_657);
if (lean_obj_tag(x_661) == 0)
{
lean_object* x_662; 
lean_dec(x_660);
x_662 = lean_box(0);
return x_662;
}
else
{
lean_object* x_663; lean_object* x_664; lean_object* x_665; lean_object* x_666; lean_object* x_667; 
x_663 = lean_ctor_get(x_661, 0);
lean_inc(x_663);
if (lean_is_exclusive(x_661)) {
 lean_ctor_release(x_661, 0);
 x_664 = x_661;
} else {
 lean_dec_ref(x_661);
 x_664 = lean_box(0);
}
x_665 = l_CakeML_Papply(x_660, x_663);
x_666 = l_CakeML_maybe__handleRef(x_665);
if (lean_is_scalar(x_664)) {
 x_667 = lean_alloc_ctor(1, 1, 0);
} else {
 x_667 = x_664;
}
lean_ctor_set(x_667, 0, x_666);
return x_667;
}
}
}
else
{
lean_object* x_668; 
lean_dec(x_655);
lean_dec(x_652);
lean_dec(x_508);
x_668 = lean_box(0);
return x_668;
}
}
}
}
}
else
{
lean_dec(x_507);
if (lean_obj_tag(x_508) == 0)
{
lean_object* x_669; 
x_669 = lean_box(0);
return x_669;
}
else
{
lean_object* x_670; 
x_670 = lean_ctor_get(x_508, 1);
lean_inc(x_670);
if (lean_obj_tag(x_670) == 0)
{
lean_object* x_671; lean_object* x_672; 
x_671 = lean_ctor_get(x_508, 0);
lean_inc(x_671);
lean_dec(x_508);
x_672 = l_CakeML_ptree__ConstructorName(x_671);
if (lean_obj_tag(x_672) == 0)
{
lean_object* x_673; 
x_673 = lean_box(0);
return x_673;
}
else
{
lean_object* x_674; lean_object* x_675; lean_object* x_676; lean_object* x_677; lean_object* x_678; lean_object* x_679; 
x_674 = lean_ctor_get(x_672, 0);
lean_inc(x_674);
if (lean_is_exclusive(x_672)) {
 lean_ctor_release(x_672, 0);
 x_675 = x_672;
} else {
 lean_dec_ref(x_672);
 x_675 = lean_box(0);
}
if (lean_is_scalar(x_675)) {
 x_676 = lean_alloc_ctor(1, 1, 0);
} else {
 x_676 = x_675;
}
lean_ctor_set(x_676, 0, x_674);
x_677 = lean_box(0);
x_678 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_678, 0, x_676);
lean_ctor_set(x_678, 1, x_677);
x_679 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_679, 0, x_678);
return x_679;
}
}
else
{
lean_object* x_680; 
x_680 = lean_ctor_get(x_670, 1);
lean_inc(x_680);
if (lean_obj_tag(x_680) == 0)
{
lean_object* x_681; lean_object* x_682; lean_object* x_683; 
x_681 = lean_ctor_get(x_508, 0);
lean_inc(x_681);
lean_dec(x_508);
x_682 = lean_ctor_get(x_670, 0);
lean_inc(x_682);
lean_dec(x_670);
x_683 = l_CakeML_ptree__Pattern(x_515, x_681);
if (lean_obj_tag(x_683) == 0)
{
lean_object* x_684; 
lean_dec(x_682);
x_684 = lean_box(0);
return x_684;
}
else
{
lean_object* x_685; lean_object* x_686; 
x_685 = lean_ctor_get(x_683, 0);
lean_inc(x_685);
lean_dec(x_683);
x_686 = l_CakeML_ptree__Pattern(x_512, x_682);
if (lean_obj_tag(x_686) == 0)
{
lean_object* x_687; 
lean_dec(x_685);
x_687 = lean_box(0);
return x_687;
}
else
{
lean_object* x_688; lean_object* x_689; lean_object* x_690; lean_object* x_691; 
x_688 = lean_ctor_get(x_686, 0);
lean_inc(x_688);
if (lean_is_exclusive(x_686)) {
 lean_ctor_release(x_686, 0);
 x_689 = x_686;
} else {
 lean_dec_ref(x_686);
 x_689 = lean_box(0);
}
x_690 = l_CakeML_Papply(x_685, x_688);
if (lean_is_scalar(x_689)) {
 x_691 = lean_alloc_ctor(1, 1, 0);
} else {
 x_691 = x_689;
}
lean_ctor_set(x_691, 0, x_690);
return x_691;
}
}
}
else
{
lean_object* x_692; 
lean_dec(x_680);
lean_dec(x_670);
lean_dec(x_508);
x_692 = lean_box(0);
return x_692;
}
}
}
}
}
else
{
lean_dec(x_507);
if (lean_obj_tag(x_508) == 0)
{
lean_object* x_693; 
x_693 = lean_box(0);
return x_693;
}
else
{
lean_object* x_694; 
x_694 = lean_ctor_get(x_508, 1);
lean_inc(x_694);
if (lean_obj_tag(x_694) == 0)
{
lean_object* x_695; uint8_t x_696; lean_object* x_697; 
x_695 = lean_ctor_get(x_508, 0);
lean_inc(x_695);
lean_dec(x_508);
x_696 = 57;
lean_inc(x_695);
x_697 = l_CakeML_ptree__Pattern(x_696, x_695);
if (lean_obj_tag(x_697) == 0)
{
lean_object* x_698; 
lean_inc(x_695);
x_698 = l_CakeML_ptree__ConstructorName(x_695);
if (lean_obj_tag(x_698) == 0)
{
lean_object* x_699; 
lean_inc(x_695);
x_699 = l_CakeML_ptree__V(x_695);
if (lean_obj_tag(x_699) == 0)
{
lean_object* x_700; 
lean_inc(x_695);
x_700 = l_CakeML_destLf___rarg(x_695);
if (lean_obj_tag(x_700) == 0)
{
lean_object* x_701; uint8_t x_702; 
x_701 = lean_box(17);
x_702 = l_CakeML_tokcheck(x_695, x_701);
if (x_702 == 0)
{
lean_object* x_703; 
x_703 = lean_box(0);
return x_703;
}
else
{
lean_object* x_704; 
x_704 = l_CakeML_ptree__Pattern___closed__6;
return x_704;
}
}
else
{
lean_object* x_705; lean_object* x_706; lean_object* x_707; 
x_705 = lean_ctor_get(x_700, 0);
lean_inc(x_705);
if (lean_is_exclusive(x_700)) {
 lean_ctor_release(x_700, 0);
 x_706 = x_700;
} else {
 lean_dec_ref(x_700);
 x_706 = lean_box(0);
}
x_707 = l_CakeML_destTOK___rarg(x_705);
if (lean_obj_tag(x_707) == 0)
{
lean_object* x_708; uint8_t x_709; 
lean_dec(x_706);
x_708 = lean_box(17);
x_709 = l_CakeML_tokcheck(x_695, x_708);
if (x_709 == 0)
{
lean_object* x_710; 
x_710 = lean_box(0);
return x_710;
}
else
{
lean_object* x_711; 
x_711 = l_CakeML_ptree__Pattern___closed__6;
return x_711;
}
}
else
{
lean_object* x_712; lean_object* x_713; lean_object* x_714; 
x_712 = lean_ctor_get(x_707, 0);
lean_inc(x_712);
if (lean_is_exclusive(x_707)) {
 lean_ctor_release(x_707, 0);
 x_713 = x_707;
} else {
 lean_dec_ref(x_707);
 x_713 = lean_box(0);
}
lean_inc(x_712);
x_714 = l_CakeML_destIntT(x_712);
if (lean_obj_tag(x_714) == 0)
{
lean_object* x_715; 
lean_inc(x_712);
x_715 = l_CakeML_destStringT(x_712);
if (lean_obj_tag(x_715) == 0)
{
lean_object* x_716; 
x_716 = l_CakeML_destCharT(x_712);
if (lean_obj_tag(x_716) == 0)
{
lean_object* x_717; uint8_t x_718; 
lean_dec(x_713);
lean_dec(x_706);
x_717 = lean_box(17);
x_718 = l_CakeML_tokcheck(x_695, x_717);
if (x_718 == 0)
{
lean_object* x_719; 
x_719 = lean_box(0);
return x_719;
}
else
{
lean_object* x_720; 
x_720 = l_CakeML_ptree__Pattern___closed__6;
return x_720;
}
}
else
{
lean_object* x_721; lean_object* x_722; lean_object* x_723; lean_object* x_724; lean_object* x_725; 
lean_dec(x_695);
x_721 = lean_ctor_get(x_716, 0);
lean_inc(x_721);
if (lean_is_exclusive(x_716)) {
 lean_ctor_release(x_716, 0);
 x_722 = x_716;
} else {
 lean_dec_ref(x_716);
 x_722 = lean_box(0);
}
if (lean_is_scalar(x_713)) {
 x_723 = lean_alloc_ctor(1, 1, 0);
} else {
 x_723 = x_713;
}
lean_ctor_set(x_723, 0, x_721);
if (lean_is_scalar(x_706)) {
 x_724 = lean_alloc_ctor(2, 1, 0);
} else {
 x_724 = x_706;
 lean_ctor_set_tag(x_724, 2);
}
lean_ctor_set(x_724, 0, x_723);
if (lean_is_scalar(x_722)) {
 x_725 = lean_alloc_ctor(1, 1, 0);
} else {
 x_725 = x_722;
}
lean_ctor_set(x_725, 0, x_724);
return x_725;
}
}
else
{
lean_object* x_726; lean_object* x_727; lean_object* x_728; lean_object* x_729; lean_object* x_730; 
lean_dec(x_712);
lean_dec(x_695);
x_726 = lean_ctor_get(x_715, 0);
lean_inc(x_726);
if (lean_is_exclusive(x_715)) {
 lean_ctor_release(x_715, 0);
 x_727 = x_715;
} else {
 lean_dec_ref(x_715);
 x_727 = lean_box(0);
}
if (lean_is_scalar(x_713)) {
 x_728 = lean_alloc_ctor(2, 1, 0);
} else {
 x_728 = x_713;
 lean_ctor_set_tag(x_728, 2);
}
lean_ctor_set(x_728, 0, x_726);
if (lean_is_scalar(x_706)) {
 x_729 = lean_alloc_ctor(2, 1, 0);
} else {
 x_729 = x_706;
 lean_ctor_set_tag(x_729, 2);
}
lean_ctor_set(x_729, 0, x_728);
if (lean_is_scalar(x_727)) {
 x_730 = lean_alloc_ctor(1, 1, 0);
} else {
 x_730 = x_727;
}
lean_ctor_set(x_730, 0, x_729);
return x_730;
}
}
else
{
lean_object* x_731; lean_object* x_732; lean_object* x_733; lean_object* x_734; lean_object* x_735; 
lean_dec(x_712);
lean_dec(x_695);
x_731 = lean_ctor_get(x_714, 0);
lean_inc(x_731);
if (lean_is_exclusive(x_714)) {
 lean_ctor_release(x_714, 0);
 x_732 = x_714;
} else {
 lean_dec_ref(x_714);
 x_732 = lean_box(0);
}
if (lean_is_scalar(x_713)) {
 x_733 = lean_alloc_ctor(0, 1, 0);
} else {
 x_733 = x_713;
 lean_ctor_set_tag(x_733, 0);
}
lean_ctor_set(x_733, 0, x_731);
if (lean_is_scalar(x_706)) {
 x_734 = lean_alloc_ctor(2, 1, 0);
} else {
 x_734 = x_706;
 lean_ctor_set_tag(x_734, 2);
}
lean_ctor_set(x_734, 0, x_733);
if (lean_is_scalar(x_732)) {
 x_735 = lean_alloc_ctor(1, 1, 0);
} else {
 x_735 = x_732;
}
lean_ctor_set(x_735, 0, x_734);
return x_735;
}
}
}
}
else
{
lean_object* x_736; lean_object* x_737; lean_object* x_738; lean_object* x_739; 
lean_dec(x_695);
x_736 = lean_ctor_get(x_699, 0);
lean_inc(x_736);
if (lean_is_exclusive(x_699)) {
 lean_ctor_release(x_699, 0);
 x_737 = x_699;
} else {
 lean_dec_ref(x_699);
 x_737 = lean_box(0);
}
x_738 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_738, 0, x_736);
if (lean_is_scalar(x_737)) {
 x_739 = lean_alloc_ctor(1, 1, 0);
} else {
 x_739 = x_737;
}
lean_ctor_set(x_739, 0, x_738);
return x_739;
}
}
else
{
lean_object* x_740; lean_object* x_741; lean_object* x_742; lean_object* x_743; lean_object* x_744; lean_object* x_745; 
lean_dec(x_695);
x_740 = lean_ctor_get(x_698, 0);
lean_inc(x_740);
if (lean_is_exclusive(x_698)) {
 lean_ctor_release(x_698, 0);
 x_741 = x_698;
} else {
 lean_dec_ref(x_698);
 x_741 = lean_box(0);
}
if (lean_is_scalar(x_741)) {
 x_742 = lean_alloc_ctor(1, 1, 0);
} else {
 x_742 = x_741;
}
lean_ctor_set(x_742, 0, x_740);
x_743 = lean_box(0);
x_744 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_744, 0, x_742);
lean_ctor_set(x_744, 1, x_743);
x_745 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_745, 0, x_744);
return x_745;
}
}
else
{
lean_object* x_746; lean_object* x_747; lean_object* x_748; 
lean_dec(x_695);
x_746 = lean_ctor_get(x_697, 0);
lean_inc(x_746);
if (lean_is_exclusive(x_697)) {
 lean_ctor_release(x_697, 0);
 x_747 = x_697;
} else {
 lean_dec_ref(x_697);
 x_747 = lean_box(0);
}
if (lean_is_scalar(x_747)) {
 x_748 = lean_alloc_ctor(1, 1, 0);
} else {
 x_748 = x_747;
}
lean_ctor_set(x_748, 0, x_746);
return x_748;
}
}
else
{
lean_object* x_749; 
x_749 = lean_ctor_get(x_694, 1);
lean_inc(x_749);
if (lean_obj_tag(x_749) == 0)
{
lean_object* x_750; lean_object* x_751; lean_object* x_752; lean_object* x_753; lean_object* x_754; uint8_t x_755; 
x_750 = lean_ctor_get(x_508, 0);
lean_inc(x_750);
x_751 = lean_ctor_get(x_694, 0);
lean_inc(x_751);
if (lean_is_exclusive(x_694)) {
 lean_ctor_release(x_694, 0);
 lean_ctor_release(x_694, 1);
 x_752 = x_694;
} else {
 lean_dec_ref(x_694);
 x_752 = lean_box(0);
}
x_753 = lean_box(0);
x_754 = l_CakeML_ptree__Pattern___closed__8;
x_755 = l_CakeML_tokcheckl(x_508, x_754);
if (x_755 == 0)
{
lean_object* x_756; lean_object* x_757; uint8_t x_758; 
if (lean_is_scalar(x_752)) {
 x_756 = lean_alloc_ctor(1, 2, 0);
} else {
 x_756 = x_752;
}
lean_ctor_set(x_756, 0, x_750);
lean_ctor_set(x_756, 1, x_753);
x_757 = l_CakeML_ptree__Pattern___closed__9;
x_758 = l_CakeML_tokcheckl(x_756, x_757);
if (x_758 == 0)
{
lean_object* x_759; 
lean_dec(x_751);
x_759 = lean_box(0);
return x_759;
}
else
{
lean_object* x_760; 
x_760 = l_CakeML_ptree__OpID(x_751);
if (lean_obj_tag(x_760) == 0)
{
lean_object* x_761; 
x_761 = lean_box(0);
return x_761;
}
else
{
lean_object* x_762; lean_object* x_763; 
x_762 = lean_ctor_get(x_760, 0);
lean_inc(x_762);
lean_dec(x_760);
x_763 = l_CakeML_EtoPat(x_762);
return x_763;
}
}
}
else
{
lean_object* x_764; 
lean_dec(x_752);
lean_dec(x_751);
lean_dec(x_750);
x_764 = l_CakeML_ptree__Pattern___closed__15;
return x_764;
}
}
else
{
lean_object* x_765; 
x_765 = lean_ctor_get(x_749, 1);
lean_inc(x_765);
if (lean_obj_tag(x_765) == 0)
{
lean_object* x_766; lean_object* x_767; lean_object* x_768; lean_object* x_769; lean_object* x_770; lean_object* x_771; lean_object* x_772; lean_object* x_773; lean_object* x_774; uint8_t x_775; 
x_766 = lean_ctor_get(x_508, 0);
lean_inc(x_766);
lean_dec(x_508);
x_767 = lean_ctor_get(x_694, 0);
lean_inc(x_767);
if (lean_is_exclusive(x_694)) {
 lean_ctor_release(x_694, 0);
 lean_ctor_release(x_694, 1);
 x_768 = x_694;
} else {
 lean_dec_ref(x_694);
 x_768 = lean_box(0);
}
x_769 = lean_ctor_get(x_749, 0);
lean_inc(x_769);
if (lean_is_exclusive(x_749)) {
 lean_ctor_release(x_749, 0);
 lean_ctor_release(x_749, 1);
 x_770 = x_749;
} else {
 lean_dec_ref(x_749);
 x_770 = lean_box(0);
}
x_771 = lean_box(0);
if (lean_is_scalar(x_770)) {
 x_772 = lean_alloc_ctor(1, 2, 0);
} else {
 x_772 = x_770;
}
lean_ctor_set(x_772, 0, x_769);
lean_ctor_set(x_772, 1, x_771);
if (lean_is_scalar(x_768)) {
 x_773 = lean_alloc_ctor(1, 2, 0);
} else {
 x_773 = x_768;
}
lean_ctor_set(x_773, 0, x_766);
lean_ctor_set(x_773, 1, x_772);
x_774 = l_CakeML_ptree__Pattern___closed__8;
x_775 = l_CakeML_tokcheckl(x_773, x_774);
if (x_775 == 0)
{
lean_object* x_776; 
lean_dec(x_767);
x_776 = lean_box(0);
return x_776;
}
else
{
lean_object* x_777; 
x_777 = l_CakeML_ptree__Plist(x_767);
if (lean_obj_tag(x_777) == 0)
{
lean_object* x_778; 
x_778 = lean_box(0);
return x_778;
}
else
{
lean_object* x_779; lean_object* x_780; lean_object* x_781; lean_object* x_782; lean_object* x_783; 
x_779 = lean_ctor_get(x_777, 0);
lean_inc(x_779);
if (lean_is_exclusive(x_777)) {
 lean_ctor_release(x_777, 0);
 x_780 = x_777;
} else {
 lean_dec_ref(x_777);
 x_780 = lean_box(0);
}
x_781 = l_CakeML_ptree__Pattern___closed__14;
x_782 = l_List_foldrTR___at_CakeML_ptree__Pattern___spec__1(x_781, x_779);
if (lean_is_scalar(x_780)) {
 x_783 = lean_alloc_ctor(1, 1, 0);
} else {
 x_783 = x_780;
}
lean_ctor_set(x_783, 0, x_782);
return x_783;
}
}
}
else
{
lean_object* x_784; 
lean_dec(x_765);
lean_dec(x_749);
lean_dec(x_694);
lean_dec(x_508);
x_784 = lean_box(0);
return x_784;
}
}
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Plist(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 58;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_4);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; uint8_t x_14; lean_object* x_15; 
x_12 = lean_ctor_get(x_4, 0);
x_13 = lean_ctor_get(x_4, 1);
lean_dec(x_13);
x_14 = 56;
x_15 = l_CakeML_ptree__Pattern(x_14, x_12);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
lean_free_object(x_4);
x_16 = lean_box(0);
return x_16;
}
else
{
uint8_t x_17; 
x_17 = !lean_is_exclusive(x_15);
if (x_17 == 0)
{
lean_object* x_18; lean_object* x_19; 
x_18 = lean_ctor_get(x_15, 0);
x_19 = lean_box(0);
lean_ctor_set(x_4, 1, x_19);
lean_ctor_set(x_4, 0, x_18);
lean_ctor_set(x_15, 0, x_4);
return x_15;
}
else
{
lean_object* x_20; lean_object* x_21; lean_object* x_22; 
x_20 = lean_ctor_get(x_15, 0);
lean_inc(x_20);
lean_dec(x_15);
x_21 = lean_box(0);
lean_ctor_set(x_4, 1, x_21);
lean_ctor_set(x_4, 0, x_20);
x_22 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_22, 0, x_4);
return x_22;
}
}
}
else
{
lean_object* x_23; uint8_t x_24; lean_object* x_25; 
x_23 = lean_ctor_get(x_4, 0);
lean_inc(x_23);
lean_dec(x_4);
x_24 = 56;
x_25 = l_CakeML_ptree__Pattern(x_24, x_23);
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_26; 
x_26 = lean_box(0);
return x_26;
}
else
{
lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; 
x_27 = lean_ctor_get(x_25, 0);
lean_inc(x_27);
if (lean_is_exclusive(x_25)) {
 lean_ctor_release(x_25, 0);
 x_28 = x_25;
} else {
 lean_dec_ref(x_25);
 x_28 = lean_box(0);
}
x_29 = lean_box(0);
x_30 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_30, 0, x_27);
lean_ctor_set(x_30, 1, x_29);
if (lean_is_scalar(x_28)) {
 x_31 = lean_alloc_ctor(1, 1, 0);
} else {
 x_31 = x_28;
}
lean_ctor_set(x_31, 0, x_30);
return x_31;
}
}
}
else
{
lean_object* x_32; 
x_32 = lean_ctor_get(x_10, 1);
lean_inc(x_32);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; 
lean_dec(x_10);
lean_dec(x_4);
x_33 = lean_box(0);
return x_33;
}
else
{
lean_object* x_34; 
x_34 = lean_ctor_get(x_32, 1);
lean_inc(x_34);
if (lean_obj_tag(x_34) == 0)
{
lean_object* x_35; lean_object* x_36; uint8_t x_37; 
x_35 = lean_ctor_get(x_4, 0);
lean_inc(x_35);
lean_dec(x_4);
x_36 = lean_ctor_get(x_10, 0);
lean_inc(x_36);
lean_dec(x_10);
x_37 = !lean_is_exclusive(x_32);
if (x_37 == 0)
{
lean_object* x_38; lean_object* x_39; lean_object* x_40; uint8_t x_41; 
x_38 = lean_ctor_get(x_32, 0);
x_39 = lean_ctor_get(x_32, 1);
lean_dec(x_39);
x_40 = lean_box(7);
x_41 = l_CakeML_tokcheck(x_36, x_40);
if (x_41 == 0)
{
lean_object* x_42; 
lean_free_object(x_32);
lean_dec(x_38);
lean_dec(x_35);
x_42 = lean_box(0);
return x_42;
}
else
{
uint8_t x_43; lean_object* x_44; 
x_43 = 56;
x_44 = l_CakeML_ptree__Pattern(x_43, x_35);
if (lean_obj_tag(x_44) == 0)
{
lean_object* x_45; 
lean_free_object(x_32);
lean_dec(x_38);
x_45 = lean_box(0);
return x_45;
}
else
{
lean_object* x_46; lean_object* x_47; 
x_46 = lean_ctor_get(x_44, 0);
lean_inc(x_46);
lean_dec(x_44);
x_47 = l_CakeML_ptree__Plist(x_38);
if (lean_obj_tag(x_47) == 0)
{
lean_object* x_48; 
lean_dec(x_46);
lean_free_object(x_32);
x_48 = lean_box(0);
return x_48;
}
else
{
uint8_t x_49; 
x_49 = !lean_is_exclusive(x_47);
if (x_49 == 0)
{
lean_object* x_50; 
x_50 = lean_ctor_get(x_47, 0);
lean_ctor_set(x_32, 1, x_50);
lean_ctor_set(x_32, 0, x_46);
lean_ctor_set(x_47, 0, x_32);
return x_47;
}
else
{
lean_object* x_51; lean_object* x_52; 
x_51 = lean_ctor_get(x_47, 0);
lean_inc(x_51);
lean_dec(x_47);
lean_ctor_set(x_32, 1, x_51);
lean_ctor_set(x_32, 0, x_46);
x_52 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_52, 0, x_32);
return x_52;
}
}
}
}
}
else
{
lean_object* x_53; lean_object* x_54; uint8_t x_55; 
x_53 = lean_ctor_get(x_32, 0);
lean_inc(x_53);
lean_dec(x_32);
x_54 = lean_box(7);
x_55 = l_CakeML_tokcheck(x_36, x_54);
if (x_55 == 0)
{
lean_object* x_56; 
lean_dec(x_53);
lean_dec(x_35);
x_56 = lean_box(0);
return x_56;
}
else
{
uint8_t x_57; lean_object* x_58; 
x_57 = 56;
x_58 = l_CakeML_ptree__Pattern(x_57, x_35);
if (lean_obj_tag(x_58) == 0)
{
lean_object* x_59; 
lean_dec(x_53);
x_59 = lean_box(0);
return x_59;
}
else
{
lean_object* x_60; lean_object* x_61; 
x_60 = lean_ctor_get(x_58, 0);
lean_inc(x_60);
lean_dec(x_58);
x_61 = l_CakeML_ptree__Plist(x_53);
if (lean_obj_tag(x_61) == 0)
{
lean_object* x_62; 
lean_dec(x_60);
x_62 = lean_box(0);
return x_62;
}
else
{
lean_object* x_63; lean_object* x_64; lean_object* x_65; lean_object* x_66; 
x_63 = lean_ctor_get(x_61, 0);
lean_inc(x_63);
if (lean_is_exclusive(x_61)) {
 lean_ctor_release(x_61, 0);
 x_64 = x_61;
} else {
 lean_dec_ref(x_61);
 x_64 = lean_box(0);
}
x_65 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_65, 0, x_60);
lean_ctor_set(x_65, 1, x_63);
if (lean_is_scalar(x_64)) {
 x_66 = lean_alloc_ctor(1, 1, 0);
} else {
 x_66 = x_64;
}
lean_ctor_set(x_66, 0, x_65);
return x_66;
}
}
}
}
}
else
{
lean_object* x_67; 
lean_dec(x_34);
lean_dec(x_32);
lean_dec(x_10);
lean_dec(x_4);
x_67 = lean_box(0);
return x_67;
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Pattern___spec__2___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
size_t x_5; size_t x_6; lean_object* x_7; 
x_5 = lean_unbox_usize(x_2);
lean_dec(x_2);
x_6 = lean_unbox_usize(x_3);
lean_dec(x_3);
x_7 = l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Pattern___spec__2(x_1, x_5, x_6, x_4);
lean_dec(x_1);
return x_7;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Pattern___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = l_CakeML_ptree__Pattern(x_3, x_2);
return x_4;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__PbaseList1(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 59;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_4);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; uint8_t x_14; lean_object* x_15; 
x_12 = lean_ctor_get(x_4, 0);
x_13 = lean_ctor_get(x_4, 1);
lean_dec(x_13);
x_14 = 51;
x_15 = l_CakeML_ptree__Pattern(x_14, x_12);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
lean_free_object(x_4);
x_16 = lean_box(0);
return x_16;
}
else
{
uint8_t x_17; 
x_17 = !lean_is_exclusive(x_15);
if (x_17 == 0)
{
lean_object* x_18; lean_object* x_19; 
x_18 = lean_ctor_get(x_15, 0);
x_19 = lean_box(0);
lean_ctor_set(x_4, 1, x_19);
lean_ctor_set(x_4, 0, x_18);
lean_ctor_set(x_15, 0, x_4);
return x_15;
}
else
{
lean_object* x_20; lean_object* x_21; lean_object* x_22; 
x_20 = lean_ctor_get(x_15, 0);
lean_inc(x_20);
lean_dec(x_15);
x_21 = lean_box(0);
lean_ctor_set(x_4, 1, x_21);
lean_ctor_set(x_4, 0, x_20);
x_22 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_22, 0, x_4);
return x_22;
}
}
}
else
{
lean_object* x_23; uint8_t x_24; lean_object* x_25; 
x_23 = lean_ctor_get(x_4, 0);
lean_inc(x_23);
lean_dec(x_4);
x_24 = 51;
x_25 = l_CakeML_ptree__Pattern(x_24, x_23);
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_26; 
x_26 = lean_box(0);
return x_26;
}
else
{
lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; 
x_27 = lean_ctor_get(x_25, 0);
lean_inc(x_27);
if (lean_is_exclusive(x_25)) {
 lean_ctor_release(x_25, 0);
 x_28 = x_25;
} else {
 lean_dec_ref(x_25);
 x_28 = lean_box(0);
}
x_29 = lean_box(0);
x_30 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_30, 0, x_27);
lean_ctor_set(x_30, 1, x_29);
if (lean_is_scalar(x_28)) {
 x_31 = lean_alloc_ctor(1, 1, 0);
} else {
 x_31 = x_28;
}
lean_ctor_set(x_31, 0, x_30);
return x_31;
}
}
}
else
{
lean_object* x_32; 
x_32 = lean_ctor_get(x_10, 1);
lean_inc(x_32);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; uint8_t x_34; 
x_33 = lean_ctor_get(x_4, 0);
lean_inc(x_33);
lean_dec(x_4);
x_34 = !lean_is_exclusive(x_10);
if (x_34 == 0)
{
lean_object* x_35; lean_object* x_36; uint8_t x_37; lean_object* x_38; 
x_35 = lean_ctor_get(x_10, 0);
x_36 = lean_ctor_get(x_10, 1);
lean_dec(x_36);
x_37 = 51;
x_38 = l_CakeML_ptree__Pattern(x_37, x_33);
if (lean_obj_tag(x_38) == 0)
{
lean_object* x_39; 
lean_free_object(x_10);
lean_dec(x_35);
x_39 = lean_box(0);
return x_39;
}
else
{
lean_object* x_40; lean_object* x_41; 
x_40 = lean_ctor_get(x_38, 0);
lean_inc(x_40);
lean_dec(x_38);
x_41 = l_CakeML_ptree__PbaseList1(x_35);
if (lean_obj_tag(x_41) == 0)
{
lean_object* x_42; 
lean_dec(x_40);
lean_free_object(x_10);
x_42 = lean_box(0);
return x_42;
}
else
{
uint8_t x_43; 
x_43 = !lean_is_exclusive(x_41);
if (x_43 == 0)
{
lean_object* x_44; 
x_44 = lean_ctor_get(x_41, 0);
lean_ctor_set(x_10, 1, x_44);
lean_ctor_set(x_10, 0, x_40);
lean_ctor_set(x_41, 0, x_10);
return x_41;
}
else
{
lean_object* x_45; lean_object* x_46; 
x_45 = lean_ctor_get(x_41, 0);
lean_inc(x_45);
lean_dec(x_41);
lean_ctor_set(x_10, 1, x_45);
lean_ctor_set(x_10, 0, x_40);
x_46 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_46, 0, x_10);
return x_46;
}
}
}
}
else
{
lean_object* x_47; uint8_t x_48; lean_object* x_49; 
x_47 = lean_ctor_get(x_10, 0);
lean_inc(x_47);
lean_dec(x_10);
x_48 = 51;
x_49 = l_CakeML_ptree__Pattern(x_48, x_33);
if (lean_obj_tag(x_49) == 0)
{
lean_object* x_50; 
lean_dec(x_47);
x_50 = lean_box(0);
return x_50;
}
else
{
lean_object* x_51; lean_object* x_52; 
x_51 = lean_ctor_get(x_49, 0);
lean_inc(x_51);
lean_dec(x_49);
x_52 = l_CakeML_ptree__PbaseList1(x_47);
if (lean_obj_tag(x_52) == 0)
{
lean_object* x_53; 
lean_dec(x_51);
x_53 = lean_box(0);
return x_53;
}
else
{
lean_object* x_54; lean_object* x_55; lean_object* x_56; lean_object* x_57; 
x_54 = lean_ctor_get(x_52, 0);
lean_inc(x_54);
if (lean_is_exclusive(x_52)) {
 lean_ctor_release(x_52, 0);
 x_55 = x_52;
} else {
 lean_dec_ref(x_52);
 x_55 = lean_box(0);
}
x_56 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_56, 0, x_51);
lean_ctor_set(x_56, 1, x_54);
if (lean_is_scalar(x_55)) {
 x_57 = lean_alloc_ctor(1, 1, 0);
} else {
 x_57 = x_55;
}
lean_ctor_set(x_57, 0, x_56);
return x_57;
}
}
}
}
else
{
lean_object* x_58; 
lean_dec(x_32);
lean_dec(x_10);
lean_dec(x_4);
x_58 = lean_box(0);
return x_58;
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_Eseq__encode(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; 
x_3 = lean_ctor_get(x_1, 1);
if (lean_obj_tag(x_3) == 0)
{
lean_object* x_4; lean_object* x_5; 
x_4 = lean_ctor_get(x_1, 0);
lean_inc(x_4);
x_5 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_5, 0, x_4);
return x_5;
}
else
{
lean_object* x_6; lean_object* x_7; 
x_6 = lean_ctor_get(x_1, 0);
x_7 = l_CakeML_Eseq__encode(x_3);
if (lean_obj_tag(x_7) == 0)
{
lean_object* x_8; 
x_8 = lean_box(0);
return x_8;
}
else
{
uint8_t x_9; 
x_9 = !lean_is_exclusive(x_7);
if (x_9 == 0)
{
lean_object* x_10; lean_object* x_11; lean_object* x_12; 
x_10 = lean_ctor_get(x_7, 0);
x_11 = lean_box(0);
lean_inc(x_6);
x_12 = lean_alloc_ctor(10, 3, 0);
lean_ctor_set(x_12, 0, x_11);
lean_ctor_set(x_12, 1, x_6);
lean_ctor_set(x_12, 2, x_10);
lean_ctor_set(x_7, 0, x_12);
return x_7;
}
else
{
lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; 
x_13 = lean_ctor_get(x_7, 0);
lean_inc(x_13);
lean_dec(x_7);
x_14 = lean_box(0);
lean_inc(x_6);
x_15 = lean_alloc_ctor(10, 3, 0);
lean_ctor_set(x_15, 0, x_14);
lean_ctor_set(x_15, 1, x_6);
lean_ctor_set(x_15, 2, x_13);
x_16 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_16, 0, x_15);
return x_16;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_Eseq__encode___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_CakeML_Eseq__encode(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_dest__Conk___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
if (lean_obj_tag(x_1) == 3)
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = lean_ctor_get(x_1, 0);
lean_inc(x_4);
x_5 = lean_ctor_get(x_1, 1);
lean_inc(x_5);
lean_dec(x_1);
x_6 = lean_apply_2(x_2, x_4, x_5);
return x_6;
}
else
{
lean_dec(x_2);
lean_dec(x_1);
lean_inc(x_3);
return x_3;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_dest__Conk(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_CakeML_dest__Conk___rarg___boxed), 3, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_dest__Conk___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_CakeML_dest__Conk___rarg(x_1, x_2, x_3);
lean_dec(x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_CakeML_destFFIop(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 40)
{
uint8_t x_2; 
x_2 = !lean_is_exclusive(x_1);
if (x_2 == 0)
{
lean_ctor_set_tag(x_1, 1);
return x_1;
}
else
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
lean_dec(x_1);
x_4 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_4, 0, x_3);
return x_4;
}
}
else
{
lean_object* x_5; 
lean_dec(x_1);
x_5 = lean_box(0);
return x_5;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_strip__loc__expr(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 13)
{
lean_object* x_2; lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_2 = lean_ctor_get(x_1, 0);
lean_inc(x_2);
x_3 = lean_ctor_get(x_1, 1);
lean_inc(x_3);
lean_dec(x_1);
x_4 = l_CakeML_strip__loc__expr(x_2);
x_5 = !lean_is_exclusive(x_4);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; 
x_6 = lean_ctor_get(x_4, 1);
lean_dec(x_6);
x_7 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_7, 0, x_3);
lean_ctor_set(x_4, 1, x_7);
return x_4;
}
else
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; 
x_8 = lean_ctor_get(x_4, 0);
lean_inc(x_8);
lean_dec(x_4);
x_9 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_9, 0, x_3);
x_10 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_10, 0, x_8);
lean_ctor_set(x_10, 1, x_9);
return x_10;
}
}
else
{
lean_object* x_11; lean_object* x_12; 
x_11 = lean_box(0);
x_12 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_12, 0, x_1);
lean_ctor_set(x_12, 1, x_11);
return x_12;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_merge__locsopt(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_3; 
lean_dec(x_2);
x_3 = lean_box(0);
return x_3;
}
else
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_4; 
x_4 = lean_box(0);
return x_4;
}
else
{
uint8_t x_5; 
x_5 = !lean_is_exclusive(x_2);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; 
x_6 = lean_ctor_get(x_1, 0);
x_7 = lean_ctor_get(x_2, 0);
x_8 = l_CakeML_merge__locs(x_6, x_7);
lean_ctor_set(x_2, 0, x_8);
return x_2;
}
else
{
lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; 
x_9 = lean_ctor_get(x_1, 0);
x_10 = lean_ctor_get(x_2, 0);
lean_inc(x_10);
lean_dec(x_2);
x_11 = l_CakeML_merge__locs(x_9, x_10);
x_12 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_12, 0, x_11);
return x_12;
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_merge__locsopt___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_CakeML_merge__locsopt(x_1, x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_optLannot(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_alloc_ctor(13, 2, 0);
lean_ctor_set(x_4, 0, x_2);
lean_ctor_set(x_4, 1, x_3);
return x_4;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_optLannot___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_CakeML_optLannot(x_1, x_2);
lean_dec(x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_mkAst__App___lambda__1___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_maybe__handleRef___closed__2;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_mkAst__App___lambda__1___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_mkAst__App___lambda__1___closed__1;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_mkAst__App___lambda__1(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; uint8_t x_6; 
x_5 = l_CakeML_mkAst__App___lambda__1___closed__2;
lean_inc(x_3);
x_6 = l___private_Init_Data_Option_Basic_0__Option_beqOption____x40_Init_Data_Option_Basic___hyg_159____at___private_CakeML_Core_Ast_0__CakeML_beqpat____x40_CakeML_Core_Ast___hyg_8136____spec__1(x_3, x_5);
if (x_6 == 0)
{
lean_object* x_7; uint8_t x_8; 
x_7 = l_CakeML_strip__loc__expr(x_1);
x_8 = !lean_is_exclusive(x_7);
if (x_8 == 0)
{
lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_9 = lean_ctor_get(x_7, 1);
x_10 = l_CakeML_merge__locsopt(x_2, x_9);
x_11 = lean_box(0);
lean_ctor_set_tag(x_7, 1);
lean_ctor_set(x_7, 1, x_11);
x_12 = l_List_appendTR___rarg(x_4, x_7);
x_13 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_13, 0, x_3);
lean_ctor_set(x_13, 1, x_12);
x_14 = l_CakeML_optLannot(x_10, x_13);
lean_dec(x_10);
return x_14;
}
else
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; 
x_15 = lean_ctor_get(x_7, 0);
x_16 = lean_ctor_get(x_7, 1);
lean_inc(x_16);
lean_inc(x_15);
lean_dec(x_7);
x_17 = l_CakeML_merge__locsopt(x_2, x_16);
x_18 = lean_box(0);
x_19 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_19, 0, x_15);
lean_ctor_set(x_19, 1, x_18);
x_20 = l_List_appendTR___rarg(x_4, x_19);
x_21 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_21, 0, x_3);
lean_ctor_set(x_21, 1, x_20);
x_22 = l_CakeML_optLannot(x_17, x_21);
lean_dec(x_17);
return x_22;
}
}
else
{
uint8_t x_23; 
x_23 = l_List_isEmpty___rarg(x_4);
if (x_23 == 0)
{
lean_object* x_24; uint8_t x_25; 
x_24 = l_CakeML_strip__loc__expr(x_1);
x_25 = !lean_is_exclusive(x_24);
if (x_25 == 0)
{
lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; 
x_26 = lean_ctor_get(x_24, 1);
x_27 = l_CakeML_merge__locsopt(x_2, x_26);
x_28 = lean_box(0);
lean_ctor_set_tag(x_24, 1);
lean_ctor_set(x_24, 1, x_28);
x_29 = l_List_appendTR___rarg(x_4, x_24);
x_30 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_30, 0, x_3);
lean_ctor_set(x_30, 1, x_29);
x_31 = l_CakeML_optLannot(x_27, x_30);
lean_dec(x_27);
return x_31;
}
else
{
lean_object* x_32; lean_object* x_33; lean_object* x_34; lean_object* x_35; lean_object* x_36; lean_object* x_37; lean_object* x_38; lean_object* x_39; 
x_32 = lean_ctor_get(x_24, 0);
x_33 = lean_ctor_get(x_24, 1);
lean_inc(x_33);
lean_inc(x_32);
lean_dec(x_24);
x_34 = l_CakeML_merge__locsopt(x_2, x_33);
x_35 = lean_box(0);
x_36 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_36, 0, x_32);
lean_ctor_set(x_36, 1, x_35);
x_37 = l_List_appendTR___rarg(x_4, x_36);
x_38 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_38, 0, x_3);
lean_ctor_set(x_38, 1, x_37);
x_39 = l_CakeML_optLannot(x_34, x_38);
lean_dec(x_34);
return x_39;
}
}
else
{
lean_object* x_40; lean_object* x_41; lean_object* x_42; lean_object* x_43; 
lean_dec(x_4);
lean_dec(x_3);
x_40 = lean_box(0);
x_41 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_41, 0, x_1);
lean_ctor_set(x_41, 1, x_40);
x_42 = lean_box(7);
x_43 = lean_alloc_ctor(6, 2, 0);
lean_ctor_set(x_43, 0, x_42);
lean_ctor_set(x_43, 1, x_41);
return x_43;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_mkAst__App(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; uint8_t x_4; 
lean_inc(x_1);
x_3 = l_CakeML_strip__loc__expr(x_1);
x_4 = !lean_is_exclusive(x_3);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; 
x_5 = lean_ctor_get(x_3, 0);
x_6 = lean_ctor_get(x_3, 1);
lean_inc(x_2);
x_7 = lean_alloc_closure((void*)(l_CakeML_mkAst__App___lambda__1___boxed), 4, 2);
lean_closure_set(x_7, 0, x_2);
lean_closure_set(x_7, 1, x_6);
if (lean_obj_tag(x_5) == 6)
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; 
x_8 = lean_ctor_get(x_5, 0);
lean_inc(x_8);
x_9 = lean_ctor_get(x_5, 1);
lean_inc(x_9);
lean_inc(x_8);
x_10 = l_CakeML_destFFIop(x_8);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; 
lean_dec(x_9);
lean_dec(x_8);
x_11 = lean_box(0);
lean_ctor_set_tag(x_3, 1);
lean_ctor_set(x_3, 1, x_11);
lean_ctor_set(x_3, 0, x_2);
x_12 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_12, 0, x_1);
lean_ctor_set(x_12, 1, x_3);
x_13 = lean_box(5);
x_14 = lean_alloc_ctor(6, 2, 0);
lean_ctor_set(x_14, 0, x_13);
lean_ctor_set(x_14, 1, x_12);
x_15 = l_CakeML_dest__Conk___rarg(x_5, x_7, x_14);
lean_dec(x_14);
return x_15;
}
else
{
lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; 
lean_dec(x_10);
lean_dec(x_1);
x_16 = lean_box(0);
lean_ctor_set_tag(x_3, 1);
lean_ctor_set(x_3, 1, x_16);
lean_ctor_set(x_3, 0, x_2);
x_17 = l_List_appendTR___rarg(x_9, x_3);
x_18 = lean_alloc_ctor(6, 2, 0);
lean_ctor_set(x_18, 0, x_8);
lean_ctor_set(x_18, 1, x_17);
x_19 = l_CakeML_dest__Conk___rarg(x_5, x_7, x_18);
lean_dec(x_18);
return x_19;
}
}
else
{
lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; 
x_20 = lean_box(0);
lean_ctor_set_tag(x_3, 1);
lean_ctor_set(x_3, 1, x_20);
lean_ctor_set(x_3, 0, x_2);
x_21 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_21, 0, x_1);
lean_ctor_set(x_21, 1, x_3);
x_22 = lean_box(5);
x_23 = lean_alloc_ctor(6, 2, 0);
lean_ctor_set(x_23, 0, x_22);
lean_ctor_set(x_23, 1, x_21);
x_24 = l_CakeML_dest__Conk___rarg(x_5, x_7, x_23);
lean_dec(x_23);
return x_24;
}
}
else
{
lean_object* x_25; lean_object* x_26; lean_object* x_27; 
x_25 = lean_ctor_get(x_3, 0);
x_26 = lean_ctor_get(x_3, 1);
lean_inc(x_26);
lean_inc(x_25);
lean_dec(x_3);
lean_inc(x_2);
x_27 = lean_alloc_closure((void*)(l_CakeML_mkAst__App___lambda__1___boxed), 4, 2);
lean_closure_set(x_27, 0, x_2);
lean_closure_set(x_27, 1, x_26);
if (lean_obj_tag(x_25) == 6)
{
lean_object* x_28; lean_object* x_29; lean_object* x_30; 
x_28 = lean_ctor_get(x_25, 0);
lean_inc(x_28);
x_29 = lean_ctor_get(x_25, 1);
lean_inc(x_29);
lean_inc(x_28);
x_30 = l_CakeML_destFFIop(x_28);
if (lean_obj_tag(x_30) == 0)
{
lean_object* x_31; lean_object* x_32; lean_object* x_33; lean_object* x_34; lean_object* x_35; lean_object* x_36; 
lean_dec(x_29);
lean_dec(x_28);
x_31 = lean_box(0);
x_32 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_32, 0, x_2);
lean_ctor_set(x_32, 1, x_31);
x_33 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_33, 0, x_1);
lean_ctor_set(x_33, 1, x_32);
x_34 = lean_box(5);
x_35 = lean_alloc_ctor(6, 2, 0);
lean_ctor_set(x_35, 0, x_34);
lean_ctor_set(x_35, 1, x_33);
x_36 = l_CakeML_dest__Conk___rarg(x_25, x_27, x_35);
lean_dec(x_35);
return x_36;
}
else
{
lean_object* x_37; lean_object* x_38; lean_object* x_39; lean_object* x_40; lean_object* x_41; 
lean_dec(x_30);
lean_dec(x_1);
x_37 = lean_box(0);
x_38 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_38, 0, x_2);
lean_ctor_set(x_38, 1, x_37);
x_39 = l_List_appendTR___rarg(x_29, x_38);
x_40 = lean_alloc_ctor(6, 2, 0);
lean_ctor_set(x_40, 0, x_28);
lean_ctor_set(x_40, 1, x_39);
x_41 = l_CakeML_dest__Conk___rarg(x_25, x_27, x_40);
lean_dec(x_40);
return x_41;
}
}
else
{
lean_object* x_42; lean_object* x_43; lean_object* x_44; lean_object* x_45; lean_object* x_46; lean_object* x_47; 
x_42 = lean_box(0);
x_43 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_43, 0, x_2);
lean_ctor_set(x_43, 1, x_42);
x_44 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_44, 0, x_1);
lean_ctor_set(x_44, 1, x_43);
x_45 = lean_box(5);
x_46 = lean_alloc_ctor(6, 2, 0);
lean_ctor_set(x_46, 0, x_45);
lean_ctor_set(x_46, 1, x_44);
x_47 = l_CakeML_dest__Conk___rarg(x_25, x_27, x_46);
lean_dec(x_46);
return x_47;
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_mkAst__App___lambda__1___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = l_CakeML_mkAst__App___lambda__1(x_1, x_2, x_3, x_4);
lean_dec(x_2);
return x_5;
}
}
static lean_object* _init_l_CakeML_dePat___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_box(0);
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_dePat___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_dePat___closed__1;
x_2 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_dePat(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 1)
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
lean_dec(x_1);
x_4 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
return x_4;
}
else
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; 
x_5 = lean_box(0);
x_6 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_6, 0, x_1);
lean_ctor_set(x_6, 1, x_2);
x_7 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_7, 0, x_6);
lean_ctor_set(x_7, 1, x_5);
x_8 = l_CakeML_dePat___closed__2;
x_9 = lean_alloc_ctor(9, 2, 0);
lean_ctor_set(x_9, 0, x_8);
lean_ctor_set(x_9, 1, x_7);
x_10 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_10, 0, x_5);
lean_ctor_set(x_10, 1, x_9);
return x_10;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_mkFun(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; uint8_t x_4; 
x_3 = l_CakeML_dePat(x_1, x_2);
x_4 = !lean_is_exclusive(x_3);
if (x_4 == 0)
{
lean_ctor_set_tag(x_3, 5);
return x_3;
}
else
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; 
x_5 = lean_ctor_get(x_3, 0);
x_6 = lean_ctor_get(x_3, 1);
lean_inc(x_6);
lean_inc(x_5);
lean_dec(x_3);
x_7 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_7, 0, x_5);
lean_ctor_set(x_7, 1, x_6);
return x_7;
}
}
}
static lean_object* _init_l_CakeML_ptree__Eliteral___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_instInhabitedToken;
x_2 = l_HOL4_instInhabitedParsetree___rarg(x_1, lean_box(0));
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Eliteral(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
uint8_t x_3; 
x_3 = !lean_is_exclusive(x_1);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; uint8_t x_9; 
x_4 = lean_ctor_get(x_1, 0);
x_5 = lean_ctor_get(x_1, 1);
x_6 = lean_unsigned_to_nat(0u);
x_7 = l_List_lengthTRAux___rarg(x_5, x_6);
x_8 = lean_unsigned_to_nat(1u);
x_9 = lean_nat_dec_eq(x_7, x_8);
lean_dec(x_7);
if (x_9 == 0)
{
lean_object* x_10; 
lean_free_object(x_1);
lean_dec(x_5);
lean_dec(x_4);
x_10 = lean_box(0);
return x_10;
}
else
{
uint8_t x_11; uint8_t x_12; uint8_t x_13; 
x_11 = 24;
x_12 = lean_unbox(x_4);
lean_dec(x_4);
x_13 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_12, x_11);
if (x_13 == 0)
{
lean_object* x_14; 
lean_free_object(x_1);
lean_dec(x_5);
x_14 = lean_box(0);
return x_14;
}
else
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; 
x_15 = l_CakeML_ptree__Eliteral___closed__1;
x_16 = l_List_head_x21___rarg(x_15, x_5);
lean_dec(x_5);
x_17 = l_CakeML_destLf___rarg(x_16);
if (lean_obj_tag(x_17) == 0)
{
lean_object* x_18; 
lean_free_object(x_1);
x_18 = lean_box(0);
return x_18;
}
else
{
uint8_t x_19; 
x_19 = !lean_is_exclusive(x_17);
if (x_19 == 0)
{
lean_object* x_20; lean_object* x_21; 
x_20 = lean_ctor_get(x_17, 0);
x_21 = l_CakeML_destTOK___rarg(x_20);
if (lean_obj_tag(x_21) == 0)
{
lean_object* x_22; 
lean_free_object(x_17);
lean_free_object(x_1);
x_22 = lean_box(0);
return x_22;
}
else
{
uint8_t x_23; 
x_23 = !lean_is_exclusive(x_21);
if (x_23 == 0)
{
lean_object* x_24; lean_object* x_25; 
x_24 = lean_ctor_get(x_21, 0);
lean_inc(x_24);
x_25 = l_CakeML_destIntT(x_24);
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_26; 
lean_inc(x_24);
x_26 = l_CakeML_destCharT(x_24);
if (lean_obj_tag(x_26) == 0)
{
lean_object* x_27; 
lean_inc(x_24);
x_27 = l_CakeML_destStringT(x_24);
if (lean_obj_tag(x_27) == 0)
{
lean_object* x_28; 
lean_inc(x_24);
x_28 = l_CakeML_destWordT(x_24);
if (lean_obj_tag(x_28) == 0)
{
lean_object* x_29; 
lean_free_object(x_17);
x_29 = l_CakeML_destFFIT(x_24);
if (lean_obj_tag(x_29) == 0)
{
lean_object* x_30; 
lean_free_object(x_21);
lean_free_object(x_1);
x_30 = lean_box(0);
return x_30;
}
else
{
uint8_t x_31; 
x_31 = !lean_is_exclusive(x_29);
if (x_31 == 0)
{
lean_object* x_32; lean_object* x_33; 
x_32 = lean_ctor_get(x_29, 0);
lean_ctor_set_tag(x_21, 40);
lean_ctor_set(x_21, 0, x_32);
x_33 = lean_box(0);
lean_ctor_set_tag(x_1, 6);
lean_ctor_set(x_1, 1, x_33);
lean_ctor_set(x_1, 0, x_21);
lean_ctor_set(x_29, 0, x_1);
return x_29;
}
else
{
lean_object* x_34; lean_object* x_35; lean_object* x_36; 
x_34 = lean_ctor_get(x_29, 0);
lean_inc(x_34);
lean_dec(x_29);
lean_ctor_set_tag(x_21, 40);
lean_ctor_set(x_21, 0, x_34);
x_35 = lean_box(0);
lean_ctor_set_tag(x_1, 6);
lean_ctor_set(x_1, 1, x_35);
lean_ctor_set(x_1, 0, x_21);
x_36 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_36, 0, x_1);
return x_36;
}
}
}
else
{
uint8_t x_37; 
lean_dec(x_24);
lean_free_object(x_1);
x_37 = !lean_is_exclusive(x_28);
if (x_37 == 0)
{
lean_object* x_38; lean_object* x_39; lean_object* x_40; 
x_38 = lean_ctor_get(x_28, 0);
x_39 = lean_unsigned_to_nat(64u);
x_40 = l_BitVec_ofNat(x_39, x_38);
lean_dec(x_38);
lean_ctor_set_tag(x_21, 4);
lean_ctor_set(x_21, 0, x_40);
lean_ctor_set_tag(x_17, 2);
lean_ctor_set(x_17, 0, x_21);
lean_ctor_set(x_28, 0, x_17);
return x_28;
}
else
{
lean_object* x_41; lean_object* x_42; lean_object* x_43; lean_object* x_44; 
x_41 = lean_ctor_get(x_28, 0);
lean_inc(x_41);
lean_dec(x_28);
x_42 = lean_unsigned_to_nat(64u);
x_43 = l_BitVec_ofNat(x_42, x_41);
lean_dec(x_41);
lean_ctor_set_tag(x_21, 4);
lean_ctor_set(x_21, 0, x_43);
lean_ctor_set_tag(x_17, 2);
lean_ctor_set(x_17, 0, x_21);
x_44 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_44, 0, x_17);
return x_44;
}
}
}
else
{
uint8_t x_45; 
lean_dec(x_24);
lean_free_object(x_1);
x_45 = !lean_is_exclusive(x_27);
if (x_45 == 0)
{
lean_object* x_46; 
x_46 = lean_ctor_get(x_27, 0);
lean_ctor_set_tag(x_21, 2);
lean_ctor_set(x_21, 0, x_46);
lean_ctor_set_tag(x_17, 2);
lean_ctor_set(x_17, 0, x_21);
lean_ctor_set(x_27, 0, x_17);
return x_27;
}
else
{
lean_object* x_47; lean_object* x_48; 
x_47 = lean_ctor_get(x_27, 0);
lean_inc(x_47);
lean_dec(x_27);
lean_ctor_set_tag(x_21, 2);
lean_ctor_set(x_21, 0, x_47);
lean_ctor_set_tag(x_17, 2);
lean_ctor_set(x_17, 0, x_21);
x_48 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_48, 0, x_17);
return x_48;
}
}
}
else
{
uint8_t x_49; 
lean_dec(x_24);
lean_free_object(x_1);
x_49 = !lean_is_exclusive(x_26);
if (x_49 == 0)
{
lean_object* x_50; 
x_50 = lean_ctor_get(x_26, 0);
lean_ctor_set(x_21, 0, x_50);
lean_ctor_set_tag(x_17, 2);
lean_ctor_set(x_17, 0, x_21);
lean_ctor_set(x_26, 0, x_17);
return x_26;
}
else
{
lean_object* x_51; lean_object* x_52; 
x_51 = lean_ctor_get(x_26, 0);
lean_inc(x_51);
lean_dec(x_26);
lean_ctor_set(x_21, 0, x_51);
lean_ctor_set_tag(x_17, 2);
lean_ctor_set(x_17, 0, x_21);
x_52 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_52, 0, x_17);
return x_52;
}
}
}
else
{
uint8_t x_53; 
lean_dec(x_24);
lean_free_object(x_1);
x_53 = !lean_is_exclusive(x_25);
if (x_53 == 0)
{
lean_object* x_54; 
x_54 = lean_ctor_get(x_25, 0);
lean_ctor_set_tag(x_21, 0);
lean_ctor_set(x_21, 0, x_54);
lean_ctor_set_tag(x_17, 2);
lean_ctor_set(x_17, 0, x_21);
lean_ctor_set(x_25, 0, x_17);
return x_25;
}
else
{
lean_object* x_55; lean_object* x_56; 
x_55 = lean_ctor_get(x_25, 0);
lean_inc(x_55);
lean_dec(x_25);
lean_ctor_set_tag(x_21, 0);
lean_ctor_set(x_21, 0, x_55);
lean_ctor_set_tag(x_17, 2);
lean_ctor_set(x_17, 0, x_21);
x_56 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_56, 0, x_17);
return x_56;
}
}
}
else
{
lean_object* x_57; lean_object* x_58; 
x_57 = lean_ctor_get(x_21, 0);
lean_inc(x_57);
lean_dec(x_21);
lean_inc(x_57);
x_58 = l_CakeML_destIntT(x_57);
if (lean_obj_tag(x_58) == 0)
{
lean_object* x_59; 
lean_inc(x_57);
x_59 = l_CakeML_destCharT(x_57);
if (lean_obj_tag(x_59) == 0)
{
lean_object* x_60; 
lean_inc(x_57);
x_60 = l_CakeML_destStringT(x_57);
if (lean_obj_tag(x_60) == 0)
{
lean_object* x_61; 
lean_inc(x_57);
x_61 = l_CakeML_destWordT(x_57);
if (lean_obj_tag(x_61) == 0)
{
lean_object* x_62; 
lean_free_object(x_17);
x_62 = l_CakeML_destFFIT(x_57);
if (lean_obj_tag(x_62) == 0)
{
lean_object* x_63; 
lean_free_object(x_1);
x_63 = lean_box(0);
return x_63;
}
else
{
lean_object* x_64; lean_object* x_65; lean_object* x_66; lean_object* x_67; lean_object* x_68; 
x_64 = lean_ctor_get(x_62, 0);
lean_inc(x_64);
if (lean_is_exclusive(x_62)) {
 lean_ctor_release(x_62, 0);
 x_65 = x_62;
} else {
 lean_dec_ref(x_62);
 x_65 = lean_box(0);
}
x_66 = lean_alloc_ctor(40, 1, 0);
lean_ctor_set(x_66, 0, x_64);
x_67 = lean_box(0);
lean_ctor_set_tag(x_1, 6);
lean_ctor_set(x_1, 1, x_67);
lean_ctor_set(x_1, 0, x_66);
if (lean_is_scalar(x_65)) {
 x_68 = lean_alloc_ctor(1, 1, 0);
} else {
 x_68 = x_65;
}
lean_ctor_set(x_68, 0, x_1);
return x_68;
}
}
else
{
lean_object* x_69; lean_object* x_70; lean_object* x_71; lean_object* x_72; lean_object* x_73; lean_object* x_74; 
lean_dec(x_57);
lean_free_object(x_1);
x_69 = lean_ctor_get(x_61, 0);
lean_inc(x_69);
if (lean_is_exclusive(x_61)) {
 lean_ctor_release(x_61, 0);
 x_70 = x_61;
} else {
 lean_dec_ref(x_61);
 x_70 = lean_box(0);
}
x_71 = lean_unsigned_to_nat(64u);
x_72 = l_BitVec_ofNat(x_71, x_69);
lean_dec(x_69);
x_73 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_73, 0, x_72);
lean_ctor_set_tag(x_17, 2);
lean_ctor_set(x_17, 0, x_73);
if (lean_is_scalar(x_70)) {
 x_74 = lean_alloc_ctor(1, 1, 0);
} else {
 x_74 = x_70;
}
lean_ctor_set(x_74, 0, x_17);
return x_74;
}
}
else
{
lean_object* x_75; lean_object* x_76; lean_object* x_77; lean_object* x_78; 
lean_dec(x_57);
lean_free_object(x_1);
x_75 = lean_ctor_get(x_60, 0);
lean_inc(x_75);
if (lean_is_exclusive(x_60)) {
 lean_ctor_release(x_60, 0);
 x_76 = x_60;
} else {
 lean_dec_ref(x_60);
 x_76 = lean_box(0);
}
x_77 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_77, 0, x_75);
lean_ctor_set_tag(x_17, 2);
lean_ctor_set(x_17, 0, x_77);
if (lean_is_scalar(x_76)) {
 x_78 = lean_alloc_ctor(1, 1, 0);
} else {
 x_78 = x_76;
}
lean_ctor_set(x_78, 0, x_17);
return x_78;
}
}
else
{
lean_object* x_79; lean_object* x_80; lean_object* x_81; lean_object* x_82; 
lean_dec(x_57);
lean_free_object(x_1);
x_79 = lean_ctor_get(x_59, 0);
lean_inc(x_79);
if (lean_is_exclusive(x_59)) {
 lean_ctor_release(x_59, 0);
 x_80 = x_59;
} else {
 lean_dec_ref(x_59);
 x_80 = lean_box(0);
}
x_81 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_81, 0, x_79);
lean_ctor_set_tag(x_17, 2);
lean_ctor_set(x_17, 0, x_81);
if (lean_is_scalar(x_80)) {
 x_82 = lean_alloc_ctor(1, 1, 0);
} else {
 x_82 = x_80;
}
lean_ctor_set(x_82, 0, x_17);
return x_82;
}
}
else
{
lean_object* x_83; lean_object* x_84; lean_object* x_85; lean_object* x_86; 
lean_dec(x_57);
lean_free_object(x_1);
x_83 = lean_ctor_get(x_58, 0);
lean_inc(x_83);
if (lean_is_exclusive(x_58)) {
 lean_ctor_release(x_58, 0);
 x_84 = x_58;
} else {
 lean_dec_ref(x_58);
 x_84 = lean_box(0);
}
x_85 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_85, 0, x_83);
lean_ctor_set_tag(x_17, 2);
lean_ctor_set(x_17, 0, x_85);
if (lean_is_scalar(x_84)) {
 x_86 = lean_alloc_ctor(1, 1, 0);
} else {
 x_86 = x_84;
}
lean_ctor_set(x_86, 0, x_17);
return x_86;
}
}
}
}
else
{
lean_object* x_87; lean_object* x_88; 
x_87 = lean_ctor_get(x_17, 0);
lean_inc(x_87);
lean_dec(x_17);
x_88 = l_CakeML_destTOK___rarg(x_87);
if (lean_obj_tag(x_88) == 0)
{
lean_object* x_89; 
lean_free_object(x_1);
x_89 = lean_box(0);
return x_89;
}
else
{
lean_object* x_90; lean_object* x_91; lean_object* x_92; 
x_90 = lean_ctor_get(x_88, 0);
lean_inc(x_90);
if (lean_is_exclusive(x_88)) {
 lean_ctor_release(x_88, 0);
 x_91 = x_88;
} else {
 lean_dec_ref(x_88);
 x_91 = lean_box(0);
}
lean_inc(x_90);
x_92 = l_CakeML_destIntT(x_90);
if (lean_obj_tag(x_92) == 0)
{
lean_object* x_93; 
lean_inc(x_90);
x_93 = l_CakeML_destCharT(x_90);
if (lean_obj_tag(x_93) == 0)
{
lean_object* x_94; 
lean_inc(x_90);
x_94 = l_CakeML_destStringT(x_90);
if (lean_obj_tag(x_94) == 0)
{
lean_object* x_95; 
lean_inc(x_90);
x_95 = l_CakeML_destWordT(x_90);
if (lean_obj_tag(x_95) == 0)
{
lean_object* x_96; 
x_96 = l_CakeML_destFFIT(x_90);
if (lean_obj_tag(x_96) == 0)
{
lean_object* x_97; 
lean_dec(x_91);
lean_free_object(x_1);
x_97 = lean_box(0);
return x_97;
}
else
{
lean_object* x_98; lean_object* x_99; lean_object* x_100; lean_object* x_101; lean_object* x_102; 
x_98 = lean_ctor_get(x_96, 0);
lean_inc(x_98);
if (lean_is_exclusive(x_96)) {
 lean_ctor_release(x_96, 0);
 x_99 = x_96;
} else {
 lean_dec_ref(x_96);
 x_99 = lean_box(0);
}
if (lean_is_scalar(x_91)) {
 x_100 = lean_alloc_ctor(40, 1, 0);
} else {
 x_100 = x_91;
 lean_ctor_set_tag(x_100, 40);
}
lean_ctor_set(x_100, 0, x_98);
x_101 = lean_box(0);
lean_ctor_set_tag(x_1, 6);
lean_ctor_set(x_1, 1, x_101);
lean_ctor_set(x_1, 0, x_100);
if (lean_is_scalar(x_99)) {
 x_102 = lean_alloc_ctor(1, 1, 0);
} else {
 x_102 = x_99;
}
lean_ctor_set(x_102, 0, x_1);
return x_102;
}
}
else
{
lean_object* x_103; lean_object* x_104; lean_object* x_105; lean_object* x_106; lean_object* x_107; lean_object* x_108; lean_object* x_109; 
lean_dec(x_90);
lean_free_object(x_1);
x_103 = lean_ctor_get(x_95, 0);
lean_inc(x_103);
if (lean_is_exclusive(x_95)) {
 lean_ctor_release(x_95, 0);
 x_104 = x_95;
} else {
 lean_dec_ref(x_95);
 x_104 = lean_box(0);
}
x_105 = lean_unsigned_to_nat(64u);
x_106 = l_BitVec_ofNat(x_105, x_103);
lean_dec(x_103);
if (lean_is_scalar(x_91)) {
 x_107 = lean_alloc_ctor(4, 1, 0);
} else {
 x_107 = x_91;
 lean_ctor_set_tag(x_107, 4);
}
lean_ctor_set(x_107, 0, x_106);
x_108 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_108, 0, x_107);
if (lean_is_scalar(x_104)) {
 x_109 = lean_alloc_ctor(1, 1, 0);
} else {
 x_109 = x_104;
}
lean_ctor_set(x_109, 0, x_108);
return x_109;
}
}
else
{
lean_object* x_110; lean_object* x_111; lean_object* x_112; lean_object* x_113; lean_object* x_114; 
lean_dec(x_90);
lean_free_object(x_1);
x_110 = lean_ctor_get(x_94, 0);
lean_inc(x_110);
if (lean_is_exclusive(x_94)) {
 lean_ctor_release(x_94, 0);
 x_111 = x_94;
} else {
 lean_dec_ref(x_94);
 x_111 = lean_box(0);
}
if (lean_is_scalar(x_91)) {
 x_112 = lean_alloc_ctor(2, 1, 0);
} else {
 x_112 = x_91;
 lean_ctor_set_tag(x_112, 2);
}
lean_ctor_set(x_112, 0, x_110);
x_113 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_113, 0, x_112);
if (lean_is_scalar(x_111)) {
 x_114 = lean_alloc_ctor(1, 1, 0);
} else {
 x_114 = x_111;
}
lean_ctor_set(x_114, 0, x_113);
return x_114;
}
}
else
{
lean_object* x_115; lean_object* x_116; lean_object* x_117; lean_object* x_118; lean_object* x_119; 
lean_dec(x_90);
lean_free_object(x_1);
x_115 = lean_ctor_get(x_93, 0);
lean_inc(x_115);
if (lean_is_exclusive(x_93)) {
 lean_ctor_release(x_93, 0);
 x_116 = x_93;
} else {
 lean_dec_ref(x_93);
 x_116 = lean_box(0);
}
if (lean_is_scalar(x_91)) {
 x_117 = lean_alloc_ctor(1, 1, 0);
} else {
 x_117 = x_91;
}
lean_ctor_set(x_117, 0, x_115);
x_118 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_118, 0, x_117);
if (lean_is_scalar(x_116)) {
 x_119 = lean_alloc_ctor(1, 1, 0);
} else {
 x_119 = x_116;
}
lean_ctor_set(x_119, 0, x_118);
return x_119;
}
}
else
{
lean_object* x_120; lean_object* x_121; lean_object* x_122; lean_object* x_123; lean_object* x_124; 
lean_dec(x_90);
lean_free_object(x_1);
x_120 = lean_ctor_get(x_92, 0);
lean_inc(x_120);
if (lean_is_exclusive(x_92)) {
 lean_ctor_release(x_92, 0);
 x_121 = x_92;
} else {
 lean_dec_ref(x_92);
 x_121 = lean_box(0);
}
if (lean_is_scalar(x_91)) {
 x_122 = lean_alloc_ctor(0, 1, 0);
} else {
 x_122 = x_91;
 lean_ctor_set_tag(x_122, 0);
}
lean_ctor_set(x_122, 0, x_120);
x_123 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_123, 0, x_122);
if (lean_is_scalar(x_121)) {
 x_124 = lean_alloc_ctor(1, 1, 0);
} else {
 x_124 = x_121;
}
lean_ctor_set(x_124, 0, x_123);
return x_124;
}
}
}
}
}
}
}
else
{
lean_object* x_125; lean_object* x_126; lean_object* x_127; lean_object* x_128; lean_object* x_129; uint8_t x_130; 
x_125 = lean_ctor_get(x_1, 0);
x_126 = lean_ctor_get(x_1, 1);
lean_inc(x_126);
lean_inc(x_125);
lean_dec(x_1);
x_127 = lean_unsigned_to_nat(0u);
x_128 = l_List_lengthTRAux___rarg(x_126, x_127);
x_129 = lean_unsigned_to_nat(1u);
x_130 = lean_nat_dec_eq(x_128, x_129);
lean_dec(x_128);
if (x_130 == 0)
{
lean_object* x_131; 
lean_dec(x_126);
lean_dec(x_125);
x_131 = lean_box(0);
return x_131;
}
else
{
uint8_t x_132; uint8_t x_133; uint8_t x_134; 
x_132 = 24;
x_133 = lean_unbox(x_125);
lean_dec(x_125);
x_134 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_133, x_132);
if (x_134 == 0)
{
lean_object* x_135; 
lean_dec(x_126);
x_135 = lean_box(0);
return x_135;
}
else
{
lean_object* x_136; lean_object* x_137; lean_object* x_138; 
x_136 = l_CakeML_ptree__Eliteral___closed__1;
x_137 = l_List_head_x21___rarg(x_136, x_126);
lean_dec(x_126);
x_138 = l_CakeML_destLf___rarg(x_137);
if (lean_obj_tag(x_138) == 0)
{
lean_object* x_139; 
x_139 = lean_box(0);
return x_139;
}
else
{
lean_object* x_140; lean_object* x_141; lean_object* x_142; 
x_140 = lean_ctor_get(x_138, 0);
lean_inc(x_140);
if (lean_is_exclusive(x_138)) {
 lean_ctor_release(x_138, 0);
 x_141 = x_138;
} else {
 lean_dec_ref(x_138);
 x_141 = lean_box(0);
}
x_142 = l_CakeML_destTOK___rarg(x_140);
if (lean_obj_tag(x_142) == 0)
{
lean_object* x_143; 
lean_dec(x_141);
x_143 = lean_box(0);
return x_143;
}
else
{
lean_object* x_144; lean_object* x_145; lean_object* x_146; 
x_144 = lean_ctor_get(x_142, 0);
lean_inc(x_144);
if (lean_is_exclusive(x_142)) {
 lean_ctor_release(x_142, 0);
 x_145 = x_142;
} else {
 lean_dec_ref(x_142);
 x_145 = lean_box(0);
}
lean_inc(x_144);
x_146 = l_CakeML_destIntT(x_144);
if (lean_obj_tag(x_146) == 0)
{
lean_object* x_147; 
lean_inc(x_144);
x_147 = l_CakeML_destCharT(x_144);
if (lean_obj_tag(x_147) == 0)
{
lean_object* x_148; 
lean_inc(x_144);
x_148 = l_CakeML_destStringT(x_144);
if (lean_obj_tag(x_148) == 0)
{
lean_object* x_149; 
lean_inc(x_144);
x_149 = l_CakeML_destWordT(x_144);
if (lean_obj_tag(x_149) == 0)
{
lean_object* x_150; 
lean_dec(x_141);
x_150 = l_CakeML_destFFIT(x_144);
if (lean_obj_tag(x_150) == 0)
{
lean_object* x_151; 
lean_dec(x_145);
x_151 = lean_box(0);
return x_151;
}
else
{
lean_object* x_152; lean_object* x_153; lean_object* x_154; lean_object* x_155; lean_object* x_156; lean_object* x_157; 
x_152 = lean_ctor_get(x_150, 0);
lean_inc(x_152);
if (lean_is_exclusive(x_150)) {
 lean_ctor_release(x_150, 0);
 x_153 = x_150;
} else {
 lean_dec_ref(x_150);
 x_153 = lean_box(0);
}
if (lean_is_scalar(x_145)) {
 x_154 = lean_alloc_ctor(40, 1, 0);
} else {
 x_154 = x_145;
 lean_ctor_set_tag(x_154, 40);
}
lean_ctor_set(x_154, 0, x_152);
x_155 = lean_box(0);
x_156 = lean_alloc_ctor(6, 2, 0);
lean_ctor_set(x_156, 0, x_154);
lean_ctor_set(x_156, 1, x_155);
if (lean_is_scalar(x_153)) {
 x_157 = lean_alloc_ctor(1, 1, 0);
} else {
 x_157 = x_153;
}
lean_ctor_set(x_157, 0, x_156);
return x_157;
}
}
else
{
lean_object* x_158; lean_object* x_159; lean_object* x_160; lean_object* x_161; lean_object* x_162; lean_object* x_163; lean_object* x_164; 
lean_dec(x_144);
x_158 = lean_ctor_get(x_149, 0);
lean_inc(x_158);
if (lean_is_exclusive(x_149)) {
 lean_ctor_release(x_149, 0);
 x_159 = x_149;
} else {
 lean_dec_ref(x_149);
 x_159 = lean_box(0);
}
x_160 = lean_unsigned_to_nat(64u);
x_161 = l_BitVec_ofNat(x_160, x_158);
lean_dec(x_158);
if (lean_is_scalar(x_145)) {
 x_162 = lean_alloc_ctor(4, 1, 0);
} else {
 x_162 = x_145;
 lean_ctor_set_tag(x_162, 4);
}
lean_ctor_set(x_162, 0, x_161);
if (lean_is_scalar(x_141)) {
 x_163 = lean_alloc_ctor(2, 1, 0);
} else {
 x_163 = x_141;
 lean_ctor_set_tag(x_163, 2);
}
lean_ctor_set(x_163, 0, x_162);
if (lean_is_scalar(x_159)) {
 x_164 = lean_alloc_ctor(1, 1, 0);
} else {
 x_164 = x_159;
}
lean_ctor_set(x_164, 0, x_163);
return x_164;
}
}
else
{
lean_object* x_165; lean_object* x_166; lean_object* x_167; lean_object* x_168; lean_object* x_169; 
lean_dec(x_144);
x_165 = lean_ctor_get(x_148, 0);
lean_inc(x_165);
if (lean_is_exclusive(x_148)) {
 lean_ctor_release(x_148, 0);
 x_166 = x_148;
} else {
 lean_dec_ref(x_148);
 x_166 = lean_box(0);
}
if (lean_is_scalar(x_145)) {
 x_167 = lean_alloc_ctor(2, 1, 0);
} else {
 x_167 = x_145;
 lean_ctor_set_tag(x_167, 2);
}
lean_ctor_set(x_167, 0, x_165);
if (lean_is_scalar(x_141)) {
 x_168 = lean_alloc_ctor(2, 1, 0);
} else {
 x_168 = x_141;
 lean_ctor_set_tag(x_168, 2);
}
lean_ctor_set(x_168, 0, x_167);
if (lean_is_scalar(x_166)) {
 x_169 = lean_alloc_ctor(1, 1, 0);
} else {
 x_169 = x_166;
}
lean_ctor_set(x_169, 0, x_168);
return x_169;
}
}
else
{
lean_object* x_170; lean_object* x_171; lean_object* x_172; lean_object* x_173; lean_object* x_174; 
lean_dec(x_144);
x_170 = lean_ctor_get(x_147, 0);
lean_inc(x_170);
if (lean_is_exclusive(x_147)) {
 lean_ctor_release(x_147, 0);
 x_171 = x_147;
} else {
 lean_dec_ref(x_147);
 x_171 = lean_box(0);
}
if (lean_is_scalar(x_145)) {
 x_172 = lean_alloc_ctor(1, 1, 0);
} else {
 x_172 = x_145;
}
lean_ctor_set(x_172, 0, x_170);
if (lean_is_scalar(x_141)) {
 x_173 = lean_alloc_ctor(2, 1, 0);
} else {
 x_173 = x_141;
 lean_ctor_set_tag(x_173, 2);
}
lean_ctor_set(x_173, 0, x_172);
if (lean_is_scalar(x_171)) {
 x_174 = lean_alloc_ctor(1, 1, 0);
} else {
 x_174 = x_171;
}
lean_ctor_set(x_174, 0, x_173);
return x_174;
}
}
else
{
lean_object* x_175; lean_object* x_176; lean_object* x_177; lean_object* x_178; lean_object* x_179; 
lean_dec(x_144);
x_175 = lean_ctor_get(x_146, 0);
lean_inc(x_175);
if (lean_is_exclusive(x_146)) {
 lean_ctor_release(x_146, 0);
 x_176 = x_146;
} else {
 lean_dec_ref(x_146);
 x_176 = lean_box(0);
}
if (lean_is_scalar(x_145)) {
 x_177 = lean_alloc_ctor(0, 1, 0);
} else {
 x_177 = x_145;
 lean_ctor_set_tag(x_177, 0);
}
lean_ctor_set(x_177, 0, x_175);
if (lean_is_scalar(x_141)) {
 x_178 = lean_alloc_ctor(2, 1, 0);
} else {
 x_178 = x_141;
 lean_ctor_set_tag(x_178, 2);
}
lean_ctor_set(x_178, 0, x_177);
if (lean_is_scalar(x_176)) {
 x_179 = lean_alloc_ctor(1, 1, 0);
} else {
 x_179 = x_176;
}
lean_ctor_set(x_179, 0, x_178);
return x_179;
}
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_bind__loc(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 13)
{
lean_dec(x_2);
return x_1;
}
else
{
lean_object* x_3; 
x_3 = lean_alloc_ctor(13, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_letFromPat(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
switch (lean_obj_tag(x_1)) {
case 0:
{
lean_object* x_4; lean_object* x_5; 
x_4 = lean_box(0);
x_5 = lean_alloc_ctor(10, 3, 0);
lean_ctor_set(x_5, 0, x_4);
lean_ctor_set(x_5, 1, x_2);
lean_ctor_set(x_5, 2, x_3);
return x_5;
}
case 1:
{
uint8_t x_6; 
x_6 = !lean_is_exclusive(x_1);
if (x_6 == 0)
{
lean_object* x_7; 
x_7 = lean_alloc_ctor(10, 3, 0);
lean_ctor_set(x_7, 0, x_1);
lean_ctor_set(x_7, 1, x_2);
lean_ctor_set(x_7, 2, x_3);
return x_7;
}
else
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; 
x_8 = lean_ctor_get(x_1, 0);
lean_inc(x_8);
lean_dec(x_1);
x_9 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_9, 0, x_8);
x_10 = lean_alloc_ctor(10, 3, 0);
lean_ctor_set(x_10, 0, x_9);
lean_ctor_set(x_10, 1, x_2);
lean_ctor_set(x_10, 2, x_3);
return x_10;
}
}
default: 
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_11 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_11, 0, x_1);
lean_ctor_set(x_11, 1, x_3);
x_12 = lean_box(0);
x_13 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_13, 0, x_11);
lean_ctor_set(x_13, 1, x_12);
x_14 = lean_alloc_ctor(9, 2, 0);
lean_ctor_set(x_14, 0, x_2);
lean_ctor_set(x_14, 1, x_13);
return x_14;
}
}
}
}
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Expr___spec__2(lean_object* x_1, size_t x_2, size_t x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; 
x_5 = lean_usize_dec_eq(x_2, x_3);
if (x_5 == 0)
{
size_t x_6; size_t x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; 
x_6 = 1;
x_7 = lean_usize_sub(x_2, x_6);
x_8 = lean_array_uget(x_1, x_7);
x_9 = lean_box(0);
x_10 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_10, 0, x_4);
lean_ctor_set(x_10, 1, x_9);
x_11 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_11, 0, x_8);
lean_ctor_set(x_11, 1, x_10);
x_12 = l_CakeML_mk__binop___closed__4;
x_13 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_13, 0, x_12);
lean_ctor_set(x_13, 1, x_11);
x_2 = x_7;
x_4 = x_13;
goto _start;
}
else
{
return x_4;
}
}
}
LEAN_EXPORT lean_object* l_List_foldrTR___at_CakeML_ptree__Expr___spec__1(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; uint8_t x_6; 
x_3 = lean_array_mk(x_2);
x_4 = lean_array_get_size(x_3);
x_5 = lean_unsigned_to_nat(0u);
x_6 = lean_nat_dec_lt(x_5, x_4);
if (x_6 == 0)
{
lean_dec(x_4);
lean_dec(x_3);
return x_1;
}
else
{
size_t x_7; size_t x_8; lean_object* x_9; 
x_7 = lean_usize_of_nat(x_4);
lean_dec(x_4);
x_8 = 0;
x_9 = l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Expr___spec__2(x_3, x_7, x_8, x_1);
lean_dec(x_3);
return x_9;
}
}
}
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Expr___spec__4(lean_object* x_1, size_t x_2, size_t x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; 
x_5 = lean_usize_dec_eq(x_2, x_3);
if (x_5 == 0)
{
size_t x_6; size_t x_7; lean_object* x_8; 
x_6 = 1;
x_7 = lean_usize_sub(x_2, x_6);
x_8 = lean_array_uget(x_1, x_7);
if (lean_obj_tag(x_8) == 0)
{
lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; 
x_9 = lean_ctor_get(x_8, 0);
lean_inc(x_9);
lean_dec(x_8);
x_10 = lean_ctor_get(x_9, 0);
lean_inc(x_10);
x_11 = lean_ctor_get(x_9, 1);
lean_inc(x_11);
lean_dec(x_9);
x_12 = l_CakeML_letFromPat(x_10, x_11, x_4);
x_2 = x_7;
x_4 = x_12;
goto _start;
}
else
{
lean_object* x_14; lean_object* x_15; 
x_14 = lean_ctor_get(x_8, 0);
lean_inc(x_14);
lean_dec(x_8);
x_15 = lean_alloc_ctor(11, 2, 0);
lean_ctor_set(x_15, 0, x_14);
lean_ctor_set(x_15, 1, x_4);
x_2 = x_7;
x_4 = x_15;
goto _start;
}
}
else
{
return x_4;
}
}
}
LEAN_EXPORT lean_object* l_List_foldrTR___at_CakeML_ptree__Expr___spec__3(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; uint8_t x_6; 
x_3 = lean_array_mk(x_2);
x_4 = lean_array_get_size(x_3);
x_5 = lean_unsigned_to_nat(0u);
x_6 = lean_nat_dec_lt(x_5, x_4);
if (x_6 == 0)
{
lean_dec(x_4);
lean_dec(x_3);
return x_1;
}
else
{
size_t x_7; size_t x_8; lean_object* x_9; 
x_7 = lean_usize_of_nat(x_4);
lean_dec(x_4);
x_8 = 0;
x_9 = l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Expr___spec__4(x_3, x_7, x_8, x_1);
lean_dec(x_3);
return x_9;
}
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_box(38);
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(24);
x_2 = l_CakeML_ptree__Expr___closed__1;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_box(14);
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(30);
x_2 = l_CakeML_ptree__Expr___closed__3;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_box(26);
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(49);
x_2 = l_CakeML_ptree__Expr___closed__5;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(33);
x_2 = l_CakeML_ptree__Expr___closed__6;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__8() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("before", 6, 6);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__9() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Expr___closed__8;
x_2 = lean_string_data(x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__10() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Expr___closed__9;
x_2 = lean_alloc_ctor(63, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Expr___closed__9;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__12() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_CakeML_ptree__Pattern___closed__13;
x_3 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__13() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Expr___closed__12;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__14() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_box(0);
x_3 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__15() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__Expr___closed__14;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__16() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_box(27);
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__17() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(34);
x_2 = l_CakeML_ptree__Expr___closed__16;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Expr___closed__18() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(36);
x_2 = l_CakeML_ptree__Expr___closed__17;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Expr(uint8_t x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_3; 
lean_dec(x_2);
x_3 = lean_box(0);
return x_3;
}
else
{
uint8_t x_4; 
x_4 = !lean_is_exclusive(x_2);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; uint8_t x_7; uint8_t x_8; lean_object* x_9; 
x_5 = lean_ctor_get(x_2, 0);
x_6 = lean_ctor_get(x_2, 1);
x_7 = lean_unbox(x_5);
x_8 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_1, x_7);
if (x_8 == 0)
{
lean_object* x_20; 
lean_free_object(x_2);
lean_dec(x_6);
lean_dec(x_5);
x_20 = lean_box(0);
x_9 = x_20;
goto block_19;
}
else
{
uint8_t x_21; uint8_t x_22; uint8_t x_23; 
x_21 = 25;
x_22 = lean_unbox(x_5);
x_23 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_22, x_21);
if (x_23 == 0)
{
uint8_t x_24; uint8_t x_25; uint8_t x_26; 
x_24 = 30;
x_25 = lean_unbox(x_5);
x_26 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_25, x_24);
if (x_26 == 0)
{
uint8_t x_27; uint8_t x_28; uint8_t x_29; 
x_27 = 27;
x_28 = lean_unbox(x_5);
x_29 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_28, x_27);
if (x_29 == 0)
{
uint8_t x_30; uint8_t x_31; uint8_t x_32; 
lean_free_object(x_2);
x_30 = 36;
x_31 = lean_unbox(x_5);
x_32 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_31, x_30);
if (x_32 == 0)
{
uint8_t x_33; uint8_t x_34; uint8_t x_35; 
x_33 = 37;
x_34 = lean_unbox(x_5);
x_35 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_34, x_33);
if (x_35 == 0)
{
uint8_t x_36; uint8_t x_37; uint8_t x_38; 
x_36 = 38;
x_37 = lean_unbox(x_5);
x_38 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_37, x_36);
if (x_38 == 0)
{
uint8_t x_39; uint8_t x_40; uint8_t x_41; 
x_39 = 39;
x_40 = lean_unbox(x_5);
x_41 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_40, x_39);
if (x_41 == 0)
{
uint8_t x_42; uint8_t x_43; uint8_t x_44; 
x_42 = 40;
x_43 = lean_unbox(x_5);
x_44 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_43, x_42);
if (x_44 == 0)
{
uint8_t x_45; uint8_t x_46; uint8_t x_47; 
x_45 = 41;
x_46 = lean_unbox(x_5);
x_47 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_46, x_45);
if (x_47 == 0)
{
uint8_t x_48; uint8_t x_49; uint8_t x_50; 
x_48 = 42;
x_49 = lean_unbox(x_5);
x_50 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_49, x_48);
if (x_50 == 0)
{
uint8_t x_51; uint8_t x_52; uint8_t x_53; 
x_51 = 43;
x_52 = lean_unbox(x_5);
x_53 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_52, x_51);
if (x_53 == 0)
{
uint8_t x_54; uint8_t x_55; uint8_t x_56; 
x_54 = 44;
x_55 = lean_unbox(x_5);
x_56 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_55, x_54);
if (x_56 == 0)
{
uint8_t x_57; uint8_t x_58; uint8_t x_59; 
x_57 = 45;
x_58 = lean_unbox(x_5);
x_59 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_58, x_57);
if (x_59 == 0)
{
uint8_t x_60; uint8_t x_61; uint8_t x_62; 
x_60 = 46;
x_61 = lean_unbox(x_5);
lean_dec(x_5);
x_62 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_61, x_60);
if (x_62 == 0)
{
lean_object* x_63; 
lean_dec(x_6);
x_63 = lean_box(0);
x_9 = x_63;
goto block_19;
}
else
{
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_64; 
x_64 = lean_box(0);
x_9 = x_64;
goto block_19;
}
else
{
lean_object* x_65; 
x_65 = lean_ctor_get(x_6, 1);
lean_inc(x_65);
if (lean_obj_tag(x_65) == 0)
{
lean_object* x_66; lean_object* x_67; 
x_66 = lean_ctor_get(x_6, 0);
lean_inc(x_66);
lean_dec(x_6);
x_67 = l_CakeML_ptree__Expr(x_57, x_66);
x_9 = x_67;
goto block_19;
}
else
{
lean_object* x_68; 
x_68 = lean_ctor_get(x_65, 1);
lean_inc(x_68);
if (lean_obj_tag(x_68) == 0)
{
lean_object* x_69; lean_object* x_70; lean_object* x_71; uint8_t x_72; 
x_69 = lean_ctor_get(x_6, 0);
lean_inc(x_69);
lean_dec(x_6);
x_70 = lean_ctor_get(x_65, 0);
lean_inc(x_70);
lean_dec(x_65);
x_71 = lean_box(42);
x_72 = l_CakeML_tokcheck(x_69, x_71);
if (x_72 == 0)
{
lean_object* x_73; 
lean_dec(x_70);
x_73 = lean_box(0);
x_9 = x_73;
goto block_19;
}
else
{
lean_object* x_74; 
x_74 = l_CakeML_ptree__Expr(x_60, x_70);
if (lean_obj_tag(x_74) == 0)
{
lean_object* x_75; 
x_75 = lean_box(0);
x_9 = x_75;
goto block_19;
}
else
{
uint8_t x_76; 
x_76 = !lean_is_exclusive(x_74);
if (x_76 == 0)
{
lean_object* x_77; lean_object* x_78; 
x_77 = lean_ctor_get(x_74, 0);
x_78 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_78, 0, x_77);
lean_ctor_set(x_74, 0, x_78);
x_9 = x_74;
goto block_19;
}
else
{
lean_object* x_79; lean_object* x_80; lean_object* x_81; 
x_79 = lean_ctor_get(x_74, 0);
lean_inc(x_79);
lean_dec(x_74);
x_80 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_80, 0, x_79);
x_81 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_81, 0, x_80);
x_9 = x_81;
goto block_19;
}
}
}
}
else
{
lean_object* x_82; 
x_82 = lean_ctor_get(x_68, 1);
lean_inc(x_82);
if (lean_obj_tag(x_82) == 0)
{
lean_object* x_83; 
lean_dec(x_68);
lean_dec(x_65);
lean_dec(x_6);
x_83 = lean_box(0);
x_9 = x_83;
goto block_19;
}
else
{
lean_object* x_84; 
x_84 = lean_ctor_get(x_82, 1);
lean_inc(x_84);
if (lean_obj_tag(x_84) == 0)
{
lean_object* x_85; lean_object* x_86; lean_object* x_87; uint8_t x_88; 
x_85 = lean_ctor_get(x_6, 0);
lean_inc(x_85);
lean_dec(x_6);
x_86 = lean_ctor_get(x_65, 0);
lean_inc(x_86);
if (lean_is_exclusive(x_65)) {
 lean_ctor_release(x_65, 0);
 lean_ctor_release(x_65, 1);
 x_87 = x_65;
} else {
 lean_dec_ref(x_65);
 x_87 = lean_box(0);
}
x_88 = !lean_is_exclusive(x_68);
if (x_88 == 0)
{
lean_object* x_89; lean_object* x_90; uint8_t x_91; 
x_89 = lean_ctor_get(x_68, 0);
x_90 = lean_ctor_get(x_68, 1);
lean_dec(x_90);
x_91 = !lean_is_exclusive(x_82);
if (x_91 == 0)
{
lean_object* x_92; lean_object* x_93; lean_object* x_94; lean_object* x_95; lean_object* x_111; uint8_t x_112; 
x_92 = lean_ctor_get(x_82, 0);
x_93 = lean_ctor_get(x_82, 1);
lean_dec(x_93);
x_94 = lean_box(0);
lean_ctor_set(x_82, 1, x_94);
lean_ctor_set(x_82, 0, x_89);
lean_ctor_set(x_68, 0, x_85);
x_111 = l_CakeML_ptree__Expr___closed__4;
lean_inc(x_68);
x_112 = l_CakeML_tokcheckl(x_68, x_111);
if (x_112 == 0)
{
lean_object* x_113; 
x_113 = lean_box(0);
x_95 = x_113;
goto block_110;
}
else
{
uint8_t x_114; lean_object* x_115; 
x_114 = 56;
lean_inc(x_86);
x_115 = l_CakeML_ptree__Pattern(x_114, x_86);
if (lean_obj_tag(x_115) == 0)
{
lean_object* x_116; 
x_116 = lean_box(0);
x_95 = x_116;
goto block_110;
}
else
{
lean_object* x_117; lean_object* x_118; 
x_117 = lean_ctor_get(x_115, 0);
lean_inc(x_117);
lean_dec(x_115);
lean_inc(x_92);
x_118 = l_CakeML_ptree__Expr(x_60, x_92);
if (lean_obj_tag(x_118) == 0)
{
lean_object* x_119; 
lean_dec(x_117);
x_119 = lean_box(0);
x_95 = x_119;
goto block_110;
}
else
{
uint8_t x_120; 
lean_dec(x_68);
lean_dec(x_92);
lean_dec(x_87);
lean_dec(x_86);
x_120 = !lean_is_exclusive(x_118);
if (x_120 == 0)
{
lean_object* x_121; lean_object* x_122; 
x_121 = lean_ctor_get(x_118, 0);
x_122 = l_CakeML_mkFun(x_117, x_121);
lean_ctor_set(x_118, 0, x_122);
x_9 = x_118;
goto block_19;
}
else
{
lean_object* x_123; lean_object* x_124; lean_object* x_125; 
x_123 = lean_ctor_get(x_118, 0);
lean_inc(x_123);
lean_dec(x_118);
x_124 = l_CakeML_mkFun(x_117, x_123);
x_125 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_125, 0, x_124);
x_9 = x_125;
goto block_19;
}
}
}
}
block_110:
{
lean_object* x_96; uint8_t x_97; 
lean_dec(x_95);
x_96 = l_CakeML_ptree__Expr___closed__2;
x_97 = l_CakeML_tokcheckl(x_68, x_96);
if (x_97 == 0)
{
lean_object* x_98; 
lean_dec(x_92);
lean_dec(x_87);
lean_dec(x_86);
x_98 = lean_box(0);
x_9 = x_98;
goto block_19;
}
else
{
lean_object* x_99; 
x_99 = l_CakeML_ptree__Expr(x_60, x_86);
if (lean_obj_tag(x_99) == 0)
{
lean_object* x_100; 
lean_dec(x_92);
lean_dec(x_87);
x_100 = lean_box(0);
x_9 = x_100;
goto block_19;
}
else
{
lean_object* x_101; lean_object* x_102; 
x_101 = lean_ctor_get(x_99, 0);
lean_inc(x_101);
lean_dec(x_99);
x_102 = l_CakeML_ptree__PEs(x_92);
if (lean_obj_tag(x_102) == 0)
{
lean_object* x_103; 
lean_dec(x_101);
lean_dec(x_87);
x_103 = lean_box(0);
x_9 = x_103;
goto block_19;
}
else
{
uint8_t x_104; 
x_104 = !lean_is_exclusive(x_102);
if (x_104 == 0)
{
lean_object* x_105; lean_object* x_106; 
x_105 = lean_ctor_get(x_102, 0);
if (lean_is_scalar(x_87)) {
 x_106 = lean_alloc_ctor(9, 2, 0);
} else {
 x_106 = x_87;
 lean_ctor_set_tag(x_106, 9);
}
lean_ctor_set(x_106, 0, x_101);
lean_ctor_set(x_106, 1, x_105);
lean_ctor_set(x_102, 0, x_106);
x_9 = x_102;
goto block_19;
}
else
{
lean_object* x_107; lean_object* x_108; lean_object* x_109; 
x_107 = lean_ctor_get(x_102, 0);
lean_inc(x_107);
lean_dec(x_102);
if (lean_is_scalar(x_87)) {
 x_108 = lean_alloc_ctor(9, 2, 0);
} else {
 x_108 = x_87;
 lean_ctor_set_tag(x_108, 9);
}
lean_ctor_set(x_108, 0, x_101);
lean_ctor_set(x_108, 1, x_107);
x_109 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_109, 0, x_108);
x_9 = x_109;
goto block_19;
}
}
}
}
}
}
else
{
lean_object* x_126; lean_object* x_127; lean_object* x_128; lean_object* x_129; lean_object* x_143; uint8_t x_144; 
x_126 = lean_ctor_get(x_82, 0);
lean_inc(x_126);
lean_dec(x_82);
x_127 = lean_box(0);
x_128 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_128, 0, x_89);
lean_ctor_set(x_128, 1, x_127);
lean_ctor_set(x_68, 1, x_128);
lean_ctor_set(x_68, 0, x_85);
x_143 = l_CakeML_ptree__Expr___closed__4;
lean_inc(x_68);
x_144 = l_CakeML_tokcheckl(x_68, x_143);
if (x_144 == 0)
{
lean_object* x_145; 
x_145 = lean_box(0);
x_129 = x_145;
goto block_142;
}
else
{
uint8_t x_146; lean_object* x_147; 
x_146 = 56;
lean_inc(x_86);
x_147 = l_CakeML_ptree__Pattern(x_146, x_86);
if (lean_obj_tag(x_147) == 0)
{
lean_object* x_148; 
x_148 = lean_box(0);
x_129 = x_148;
goto block_142;
}
else
{
lean_object* x_149; lean_object* x_150; 
x_149 = lean_ctor_get(x_147, 0);
lean_inc(x_149);
lean_dec(x_147);
lean_inc(x_126);
x_150 = l_CakeML_ptree__Expr(x_60, x_126);
if (lean_obj_tag(x_150) == 0)
{
lean_object* x_151; 
lean_dec(x_149);
x_151 = lean_box(0);
x_129 = x_151;
goto block_142;
}
else
{
lean_object* x_152; lean_object* x_153; lean_object* x_154; lean_object* x_155; 
lean_dec(x_68);
lean_dec(x_126);
lean_dec(x_87);
lean_dec(x_86);
x_152 = lean_ctor_get(x_150, 0);
lean_inc(x_152);
if (lean_is_exclusive(x_150)) {
 lean_ctor_release(x_150, 0);
 x_153 = x_150;
} else {
 lean_dec_ref(x_150);
 x_153 = lean_box(0);
}
x_154 = l_CakeML_mkFun(x_149, x_152);
if (lean_is_scalar(x_153)) {
 x_155 = lean_alloc_ctor(1, 1, 0);
} else {
 x_155 = x_153;
}
lean_ctor_set(x_155, 0, x_154);
x_9 = x_155;
goto block_19;
}
}
}
block_142:
{
lean_object* x_130; uint8_t x_131; 
lean_dec(x_129);
x_130 = l_CakeML_ptree__Expr___closed__2;
x_131 = l_CakeML_tokcheckl(x_68, x_130);
if (x_131 == 0)
{
lean_object* x_132; 
lean_dec(x_126);
lean_dec(x_87);
lean_dec(x_86);
x_132 = lean_box(0);
x_9 = x_132;
goto block_19;
}
else
{
lean_object* x_133; 
x_133 = l_CakeML_ptree__Expr(x_60, x_86);
if (lean_obj_tag(x_133) == 0)
{
lean_object* x_134; 
lean_dec(x_126);
lean_dec(x_87);
x_134 = lean_box(0);
x_9 = x_134;
goto block_19;
}
else
{
lean_object* x_135; lean_object* x_136; 
x_135 = lean_ctor_get(x_133, 0);
lean_inc(x_135);
lean_dec(x_133);
x_136 = l_CakeML_ptree__PEs(x_126);
if (lean_obj_tag(x_136) == 0)
{
lean_object* x_137; 
lean_dec(x_135);
lean_dec(x_87);
x_137 = lean_box(0);
x_9 = x_137;
goto block_19;
}
else
{
lean_object* x_138; lean_object* x_139; lean_object* x_140; lean_object* x_141; 
x_138 = lean_ctor_get(x_136, 0);
lean_inc(x_138);
if (lean_is_exclusive(x_136)) {
 lean_ctor_release(x_136, 0);
 x_139 = x_136;
} else {
 lean_dec_ref(x_136);
 x_139 = lean_box(0);
}
if (lean_is_scalar(x_87)) {
 x_140 = lean_alloc_ctor(9, 2, 0);
} else {
 x_140 = x_87;
 lean_ctor_set_tag(x_140, 9);
}
lean_ctor_set(x_140, 0, x_135);
lean_ctor_set(x_140, 1, x_138);
if (lean_is_scalar(x_139)) {
 x_141 = lean_alloc_ctor(1, 1, 0);
} else {
 x_141 = x_139;
}
lean_ctor_set(x_141, 0, x_140);
x_9 = x_141;
goto block_19;
}
}
}
}
}
}
else
{
lean_object* x_156; lean_object* x_157; lean_object* x_158; lean_object* x_159; lean_object* x_160; lean_object* x_161; lean_object* x_162; lean_object* x_176; uint8_t x_177; 
x_156 = lean_ctor_get(x_68, 0);
lean_inc(x_156);
lean_dec(x_68);
x_157 = lean_ctor_get(x_82, 0);
lean_inc(x_157);
if (lean_is_exclusive(x_82)) {
 lean_ctor_release(x_82, 0);
 lean_ctor_release(x_82, 1);
 x_158 = x_82;
} else {
 lean_dec_ref(x_82);
 x_158 = lean_box(0);
}
x_159 = lean_box(0);
if (lean_is_scalar(x_158)) {
 x_160 = lean_alloc_ctor(1, 2, 0);
} else {
 x_160 = x_158;
}
lean_ctor_set(x_160, 0, x_156);
lean_ctor_set(x_160, 1, x_159);
x_161 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_161, 0, x_85);
lean_ctor_set(x_161, 1, x_160);
x_176 = l_CakeML_ptree__Expr___closed__4;
lean_inc(x_161);
x_177 = l_CakeML_tokcheckl(x_161, x_176);
if (x_177 == 0)
{
lean_object* x_178; 
x_178 = lean_box(0);
x_162 = x_178;
goto block_175;
}
else
{
uint8_t x_179; lean_object* x_180; 
x_179 = 56;
lean_inc(x_86);
x_180 = l_CakeML_ptree__Pattern(x_179, x_86);
if (lean_obj_tag(x_180) == 0)
{
lean_object* x_181; 
x_181 = lean_box(0);
x_162 = x_181;
goto block_175;
}
else
{
lean_object* x_182; lean_object* x_183; 
x_182 = lean_ctor_get(x_180, 0);
lean_inc(x_182);
lean_dec(x_180);
lean_inc(x_157);
x_183 = l_CakeML_ptree__Expr(x_60, x_157);
if (lean_obj_tag(x_183) == 0)
{
lean_object* x_184; 
lean_dec(x_182);
x_184 = lean_box(0);
x_162 = x_184;
goto block_175;
}
else
{
lean_object* x_185; lean_object* x_186; lean_object* x_187; lean_object* x_188; 
lean_dec(x_161);
lean_dec(x_157);
lean_dec(x_87);
lean_dec(x_86);
x_185 = lean_ctor_get(x_183, 0);
lean_inc(x_185);
if (lean_is_exclusive(x_183)) {
 lean_ctor_release(x_183, 0);
 x_186 = x_183;
} else {
 lean_dec_ref(x_183);
 x_186 = lean_box(0);
}
x_187 = l_CakeML_mkFun(x_182, x_185);
if (lean_is_scalar(x_186)) {
 x_188 = lean_alloc_ctor(1, 1, 0);
} else {
 x_188 = x_186;
}
lean_ctor_set(x_188, 0, x_187);
x_9 = x_188;
goto block_19;
}
}
}
block_175:
{
lean_object* x_163; uint8_t x_164; 
lean_dec(x_162);
x_163 = l_CakeML_ptree__Expr___closed__2;
x_164 = l_CakeML_tokcheckl(x_161, x_163);
if (x_164 == 0)
{
lean_object* x_165; 
lean_dec(x_157);
lean_dec(x_87);
lean_dec(x_86);
x_165 = lean_box(0);
x_9 = x_165;
goto block_19;
}
else
{
lean_object* x_166; 
x_166 = l_CakeML_ptree__Expr(x_60, x_86);
if (lean_obj_tag(x_166) == 0)
{
lean_object* x_167; 
lean_dec(x_157);
lean_dec(x_87);
x_167 = lean_box(0);
x_9 = x_167;
goto block_19;
}
else
{
lean_object* x_168; lean_object* x_169; 
x_168 = lean_ctor_get(x_166, 0);
lean_inc(x_168);
lean_dec(x_166);
x_169 = l_CakeML_ptree__PEs(x_157);
if (lean_obj_tag(x_169) == 0)
{
lean_object* x_170; 
lean_dec(x_168);
lean_dec(x_87);
x_170 = lean_box(0);
x_9 = x_170;
goto block_19;
}
else
{
lean_object* x_171; lean_object* x_172; lean_object* x_173; lean_object* x_174; 
x_171 = lean_ctor_get(x_169, 0);
lean_inc(x_171);
if (lean_is_exclusive(x_169)) {
 lean_ctor_release(x_169, 0);
 x_172 = x_169;
} else {
 lean_dec_ref(x_169);
 x_172 = lean_box(0);
}
if (lean_is_scalar(x_87)) {
 x_173 = lean_alloc_ctor(9, 2, 0);
} else {
 x_173 = x_87;
 lean_ctor_set_tag(x_173, 9);
}
lean_ctor_set(x_173, 0, x_168);
lean_ctor_set(x_173, 1, x_171);
if (lean_is_scalar(x_172)) {
 x_174 = lean_alloc_ctor(1, 1, 0);
} else {
 x_174 = x_172;
}
lean_ctor_set(x_174, 0, x_173);
x_9 = x_174;
goto block_19;
}
}
}
}
}
}
else
{
lean_object* x_189; 
x_189 = lean_ctor_get(x_84, 1);
lean_inc(x_189);
if (lean_obj_tag(x_189) == 0)
{
lean_object* x_190; 
lean_dec(x_84);
lean_dec(x_82);
lean_dec(x_68);
lean_dec(x_65);
lean_dec(x_6);
x_190 = lean_box(0);
x_9 = x_190;
goto block_19;
}
else
{
lean_object* x_191; 
x_191 = lean_ctor_get(x_189, 1);
lean_inc(x_191);
if (lean_obj_tag(x_191) == 0)
{
lean_object* x_192; lean_object* x_193; lean_object* x_194; uint8_t x_195; 
x_192 = lean_ctor_get(x_6, 0);
lean_inc(x_192);
lean_dec(x_6);
x_193 = lean_ctor_get(x_65, 0);
lean_inc(x_193);
lean_dec(x_65);
x_194 = lean_ctor_get(x_68, 0);
lean_inc(x_194);
lean_dec(x_68);
x_195 = !lean_is_exclusive(x_82);
if (x_195 == 0)
{
lean_object* x_196; lean_object* x_197; uint8_t x_198; 
x_196 = lean_ctor_get(x_82, 0);
x_197 = lean_ctor_get(x_82, 1);
lean_dec(x_197);
x_198 = !lean_is_exclusive(x_84);
if (x_198 == 0)
{
lean_object* x_199; lean_object* x_200; uint8_t x_201; 
x_199 = lean_ctor_get(x_84, 0);
x_200 = lean_ctor_get(x_84, 1);
lean_dec(x_200);
x_201 = !lean_is_exclusive(x_189);
if (x_201 == 0)
{
lean_object* x_202; lean_object* x_203; lean_object* x_204; lean_object* x_205; uint8_t x_206; 
x_202 = lean_ctor_get(x_189, 0);
x_203 = lean_ctor_get(x_189, 1);
lean_dec(x_203);
x_204 = lean_box(0);
lean_ctor_set(x_189, 1, x_204);
lean_ctor_set(x_189, 0, x_199);
lean_ctor_set(x_84, 0, x_194);
lean_ctor_set(x_82, 0, x_192);
x_205 = l_CakeML_ptree__Expr___closed__7;
x_206 = l_CakeML_tokcheckl(x_82, x_205);
if (x_206 == 0)
{
lean_object* x_207; 
lean_dec(x_202);
lean_dec(x_196);
lean_dec(x_193);
x_207 = lean_box(0);
x_9 = x_207;
goto block_19;
}
else
{
lean_object* x_208; 
x_208 = l_CakeML_ptree__Expr(x_60, x_193);
if (lean_obj_tag(x_208) == 0)
{
lean_object* x_209; 
lean_dec(x_202);
lean_dec(x_196);
x_209 = lean_box(0);
x_9 = x_209;
goto block_19;
}
else
{
lean_object* x_210; lean_object* x_211; 
x_210 = lean_ctor_get(x_208, 0);
lean_inc(x_210);
lean_dec(x_208);
x_211 = l_CakeML_ptree__Expr(x_60, x_196);
if (lean_obj_tag(x_211) == 0)
{
lean_object* x_212; 
lean_dec(x_210);
lean_dec(x_202);
x_212 = lean_box(0);
x_9 = x_212;
goto block_19;
}
else
{
lean_object* x_213; lean_object* x_214; 
x_213 = lean_ctor_get(x_211, 0);
lean_inc(x_213);
lean_dec(x_211);
x_214 = l_CakeML_ptree__Expr(x_60, x_202);
if (lean_obj_tag(x_214) == 0)
{
lean_object* x_215; 
lean_dec(x_213);
lean_dec(x_210);
x_215 = lean_box(0);
x_9 = x_215;
goto block_19;
}
else
{
uint8_t x_216; 
x_216 = !lean_is_exclusive(x_214);
if (x_216 == 0)
{
lean_object* x_217; lean_object* x_218; 
x_217 = lean_ctor_get(x_214, 0);
x_218 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_218, 0, x_210);
lean_ctor_set(x_218, 1, x_213);
lean_ctor_set(x_218, 2, x_217);
lean_ctor_set(x_214, 0, x_218);
x_9 = x_214;
goto block_19;
}
else
{
lean_object* x_219; lean_object* x_220; lean_object* x_221; 
x_219 = lean_ctor_get(x_214, 0);
lean_inc(x_219);
lean_dec(x_214);
x_220 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_220, 0, x_210);
lean_ctor_set(x_220, 1, x_213);
lean_ctor_set(x_220, 2, x_219);
x_221 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_221, 0, x_220);
x_9 = x_221;
goto block_19;
}
}
}
}
}
}
else
{
lean_object* x_222; lean_object* x_223; lean_object* x_224; lean_object* x_225; uint8_t x_226; 
x_222 = lean_ctor_get(x_189, 0);
lean_inc(x_222);
lean_dec(x_189);
x_223 = lean_box(0);
x_224 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_224, 0, x_199);
lean_ctor_set(x_224, 1, x_223);
lean_ctor_set(x_84, 1, x_224);
lean_ctor_set(x_84, 0, x_194);
lean_ctor_set(x_82, 0, x_192);
x_225 = l_CakeML_ptree__Expr___closed__7;
x_226 = l_CakeML_tokcheckl(x_82, x_225);
if (x_226 == 0)
{
lean_object* x_227; 
lean_dec(x_222);
lean_dec(x_196);
lean_dec(x_193);
x_227 = lean_box(0);
x_9 = x_227;
goto block_19;
}
else
{
lean_object* x_228; 
x_228 = l_CakeML_ptree__Expr(x_60, x_193);
if (lean_obj_tag(x_228) == 0)
{
lean_object* x_229; 
lean_dec(x_222);
lean_dec(x_196);
x_229 = lean_box(0);
x_9 = x_229;
goto block_19;
}
else
{
lean_object* x_230; lean_object* x_231; 
x_230 = lean_ctor_get(x_228, 0);
lean_inc(x_230);
lean_dec(x_228);
x_231 = l_CakeML_ptree__Expr(x_60, x_196);
if (lean_obj_tag(x_231) == 0)
{
lean_object* x_232; 
lean_dec(x_230);
lean_dec(x_222);
x_232 = lean_box(0);
x_9 = x_232;
goto block_19;
}
else
{
lean_object* x_233; lean_object* x_234; 
x_233 = lean_ctor_get(x_231, 0);
lean_inc(x_233);
lean_dec(x_231);
x_234 = l_CakeML_ptree__Expr(x_60, x_222);
if (lean_obj_tag(x_234) == 0)
{
lean_object* x_235; 
lean_dec(x_233);
lean_dec(x_230);
x_235 = lean_box(0);
x_9 = x_235;
goto block_19;
}
else
{
lean_object* x_236; lean_object* x_237; lean_object* x_238; lean_object* x_239; 
x_236 = lean_ctor_get(x_234, 0);
lean_inc(x_236);
if (lean_is_exclusive(x_234)) {
 lean_ctor_release(x_234, 0);
 x_237 = x_234;
} else {
 lean_dec_ref(x_234);
 x_237 = lean_box(0);
}
x_238 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_238, 0, x_230);
lean_ctor_set(x_238, 1, x_233);
lean_ctor_set(x_238, 2, x_236);
if (lean_is_scalar(x_237)) {
 x_239 = lean_alloc_ctor(1, 1, 0);
} else {
 x_239 = x_237;
}
lean_ctor_set(x_239, 0, x_238);
x_9 = x_239;
goto block_19;
}
}
}
}
}
}
else
{
lean_object* x_240; lean_object* x_241; lean_object* x_242; lean_object* x_243; lean_object* x_244; lean_object* x_245; lean_object* x_246; uint8_t x_247; 
x_240 = lean_ctor_get(x_84, 0);
lean_inc(x_240);
lean_dec(x_84);
x_241 = lean_ctor_get(x_189, 0);
lean_inc(x_241);
if (lean_is_exclusive(x_189)) {
 lean_ctor_release(x_189, 0);
 lean_ctor_release(x_189, 1);
 x_242 = x_189;
} else {
 lean_dec_ref(x_189);
 x_242 = lean_box(0);
}
x_243 = lean_box(0);
if (lean_is_scalar(x_242)) {
 x_244 = lean_alloc_ctor(1, 2, 0);
} else {
 x_244 = x_242;
}
lean_ctor_set(x_244, 0, x_240);
lean_ctor_set(x_244, 1, x_243);
x_245 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_245, 0, x_194);
lean_ctor_set(x_245, 1, x_244);
lean_ctor_set(x_82, 1, x_245);
lean_ctor_set(x_82, 0, x_192);
x_246 = l_CakeML_ptree__Expr___closed__7;
x_247 = l_CakeML_tokcheckl(x_82, x_246);
if (x_247 == 0)
{
lean_object* x_248; 
lean_dec(x_241);
lean_dec(x_196);
lean_dec(x_193);
x_248 = lean_box(0);
x_9 = x_248;
goto block_19;
}
else
{
lean_object* x_249; 
x_249 = l_CakeML_ptree__Expr(x_60, x_193);
if (lean_obj_tag(x_249) == 0)
{
lean_object* x_250; 
lean_dec(x_241);
lean_dec(x_196);
x_250 = lean_box(0);
x_9 = x_250;
goto block_19;
}
else
{
lean_object* x_251; lean_object* x_252; 
x_251 = lean_ctor_get(x_249, 0);
lean_inc(x_251);
lean_dec(x_249);
x_252 = l_CakeML_ptree__Expr(x_60, x_196);
if (lean_obj_tag(x_252) == 0)
{
lean_object* x_253; 
lean_dec(x_251);
lean_dec(x_241);
x_253 = lean_box(0);
x_9 = x_253;
goto block_19;
}
else
{
lean_object* x_254; lean_object* x_255; 
x_254 = lean_ctor_get(x_252, 0);
lean_inc(x_254);
lean_dec(x_252);
x_255 = l_CakeML_ptree__Expr(x_60, x_241);
if (lean_obj_tag(x_255) == 0)
{
lean_object* x_256; 
lean_dec(x_254);
lean_dec(x_251);
x_256 = lean_box(0);
x_9 = x_256;
goto block_19;
}
else
{
lean_object* x_257; lean_object* x_258; lean_object* x_259; lean_object* x_260; 
x_257 = lean_ctor_get(x_255, 0);
lean_inc(x_257);
if (lean_is_exclusive(x_255)) {
 lean_ctor_release(x_255, 0);
 x_258 = x_255;
} else {
 lean_dec_ref(x_255);
 x_258 = lean_box(0);
}
x_259 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_259, 0, x_251);
lean_ctor_set(x_259, 1, x_254);
lean_ctor_set(x_259, 2, x_257);
if (lean_is_scalar(x_258)) {
 x_260 = lean_alloc_ctor(1, 1, 0);
} else {
 x_260 = x_258;
}
lean_ctor_set(x_260, 0, x_259);
x_9 = x_260;
goto block_19;
}
}
}
}
}
}
else
{
lean_object* x_261; lean_object* x_262; lean_object* x_263; lean_object* x_264; lean_object* x_265; lean_object* x_266; lean_object* x_267; lean_object* x_268; lean_object* x_269; lean_object* x_270; uint8_t x_271; 
x_261 = lean_ctor_get(x_82, 0);
lean_inc(x_261);
lean_dec(x_82);
x_262 = lean_ctor_get(x_84, 0);
lean_inc(x_262);
if (lean_is_exclusive(x_84)) {
 lean_ctor_release(x_84, 0);
 lean_ctor_release(x_84, 1);
 x_263 = x_84;
} else {
 lean_dec_ref(x_84);
 x_263 = lean_box(0);
}
x_264 = lean_ctor_get(x_189, 0);
lean_inc(x_264);
if (lean_is_exclusive(x_189)) {
 lean_ctor_release(x_189, 0);
 lean_ctor_release(x_189, 1);
 x_265 = x_189;
} else {
 lean_dec_ref(x_189);
 x_265 = lean_box(0);
}
x_266 = lean_box(0);
if (lean_is_scalar(x_265)) {
 x_267 = lean_alloc_ctor(1, 2, 0);
} else {
 x_267 = x_265;
}
lean_ctor_set(x_267, 0, x_262);
lean_ctor_set(x_267, 1, x_266);
if (lean_is_scalar(x_263)) {
 x_268 = lean_alloc_ctor(1, 2, 0);
} else {
 x_268 = x_263;
}
lean_ctor_set(x_268, 0, x_194);
lean_ctor_set(x_268, 1, x_267);
x_269 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_269, 0, x_192);
lean_ctor_set(x_269, 1, x_268);
x_270 = l_CakeML_ptree__Expr___closed__7;
x_271 = l_CakeML_tokcheckl(x_269, x_270);
if (x_271 == 0)
{
lean_object* x_272; 
lean_dec(x_264);
lean_dec(x_261);
lean_dec(x_193);
x_272 = lean_box(0);
x_9 = x_272;
goto block_19;
}
else
{
lean_object* x_273; 
x_273 = l_CakeML_ptree__Expr(x_60, x_193);
if (lean_obj_tag(x_273) == 0)
{
lean_object* x_274; 
lean_dec(x_264);
lean_dec(x_261);
x_274 = lean_box(0);
x_9 = x_274;
goto block_19;
}
else
{
lean_object* x_275; lean_object* x_276; 
x_275 = lean_ctor_get(x_273, 0);
lean_inc(x_275);
lean_dec(x_273);
x_276 = l_CakeML_ptree__Expr(x_60, x_261);
if (lean_obj_tag(x_276) == 0)
{
lean_object* x_277; 
lean_dec(x_275);
lean_dec(x_264);
x_277 = lean_box(0);
x_9 = x_277;
goto block_19;
}
else
{
lean_object* x_278; lean_object* x_279; 
x_278 = lean_ctor_get(x_276, 0);
lean_inc(x_278);
lean_dec(x_276);
x_279 = l_CakeML_ptree__Expr(x_60, x_264);
if (lean_obj_tag(x_279) == 0)
{
lean_object* x_280; 
lean_dec(x_278);
lean_dec(x_275);
x_280 = lean_box(0);
x_9 = x_280;
goto block_19;
}
else
{
lean_object* x_281; lean_object* x_282; lean_object* x_283; lean_object* x_284; 
x_281 = lean_ctor_get(x_279, 0);
lean_inc(x_281);
if (lean_is_exclusive(x_279)) {
 lean_ctor_release(x_279, 0);
 x_282 = x_279;
} else {
 lean_dec_ref(x_279);
 x_282 = lean_box(0);
}
x_283 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_283, 0, x_275);
lean_ctor_set(x_283, 1, x_278);
lean_ctor_set(x_283, 2, x_281);
if (lean_is_scalar(x_282)) {
 x_284 = lean_alloc_ctor(1, 1, 0);
} else {
 x_284 = x_282;
}
lean_ctor_set(x_284, 0, x_283);
x_9 = x_284;
goto block_19;
}
}
}
}
}
}
else
{
lean_object* x_285; 
lean_dec(x_191);
lean_dec(x_189);
lean_dec(x_84);
lean_dec(x_82);
lean_dec(x_68);
lean_dec(x_65);
lean_dec(x_6);
x_285 = lean_box(0);
x_9 = x_285;
goto block_19;
}
}
}
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_286; 
x_286 = lean_box(0);
x_9 = x_286;
goto block_19;
}
else
{
lean_object* x_287; 
x_287 = lean_ctor_get(x_6, 1);
lean_inc(x_287);
if (lean_obj_tag(x_287) == 0)
{
lean_object* x_288; lean_object* x_289; 
x_288 = lean_ctor_get(x_6, 0);
lean_inc(x_288);
lean_dec(x_6);
x_289 = l_CakeML_ptree__Expr(x_54, x_288);
x_9 = x_289;
goto block_19;
}
else
{
lean_object* x_290; 
x_290 = lean_ctor_get(x_287, 1);
lean_inc(x_290);
if (lean_obj_tag(x_290) == 0)
{
lean_object* x_291; 
lean_dec(x_287);
lean_dec(x_6);
x_291 = lean_box(0);
x_9 = x_291;
goto block_19;
}
else
{
lean_object* x_292; 
x_292 = lean_ctor_get(x_290, 1);
lean_inc(x_292);
if (lean_obj_tag(x_292) == 0)
{
lean_object* x_293; lean_object* x_294; uint8_t x_295; 
x_293 = lean_ctor_get(x_6, 0);
lean_inc(x_293);
lean_dec(x_6);
x_294 = lean_ctor_get(x_287, 0);
lean_inc(x_294);
lean_dec(x_287);
x_295 = !lean_is_exclusive(x_290);
if (x_295 == 0)
{
lean_object* x_296; lean_object* x_297; lean_object* x_298; uint8_t x_299; 
x_296 = lean_ctor_get(x_290, 0);
x_297 = lean_ctor_get(x_290, 1);
lean_dec(x_297);
x_298 = lean_box(32);
x_299 = l_CakeML_tokcheck(x_294, x_298);
if (x_299 == 0)
{
lean_object* x_300; 
lean_free_object(x_290);
lean_dec(x_296);
lean_dec(x_293);
x_300 = lean_box(0);
x_9 = x_300;
goto block_19;
}
else
{
lean_object* x_301; 
x_301 = l_CakeML_ptree__Expr(x_54, x_293);
if (lean_obj_tag(x_301) == 0)
{
lean_object* x_302; 
lean_free_object(x_290);
lean_dec(x_296);
x_302 = lean_box(0);
x_9 = x_302;
goto block_19;
}
else
{
lean_object* x_303; lean_object* x_304; 
x_303 = lean_ctor_get(x_301, 0);
lean_inc(x_303);
lean_dec(x_301);
x_304 = l_CakeML_ptree__PEs(x_296);
if (lean_obj_tag(x_304) == 0)
{
lean_object* x_305; 
lean_dec(x_303);
lean_free_object(x_290);
x_305 = lean_box(0);
x_9 = x_305;
goto block_19;
}
else
{
uint8_t x_306; 
x_306 = !lean_is_exclusive(x_304);
if (x_306 == 0)
{
lean_object* x_307; 
x_307 = lean_ctor_get(x_304, 0);
lean_ctor_set(x_290, 1, x_307);
lean_ctor_set(x_290, 0, x_303);
lean_ctor_set(x_304, 0, x_290);
x_9 = x_304;
goto block_19;
}
else
{
lean_object* x_308; lean_object* x_309; 
x_308 = lean_ctor_get(x_304, 0);
lean_inc(x_308);
lean_dec(x_304);
lean_ctor_set(x_290, 1, x_308);
lean_ctor_set(x_290, 0, x_303);
x_309 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_309, 0, x_290);
x_9 = x_309;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_310; lean_object* x_311; uint8_t x_312; 
x_310 = lean_ctor_get(x_290, 0);
lean_inc(x_310);
lean_dec(x_290);
x_311 = lean_box(32);
x_312 = l_CakeML_tokcheck(x_294, x_311);
if (x_312 == 0)
{
lean_object* x_313; 
lean_dec(x_310);
lean_dec(x_293);
x_313 = lean_box(0);
x_9 = x_313;
goto block_19;
}
else
{
lean_object* x_314; 
x_314 = l_CakeML_ptree__Expr(x_54, x_293);
if (lean_obj_tag(x_314) == 0)
{
lean_object* x_315; 
lean_dec(x_310);
x_315 = lean_box(0);
x_9 = x_315;
goto block_19;
}
else
{
lean_object* x_316; lean_object* x_317; 
x_316 = lean_ctor_get(x_314, 0);
lean_inc(x_316);
lean_dec(x_314);
x_317 = l_CakeML_ptree__PEs(x_310);
if (lean_obj_tag(x_317) == 0)
{
lean_object* x_318; 
lean_dec(x_316);
x_318 = lean_box(0);
x_9 = x_318;
goto block_19;
}
else
{
lean_object* x_319; lean_object* x_320; lean_object* x_321; lean_object* x_322; 
x_319 = lean_ctor_get(x_317, 0);
lean_inc(x_319);
if (lean_is_exclusive(x_317)) {
 lean_ctor_release(x_317, 0);
 x_320 = x_317;
} else {
 lean_dec_ref(x_317);
 x_320 = lean_box(0);
}
x_321 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_321, 0, x_316);
lean_ctor_set(x_321, 1, x_319);
if (lean_is_scalar(x_320)) {
 x_322 = lean_alloc_ctor(1, 1, 0);
} else {
 x_322 = x_320;
}
lean_ctor_set(x_322, 0, x_321);
x_9 = x_322;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_323; 
lean_dec(x_292);
lean_dec(x_290);
lean_dec(x_287);
lean_dec(x_6);
x_323 = lean_box(0);
x_9 = x_323;
goto block_19;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_324; 
x_324 = lean_box(0);
x_9 = x_324;
goto block_19;
}
else
{
lean_object* x_325; 
x_325 = lean_ctor_get(x_6, 1);
lean_inc(x_325);
if (lean_obj_tag(x_325) == 0)
{
lean_object* x_326; lean_object* x_327; 
x_326 = lean_ctor_get(x_6, 0);
lean_inc(x_326);
lean_dec(x_6);
x_327 = l_CakeML_ptree__Expr(x_51, x_326);
x_9 = x_327;
goto block_19;
}
else
{
lean_object* x_328; 
x_328 = lean_ctor_get(x_325, 1);
lean_inc(x_328);
if (lean_obj_tag(x_328) == 0)
{
lean_object* x_329; 
lean_dec(x_325);
lean_dec(x_6);
x_329 = lean_box(0);
x_9 = x_329;
goto block_19;
}
else
{
lean_object* x_330; 
x_330 = lean_ctor_get(x_328, 1);
lean_inc(x_330);
if (lean_obj_tag(x_330) == 0)
{
lean_object* x_331; lean_object* x_332; lean_object* x_333; lean_object* x_334; uint8_t x_335; 
x_331 = lean_ctor_get(x_6, 0);
lean_inc(x_331);
lean_dec(x_6);
x_332 = lean_ctor_get(x_325, 0);
lean_inc(x_332);
lean_dec(x_325);
x_333 = lean_ctor_get(x_328, 0);
lean_inc(x_333);
lean_dec(x_328);
x_334 = lean_box(41);
x_335 = l_CakeML_tokcheck(x_332, x_334);
if (x_335 == 0)
{
lean_object* x_336; 
lean_dec(x_333);
lean_dec(x_331);
x_336 = lean_box(0);
x_9 = x_336;
goto block_19;
}
else
{
lean_object* x_337; 
x_337 = l_CakeML_ptree__Expr(x_54, x_331);
if (lean_obj_tag(x_337) == 0)
{
lean_object* x_338; 
lean_dec(x_333);
x_338 = lean_box(0);
x_9 = x_338;
goto block_19;
}
else
{
lean_object* x_339; lean_object* x_340; 
x_339 = lean_ctor_get(x_337, 0);
lean_inc(x_339);
lean_dec(x_337);
x_340 = l_CakeML_ptree__Expr(x_51, x_333);
if (lean_obj_tag(x_340) == 0)
{
lean_object* x_341; 
lean_dec(x_339);
x_341 = lean_box(0);
x_9 = x_341;
goto block_19;
}
else
{
uint8_t x_342; 
x_342 = !lean_is_exclusive(x_340);
if (x_342 == 0)
{
lean_object* x_343; uint8_t x_344; lean_object* x_345; 
x_343 = lean_ctor_get(x_340, 0);
x_344 = 1;
x_345 = lean_alloc_ctor(7, 2, 1);
lean_ctor_set(x_345, 0, x_339);
lean_ctor_set(x_345, 1, x_343);
lean_ctor_set_uint8(x_345, sizeof(void*)*2, x_344);
lean_ctor_set(x_340, 0, x_345);
x_9 = x_340;
goto block_19;
}
else
{
lean_object* x_346; uint8_t x_347; lean_object* x_348; lean_object* x_349; 
x_346 = lean_ctor_get(x_340, 0);
lean_inc(x_346);
lean_dec(x_340);
x_347 = 1;
x_348 = lean_alloc_ctor(7, 2, 1);
lean_ctor_set(x_348, 0, x_339);
lean_ctor_set(x_348, 1, x_346);
lean_ctor_set_uint8(x_348, sizeof(void*)*2, x_347);
x_349 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_349, 0, x_348);
x_9 = x_349;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_350; 
lean_dec(x_330);
lean_dec(x_328);
lean_dec(x_325);
lean_dec(x_6);
x_350 = lean_box(0);
x_9 = x_350;
goto block_19;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_351; 
x_351 = lean_box(0);
x_9 = x_351;
goto block_19;
}
else
{
lean_object* x_352; 
x_352 = lean_ctor_get(x_6, 1);
lean_inc(x_352);
if (lean_obj_tag(x_352) == 0)
{
lean_object* x_353; lean_object* x_354; 
x_353 = lean_ctor_get(x_6, 0);
lean_inc(x_353);
lean_dec(x_6);
x_354 = l_CakeML_ptree__Expr(x_48, x_353);
x_9 = x_354;
goto block_19;
}
else
{
lean_object* x_355; 
x_355 = lean_ctor_get(x_352, 1);
lean_inc(x_355);
if (lean_obj_tag(x_355) == 0)
{
lean_object* x_356; 
lean_dec(x_352);
lean_dec(x_6);
x_356 = lean_box(0);
x_9 = x_356;
goto block_19;
}
else
{
lean_object* x_357; 
x_357 = lean_ctor_get(x_355, 1);
lean_inc(x_357);
if (lean_obj_tag(x_357) == 0)
{
lean_object* x_358; lean_object* x_359; lean_object* x_360; lean_object* x_361; uint8_t x_362; 
x_358 = lean_ctor_get(x_6, 0);
lean_inc(x_358);
lean_dec(x_6);
x_359 = lean_ctor_get(x_352, 0);
lean_inc(x_359);
lean_dec(x_352);
x_360 = lean_ctor_get(x_355, 0);
lean_inc(x_360);
lean_dec(x_355);
x_361 = lean_box(22);
x_362 = l_CakeML_tokcheck(x_359, x_361);
if (x_362 == 0)
{
lean_object* x_363; 
lean_dec(x_360);
lean_dec(x_358);
x_363 = lean_box(0);
x_9 = x_363;
goto block_19;
}
else
{
lean_object* x_364; 
x_364 = l_CakeML_ptree__Expr(x_51, x_358);
if (lean_obj_tag(x_364) == 0)
{
lean_object* x_365; 
lean_dec(x_360);
x_365 = lean_box(0);
x_9 = x_365;
goto block_19;
}
else
{
lean_object* x_366; lean_object* x_367; 
x_366 = lean_ctor_get(x_364, 0);
lean_inc(x_366);
lean_dec(x_364);
x_367 = l_CakeML_ptree__Expr(x_48, x_360);
if (lean_obj_tag(x_367) == 0)
{
lean_object* x_368; 
lean_dec(x_366);
x_368 = lean_box(0);
x_9 = x_368;
goto block_19;
}
else
{
uint8_t x_369; 
x_369 = !lean_is_exclusive(x_367);
if (x_369 == 0)
{
lean_object* x_370; uint8_t x_371; lean_object* x_372; 
x_370 = lean_ctor_get(x_367, 0);
x_371 = 0;
x_372 = lean_alloc_ctor(7, 2, 1);
lean_ctor_set(x_372, 0, x_366);
lean_ctor_set(x_372, 1, x_370);
lean_ctor_set_uint8(x_372, sizeof(void*)*2, x_371);
lean_ctor_set(x_367, 0, x_372);
x_9 = x_367;
goto block_19;
}
else
{
lean_object* x_373; uint8_t x_374; lean_object* x_375; lean_object* x_376; 
x_373 = lean_ctor_get(x_367, 0);
lean_inc(x_373);
lean_dec(x_367);
x_374 = 0;
x_375 = lean_alloc_ctor(7, 2, 1);
lean_ctor_set(x_375, 0, x_366);
lean_ctor_set(x_375, 1, x_373);
lean_ctor_set_uint8(x_375, sizeof(void*)*2, x_374);
x_376 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_376, 0, x_375);
x_9 = x_376;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_377; 
lean_dec(x_357);
lean_dec(x_355);
lean_dec(x_352);
lean_dec(x_6);
x_377 = lean_box(0);
x_9 = x_377;
goto block_19;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_378; 
x_378 = lean_box(0);
x_9 = x_378;
goto block_19;
}
else
{
lean_object* x_379; 
x_379 = lean_ctor_get(x_6, 1);
lean_inc(x_379);
if (lean_obj_tag(x_379) == 0)
{
lean_object* x_380; lean_object* x_381; 
x_380 = lean_ctor_get(x_6, 0);
lean_inc(x_380);
lean_dec(x_6);
x_381 = l_CakeML_ptree__Expr(x_45, x_380);
x_9 = x_381;
goto block_19;
}
else
{
lean_object* x_382; 
x_382 = lean_ctor_get(x_379, 1);
lean_inc(x_382);
if (lean_obj_tag(x_382) == 0)
{
lean_object* x_383; 
lean_dec(x_379);
lean_dec(x_6);
x_383 = lean_box(0);
x_9 = x_383;
goto block_19;
}
else
{
lean_object* x_384; 
x_384 = lean_ctor_get(x_382, 1);
lean_inc(x_384);
if (lean_obj_tag(x_384) == 0)
{
lean_object* x_385; lean_object* x_386; uint8_t x_387; 
x_385 = lean_ctor_get(x_6, 0);
lean_inc(x_385);
lean_dec(x_6);
x_386 = lean_ctor_get(x_379, 0);
lean_inc(x_386);
lean_dec(x_379);
x_387 = !lean_is_exclusive(x_382);
if (x_387 == 0)
{
lean_object* x_388; lean_object* x_389; lean_object* x_390; uint8_t x_391; 
x_388 = lean_ctor_get(x_382, 0);
x_389 = lean_ctor_get(x_382, 1);
lean_dec(x_389);
x_390 = lean_box(10);
x_391 = l_CakeML_tokcheck(x_386, x_390);
if (x_391 == 0)
{
lean_object* x_392; 
lean_free_object(x_382);
lean_dec(x_388);
lean_dec(x_385);
x_392 = lean_box(0);
x_9 = x_392;
goto block_19;
}
else
{
lean_object* x_393; 
x_393 = l_CakeML_ptree__Expr(x_45, x_385);
if (lean_obj_tag(x_393) == 0)
{
lean_object* x_394; 
lean_free_object(x_382);
lean_dec(x_388);
x_394 = lean_box(0);
x_9 = x_394;
goto block_19;
}
else
{
lean_object* x_395; uint8_t x_396; lean_object* x_397; 
x_395 = lean_ctor_get(x_393, 0);
lean_inc(x_395);
lean_dec(x_393);
x_396 = 8;
x_397 = l_CakeML_ptree__Type(x_396, x_388);
if (lean_obj_tag(x_397) == 0)
{
lean_object* x_398; 
lean_dec(x_395);
lean_free_object(x_382);
x_398 = lean_box(0);
x_9 = x_398;
goto block_19;
}
else
{
uint8_t x_399; 
x_399 = !lean_is_exclusive(x_397);
if (x_399 == 0)
{
lean_object* x_400; 
x_400 = lean_ctor_get(x_397, 0);
lean_ctor_set_tag(x_382, 12);
lean_ctor_set(x_382, 1, x_400);
lean_ctor_set(x_382, 0, x_395);
lean_ctor_set(x_397, 0, x_382);
x_9 = x_397;
goto block_19;
}
else
{
lean_object* x_401; lean_object* x_402; 
x_401 = lean_ctor_get(x_397, 0);
lean_inc(x_401);
lean_dec(x_397);
lean_ctor_set_tag(x_382, 12);
lean_ctor_set(x_382, 1, x_401);
lean_ctor_set(x_382, 0, x_395);
x_402 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_402, 0, x_382);
x_9 = x_402;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_403; lean_object* x_404; uint8_t x_405; 
x_403 = lean_ctor_get(x_382, 0);
lean_inc(x_403);
lean_dec(x_382);
x_404 = lean_box(10);
x_405 = l_CakeML_tokcheck(x_386, x_404);
if (x_405 == 0)
{
lean_object* x_406; 
lean_dec(x_403);
lean_dec(x_385);
x_406 = lean_box(0);
x_9 = x_406;
goto block_19;
}
else
{
lean_object* x_407; 
x_407 = l_CakeML_ptree__Expr(x_45, x_385);
if (lean_obj_tag(x_407) == 0)
{
lean_object* x_408; 
lean_dec(x_403);
x_408 = lean_box(0);
x_9 = x_408;
goto block_19;
}
else
{
lean_object* x_409; uint8_t x_410; lean_object* x_411; 
x_409 = lean_ctor_get(x_407, 0);
lean_inc(x_409);
lean_dec(x_407);
x_410 = 8;
x_411 = l_CakeML_ptree__Type(x_410, x_403);
if (lean_obj_tag(x_411) == 0)
{
lean_object* x_412; 
lean_dec(x_409);
x_412 = lean_box(0);
x_9 = x_412;
goto block_19;
}
else
{
lean_object* x_413; lean_object* x_414; lean_object* x_415; lean_object* x_416; 
x_413 = lean_ctor_get(x_411, 0);
lean_inc(x_413);
if (lean_is_exclusive(x_411)) {
 lean_ctor_release(x_411, 0);
 x_414 = x_411;
} else {
 lean_dec_ref(x_411);
 x_414 = lean_box(0);
}
x_415 = lean_alloc_ctor(12, 2, 0);
lean_ctor_set(x_415, 0, x_409);
lean_ctor_set(x_415, 1, x_413);
if (lean_is_scalar(x_414)) {
 x_416 = lean_alloc_ctor(1, 1, 0);
} else {
 x_416 = x_414;
}
lean_ctor_set(x_416, 0, x_415);
x_9 = x_416;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_417; 
lean_dec(x_384);
lean_dec(x_382);
lean_dec(x_379);
lean_dec(x_6);
x_417 = lean_box(0);
x_9 = x_417;
goto block_19;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_418; 
x_418 = lean_box(0);
x_9 = x_418;
goto block_19;
}
else
{
lean_object* x_419; 
x_419 = lean_ctor_get(x_6, 1);
lean_inc(x_419);
if (lean_obj_tag(x_419) == 0)
{
lean_object* x_420; lean_object* x_421; 
x_420 = lean_ctor_get(x_6, 0);
lean_inc(x_420);
lean_dec(x_6);
x_421 = l_CakeML_ptree__Expr(x_42, x_420);
x_9 = x_421;
goto block_19;
}
else
{
lean_object* x_422; 
x_422 = lean_ctor_get(x_419, 1);
lean_inc(x_422);
if (lean_obj_tag(x_422) == 0)
{
lean_object* x_423; 
lean_dec(x_419);
lean_dec(x_6);
x_423 = lean_box(0);
x_9 = x_423;
goto block_19;
}
else
{
lean_object* x_424; 
x_424 = lean_ctor_get(x_422, 1);
lean_inc(x_424);
if (lean_obj_tag(x_424) == 0)
{
lean_object* x_425; lean_object* x_426; lean_object* x_427; lean_object* x_428; uint8_t x_429; 
x_425 = lean_ctor_get(x_6, 0);
lean_inc(x_425);
lean_dec(x_6);
x_426 = lean_ctor_get(x_419, 0);
lean_inc(x_426);
lean_dec(x_419);
x_427 = lean_ctor_get(x_422, 0);
lean_inc(x_427);
lean_dec(x_422);
x_428 = l_CakeML_ptree__Expr___closed__10;
x_429 = l_CakeML_tokcheck(x_426, x_428);
if (x_429 == 0)
{
lean_object* x_430; 
lean_dec(x_427);
lean_dec(x_425);
x_430 = lean_box(0);
x_9 = x_430;
goto block_19;
}
else
{
lean_object* x_431; 
x_431 = l_CakeML_ptree__Expr(x_45, x_425);
if (lean_obj_tag(x_431) == 0)
{
lean_object* x_432; 
lean_dec(x_427);
x_432 = lean_box(0);
x_9 = x_432;
goto block_19;
}
else
{
lean_object* x_433; lean_object* x_434; 
x_433 = lean_ctor_get(x_431, 0);
lean_inc(x_433);
lean_dec(x_431);
x_434 = l_CakeML_ptree__Expr(x_42, x_427);
if (lean_obj_tag(x_434) == 0)
{
lean_object* x_435; 
lean_dec(x_433);
x_435 = lean_box(0);
x_9 = x_435;
goto block_19;
}
else
{
uint8_t x_436; 
x_436 = !lean_is_exclusive(x_434);
if (x_436 == 0)
{
lean_object* x_437; lean_object* x_438; lean_object* x_439; 
x_437 = lean_ctor_get(x_434, 0);
x_438 = l_CakeML_ptree__Expr___closed__11;
x_439 = l_CakeML_mk__binop(x_438, x_433, x_437);
lean_ctor_set(x_434, 0, x_439);
x_9 = x_434;
goto block_19;
}
else
{
lean_object* x_440; lean_object* x_441; lean_object* x_442; lean_object* x_443; 
x_440 = lean_ctor_get(x_434, 0);
lean_inc(x_440);
lean_dec(x_434);
x_441 = l_CakeML_ptree__Expr___closed__11;
x_442 = l_CakeML_mk__binop(x_441, x_433, x_440);
x_443 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_443, 0, x_442);
x_9 = x_443;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_444; 
lean_dec(x_424);
lean_dec(x_422);
lean_dec(x_419);
lean_dec(x_6);
x_444 = lean_box(0);
x_9 = x_444;
goto block_19;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_445; 
x_445 = lean_box(0);
x_9 = x_445;
goto block_19;
}
else
{
lean_object* x_446; 
x_446 = lean_ctor_get(x_6, 1);
lean_inc(x_446);
if (lean_obj_tag(x_446) == 0)
{
lean_object* x_447; lean_object* x_448; 
x_447 = lean_ctor_get(x_6, 0);
lean_inc(x_447);
lean_dec(x_6);
x_448 = l_CakeML_ptree__Expr(x_39, x_447);
x_9 = x_448;
goto block_19;
}
else
{
lean_object* x_449; 
x_449 = lean_ctor_get(x_446, 1);
lean_inc(x_449);
if (lean_obj_tag(x_449) == 0)
{
lean_object* x_450; 
lean_dec(x_446);
lean_dec(x_6);
x_450 = lean_box(0);
x_9 = x_450;
goto block_19;
}
else
{
lean_object* x_451; 
x_451 = lean_ctor_get(x_449, 1);
lean_inc(x_451);
if (lean_obj_tag(x_451) == 0)
{
lean_object* x_452; lean_object* x_453; lean_object* x_454; lean_object* x_455; 
x_452 = lean_ctor_get(x_6, 0);
lean_inc(x_452);
lean_dec(x_6);
x_453 = lean_ctor_get(x_446, 0);
lean_inc(x_453);
lean_dec(x_446);
x_454 = lean_ctor_get(x_449, 0);
lean_inc(x_454);
lean_dec(x_449);
x_455 = l_CakeML_ptree__Expr(x_42, x_452);
if (lean_obj_tag(x_455) == 0)
{
lean_object* x_456; 
lean_dec(x_454);
lean_dec(x_453);
x_456 = lean_box(0);
x_9 = x_456;
goto block_19;
}
else
{
lean_object* x_457; lean_object* x_458; 
x_457 = lean_ctor_get(x_455, 0);
lean_inc(x_457);
lean_dec(x_455);
x_458 = l_CakeML_ptree__Op(x_453);
if (lean_obj_tag(x_458) == 0)
{
lean_object* x_459; 
lean_dec(x_457);
lean_dec(x_454);
x_459 = lean_box(0);
x_9 = x_459;
goto block_19;
}
else
{
lean_object* x_460; lean_object* x_461; 
x_460 = lean_ctor_get(x_458, 0);
lean_inc(x_460);
lean_dec(x_458);
x_461 = l_CakeML_ptree__Expr(x_39, x_454);
if (lean_obj_tag(x_461) == 0)
{
lean_object* x_462; 
lean_dec(x_460);
lean_dec(x_457);
x_462 = lean_box(0);
x_9 = x_462;
goto block_19;
}
else
{
uint8_t x_463; 
x_463 = !lean_is_exclusive(x_461);
if (x_463 == 0)
{
lean_object* x_464; lean_object* x_465; 
x_464 = lean_ctor_get(x_461, 0);
x_465 = l_CakeML_mk__binop(x_460, x_457, x_464);
lean_ctor_set(x_461, 0, x_465);
x_9 = x_461;
goto block_19;
}
else
{
lean_object* x_466; lean_object* x_467; lean_object* x_468; 
x_466 = lean_ctor_get(x_461, 0);
lean_inc(x_466);
lean_dec(x_461);
x_467 = l_CakeML_mk__binop(x_460, x_457, x_466);
x_468 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_468, 0, x_467);
x_9 = x_468;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_469; 
lean_dec(x_451);
lean_dec(x_449);
lean_dec(x_446);
lean_dec(x_6);
x_469 = lean_box(0);
x_9 = x_469;
goto block_19;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_470; 
x_470 = lean_box(0);
x_9 = x_470;
goto block_19;
}
else
{
lean_object* x_471; 
x_471 = lean_ctor_get(x_6, 1);
lean_inc(x_471);
if (lean_obj_tag(x_471) == 0)
{
lean_object* x_472; lean_object* x_473; 
x_472 = lean_ctor_get(x_6, 0);
lean_inc(x_472);
lean_dec(x_6);
x_473 = l_CakeML_ptree__Expr(x_36, x_472);
x_9 = x_473;
goto block_19;
}
else
{
lean_object* x_474; 
x_474 = lean_ctor_get(x_471, 1);
lean_inc(x_474);
if (lean_obj_tag(x_474) == 0)
{
lean_object* x_475; 
lean_dec(x_471);
lean_dec(x_6);
x_475 = lean_box(0);
x_9 = x_475;
goto block_19;
}
else
{
lean_object* x_476; 
x_476 = lean_ctor_get(x_474, 1);
lean_inc(x_476);
if (lean_obj_tag(x_476) == 0)
{
lean_object* x_477; lean_object* x_478; lean_object* x_479; lean_object* x_480; 
x_477 = lean_ctor_get(x_6, 0);
lean_inc(x_477);
lean_dec(x_6);
x_478 = lean_ctor_get(x_471, 0);
lean_inc(x_478);
lean_dec(x_471);
x_479 = lean_ctor_get(x_474, 0);
lean_inc(x_479);
lean_dec(x_474);
x_480 = l_CakeML_ptree__Expr(x_39, x_477);
if (lean_obj_tag(x_480) == 0)
{
lean_object* x_481; 
lean_dec(x_479);
lean_dec(x_478);
x_481 = lean_box(0);
x_9 = x_481;
goto block_19;
}
else
{
lean_object* x_482; lean_object* x_483; 
x_482 = lean_ctor_get(x_480, 0);
lean_inc(x_482);
lean_dec(x_480);
x_483 = l_CakeML_ptree__Op(x_478);
if (lean_obj_tag(x_483) == 0)
{
lean_object* x_484; 
lean_dec(x_482);
lean_dec(x_479);
x_484 = lean_box(0);
x_9 = x_484;
goto block_19;
}
else
{
lean_object* x_485; lean_object* x_486; 
x_485 = lean_ctor_get(x_483, 0);
lean_inc(x_485);
lean_dec(x_483);
x_486 = l_CakeML_ptree__Expr(x_36, x_479);
if (lean_obj_tag(x_486) == 0)
{
lean_object* x_487; 
lean_dec(x_485);
lean_dec(x_482);
x_487 = lean_box(0);
x_9 = x_487;
goto block_19;
}
else
{
uint8_t x_488; 
x_488 = !lean_is_exclusive(x_486);
if (x_488 == 0)
{
lean_object* x_489; lean_object* x_490; 
x_489 = lean_ctor_get(x_486, 0);
x_490 = l_CakeML_mk__binop(x_485, x_482, x_489);
lean_ctor_set(x_486, 0, x_490);
x_9 = x_486;
goto block_19;
}
else
{
lean_object* x_491; lean_object* x_492; lean_object* x_493; 
x_491 = lean_ctor_get(x_486, 0);
lean_inc(x_491);
lean_dec(x_486);
x_492 = l_CakeML_mk__binop(x_485, x_482, x_491);
x_493 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_493, 0, x_492);
x_9 = x_493;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_494; 
lean_dec(x_476);
lean_dec(x_474);
lean_dec(x_471);
lean_dec(x_6);
x_494 = lean_box(0);
x_9 = x_494;
goto block_19;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_495; 
x_495 = lean_box(0);
x_9 = x_495;
goto block_19;
}
else
{
lean_object* x_496; 
x_496 = lean_ctor_get(x_6, 1);
lean_inc(x_496);
if (lean_obj_tag(x_496) == 0)
{
lean_object* x_497; lean_object* x_498; 
x_497 = lean_ctor_get(x_6, 0);
lean_inc(x_497);
lean_dec(x_6);
x_498 = l_CakeML_ptree__Expr(x_33, x_497);
x_9 = x_498;
goto block_19;
}
else
{
lean_object* x_499; 
x_499 = lean_ctor_get(x_496, 1);
lean_inc(x_499);
if (lean_obj_tag(x_499) == 0)
{
lean_object* x_500; 
lean_dec(x_496);
lean_dec(x_6);
x_500 = lean_box(0);
x_9 = x_500;
goto block_19;
}
else
{
lean_object* x_501; 
x_501 = lean_ctor_get(x_499, 1);
lean_inc(x_501);
if (lean_obj_tag(x_501) == 0)
{
lean_object* x_502; lean_object* x_503; lean_object* x_504; lean_object* x_505; 
x_502 = lean_ctor_get(x_6, 0);
lean_inc(x_502);
lean_dec(x_6);
x_503 = lean_ctor_get(x_496, 0);
lean_inc(x_503);
lean_dec(x_496);
x_504 = lean_ctor_get(x_499, 0);
lean_inc(x_504);
lean_dec(x_499);
x_505 = l_CakeML_ptree__Expr(x_33, x_502);
if (lean_obj_tag(x_505) == 0)
{
lean_object* x_506; 
lean_dec(x_504);
lean_dec(x_503);
x_506 = lean_box(0);
x_9 = x_506;
goto block_19;
}
else
{
lean_object* x_507; lean_object* x_508; 
x_507 = lean_ctor_get(x_505, 0);
lean_inc(x_507);
lean_dec(x_505);
x_508 = l_CakeML_ptree__Op(x_503);
if (lean_obj_tag(x_508) == 0)
{
lean_object* x_509; 
lean_dec(x_507);
lean_dec(x_504);
x_509 = lean_box(0);
x_9 = x_509;
goto block_19;
}
else
{
lean_object* x_510; lean_object* x_511; 
x_510 = lean_ctor_get(x_508, 0);
lean_inc(x_510);
lean_dec(x_508);
x_511 = l_CakeML_ptree__Expr(x_36, x_504);
if (lean_obj_tag(x_511) == 0)
{
lean_object* x_512; 
lean_dec(x_510);
lean_dec(x_507);
x_512 = lean_box(0);
x_9 = x_512;
goto block_19;
}
else
{
uint8_t x_513; 
x_513 = !lean_is_exclusive(x_511);
if (x_513 == 0)
{
lean_object* x_514; lean_object* x_515; 
x_514 = lean_ctor_get(x_511, 0);
x_515 = l_CakeML_mk__binop(x_510, x_507, x_514);
lean_ctor_set(x_511, 0, x_515);
x_9 = x_511;
goto block_19;
}
else
{
lean_object* x_516; lean_object* x_517; lean_object* x_518; 
x_516 = lean_ctor_get(x_511, 0);
lean_inc(x_516);
lean_dec(x_511);
x_517 = l_CakeML_mk__binop(x_510, x_507, x_516);
x_518 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_518, 0, x_517);
x_9 = x_518;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_519; 
lean_dec(x_501);
lean_dec(x_499);
lean_dec(x_496);
lean_dec(x_6);
x_519 = lean_box(0);
x_9 = x_519;
goto block_19;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_520; 
x_520 = lean_box(0);
x_9 = x_520;
goto block_19;
}
else
{
lean_object* x_521; 
x_521 = lean_ctor_get(x_6, 1);
lean_inc(x_521);
if (lean_obj_tag(x_521) == 0)
{
lean_object* x_522; lean_object* x_523; 
x_522 = lean_ctor_get(x_6, 0);
lean_inc(x_522);
lean_dec(x_6);
x_523 = l_CakeML_ptree__Expr(x_30, x_522);
x_9 = x_523;
goto block_19;
}
else
{
lean_object* x_524; 
x_524 = lean_ctor_get(x_521, 1);
lean_inc(x_524);
if (lean_obj_tag(x_524) == 0)
{
lean_object* x_525; 
lean_dec(x_521);
lean_dec(x_6);
x_525 = lean_box(0);
x_9 = x_525;
goto block_19;
}
else
{
lean_object* x_526; 
x_526 = lean_ctor_get(x_524, 1);
lean_inc(x_526);
if (lean_obj_tag(x_526) == 0)
{
lean_object* x_527; lean_object* x_528; lean_object* x_529; lean_object* x_530; 
x_527 = lean_ctor_get(x_6, 0);
lean_inc(x_527);
lean_dec(x_6);
x_528 = lean_ctor_get(x_521, 0);
lean_inc(x_528);
lean_dec(x_521);
x_529 = lean_ctor_get(x_524, 0);
lean_inc(x_529);
lean_dec(x_524);
x_530 = l_CakeML_ptree__Expr(x_33, x_527);
if (lean_obj_tag(x_530) == 0)
{
lean_object* x_531; 
lean_dec(x_529);
lean_dec(x_528);
x_531 = lean_box(0);
x_9 = x_531;
goto block_19;
}
else
{
lean_object* x_532; lean_object* x_533; 
x_532 = lean_ctor_get(x_530, 0);
lean_inc(x_532);
lean_dec(x_530);
x_533 = l_CakeML_ptree__Op(x_528);
if (lean_obj_tag(x_533) == 0)
{
lean_object* x_534; 
lean_dec(x_532);
lean_dec(x_529);
x_534 = lean_box(0);
x_9 = x_534;
goto block_19;
}
else
{
lean_object* x_535; lean_object* x_536; 
x_535 = lean_ctor_get(x_533, 0);
lean_inc(x_535);
lean_dec(x_533);
x_536 = l_CakeML_ptree__Expr(x_30, x_529);
if (lean_obj_tag(x_536) == 0)
{
lean_object* x_537; 
lean_dec(x_535);
lean_dec(x_532);
x_537 = lean_box(0);
x_9 = x_537;
goto block_19;
}
else
{
uint8_t x_538; 
x_538 = !lean_is_exclusive(x_536);
if (x_538 == 0)
{
lean_object* x_539; lean_object* x_540; 
x_539 = lean_ctor_get(x_536, 0);
x_540 = l_CakeML_mk__binop(x_535, x_532, x_539);
lean_ctor_set(x_536, 0, x_540);
x_9 = x_536;
goto block_19;
}
else
{
lean_object* x_541; lean_object* x_542; lean_object* x_543; 
x_541 = lean_ctor_get(x_536, 0);
lean_inc(x_541);
lean_dec(x_536);
x_542 = l_CakeML_mk__binop(x_535, x_532, x_541);
x_543 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_543, 0, x_542);
x_9 = x_543;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_544; 
lean_dec(x_526);
lean_dec(x_524);
lean_dec(x_521);
lean_dec(x_6);
x_544 = lean_box(0);
x_9 = x_544;
goto block_19;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_545; 
x_545 = lean_box(0);
x_9 = x_545;
goto block_19;
}
else
{
lean_object* x_546; 
x_546 = lean_ctor_get(x_6, 1);
lean_inc(x_546);
if (lean_obj_tag(x_546) == 0)
{
lean_object* x_547; lean_object* x_548; 
x_547 = lean_ctor_get(x_6, 0);
lean_inc(x_547);
lean_dec(x_6);
x_548 = l_CakeML_ptree__Expr(x_24, x_547);
x_9 = x_548;
goto block_19;
}
else
{
lean_object* x_549; 
x_549 = lean_ctor_get(x_546, 1);
lean_inc(x_549);
if (lean_obj_tag(x_549) == 0)
{
lean_object* x_550; 
lean_dec(x_546);
lean_dec(x_6);
x_550 = lean_box(0);
x_9 = x_550;
goto block_19;
}
else
{
lean_object* x_551; 
x_551 = lean_ctor_get(x_549, 1);
lean_inc(x_551);
if (lean_obj_tag(x_551) == 0)
{
lean_object* x_552; lean_object* x_553; lean_object* x_554; lean_object* x_555; 
x_552 = lean_ctor_get(x_6, 0);
lean_inc(x_552);
lean_dec(x_6);
x_553 = lean_ctor_get(x_546, 0);
lean_inc(x_553);
lean_dec(x_546);
x_554 = lean_ctor_get(x_549, 0);
lean_inc(x_554);
lean_dec(x_549);
x_555 = l_CakeML_ptree__Expr(x_30, x_552);
if (lean_obj_tag(x_555) == 0)
{
lean_object* x_556; 
lean_dec(x_554);
lean_dec(x_553);
x_556 = lean_box(0);
x_9 = x_556;
goto block_19;
}
else
{
lean_object* x_557; lean_object* x_558; 
x_557 = lean_ctor_get(x_555, 0);
lean_inc(x_557);
lean_dec(x_555);
x_558 = l_CakeML_ptree__Op(x_553);
if (lean_obj_tag(x_558) == 0)
{
lean_object* x_559; 
lean_dec(x_557);
lean_dec(x_554);
x_559 = lean_box(0);
x_9 = x_559;
goto block_19;
}
else
{
lean_object* x_560; lean_object* x_561; 
x_560 = lean_ctor_get(x_558, 0);
lean_inc(x_560);
lean_dec(x_558);
x_561 = l_CakeML_ptree__Expr(x_24, x_554);
if (lean_obj_tag(x_561) == 0)
{
lean_object* x_562; 
lean_dec(x_560);
lean_dec(x_557);
x_562 = lean_box(0);
x_9 = x_562;
goto block_19;
}
else
{
uint8_t x_563; 
x_563 = !lean_is_exclusive(x_561);
if (x_563 == 0)
{
lean_object* x_564; lean_object* x_565; 
x_564 = lean_ctor_get(x_561, 0);
x_565 = l_CakeML_mk__binop(x_560, x_557, x_564);
lean_ctor_set(x_561, 0, x_565);
x_9 = x_561;
goto block_19;
}
else
{
lean_object* x_566; lean_object* x_567; lean_object* x_568; 
x_566 = lean_ctor_get(x_561, 0);
lean_inc(x_566);
lean_dec(x_561);
x_567 = l_CakeML_mk__binop(x_560, x_557, x_566);
x_568 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_568, 0, x_567);
x_9 = x_568;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_569; 
lean_dec(x_551);
lean_dec(x_549);
lean_dec(x_546);
lean_dec(x_6);
x_569 = lean_box(0);
x_9 = x_569;
goto block_19;
}
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_570; 
lean_free_object(x_2);
x_570 = lean_box(0);
x_9 = x_570;
goto block_19;
}
else
{
lean_object* x_571; 
x_571 = lean_ctor_get(x_6, 1);
lean_inc(x_571);
if (lean_obj_tag(x_571) == 0)
{
lean_object* x_572; 
lean_free_object(x_2);
lean_dec(x_6);
x_572 = lean_box(0);
x_9 = x_572;
goto block_19;
}
else
{
lean_object* x_573; 
x_573 = lean_ctor_get(x_571, 1);
lean_inc(x_573);
if (lean_obj_tag(x_573) == 0)
{
lean_object* x_574; 
lean_dec(x_571);
lean_free_object(x_2);
lean_dec(x_6);
x_574 = lean_box(0);
x_9 = x_574;
goto block_19;
}
else
{
lean_object* x_575; 
x_575 = lean_ctor_get(x_573, 1);
lean_inc(x_575);
if (lean_obj_tag(x_575) == 0)
{
lean_object* x_576; uint8_t x_577; 
x_576 = lean_ctor_get(x_6, 0);
lean_inc(x_576);
lean_dec(x_6);
x_577 = !lean_is_exclusive(x_571);
if (x_577 == 0)
{
lean_object* x_578; lean_object* x_579; uint8_t x_580; 
x_578 = lean_ctor_get(x_571, 0);
x_579 = lean_ctor_get(x_571, 1);
lean_dec(x_579);
x_580 = !lean_is_exclusive(x_573);
if (x_580 == 0)
{
lean_object* x_581; lean_object* x_582; lean_object* x_583; uint8_t x_584; 
x_581 = lean_ctor_get(x_573, 1);
lean_dec(x_581);
x_582 = lean_box(0);
lean_ctor_set(x_573, 1, x_582);
lean_ctor_set(x_571, 0, x_576);
x_583 = l_CakeML_ptree__Pattern___closed__2;
x_584 = l_CakeML_tokcheckl(x_571, x_583);
if (x_584 == 0)
{
lean_object* x_585; 
lean_dec(x_578);
lean_free_object(x_2);
x_585 = lean_box(0);
x_9 = x_585;
goto block_19;
}
else
{
lean_object* x_586; 
x_586 = l_CakeML_ptree__Exprlist___rarg(x_578);
if (lean_obj_tag(x_586) == 0)
{
lean_object* x_587; 
lean_free_object(x_2);
x_587 = lean_box(0);
x_9 = x_587;
goto block_19;
}
else
{
uint8_t x_588; 
x_588 = !lean_is_exclusive(x_586);
if (x_588 == 0)
{
lean_object* x_589; lean_object* x_590; 
x_589 = lean_ctor_get(x_586, 0);
x_590 = lean_box(0);
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_589);
lean_ctor_set(x_2, 0, x_590);
lean_ctor_set(x_586, 0, x_2);
x_9 = x_586;
goto block_19;
}
else
{
lean_object* x_591; lean_object* x_592; lean_object* x_593; 
x_591 = lean_ctor_get(x_586, 0);
lean_inc(x_591);
lean_dec(x_586);
x_592 = lean_box(0);
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_591);
lean_ctor_set(x_2, 0, x_592);
x_593 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_593, 0, x_2);
x_9 = x_593;
goto block_19;
}
}
}
}
else
{
lean_object* x_594; lean_object* x_595; lean_object* x_596; lean_object* x_597; uint8_t x_598; 
x_594 = lean_ctor_get(x_573, 0);
lean_inc(x_594);
lean_dec(x_573);
x_595 = lean_box(0);
x_596 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_596, 0, x_594);
lean_ctor_set(x_596, 1, x_595);
lean_ctor_set(x_571, 1, x_596);
lean_ctor_set(x_571, 0, x_576);
x_597 = l_CakeML_ptree__Pattern___closed__2;
x_598 = l_CakeML_tokcheckl(x_571, x_597);
if (x_598 == 0)
{
lean_object* x_599; 
lean_dec(x_578);
lean_free_object(x_2);
x_599 = lean_box(0);
x_9 = x_599;
goto block_19;
}
else
{
lean_object* x_600; 
x_600 = l_CakeML_ptree__Exprlist___rarg(x_578);
if (lean_obj_tag(x_600) == 0)
{
lean_object* x_601; 
lean_free_object(x_2);
x_601 = lean_box(0);
x_9 = x_601;
goto block_19;
}
else
{
lean_object* x_602; lean_object* x_603; lean_object* x_604; lean_object* x_605; 
x_602 = lean_ctor_get(x_600, 0);
lean_inc(x_602);
if (lean_is_exclusive(x_600)) {
 lean_ctor_release(x_600, 0);
 x_603 = x_600;
} else {
 lean_dec_ref(x_600);
 x_603 = lean_box(0);
}
x_604 = lean_box(0);
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_602);
lean_ctor_set(x_2, 0, x_604);
if (lean_is_scalar(x_603)) {
 x_605 = lean_alloc_ctor(1, 1, 0);
} else {
 x_605 = x_603;
}
lean_ctor_set(x_605, 0, x_2);
x_9 = x_605;
goto block_19;
}
}
}
}
else
{
lean_object* x_606; lean_object* x_607; lean_object* x_608; lean_object* x_609; lean_object* x_610; lean_object* x_611; lean_object* x_612; uint8_t x_613; 
x_606 = lean_ctor_get(x_571, 0);
lean_inc(x_606);
lean_dec(x_571);
x_607 = lean_ctor_get(x_573, 0);
lean_inc(x_607);
if (lean_is_exclusive(x_573)) {
 lean_ctor_release(x_573, 0);
 lean_ctor_release(x_573, 1);
 x_608 = x_573;
} else {
 lean_dec_ref(x_573);
 x_608 = lean_box(0);
}
x_609 = lean_box(0);
if (lean_is_scalar(x_608)) {
 x_610 = lean_alloc_ctor(1, 2, 0);
} else {
 x_610 = x_608;
}
lean_ctor_set(x_610, 0, x_607);
lean_ctor_set(x_610, 1, x_609);
x_611 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_611, 0, x_576);
lean_ctor_set(x_611, 1, x_610);
x_612 = l_CakeML_ptree__Pattern___closed__2;
x_613 = l_CakeML_tokcheckl(x_611, x_612);
if (x_613 == 0)
{
lean_object* x_614; 
lean_dec(x_606);
lean_free_object(x_2);
x_614 = lean_box(0);
x_9 = x_614;
goto block_19;
}
else
{
lean_object* x_615; 
x_615 = l_CakeML_ptree__Exprlist___rarg(x_606);
if (lean_obj_tag(x_615) == 0)
{
lean_object* x_616; 
lean_free_object(x_2);
x_616 = lean_box(0);
x_9 = x_616;
goto block_19;
}
else
{
lean_object* x_617; lean_object* x_618; lean_object* x_619; lean_object* x_620; 
x_617 = lean_ctor_get(x_615, 0);
lean_inc(x_617);
if (lean_is_exclusive(x_615)) {
 lean_ctor_release(x_615, 0);
 x_618 = x_615;
} else {
 lean_dec_ref(x_615);
 x_618 = lean_box(0);
}
x_619 = lean_box(0);
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_617);
lean_ctor_set(x_2, 0, x_619);
if (lean_is_scalar(x_618)) {
 x_620 = lean_alloc_ctor(1, 1, 0);
} else {
 x_620 = x_618;
}
lean_ctor_set(x_620, 0, x_2);
x_9 = x_620;
goto block_19;
}
}
}
}
else
{
lean_object* x_621; 
lean_dec(x_575);
lean_dec(x_573);
lean_dec(x_571);
lean_free_object(x_2);
lean_dec(x_6);
x_621 = lean_box(0);
x_9 = x_621;
goto block_19;
}
}
}
}
}
}
else
{
lean_free_object(x_2);
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_622; 
x_622 = lean_box(0);
x_9 = x_622;
goto block_19;
}
else
{
lean_object* x_623; 
x_623 = lean_ctor_get(x_6, 1);
lean_inc(x_623);
if (lean_obj_tag(x_623) == 0)
{
lean_object* x_624; lean_object* x_625; 
x_624 = lean_ctor_get(x_6, 0);
lean_inc(x_624);
lean_dec(x_6);
x_625 = l_CakeML_ptree__Expr(x_21, x_624);
x_9 = x_625;
goto block_19;
}
else
{
lean_object* x_626; 
x_626 = lean_ctor_get(x_623, 1);
lean_inc(x_626);
if (lean_obj_tag(x_626) == 0)
{
lean_object* x_627; lean_object* x_628; lean_object* x_629; 
x_627 = lean_ctor_get(x_6, 0);
lean_inc(x_627);
lean_dec(x_6);
x_628 = lean_ctor_get(x_623, 0);
lean_inc(x_628);
lean_dec(x_623);
x_629 = l_CakeML_ptree__Expr(x_24, x_627);
if (lean_obj_tag(x_629) == 0)
{
lean_object* x_630; 
lean_dec(x_628);
x_630 = lean_box(0);
x_9 = x_630;
goto block_19;
}
else
{
lean_object* x_631; lean_object* x_632; 
x_631 = lean_ctor_get(x_629, 0);
lean_inc(x_631);
lean_dec(x_629);
x_632 = l_CakeML_ptree__Expr(x_21, x_628);
if (lean_obj_tag(x_632) == 0)
{
lean_object* x_633; 
lean_dec(x_631);
x_633 = lean_box(0);
x_9 = x_633;
goto block_19;
}
else
{
uint8_t x_634; 
x_634 = !lean_is_exclusive(x_632);
if (x_634 == 0)
{
lean_object* x_635; lean_object* x_636; 
x_635 = lean_ctor_get(x_632, 0);
x_636 = l_CakeML_mkAst__App(x_631, x_635);
lean_ctor_set(x_632, 0, x_636);
x_9 = x_632;
goto block_19;
}
else
{
lean_object* x_637; lean_object* x_638; lean_object* x_639; 
x_637 = lean_ctor_get(x_632, 0);
lean_inc(x_637);
lean_dec(x_632);
x_638 = l_CakeML_mkAst__App(x_631, x_637);
x_639 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_639, 0, x_638);
x_9 = x_639;
goto block_19;
}
}
}
}
else
{
lean_object* x_640; 
lean_dec(x_626);
lean_dec(x_623);
lean_dec(x_6);
x_640 = lean_box(0);
x_9 = x_640;
goto block_19;
}
}
}
}
}
else
{
lean_dec(x_5);
if (lean_obj_tag(x_6) == 0)
{
lean_object* x_641; 
lean_free_object(x_2);
x_641 = lean_box(0);
x_9 = x_641;
goto block_19;
}
else
{
lean_object* x_642; 
x_642 = lean_ctor_get(x_6, 1);
lean_inc(x_642);
if (lean_obj_tag(x_642) == 0)
{
lean_object* x_643; lean_object* x_644; 
x_643 = lean_ctor_get(x_6, 0);
lean_inc(x_643);
lean_dec(x_6);
lean_inc(x_643);
x_644 = l_CakeML_ptree__Eliteral(x_643);
if (lean_obj_tag(x_644) == 0)
{
lean_object* x_645; 
lean_inc(x_643);
x_645 = l_CakeML_ptree__FQV(x_643);
if (lean_obj_tag(x_645) == 0)
{
lean_object* x_646; 
lean_inc(x_643);
x_646 = l_CakeML_ptree__ConstructorName(x_643);
if (lean_obj_tag(x_646) == 0)
{
uint8_t x_647; lean_object* x_648; 
lean_free_object(x_2);
x_647 = 27;
x_648 = l_CakeML_ptree__Expr(x_647, x_643);
x_9 = x_648;
goto block_19;
}
else
{
uint8_t x_649; 
lean_dec(x_643);
x_649 = !lean_is_exclusive(x_646);
if (x_649 == 0)
{
lean_object* x_650; lean_object* x_651; 
x_650 = lean_box(0);
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_650);
lean_ctor_set(x_2, 0, x_646);
x_651 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_651, 0, x_2);
x_9 = x_651;
goto block_19;
}
else
{
lean_object* x_652; lean_object* x_653; lean_object* x_654; lean_object* x_655; 
x_652 = lean_ctor_get(x_646, 0);
lean_inc(x_652);
lean_dec(x_646);
x_653 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_653, 0, x_652);
x_654 = lean_box(0);
lean_ctor_set_tag(x_2, 3);
lean_ctor_set(x_2, 1, x_654);
lean_ctor_set(x_2, 0, x_653);
x_655 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_655, 0, x_2);
x_9 = x_655;
goto block_19;
}
}
}
else
{
uint8_t x_656; 
lean_dec(x_643);
lean_free_object(x_2);
x_656 = !lean_is_exclusive(x_645);
if (x_656 == 0)
{
lean_object* x_657; lean_object* x_658; 
x_657 = lean_ctor_get(x_645, 0);
x_658 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_658, 0, x_657);
lean_ctor_set(x_645, 0, x_658);
x_9 = x_645;
goto block_19;
}
else
{
lean_object* x_659; lean_object* x_660; lean_object* x_661; 
x_659 = lean_ctor_get(x_645, 0);
lean_inc(x_659);
lean_dec(x_645);
x_660 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_660, 0, x_659);
x_661 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_661, 0, x_660);
x_9 = x_661;
goto block_19;
}
}
}
else
{
uint8_t x_662; 
lean_dec(x_643);
lean_free_object(x_2);
x_662 = !lean_is_exclusive(x_644);
if (x_662 == 0)
{
x_9 = x_644;
goto block_19;
}
else
{
lean_object* x_663; lean_object* x_664; 
x_663 = lean_ctor_get(x_644, 0);
lean_inc(x_663);
lean_dec(x_644);
x_664 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_664, 0, x_663);
x_9 = x_664;
goto block_19;
}
}
}
else
{
lean_object* x_665; 
lean_free_object(x_2);
x_665 = lean_ctor_get(x_642, 1);
lean_inc(x_665);
if (lean_obj_tag(x_665) == 0)
{
uint8_t x_666; 
x_666 = !lean_is_exclusive(x_6);
if (x_666 == 0)
{
lean_object* x_667; lean_object* x_668; uint8_t x_669; 
x_667 = lean_ctor_get(x_6, 0);
x_668 = lean_ctor_get(x_6, 1);
lean_dec(x_668);
x_669 = !lean_is_exclusive(x_642);
if (x_669 == 0)
{
lean_object* x_670; lean_object* x_671; lean_object* x_672; lean_object* x_673; uint8_t x_674; 
x_670 = lean_ctor_get(x_642, 0);
x_671 = lean_ctor_get(x_642, 1);
lean_dec(x_671);
x_672 = lean_box(0);
lean_inc(x_670);
lean_ctor_set(x_642, 1, x_672);
lean_inc(x_667);
x_673 = l_CakeML_ptree__Pattern___closed__2;
lean_inc(x_6);
x_674 = l_CakeML_tokcheckl(x_6, x_673);
if (x_674 == 0)
{
lean_object* x_675; uint8_t x_676; 
x_675 = l_CakeML_ptree__Pattern___closed__8;
x_676 = l_CakeML_tokcheckl(x_6, x_675);
if (x_676 == 0)
{
lean_object* x_677; uint8_t x_678; 
x_677 = lean_box(39);
x_678 = l_CakeML_tokcheck(x_667, x_677);
if (x_678 == 0)
{
lean_object* x_679; 
lean_dec(x_670);
x_679 = lean_box(0);
x_9 = x_679;
goto block_19;
}
else
{
lean_object* x_680; 
x_680 = l_CakeML_ptree__OpID(x_670);
x_9 = x_680;
goto block_19;
}
}
else
{
lean_object* x_681; 
lean_dec(x_670);
lean_dec(x_667);
x_681 = l_CakeML_ptree__Expr___closed__13;
x_9 = x_681;
goto block_19;
}
}
else
{
lean_object* x_682; 
lean_dec(x_6);
lean_dec(x_670);
lean_dec(x_667);
x_682 = l_CakeML_ptree__Expr___closed__15;
x_9 = x_682;
goto block_19;
}
}
else
{
lean_object* x_683; lean_object* x_684; lean_object* x_685; lean_object* x_686; uint8_t x_687; 
x_683 = lean_ctor_get(x_642, 0);
lean_inc(x_683);
lean_dec(x_642);
x_684 = lean_box(0);
lean_inc(x_683);
x_685 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_685, 0, x_683);
lean_ctor_set(x_685, 1, x_684);
lean_inc(x_667);
lean_ctor_set(x_6, 1, x_685);
x_686 = l_CakeML_ptree__Pattern___closed__2;
lean_inc(x_6);
x_687 = l_CakeML_tokcheckl(x_6, x_686);
if (x_687 == 0)
{
lean_object* x_688; uint8_t x_689; 
x_688 = l_CakeML_ptree__Pattern___closed__8;
x_689 = l_CakeML_tokcheckl(x_6, x_688);
if (x_689 == 0)
{
lean_object* x_690; uint8_t x_691; 
x_690 = lean_box(39);
x_691 = l_CakeML_tokcheck(x_667, x_690);
if (x_691 == 0)
{
lean_object* x_692; 
lean_dec(x_683);
x_692 = lean_box(0);
x_9 = x_692;
goto block_19;
}
else
{
lean_object* x_693; 
x_693 = l_CakeML_ptree__OpID(x_683);
x_9 = x_693;
goto block_19;
}
}
else
{
lean_object* x_694; 
lean_dec(x_683);
lean_dec(x_667);
x_694 = l_CakeML_ptree__Expr___closed__13;
x_9 = x_694;
goto block_19;
}
}
else
{
lean_object* x_695; 
lean_dec(x_6);
lean_dec(x_683);
lean_dec(x_667);
x_695 = l_CakeML_ptree__Expr___closed__15;
x_9 = x_695;
goto block_19;
}
}
}
else
{
lean_object* x_696; lean_object* x_697; lean_object* x_698; lean_object* x_699; lean_object* x_700; lean_object* x_701; lean_object* x_702; uint8_t x_703; 
x_696 = lean_ctor_get(x_6, 0);
lean_inc(x_696);
lean_dec(x_6);
x_697 = lean_ctor_get(x_642, 0);
lean_inc(x_697);
if (lean_is_exclusive(x_642)) {
 lean_ctor_release(x_642, 0);
 lean_ctor_release(x_642, 1);
 x_698 = x_642;
} else {
 lean_dec_ref(x_642);
 x_698 = lean_box(0);
}
x_699 = lean_box(0);
lean_inc(x_697);
if (lean_is_scalar(x_698)) {
 x_700 = lean_alloc_ctor(1, 2, 0);
} else {
 x_700 = x_698;
}
lean_ctor_set(x_700, 0, x_697);
lean_ctor_set(x_700, 1, x_699);
lean_inc(x_696);
x_701 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_701, 0, x_696);
lean_ctor_set(x_701, 1, x_700);
x_702 = l_CakeML_ptree__Pattern___closed__2;
lean_inc(x_701);
x_703 = l_CakeML_tokcheckl(x_701, x_702);
if (x_703 == 0)
{
lean_object* x_704; uint8_t x_705; 
x_704 = l_CakeML_ptree__Pattern___closed__8;
x_705 = l_CakeML_tokcheckl(x_701, x_704);
if (x_705 == 0)
{
lean_object* x_706; uint8_t x_707; 
x_706 = lean_box(39);
x_707 = l_CakeML_tokcheck(x_696, x_706);
if (x_707 == 0)
{
lean_object* x_708; 
lean_dec(x_697);
x_708 = lean_box(0);
x_9 = x_708;
goto block_19;
}
else
{
lean_object* x_709; 
x_709 = l_CakeML_ptree__OpID(x_697);
x_9 = x_709;
goto block_19;
}
}
else
{
lean_object* x_710; 
lean_dec(x_697);
lean_dec(x_696);
x_710 = l_CakeML_ptree__Expr___closed__13;
x_9 = x_710;
goto block_19;
}
}
else
{
lean_object* x_711; 
lean_dec(x_701);
lean_dec(x_697);
lean_dec(x_696);
x_711 = l_CakeML_ptree__Expr___closed__15;
x_9 = x_711;
goto block_19;
}
}
}
else
{
lean_object* x_712; 
x_712 = lean_ctor_get(x_665, 1);
lean_inc(x_712);
if (lean_obj_tag(x_712) == 0)
{
lean_object* x_713; uint8_t x_714; 
x_713 = lean_ctor_get(x_6, 0);
lean_inc(x_713);
lean_dec(x_6);
x_714 = !lean_is_exclusive(x_642);
if (x_714 == 0)
{
lean_object* x_715; lean_object* x_716; uint8_t x_717; 
x_715 = lean_ctor_get(x_642, 0);
x_716 = lean_ctor_get(x_642, 1);
lean_dec(x_716);
x_717 = !lean_is_exclusive(x_665);
if (x_717 == 0)
{
lean_object* x_718; lean_object* x_719; lean_object* x_720; uint8_t x_721; 
x_718 = lean_ctor_get(x_665, 0);
x_719 = lean_ctor_get(x_665, 1);
lean_dec(x_719);
x_720 = lean_box(4);
lean_inc(x_713);
x_721 = l_CakeML_tokcheck(x_713, x_720);
if (x_721 == 0)
{
lean_object* x_722; lean_object* x_723; uint8_t x_724; 
x_722 = lean_box(0);
lean_ctor_set(x_665, 1, x_722);
lean_ctor_set(x_642, 0, x_713);
x_723 = l_CakeML_ptree__Pattern___closed__8;
x_724 = l_CakeML_tokcheckl(x_642, x_723);
if (x_724 == 0)
{
lean_object* x_725; 
lean_dec(x_715);
x_725 = lean_box(0);
x_9 = x_725;
goto block_19;
}
else
{
lean_object* x_726; 
x_726 = l_CakeML_ptree__Exprlist___rarg(x_715);
if (lean_obj_tag(x_726) == 0)
{
lean_object* x_727; 
x_727 = lean_box(0);
x_9 = x_727;
goto block_19;
}
else
{
uint8_t x_728; 
x_728 = !lean_is_exclusive(x_726);
if (x_728 == 0)
{
lean_object* x_729; lean_object* x_730; lean_object* x_731; 
x_729 = lean_ctor_get(x_726, 0);
x_730 = l_CakeML_ptree__Expr___closed__12;
x_731 = l_List_foldrTR___at_CakeML_ptree__Expr___spec__1(x_730, x_729);
lean_ctor_set(x_726, 0, x_731);
x_9 = x_726;
goto block_19;
}
else
{
lean_object* x_732; lean_object* x_733; lean_object* x_734; lean_object* x_735; 
x_732 = lean_ctor_get(x_726, 0);
lean_inc(x_732);
lean_dec(x_726);
x_733 = l_CakeML_ptree__Expr___closed__12;
x_734 = l_List_foldrTR___at_CakeML_ptree__Expr___spec__1(x_733, x_732);
x_735 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_735, 0, x_734);
x_9 = x_735;
goto block_19;
}
}
}
}
else
{
lean_object* x_736; uint8_t x_737; 
lean_free_object(x_665);
lean_free_object(x_642);
lean_dec(x_713);
x_736 = lean_box(5);
x_737 = l_CakeML_tokcheck(x_718, x_736);
if (x_737 == 0)
{
lean_object* x_738; 
lean_dec(x_715);
x_738 = lean_box(0);
x_9 = x_738;
goto block_19;
}
else
{
lean_object* x_739; 
x_739 = l_CakeML_ptree__Eseq(x_715);
if (lean_obj_tag(x_739) == 0)
{
lean_object* x_740; 
x_740 = lean_box(0);
x_9 = x_740;
goto block_19;
}
else
{
lean_object* x_741; lean_object* x_742; 
x_741 = lean_ctor_get(x_739, 0);
lean_inc(x_741);
lean_dec(x_739);
x_742 = l_CakeML_Eseq__encode(x_741);
lean_dec(x_741);
x_9 = x_742;
goto block_19;
}
}
}
}
else
{
lean_object* x_743; lean_object* x_744; uint8_t x_745; 
x_743 = lean_ctor_get(x_665, 0);
lean_inc(x_743);
lean_dec(x_665);
x_744 = lean_box(4);
lean_inc(x_713);
x_745 = l_CakeML_tokcheck(x_713, x_744);
if (x_745 == 0)
{
lean_object* x_746; lean_object* x_747; lean_object* x_748; uint8_t x_749; 
x_746 = lean_box(0);
x_747 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_747, 0, x_743);
lean_ctor_set(x_747, 1, x_746);
lean_ctor_set(x_642, 1, x_747);
lean_ctor_set(x_642, 0, x_713);
x_748 = l_CakeML_ptree__Pattern___closed__8;
x_749 = l_CakeML_tokcheckl(x_642, x_748);
if (x_749 == 0)
{
lean_object* x_750; 
lean_dec(x_715);
x_750 = lean_box(0);
x_9 = x_750;
goto block_19;
}
else
{
lean_object* x_751; 
x_751 = l_CakeML_ptree__Exprlist___rarg(x_715);
if (lean_obj_tag(x_751) == 0)
{
lean_object* x_752; 
x_752 = lean_box(0);
x_9 = x_752;
goto block_19;
}
else
{
lean_object* x_753; lean_object* x_754; lean_object* x_755; lean_object* x_756; lean_object* x_757; 
x_753 = lean_ctor_get(x_751, 0);
lean_inc(x_753);
if (lean_is_exclusive(x_751)) {
 lean_ctor_release(x_751, 0);
 x_754 = x_751;
} else {
 lean_dec_ref(x_751);
 x_754 = lean_box(0);
}
x_755 = l_CakeML_ptree__Expr___closed__12;
x_756 = l_List_foldrTR___at_CakeML_ptree__Expr___spec__1(x_755, x_753);
if (lean_is_scalar(x_754)) {
 x_757 = lean_alloc_ctor(1, 1, 0);
} else {
 x_757 = x_754;
}
lean_ctor_set(x_757, 0, x_756);
x_9 = x_757;
goto block_19;
}
}
}
else
{
lean_object* x_758; uint8_t x_759; 
lean_free_object(x_642);
lean_dec(x_713);
x_758 = lean_box(5);
x_759 = l_CakeML_tokcheck(x_743, x_758);
if (x_759 == 0)
{
lean_object* x_760; 
lean_dec(x_715);
x_760 = lean_box(0);
x_9 = x_760;
goto block_19;
}
else
{
lean_object* x_761; 
x_761 = l_CakeML_ptree__Eseq(x_715);
if (lean_obj_tag(x_761) == 0)
{
lean_object* x_762; 
x_762 = lean_box(0);
x_9 = x_762;
goto block_19;
}
else
{
lean_object* x_763; lean_object* x_764; 
x_763 = lean_ctor_get(x_761, 0);
lean_inc(x_763);
lean_dec(x_761);
x_764 = l_CakeML_Eseq__encode(x_763);
lean_dec(x_763);
x_9 = x_764;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_765; lean_object* x_766; lean_object* x_767; lean_object* x_768; uint8_t x_769; 
x_765 = lean_ctor_get(x_642, 0);
lean_inc(x_765);
lean_dec(x_642);
x_766 = lean_ctor_get(x_665, 0);
lean_inc(x_766);
if (lean_is_exclusive(x_665)) {
 lean_ctor_release(x_665, 0);
 lean_ctor_release(x_665, 1);
 x_767 = x_665;
} else {
 lean_dec_ref(x_665);
 x_767 = lean_box(0);
}
x_768 = lean_box(4);
lean_inc(x_713);
x_769 = l_CakeML_tokcheck(x_713, x_768);
if (x_769 == 0)
{
lean_object* x_770; lean_object* x_771; lean_object* x_772; lean_object* x_773; uint8_t x_774; 
x_770 = lean_box(0);
if (lean_is_scalar(x_767)) {
 x_771 = lean_alloc_ctor(1, 2, 0);
} else {
 x_771 = x_767;
}
lean_ctor_set(x_771, 0, x_766);
lean_ctor_set(x_771, 1, x_770);
x_772 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_772, 0, x_713);
lean_ctor_set(x_772, 1, x_771);
x_773 = l_CakeML_ptree__Pattern___closed__8;
x_774 = l_CakeML_tokcheckl(x_772, x_773);
if (x_774 == 0)
{
lean_object* x_775; 
lean_dec(x_765);
x_775 = lean_box(0);
x_9 = x_775;
goto block_19;
}
else
{
lean_object* x_776; 
x_776 = l_CakeML_ptree__Exprlist___rarg(x_765);
if (lean_obj_tag(x_776) == 0)
{
lean_object* x_777; 
x_777 = lean_box(0);
x_9 = x_777;
goto block_19;
}
else
{
lean_object* x_778; lean_object* x_779; lean_object* x_780; lean_object* x_781; lean_object* x_782; 
x_778 = lean_ctor_get(x_776, 0);
lean_inc(x_778);
if (lean_is_exclusive(x_776)) {
 lean_ctor_release(x_776, 0);
 x_779 = x_776;
} else {
 lean_dec_ref(x_776);
 x_779 = lean_box(0);
}
x_780 = l_CakeML_ptree__Expr___closed__12;
x_781 = l_List_foldrTR___at_CakeML_ptree__Expr___spec__1(x_780, x_778);
if (lean_is_scalar(x_779)) {
 x_782 = lean_alloc_ctor(1, 1, 0);
} else {
 x_782 = x_779;
}
lean_ctor_set(x_782, 0, x_781);
x_9 = x_782;
goto block_19;
}
}
}
else
{
lean_object* x_783; uint8_t x_784; 
lean_dec(x_767);
lean_dec(x_713);
x_783 = lean_box(5);
x_784 = l_CakeML_tokcheck(x_766, x_783);
if (x_784 == 0)
{
lean_object* x_785; 
lean_dec(x_765);
x_785 = lean_box(0);
x_9 = x_785;
goto block_19;
}
else
{
lean_object* x_786; 
x_786 = l_CakeML_ptree__Eseq(x_765);
if (lean_obj_tag(x_786) == 0)
{
lean_object* x_787; 
x_787 = lean_box(0);
x_9 = x_787;
goto block_19;
}
else
{
lean_object* x_788; lean_object* x_789; 
x_788 = lean_ctor_get(x_786, 0);
lean_inc(x_788);
lean_dec(x_786);
x_789 = l_CakeML_Eseq__encode(x_788);
lean_dec(x_788);
x_9 = x_789;
goto block_19;
}
}
}
}
}
else
{
lean_object* x_790; 
x_790 = lean_ctor_get(x_712, 1);
lean_inc(x_790);
if (lean_obj_tag(x_790) == 0)
{
lean_object* x_791; 
lean_dec(x_712);
lean_dec(x_665);
lean_dec(x_642);
lean_dec(x_6);
x_791 = lean_box(0);
x_9 = x_791;
goto block_19;
}
else
{
lean_object* x_792; 
x_792 = lean_ctor_get(x_790, 1);
lean_inc(x_792);
if (lean_obj_tag(x_792) == 0)
{
lean_object* x_793; lean_object* x_794; uint8_t x_795; 
x_793 = lean_ctor_get(x_6, 0);
lean_inc(x_793);
lean_dec(x_6);
x_794 = lean_ctor_get(x_642, 0);
lean_inc(x_794);
lean_dec(x_642);
x_795 = !lean_is_exclusive(x_665);
if (x_795 == 0)
{
lean_object* x_796; lean_object* x_797; uint8_t x_798; 
x_796 = lean_ctor_get(x_665, 0);
x_797 = lean_ctor_get(x_665, 1);
lean_dec(x_797);
x_798 = !lean_is_exclusive(x_712);
if (x_798 == 0)
{
lean_object* x_799; lean_object* x_800; uint8_t x_801; 
x_799 = lean_ctor_get(x_712, 0);
x_800 = lean_ctor_get(x_712, 1);
lean_dec(x_800);
x_801 = !lean_is_exclusive(x_790);
if (x_801 == 0)
{
lean_object* x_802; lean_object* x_803; lean_object* x_804; uint8_t x_805; 
x_802 = lean_ctor_get(x_790, 1);
lean_dec(x_802);
x_803 = lean_box(0);
lean_ctor_set(x_790, 1, x_803);
lean_ctor_set(x_712, 0, x_796);
lean_ctor_set(x_665, 0, x_793);
x_804 = l_CakeML_ptree__Expr___closed__18;
x_805 = l_CakeML_tokcheckl(x_665, x_804);
if (x_805 == 0)
{
lean_object* x_806; 
lean_dec(x_799);
lean_dec(x_794);
x_806 = lean_box(0);
x_9 = x_806;
goto block_19;
}
else
{
lean_object* x_807; 
x_807 = l_CakeML_ptree__LetDecs(x_794);
if (lean_obj_tag(x_807) == 0)
{
lean_object* x_808; 
lean_dec(x_799);
x_808 = lean_box(0);
x_9 = x_808;
goto block_19;
}
else
{
lean_object* x_809; lean_object* x_810; 
x_809 = lean_ctor_get(x_807, 0);
lean_inc(x_809);
lean_dec(x_807);
x_810 = l_CakeML_ptree__Eseq(x_799);
if (lean_obj_tag(x_810) == 0)
{
lean_object* x_811; 
lean_dec(x_809);
x_811 = lean_box(0);
x_9 = x_811;
goto block_19;
}
else
{
lean_object* x_812; lean_object* x_813; 
x_812 = lean_ctor_get(x_810, 0);
lean_inc(x_812);
lean_dec(x_810);
x_813 = l_CakeML_Eseq__encode(x_812);
lean_dec(x_812);
if (lean_obj_tag(x_813) == 0)
{
lean_object* x_814; 
lean_dec(x_809);
x_814 = lean_box(0);
x_9 = x_814;
goto block_19;
}
else
{
uint8_t x_815; 
x_815 = !lean_is_exclusive(x_813);
if (x_815 == 0)
{
lean_object* x_816; lean_object* x_817; 
x_816 = lean_ctor_get(x_813, 0);
x_817 = l_List_foldrTR___at_CakeML_ptree__Expr___spec__3(x_816, x_809);
lean_ctor_set(x_813, 0, x_817);
x_9 = x_813;
goto block_19;
}
else
{
lean_object* x_818; lean_object* x_819; lean_object* x_820; 
x_818 = lean_ctor_get(x_813, 0);
lean_inc(x_818);
lean_dec(x_813);
x_819 = l_List_foldrTR___at_CakeML_ptree__Expr___spec__3(x_818, x_809);
x_820 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_820, 0, x_819);
x_9 = x_820;
goto block_19;
}
}
}
}
}
}
else
{
lean_object* x_821; lean_object* x_822; lean_object* x_823; lean_object* x_824; uint8_t x_825; 
x_821 = lean_ctor_get(x_790, 0);
lean_inc(x_821);
lean_dec(x_790);
x_822 = lean_box(0);
x_823 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_823, 0, x_821);
lean_ctor_set(x_823, 1, x_822);
lean_ctor_set(x_712, 1, x_823);
lean_ctor_set(x_712, 0, x_796);
lean_ctor_set(x_665, 0, x_793);
x_824 = l_CakeML_ptree__Expr___closed__18;
x_825 = l_CakeML_tokcheckl(x_665, x_824);
if (x_825 == 0)
{
lean_object* x_826; 
lean_dec(x_799);
lean_dec(x_794);
x_826 = lean_box(0);
x_9 = x_826;
goto block_19;
}
else
{
lean_object* x_827; 
x_827 = l_CakeML_ptree__LetDecs(x_794);
if (lean_obj_tag(x_827) == 0)
{
lean_object* x_828; 
lean_dec(x_799);
x_828 = lean_box(0);
x_9 = x_828;
goto block_19;
}
else
{
lean_object* x_829; lean_object* x_830; 
x_829 = lean_ctor_get(x_827, 0);
lean_inc(x_829);
lean_dec(x_827);
x_830 = l_CakeML_ptree__Eseq(x_799);
if (lean_obj_tag(x_830) == 0)
{
lean_object* x_831; 
lean_dec(x_829);
x_831 = lean_box(0);
x_9 = x_831;
goto block_19;
}
else
{
lean_object* x_832; lean_object* x_833; 
x_832 = lean_ctor_get(x_830, 0);
lean_inc(x_832);
lean_dec(x_830);
x_833 = l_CakeML_Eseq__encode(x_832);
lean_dec(x_832);
if (lean_obj_tag(x_833) == 0)
{
lean_object* x_834; 
lean_dec(x_829);
x_834 = lean_box(0);
x_9 = x_834;
goto block_19;
}
else
{
lean_object* x_835; lean_object* x_836; lean_object* x_837; lean_object* x_838; 
x_835 = lean_ctor_get(x_833, 0);
lean_inc(x_835);
if (lean_is_exclusive(x_833)) {
 lean_ctor_release(x_833, 0);
 x_836 = x_833;
} else {
 lean_dec_ref(x_833);
 x_836 = lean_box(0);
}
x_837 = l_List_foldrTR___at_CakeML_ptree__Expr___spec__3(x_835, x_829);
if (lean_is_scalar(x_836)) {
 x_838 = lean_alloc_ctor(1, 1, 0);
} else {
 x_838 = x_836;
}
lean_ctor_set(x_838, 0, x_837);
x_9 = x_838;
goto block_19;
}
}
}
}
}
}
else
{
lean_object* x_839; lean_object* x_840; lean_object* x_841; lean_object* x_842; lean_object* x_843; lean_object* x_844; lean_object* x_845; uint8_t x_846; 
x_839 = lean_ctor_get(x_712, 0);
lean_inc(x_839);
lean_dec(x_712);
x_840 = lean_ctor_get(x_790, 0);
lean_inc(x_840);
if (lean_is_exclusive(x_790)) {
 lean_ctor_release(x_790, 0);
 lean_ctor_release(x_790, 1);
 x_841 = x_790;
} else {
 lean_dec_ref(x_790);
 x_841 = lean_box(0);
}
x_842 = lean_box(0);
if (lean_is_scalar(x_841)) {
 x_843 = lean_alloc_ctor(1, 2, 0);
} else {
 x_843 = x_841;
}
lean_ctor_set(x_843, 0, x_840);
lean_ctor_set(x_843, 1, x_842);
x_844 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_844, 0, x_796);
lean_ctor_set(x_844, 1, x_843);
lean_ctor_set(x_665, 1, x_844);
lean_ctor_set(x_665, 0, x_793);
x_845 = l_CakeML_ptree__Expr___closed__18;
x_846 = l_CakeML_tokcheckl(x_665, x_845);
if (x_846 == 0)
{
lean_object* x_847; 
lean_dec(x_839);
lean_dec(x_794);
x_847 = lean_box(0);
x_9 = x_847;
goto block_19;
}
else
{
lean_object* x_848; 
x_848 = l_CakeML_ptree__LetDecs(x_794);
if (lean_obj_tag(x_848) == 0)
{
lean_object* x_849; 
lean_dec(x_839);
x_849 = lean_box(0);
x_9 = x_849;
goto block_19;
}
else
{
lean_object* x_850; lean_object* x_851; 
x_850 = lean_ctor_get(x_848, 0);
lean_inc(x_850);
lean_dec(x_848);
x_851 = l_CakeML_ptree__Eseq(x_839);
if (lean_obj_tag(x_851) == 0)
{
lean_object* x_852; 
lean_dec(x_850);
x_852 = lean_box(0);
x_9 = x_852;
goto block_19;
}
else
{
lean_object* x_853; lean_object* x_854; 
x_853 = lean_ctor_get(x_851, 0);
lean_inc(x_853);
lean_dec(x_851);
x_854 = l_CakeML_Eseq__encode(x_853);
lean_dec(x_853);
if (lean_obj_tag(x_854) == 0)
{
lean_object* x_855; 
lean_dec(x_850);
x_855 = lean_box(0);
x_9 = x_855;
goto block_19;
}
else
{
lean_object* x_856; lean_object* x_857; lean_object* x_858; lean_object* x_859; 
x_856 = lean_ctor_get(x_854, 0);
lean_inc(x_856);
if (lean_is_exclusive(x_854)) {
 lean_ctor_release(x_854, 0);
 x_857 = x_854;
} else {
 lean_dec_ref(x_854);
 x_857 = lean_box(0);
}
x_858 = l_List_foldrTR___at_CakeML_ptree__Expr___spec__3(x_856, x_850);
if (lean_is_scalar(x_857)) {
 x_859 = lean_alloc_ctor(1, 1, 0);
} else {
 x_859 = x_857;
}
lean_ctor_set(x_859, 0, x_858);
x_9 = x_859;
goto block_19;
}
}
}
}
}
}
else
{
lean_object* x_860; lean_object* x_861; lean_object* x_862; lean_object* x_863; lean_object* x_864; lean_object* x_865; lean_object* x_866; lean_object* x_867; lean_object* x_868; lean_object* x_869; uint8_t x_870; 
x_860 = lean_ctor_get(x_665, 0);
lean_inc(x_860);
lean_dec(x_665);
x_861 = lean_ctor_get(x_712, 0);
lean_inc(x_861);
if (lean_is_exclusive(x_712)) {
 lean_ctor_release(x_712, 0);
 lean_ctor_release(x_712, 1);
 x_862 = x_712;
} else {
 lean_dec_ref(x_712);
 x_862 = lean_box(0);
}
x_863 = lean_ctor_get(x_790, 0);
lean_inc(x_863);
if (lean_is_exclusive(x_790)) {
 lean_ctor_release(x_790, 0);
 lean_ctor_release(x_790, 1);
 x_864 = x_790;
} else {
 lean_dec_ref(x_790);
 x_864 = lean_box(0);
}
x_865 = lean_box(0);
if (lean_is_scalar(x_864)) {
 x_866 = lean_alloc_ctor(1, 2, 0);
} else {
 x_866 = x_864;
}
lean_ctor_set(x_866, 0, x_863);
lean_ctor_set(x_866, 1, x_865);
if (lean_is_scalar(x_862)) {
 x_867 = lean_alloc_ctor(1, 2, 0);
} else {
 x_867 = x_862;
}
lean_ctor_set(x_867, 0, x_860);
lean_ctor_set(x_867, 1, x_866);
x_868 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_868, 0, x_793);
lean_ctor_set(x_868, 1, x_867);
x_869 = l_CakeML_ptree__Expr___closed__18;
x_870 = l_CakeML_tokcheckl(x_868, x_869);
if (x_870 == 0)
{
lean_object* x_871; 
lean_dec(x_861);
lean_dec(x_794);
x_871 = lean_box(0);
x_9 = x_871;
goto block_19;
}
else
{
lean_object* x_872; 
x_872 = l_CakeML_ptree__LetDecs(x_794);
if (lean_obj_tag(x_872) == 0)
{
lean_object* x_873; 
lean_dec(x_861);
x_873 = lean_box(0);
x_9 = x_873;
goto block_19;
}
else
{
lean_object* x_874; lean_object* x_875; 
x_874 = lean_ctor_get(x_872, 0);
lean_inc(x_874);
lean_dec(x_872);
x_875 = l_CakeML_ptree__Eseq(x_861);
if (lean_obj_tag(x_875) == 0)
{
lean_object* x_876; 
lean_dec(x_874);
x_876 = lean_box(0);
x_9 = x_876;
goto block_19;
}
else
{
lean_object* x_877; lean_object* x_878; 
x_877 = lean_ctor_get(x_875, 0);
lean_inc(x_877);
lean_dec(x_875);
x_878 = l_CakeML_Eseq__encode(x_877);
lean_dec(x_877);
if (lean_obj_tag(x_878) == 0)
{
lean_object* x_879; 
lean_dec(x_874);
x_879 = lean_box(0);
x_9 = x_879;
goto block_19;
}
else
{
lean_object* x_880; lean_object* x_881; lean_object* x_882; lean_object* x_883; 
x_880 = lean_ctor_get(x_878, 0);
lean_inc(x_880);
if (lean_is_exclusive(x_878)) {
 lean_ctor_release(x_878, 0);
 x_881 = x_878;
} else {
 lean_dec_ref(x_878);
 x_881 = lean_box(0);
}
x_882 = l_List_foldrTR___at_CakeML_ptree__Expr___spec__3(x_880, x_874);
if (lean_is_scalar(x_881)) {
 x_883 = lean_alloc_ctor(1, 1, 0);
} else {
 x_883 = x_881;
}
lean_ctor_set(x_883, 0, x_882);
x_9 = x_883;
goto block_19;
}
}
}
}
}
}
else
{
lean_object* x_884; 
lean_dec(x_792);
lean_dec(x_790);
lean_dec(x_712);
lean_dec(x_665);
lean_dec(x_642);
lean_dec(x_6);
x_884 = lean_box(0);
x_9 = x_884;
goto block_19;
}
}
}
}
}
}
}
}
block_19:
{
if (lean_obj_tag(x_9) == 0)
{
lean_object* x_10; 
x_10 = lean_box(0);
return x_10;
}
else
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_9);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_12 = lean_ctor_get(x_9, 0);
x_13 = l_CakeML_unknown__loc;
x_14 = l_CakeML_bind__loc(x_12, x_13);
lean_ctor_set(x_9, 0, x_14);
return x_9;
}
else
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; 
x_15 = lean_ctor_get(x_9, 0);
lean_inc(x_15);
lean_dec(x_9);
x_16 = l_CakeML_unknown__loc;
x_17 = l_CakeML_bind__loc(x_15, x_16);
x_18 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_18, 0, x_17);
return x_18;
}
}
}
}
else
{
lean_object* x_885; lean_object* x_886; uint8_t x_887; uint8_t x_888; lean_object* x_889; 
x_885 = lean_ctor_get(x_2, 0);
x_886 = lean_ctor_get(x_2, 1);
lean_inc(x_886);
lean_inc(x_885);
lean_dec(x_2);
x_887 = lean_unbox(x_885);
x_888 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_1, x_887);
if (x_888 == 0)
{
lean_object* x_897; 
lean_dec(x_886);
lean_dec(x_885);
x_897 = lean_box(0);
x_889 = x_897;
goto block_896;
}
else
{
uint8_t x_898; uint8_t x_899; uint8_t x_900; 
x_898 = 25;
x_899 = lean_unbox(x_885);
x_900 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_899, x_898);
if (x_900 == 0)
{
uint8_t x_901; uint8_t x_902; uint8_t x_903; 
x_901 = 30;
x_902 = lean_unbox(x_885);
x_903 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_902, x_901);
if (x_903 == 0)
{
uint8_t x_904; uint8_t x_905; uint8_t x_906; 
x_904 = 27;
x_905 = lean_unbox(x_885);
x_906 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_905, x_904);
if (x_906 == 0)
{
uint8_t x_907; uint8_t x_908; uint8_t x_909; 
x_907 = 36;
x_908 = lean_unbox(x_885);
x_909 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_908, x_907);
if (x_909 == 0)
{
uint8_t x_910; uint8_t x_911; uint8_t x_912; 
x_910 = 37;
x_911 = lean_unbox(x_885);
x_912 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_911, x_910);
if (x_912 == 0)
{
uint8_t x_913; uint8_t x_914; uint8_t x_915; 
x_913 = 38;
x_914 = lean_unbox(x_885);
x_915 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_914, x_913);
if (x_915 == 0)
{
uint8_t x_916; uint8_t x_917; uint8_t x_918; 
x_916 = 39;
x_917 = lean_unbox(x_885);
x_918 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_917, x_916);
if (x_918 == 0)
{
uint8_t x_919; uint8_t x_920; uint8_t x_921; 
x_919 = 40;
x_920 = lean_unbox(x_885);
x_921 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_920, x_919);
if (x_921 == 0)
{
uint8_t x_922; uint8_t x_923; uint8_t x_924; 
x_922 = 41;
x_923 = lean_unbox(x_885);
x_924 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_923, x_922);
if (x_924 == 0)
{
uint8_t x_925; uint8_t x_926; uint8_t x_927; 
x_925 = 42;
x_926 = lean_unbox(x_885);
x_927 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_926, x_925);
if (x_927 == 0)
{
uint8_t x_928; uint8_t x_929; uint8_t x_930; 
x_928 = 43;
x_929 = lean_unbox(x_885);
x_930 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_929, x_928);
if (x_930 == 0)
{
uint8_t x_931; uint8_t x_932; uint8_t x_933; 
x_931 = 44;
x_932 = lean_unbox(x_885);
x_933 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_932, x_931);
if (x_933 == 0)
{
uint8_t x_934; uint8_t x_935; uint8_t x_936; 
x_934 = 45;
x_935 = lean_unbox(x_885);
x_936 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_935, x_934);
if (x_936 == 0)
{
uint8_t x_937; uint8_t x_938; uint8_t x_939; 
x_937 = 46;
x_938 = lean_unbox(x_885);
lean_dec(x_885);
x_939 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_938, x_937);
if (x_939 == 0)
{
lean_object* x_940; 
lean_dec(x_886);
x_940 = lean_box(0);
x_889 = x_940;
goto block_896;
}
else
{
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_941; 
x_941 = lean_box(0);
x_889 = x_941;
goto block_896;
}
else
{
lean_object* x_942; 
x_942 = lean_ctor_get(x_886, 1);
lean_inc(x_942);
if (lean_obj_tag(x_942) == 0)
{
lean_object* x_943; lean_object* x_944; 
x_943 = lean_ctor_get(x_886, 0);
lean_inc(x_943);
lean_dec(x_886);
x_944 = l_CakeML_ptree__Expr(x_934, x_943);
x_889 = x_944;
goto block_896;
}
else
{
lean_object* x_945; 
x_945 = lean_ctor_get(x_942, 1);
lean_inc(x_945);
if (lean_obj_tag(x_945) == 0)
{
lean_object* x_946; lean_object* x_947; lean_object* x_948; uint8_t x_949; 
x_946 = lean_ctor_get(x_886, 0);
lean_inc(x_946);
lean_dec(x_886);
x_947 = lean_ctor_get(x_942, 0);
lean_inc(x_947);
lean_dec(x_942);
x_948 = lean_box(42);
x_949 = l_CakeML_tokcheck(x_946, x_948);
if (x_949 == 0)
{
lean_object* x_950; 
lean_dec(x_947);
x_950 = lean_box(0);
x_889 = x_950;
goto block_896;
}
else
{
lean_object* x_951; 
x_951 = l_CakeML_ptree__Expr(x_937, x_947);
if (lean_obj_tag(x_951) == 0)
{
lean_object* x_952; 
x_952 = lean_box(0);
x_889 = x_952;
goto block_896;
}
else
{
lean_object* x_953; lean_object* x_954; lean_object* x_955; lean_object* x_956; 
x_953 = lean_ctor_get(x_951, 0);
lean_inc(x_953);
if (lean_is_exclusive(x_951)) {
 lean_ctor_release(x_951, 0);
 x_954 = x_951;
} else {
 lean_dec_ref(x_951);
 x_954 = lean_box(0);
}
x_955 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_955, 0, x_953);
if (lean_is_scalar(x_954)) {
 x_956 = lean_alloc_ctor(1, 1, 0);
} else {
 x_956 = x_954;
}
lean_ctor_set(x_956, 0, x_955);
x_889 = x_956;
goto block_896;
}
}
}
else
{
lean_object* x_957; 
x_957 = lean_ctor_get(x_945, 1);
lean_inc(x_957);
if (lean_obj_tag(x_957) == 0)
{
lean_object* x_958; 
lean_dec(x_945);
lean_dec(x_942);
lean_dec(x_886);
x_958 = lean_box(0);
x_889 = x_958;
goto block_896;
}
else
{
lean_object* x_959; 
x_959 = lean_ctor_get(x_957, 1);
lean_inc(x_959);
if (lean_obj_tag(x_959) == 0)
{
lean_object* x_960; lean_object* x_961; lean_object* x_962; lean_object* x_963; lean_object* x_964; lean_object* x_965; lean_object* x_966; lean_object* x_967; lean_object* x_968; lean_object* x_969; lean_object* x_970; lean_object* x_984; uint8_t x_985; 
x_960 = lean_ctor_get(x_886, 0);
lean_inc(x_960);
lean_dec(x_886);
x_961 = lean_ctor_get(x_942, 0);
lean_inc(x_961);
if (lean_is_exclusive(x_942)) {
 lean_ctor_release(x_942, 0);
 lean_ctor_release(x_942, 1);
 x_962 = x_942;
} else {
 lean_dec_ref(x_942);
 x_962 = lean_box(0);
}
x_963 = lean_ctor_get(x_945, 0);
lean_inc(x_963);
if (lean_is_exclusive(x_945)) {
 lean_ctor_release(x_945, 0);
 lean_ctor_release(x_945, 1);
 x_964 = x_945;
} else {
 lean_dec_ref(x_945);
 x_964 = lean_box(0);
}
x_965 = lean_ctor_get(x_957, 0);
lean_inc(x_965);
if (lean_is_exclusive(x_957)) {
 lean_ctor_release(x_957, 0);
 lean_ctor_release(x_957, 1);
 x_966 = x_957;
} else {
 lean_dec_ref(x_957);
 x_966 = lean_box(0);
}
x_967 = lean_box(0);
if (lean_is_scalar(x_966)) {
 x_968 = lean_alloc_ctor(1, 2, 0);
} else {
 x_968 = x_966;
}
lean_ctor_set(x_968, 0, x_963);
lean_ctor_set(x_968, 1, x_967);
if (lean_is_scalar(x_964)) {
 x_969 = lean_alloc_ctor(1, 2, 0);
} else {
 x_969 = x_964;
}
lean_ctor_set(x_969, 0, x_960);
lean_ctor_set(x_969, 1, x_968);
x_984 = l_CakeML_ptree__Expr___closed__4;
lean_inc(x_969);
x_985 = l_CakeML_tokcheckl(x_969, x_984);
if (x_985 == 0)
{
lean_object* x_986; 
x_986 = lean_box(0);
x_970 = x_986;
goto block_983;
}
else
{
uint8_t x_987; lean_object* x_988; 
x_987 = 56;
lean_inc(x_961);
x_988 = l_CakeML_ptree__Pattern(x_987, x_961);
if (lean_obj_tag(x_988) == 0)
{
lean_object* x_989; 
x_989 = lean_box(0);
x_970 = x_989;
goto block_983;
}
else
{
lean_object* x_990; lean_object* x_991; 
x_990 = lean_ctor_get(x_988, 0);
lean_inc(x_990);
lean_dec(x_988);
lean_inc(x_965);
x_991 = l_CakeML_ptree__Expr(x_937, x_965);
if (lean_obj_tag(x_991) == 0)
{
lean_object* x_992; 
lean_dec(x_990);
x_992 = lean_box(0);
x_970 = x_992;
goto block_983;
}
else
{
lean_object* x_993; lean_object* x_994; lean_object* x_995; lean_object* x_996; 
lean_dec(x_969);
lean_dec(x_965);
lean_dec(x_962);
lean_dec(x_961);
x_993 = lean_ctor_get(x_991, 0);
lean_inc(x_993);
if (lean_is_exclusive(x_991)) {
 lean_ctor_release(x_991, 0);
 x_994 = x_991;
} else {
 lean_dec_ref(x_991);
 x_994 = lean_box(0);
}
x_995 = l_CakeML_mkFun(x_990, x_993);
if (lean_is_scalar(x_994)) {
 x_996 = lean_alloc_ctor(1, 1, 0);
} else {
 x_996 = x_994;
}
lean_ctor_set(x_996, 0, x_995);
x_889 = x_996;
goto block_896;
}
}
}
block_983:
{
lean_object* x_971; uint8_t x_972; 
lean_dec(x_970);
x_971 = l_CakeML_ptree__Expr___closed__2;
x_972 = l_CakeML_tokcheckl(x_969, x_971);
if (x_972 == 0)
{
lean_object* x_973; 
lean_dec(x_965);
lean_dec(x_962);
lean_dec(x_961);
x_973 = lean_box(0);
x_889 = x_973;
goto block_896;
}
else
{
lean_object* x_974; 
x_974 = l_CakeML_ptree__Expr(x_937, x_961);
if (lean_obj_tag(x_974) == 0)
{
lean_object* x_975; 
lean_dec(x_965);
lean_dec(x_962);
x_975 = lean_box(0);
x_889 = x_975;
goto block_896;
}
else
{
lean_object* x_976; lean_object* x_977; 
x_976 = lean_ctor_get(x_974, 0);
lean_inc(x_976);
lean_dec(x_974);
x_977 = l_CakeML_ptree__PEs(x_965);
if (lean_obj_tag(x_977) == 0)
{
lean_object* x_978; 
lean_dec(x_976);
lean_dec(x_962);
x_978 = lean_box(0);
x_889 = x_978;
goto block_896;
}
else
{
lean_object* x_979; lean_object* x_980; lean_object* x_981; lean_object* x_982; 
x_979 = lean_ctor_get(x_977, 0);
lean_inc(x_979);
if (lean_is_exclusive(x_977)) {
 lean_ctor_release(x_977, 0);
 x_980 = x_977;
} else {
 lean_dec_ref(x_977);
 x_980 = lean_box(0);
}
if (lean_is_scalar(x_962)) {
 x_981 = lean_alloc_ctor(9, 2, 0);
} else {
 x_981 = x_962;
 lean_ctor_set_tag(x_981, 9);
}
lean_ctor_set(x_981, 0, x_976);
lean_ctor_set(x_981, 1, x_979);
if (lean_is_scalar(x_980)) {
 x_982 = lean_alloc_ctor(1, 1, 0);
} else {
 x_982 = x_980;
}
lean_ctor_set(x_982, 0, x_981);
x_889 = x_982;
goto block_896;
}
}
}
}
}
else
{
lean_object* x_997; 
x_997 = lean_ctor_get(x_959, 1);
lean_inc(x_997);
if (lean_obj_tag(x_997) == 0)
{
lean_object* x_998; 
lean_dec(x_959);
lean_dec(x_957);
lean_dec(x_945);
lean_dec(x_942);
lean_dec(x_886);
x_998 = lean_box(0);
x_889 = x_998;
goto block_896;
}
else
{
lean_object* x_999; 
x_999 = lean_ctor_get(x_997, 1);
lean_inc(x_999);
if (lean_obj_tag(x_999) == 0)
{
lean_object* x_1000; lean_object* x_1001; lean_object* x_1002; lean_object* x_1003; lean_object* x_1004; lean_object* x_1005; lean_object* x_1006; lean_object* x_1007; lean_object* x_1008; lean_object* x_1009; lean_object* x_1010; lean_object* x_1011; lean_object* x_1012; lean_object* x_1013; uint8_t x_1014; 
x_1000 = lean_ctor_get(x_886, 0);
lean_inc(x_1000);
lean_dec(x_886);
x_1001 = lean_ctor_get(x_942, 0);
lean_inc(x_1001);
lean_dec(x_942);
x_1002 = lean_ctor_get(x_945, 0);
lean_inc(x_1002);
lean_dec(x_945);
x_1003 = lean_ctor_get(x_957, 0);
lean_inc(x_1003);
if (lean_is_exclusive(x_957)) {
 lean_ctor_release(x_957, 0);
 lean_ctor_release(x_957, 1);
 x_1004 = x_957;
} else {
 lean_dec_ref(x_957);
 x_1004 = lean_box(0);
}
x_1005 = lean_ctor_get(x_959, 0);
lean_inc(x_1005);
if (lean_is_exclusive(x_959)) {
 lean_ctor_release(x_959, 0);
 lean_ctor_release(x_959, 1);
 x_1006 = x_959;
} else {
 lean_dec_ref(x_959);
 x_1006 = lean_box(0);
}
x_1007 = lean_ctor_get(x_997, 0);
lean_inc(x_1007);
if (lean_is_exclusive(x_997)) {
 lean_ctor_release(x_997, 0);
 lean_ctor_release(x_997, 1);
 x_1008 = x_997;
} else {
 lean_dec_ref(x_997);
 x_1008 = lean_box(0);
}
x_1009 = lean_box(0);
if (lean_is_scalar(x_1008)) {
 x_1010 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1010 = x_1008;
}
lean_ctor_set(x_1010, 0, x_1005);
lean_ctor_set(x_1010, 1, x_1009);
if (lean_is_scalar(x_1006)) {
 x_1011 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1011 = x_1006;
}
lean_ctor_set(x_1011, 0, x_1002);
lean_ctor_set(x_1011, 1, x_1010);
if (lean_is_scalar(x_1004)) {
 x_1012 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1012 = x_1004;
}
lean_ctor_set(x_1012, 0, x_1000);
lean_ctor_set(x_1012, 1, x_1011);
x_1013 = l_CakeML_ptree__Expr___closed__7;
x_1014 = l_CakeML_tokcheckl(x_1012, x_1013);
if (x_1014 == 0)
{
lean_object* x_1015; 
lean_dec(x_1007);
lean_dec(x_1003);
lean_dec(x_1001);
x_1015 = lean_box(0);
x_889 = x_1015;
goto block_896;
}
else
{
lean_object* x_1016; 
x_1016 = l_CakeML_ptree__Expr(x_937, x_1001);
if (lean_obj_tag(x_1016) == 0)
{
lean_object* x_1017; 
lean_dec(x_1007);
lean_dec(x_1003);
x_1017 = lean_box(0);
x_889 = x_1017;
goto block_896;
}
else
{
lean_object* x_1018; lean_object* x_1019; 
x_1018 = lean_ctor_get(x_1016, 0);
lean_inc(x_1018);
lean_dec(x_1016);
x_1019 = l_CakeML_ptree__Expr(x_937, x_1003);
if (lean_obj_tag(x_1019) == 0)
{
lean_object* x_1020; 
lean_dec(x_1018);
lean_dec(x_1007);
x_1020 = lean_box(0);
x_889 = x_1020;
goto block_896;
}
else
{
lean_object* x_1021; lean_object* x_1022; 
x_1021 = lean_ctor_get(x_1019, 0);
lean_inc(x_1021);
lean_dec(x_1019);
x_1022 = l_CakeML_ptree__Expr(x_937, x_1007);
if (lean_obj_tag(x_1022) == 0)
{
lean_object* x_1023; 
lean_dec(x_1021);
lean_dec(x_1018);
x_1023 = lean_box(0);
x_889 = x_1023;
goto block_896;
}
else
{
lean_object* x_1024; lean_object* x_1025; lean_object* x_1026; lean_object* x_1027; 
x_1024 = lean_ctor_get(x_1022, 0);
lean_inc(x_1024);
if (lean_is_exclusive(x_1022)) {
 lean_ctor_release(x_1022, 0);
 x_1025 = x_1022;
} else {
 lean_dec_ref(x_1022);
 x_1025 = lean_box(0);
}
x_1026 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_1026, 0, x_1018);
lean_ctor_set(x_1026, 1, x_1021);
lean_ctor_set(x_1026, 2, x_1024);
if (lean_is_scalar(x_1025)) {
 x_1027 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1027 = x_1025;
}
lean_ctor_set(x_1027, 0, x_1026);
x_889 = x_1027;
goto block_896;
}
}
}
}
}
else
{
lean_object* x_1028; 
lean_dec(x_999);
lean_dec(x_997);
lean_dec(x_959);
lean_dec(x_957);
lean_dec(x_945);
lean_dec(x_942);
lean_dec(x_886);
x_1028 = lean_box(0);
x_889 = x_1028;
goto block_896;
}
}
}
}
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1029; 
x_1029 = lean_box(0);
x_889 = x_1029;
goto block_896;
}
else
{
lean_object* x_1030; 
x_1030 = lean_ctor_get(x_886, 1);
lean_inc(x_1030);
if (lean_obj_tag(x_1030) == 0)
{
lean_object* x_1031; lean_object* x_1032; 
x_1031 = lean_ctor_get(x_886, 0);
lean_inc(x_1031);
lean_dec(x_886);
x_1032 = l_CakeML_ptree__Expr(x_931, x_1031);
x_889 = x_1032;
goto block_896;
}
else
{
lean_object* x_1033; 
x_1033 = lean_ctor_get(x_1030, 1);
lean_inc(x_1033);
if (lean_obj_tag(x_1033) == 0)
{
lean_object* x_1034; 
lean_dec(x_1030);
lean_dec(x_886);
x_1034 = lean_box(0);
x_889 = x_1034;
goto block_896;
}
else
{
lean_object* x_1035; 
x_1035 = lean_ctor_get(x_1033, 1);
lean_inc(x_1035);
if (lean_obj_tag(x_1035) == 0)
{
lean_object* x_1036; lean_object* x_1037; lean_object* x_1038; lean_object* x_1039; lean_object* x_1040; uint8_t x_1041; 
x_1036 = lean_ctor_get(x_886, 0);
lean_inc(x_1036);
lean_dec(x_886);
x_1037 = lean_ctor_get(x_1030, 0);
lean_inc(x_1037);
lean_dec(x_1030);
x_1038 = lean_ctor_get(x_1033, 0);
lean_inc(x_1038);
if (lean_is_exclusive(x_1033)) {
 lean_ctor_release(x_1033, 0);
 lean_ctor_release(x_1033, 1);
 x_1039 = x_1033;
} else {
 lean_dec_ref(x_1033);
 x_1039 = lean_box(0);
}
x_1040 = lean_box(32);
x_1041 = l_CakeML_tokcheck(x_1037, x_1040);
if (x_1041 == 0)
{
lean_object* x_1042; 
lean_dec(x_1039);
lean_dec(x_1038);
lean_dec(x_1036);
x_1042 = lean_box(0);
x_889 = x_1042;
goto block_896;
}
else
{
lean_object* x_1043; 
x_1043 = l_CakeML_ptree__Expr(x_931, x_1036);
if (lean_obj_tag(x_1043) == 0)
{
lean_object* x_1044; 
lean_dec(x_1039);
lean_dec(x_1038);
x_1044 = lean_box(0);
x_889 = x_1044;
goto block_896;
}
else
{
lean_object* x_1045; lean_object* x_1046; 
x_1045 = lean_ctor_get(x_1043, 0);
lean_inc(x_1045);
lean_dec(x_1043);
x_1046 = l_CakeML_ptree__PEs(x_1038);
if (lean_obj_tag(x_1046) == 0)
{
lean_object* x_1047; 
lean_dec(x_1045);
lean_dec(x_1039);
x_1047 = lean_box(0);
x_889 = x_1047;
goto block_896;
}
else
{
lean_object* x_1048; lean_object* x_1049; lean_object* x_1050; lean_object* x_1051; 
x_1048 = lean_ctor_get(x_1046, 0);
lean_inc(x_1048);
if (lean_is_exclusive(x_1046)) {
 lean_ctor_release(x_1046, 0);
 x_1049 = x_1046;
} else {
 lean_dec_ref(x_1046);
 x_1049 = lean_box(0);
}
if (lean_is_scalar(x_1039)) {
 x_1050 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1050 = x_1039;
}
lean_ctor_set(x_1050, 0, x_1045);
lean_ctor_set(x_1050, 1, x_1048);
if (lean_is_scalar(x_1049)) {
 x_1051 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1051 = x_1049;
}
lean_ctor_set(x_1051, 0, x_1050);
x_889 = x_1051;
goto block_896;
}
}
}
}
else
{
lean_object* x_1052; 
lean_dec(x_1035);
lean_dec(x_1033);
lean_dec(x_1030);
lean_dec(x_886);
x_1052 = lean_box(0);
x_889 = x_1052;
goto block_896;
}
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1053; 
x_1053 = lean_box(0);
x_889 = x_1053;
goto block_896;
}
else
{
lean_object* x_1054; 
x_1054 = lean_ctor_get(x_886, 1);
lean_inc(x_1054);
if (lean_obj_tag(x_1054) == 0)
{
lean_object* x_1055; lean_object* x_1056; 
x_1055 = lean_ctor_get(x_886, 0);
lean_inc(x_1055);
lean_dec(x_886);
x_1056 = l_CakeML_ptree__Expr(x_928, x_1055);
x_889 = x_1056;
goto block_896;
}
else
{
lean_object* x_1057; 
x_1057 = lean_ctor_get(x_1054, 1);
lean_inc(x_1057);
if (lean_obj_tag(x_1057) == 0)
{
lean_object* x_1058; 
lean_dec(x_1054);
lean_dec(x_886);
x_1058 = lean_box(0);
x_889 = x_1058;
goto block_896;
}
else
{
lean_object* x_1059; 
x_1059 = lean_ctor_get(x_1057, 1);
lean_inc(x_1059);
if (lean_obj_tag(x_1059) == 0)
{
lean_object* x_1060; lean_object* x_1061; lean_object* x_1062; lean_object* x_1063; uint8_t x_1064; 
x_1060 = lean_ctor_get(x_886, 0);
lean_inc(x_1060);
lean_dec(x_886);
x_1061 = lean_ctor_get(x_1054, 0);
lean_inc(x_1061);
lean_dec(x_1054);
x_1062 = lean_ctor_get(x_1057, 0);
lean_inc(x_1062);
lean_dec(x_1057);
x_1063 = lean_box(41);
x_1064 = l_CakeML_tokcheck(x_1061, x_1063);
if (x_1064 == 0)
{
lean_object* x_1065; 
lean_dec(x_1062);
lean_dec(x_1060);
x_1065 = lean_box(0);
x_889 = x_1065;
goto block_896;
}
else
{
lean_object* x_1066; 
x_1066 = l_CakeML_ptree__Expr(x_931, x_1060);
if (lean_obj_tag(x_1066) == 0)
{
lean_object* x_1067; 
lean_dec(x_1062);
x_1067 = lean_box(0);
x_889 = x_1067;
goto block_896;
}
else
{
lean_object* x_1068; lean_object* x_1069; 
x_1068 = lean_ctor_get(x_1066, 0);
lean_inc(x_1068);
lean_dec(x_1066);
x_1069 = l_CakeML_ptree__Expr(x_928, x_1062);
if (lean_obj_tag(x_1069) == 0)
{
lean_object* x_1070; 
lean_dec(x_1068);
x_1070 = lean_box(0);
x_889 = x_1070;
goto block_896;
}
else
{
lean_object* x_1071; lean_object* x_1072; uint8_t x_1073; lean_object* x_1074; lean_object* x_1075; 
x_1071 = lean_ctor_get(x_1069, 0);
lean_inc(x_1071);
if (lean_is_exclusive(x_1069)) {
 lean_ctor_release(x_1069, 0);
 x_1072 = x_1069;
} else {
 lean_dec_ref(x_1069);
 x_1072 = lean_box(0);
}
x_1073 = 1;
x_1074 = lean_alloc_ctor(7, 2, 1);
lean_ctor_set(x_1074, 0, x_1068);
lean_ctor_set(x_1074, 1, x_1071);
lean_ctor_set_uint8(x_1074, sizeof(void*)*2, x_1073);
if (lean_is_scalar(x_1072)) {
 x_1075 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1075 = x_1072;
}
lean_ctor_set(x_1075, 0, x_1074);
x_889 = x_1075;
goto block_896;
}
}
}
}
else
{
lean_object* x_1076; 
lean_dec(x_1059);
lean_dec(x_1057);
lean_dec(x_1054);
lean_dec(x_886);
x_1076 = lean_box(0);
x_889 = x_1076;
goto block_896;
}
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1077; 
x_1077 = lean_box(0);
x_889 = x_1077;
goto block_896;
}
else
{
lean_object* x_1078; 
x_1078 = lean_ctor_get(x_886, 1);
lean_inc(x_1078);
if (lean_obj_tag(x_1078) == 0)
{
lean_object* x_1079; lean_object* x_1080; 
x_1079 = lean_ctor_get(x_886, 0);
lean_inc(x_1079);
lean_dec(x_886);
x_1080 = l_CakeML_ptree__Expr(x_925, x_1079);
x_889 = x_1080;
goto block_896;
}
else
{
lean_object* x_1081; 
x_1081 = lean_ctor_get(x_1078, 1);
lean_inc(x_1081);
if (lean_obj_tag(x_1081) == 0)
{
lean_object* x_1082; 
lean_dec(x_1078);
lean_dec(x_886);
x_1082 = lean_box(0);
x_889 = x_1082;
goto block_896;
}
else
{
lean_object* x_1083; 
x_1083 = lean_ctor_get(x_1081, 1);
lean_inc(x_1083);
if (lean_obj_tag(x_1083) == 0)
{
lean_object* x_1084; lean_object* x_1085; lean_object* x_1086; lean_object* x_1087; uint8_t x_1088; 
x_1084 = lean_ctor_get(x_886, 0);
lean_inc(x_1084);
lean_dec(x_886);
x_1085 = lean_ctor_get(x_1078, 0);
lean_inc(x_1085);
lean_dec(x_1078);
x_1086 = lean_ctor_get(x_1081, 0);
lean_inc(x_1086);
lean_dec(x_1081);
x_1087 = lean_box(22);
x_1088 = l_CakeML_tokcheck(x_1085, x_1087);
if (x_1088 == 0)
{
lean_object* x_1089; 
lean_dec(x_1086);
lean_dec(x_1084);
x_1089 = lean_box(0);
x_889 = x_1089;
goto block_896;
}
else
{
lean_object* x_1090; 
x_1090 = l_CakeML_ptree__Expr(x_928, x_1084);
if (lean_obj_tag(x_1090) == 0)
{
lean_object* x_1091; 
lean_dec(x_1086);
x_1091 = lean_box(0);
x_889 = x_1091;
goto block_896;
}
else
{
lean_object* x_1092; lean_object* x_1093; 
x_1092 = lean_ctor_get(x_1090, 0);
lean_inc(x_1092);
lean_dec(x_1090);
x_1093 = l_CakeML_ptree__Expr(x_925, x_1086);
if (lean_obj_tag(x_1093) == 0)
{
lean_object* x_1094; 
lean_dec(x_1092);
x_1094 = lean_box(0);
x_889 = x_1094;
goto block_896;
}
else
{
lean_object* x_1095; lean_object* x_1096; uint8_t x_1097; lean_object* x_1098; lean_object* x_1099; 
x_1095 = lean_ctor_get(x_1093, 0);
lean_inc(x_1095);
if (lean_is_exclusive(x_1093)) {
 lean_ctor_release(x_1093, 0);
 x_1096 = x_1093;
} else {
 lean_dec_ref(x_1093);
 x_1096 = lean_box(0);
}
x_1097 = 0;
x_1098 = lean_alloc_ctor(7, 2, 1);
lean_ctor_set(x_1098, 0, x_1092);
lean_ctor_set(x_1098, 1, x_1095);
lean_ctor_set_uint8(x_1098, sizeof(void*)*2, x_1097);
if (lean_is_scalar(x_1096)) {
 x_1099 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1099 = x_1096;
}
lean_ctor_set(x_1099, 0, x_1098);
x_889 = x_1099;
goto block_896;
}
}
}
}
else
{
lean_object* x_1100; 
lean_dec(x_1083);
lean_dec(x_1081);
lean_dec(x_1078);
lean_dec(x_886);
x_1100 = lean_box(0);
x_889 = x_1100;
goto block_896;
}
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1101; 
x_1101 = lean_box(0);
x_889 = x_1101;
goto block_896;
}
else
{
lean_object* x_1102; 
x_1102 = lean_ctor_get(x_886, 1);
lean_inc(x_1102);
if (lean_obj_tag(x_1102) == 0)
{
lean_object* x_1103; lean_object* x_1104; 
x_1103 = lean_ctor_get(x_886, 0);
lean_inc(x_1103);
lean_dec(x_886);
x_1104 = l_CakeML_ptree__Expr(x_922, x_1103);
x_889 = x_1104;
goto block_896;
}
else
{
lean_object* x_1105; 
x_1105 = lean_ctor_get(x_1102, 1);
lean_inc(x_1105);
if (lean_obj_tag(x_1105) == 0)
{
lean_object* x_1106; 
lean_dec(x_1102);
lean_dec(x_886);
x_1106 = lean_box(0);
x_889 = x_1106;
goto block_896;
}
else
{
lean_object* x_1107; 
x_1107 = lean_ctor_get(x_1105, 1);
lean_inc(x_1107);
if (lean_obj_tag(x_1107) == 0)
{
lean_object* x_1108; lean_object* x_1109; lean_object* x_1110; lean_object* x_1111; lean_object* x_1112; uint8_t x_1113; 
x_1108 = lean_ctor_get(x_886, 0);
lean_inc(x_1108);
lean_dec(x_886);
x_1109 = lean_ctor_get(x_1102, 0);
lean_inc(x_1109);
lean_dec(x_1102);
x_1110 = lean_ctor_get(x_1105, 0);
lean_inc(x_1110);
if (lean_is_exclusive(x_1105)) {
 lean_ctor_release(x_1105, 0);
 lean_ctor_release(x_1105, 1);
 x_1111 = x_1105;
} else {
 lean_dec_ref(x_1105);
 x_1111 = lean_box(0);
}
x_1112 = lean_box(10);
x_1113 = l_CakeML_tokcheck(x_1109, x_1112);
if (x_1113 == 0)
{
lean_object* x_1114; 
lean_dec(x_1111);
lean_dec(x_1110);
lean_dec(x_1108);
x_1114 = lean_box(0);
x_889 = x_1114;
goto block_896;
}
else
{
lean_object* x_1115; 
x_1115 = l_CakeML_ptree__Expr(x_922, x_1108);
if (lean_obj_tag(x_1115) == 0)
{
lean_object* x_1116; 
lean_dec(x_1111);
lean_dec(x_1110);
x_1116 = lean_box(0);
x_889 = x_1116;
goto block_896;
}
else
{
lean_object* x_1117; uint8_t x_1118; lean_object* x_1119; 
x_1117 = lean_ctor_get(x_1115, 0);
lean_inc(x_1117);
lean_dec(x_1115);
x_1118 = 8;
x_1119 = l_CakeML_ptree__Type(x_1118, x_1110);
if (lean_obj_tag(x_1119) == 0)
{
lean_object* x_1120; 
lean_dec(x_1117);
lean_dec(x_1111);
x_1120 = lean_box(0);
x_889 = x_1120;
goto block_896;
}
else
{
lean_object* x_1121; lean_object* x_1122; lean_object* x_1123; lean_object* x_1124; 
x_1121 = lean_ctor_get(x_1119, 0);
lean_inc(x_1121);
if (lean_is_exclusive(x_1119)) {
 lean_ctor_release(x_1119, 0);
 x_1122 = x_1119;
} else {
 lean_dec_ref(x_1119);
 x_1122 = lean_box(0);
}
if (lean_is_scalar(x_1111)) {
 x_1123 = lean_alloc_ctor(12, 2, 0);
} else {
 x_1123 = x_1111;
 lean_ctor_set_tag(x_1123, 12);
}
lean_ctor_set(x_1123, 0, x_1117);
lean_ctor_set(x_1123, 1, x_1121);
if (lean_is_scalar(x_1122)) {
 x_1124 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1124 = x_1122;
}
lean_ctor_set(x_1124, 0, x_1123);
x_889 = x_1124;
goto block_896;
}
}
}
}
else
{
lean_object* x_1125; 
lean_dec(x_1107);
lean_dec(x_1105);
lean_dec(x_1102);
lean_dec(x_886);
x_1125 = lean_box(0);
x_889 = x_1125;
goto block_896;
}
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1126; 
x_1126 = lean_box(0);
x_889 = x_1126;
goto block_896;
}
else
{
lean_object* x_1127; 
x_1127 = lean_ctor_get(x_886, 1);
lean_inc(x_1127);
if (lean_obj_tag(x_1127) == 0)
{
lean_object* x_1128; lean_object* x_1129; 
x_1128 = lean_ctor_get(x_886, 0);
lean_inc(x_1128);
lean_dec(x_886);
x_1129 = l_CakeML_ptree__Expr(x_919, x_1128);
x_889 = x_1129;
goto block_896;
}
else
{
lean_object* x_1130; 
x_1130 = lean_ctor_get(x_1127, 1);
lean_inc(x_1130);
if (lean_obj_tag(x_1130) == 0)
{
lean_object* x_1131; 
lean_dec(x_1127);
lean_dec(x_886);
x_1131 = lean_box(0);
x_889 = x_1131;
goto block_896;
}
else
{
lean_object* x_1132; 
x_1132 = lean_ctor_get(x_1130, 1);
lean_inc(x_1132);
if (lean_obj_tag(x_1132) == 0)
{
lean_object* x_1133; lean_object* x_1134; lean_object* x_1135; lean_object* x_1136; uint8_t x_1137; 
x_1133 = lean_ctor_get(x_886, 0);
lean_inc(x_1133);
lean_dec(x_886);
x_1134 = lean_ctor_get(x_1127, 0);
lean_inc(x_1134);
lean_dec(x_1127);
x_1135 = lean_ctor_get(x_1130, 0);
lean_inc(x_1135);
lean_dec(x_1130);
x_1136 = l_CakeML_ptree__Expr___closed__10;
x_1137 = l_CakeML_tokcheck(x_1134, x_1136);
if (x_1137 == 0)
{
lean_object* x_1138; 
lean_dec(x_1135);
lean_dec(x_1133);
x_1138 = lean_box(0);
x_889 = x_1138;
goto block_896;
}
else
{
lean_object* x_1139; 
x_1139 = l_CakeML_ptree__Expr(x_922, x_1133);
if (lean_obj_tag(x_1139) == 0)
{
lean_object* x_1140; 
lean_dec(x_1135);
x_1140 = lean_box(0);
x_889 = x_1140;
goto block_896;
}
else
{
lean_object* x_1141; lean_object* x_1142; 
x_1141 = lean_ctor_get(x_1139, 0);
lean_inc(x_1141);
lean_dec(x_1139);
x_1142 = l_CakeML_ptree__Expr(x_919, x_1135);
if (lean_obj_tag(x_1142) == 0)
{
lean_object* x_1143; 
lean_dec(x_1141);
x_1143 = lean_box(0);
x_889 = x_1143;
goto block_896;
}
else
{
lean_object* x_1144; lean_object* x_1145; lean_object* x_1146; lean_object* x_1147; lean_object* x_1148; 
x_1144 = lean_ctor_get(x_1142, 0);
lean_inc(x_1144);
if (lean_is_exclusive(x_1142)) {
 lean_ctor_release(x_1142, 0);
 x_1145 = x_1142;
} else {
 lean_dec_ref(x_1142);
 x_1145 = lean_box(0);
}
x_1146 = l_CakeML_ptree__Expr___closed__11;
x_1147 = l_CakeML_mk__binop(x_1146, x_1141, x_1144);
if (lean_is_scalar(x_1145)) {
 x_1148 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1148 = x_1145;
}
lean_ctor_set(x_1148, 0, x_1147);
x_889 = x_1148;
goto block_896;
}
}
}
}
else
{
lean_object* x_1149; 
lean_dec(x_1132);
lean_dec(x_1130);
lean_dec(x_1127);
lean_dec(x_886);
x_1149 = lean_box(0);
x_889 = x_1149;
goto block_896;
}
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1150; 
x_1150 = lean_box(0);
x_889 = x_1150;
goto block_896;
}
else
{
lean_object* x_1151; 
x_1151 = lean_ctor_get(x_886, 1);
lean_inc(x_1151);
if (lean_obj_tag(x_1151) == 0)
{
lean_object* x_1152; lean_object* x_1153; 
x_1152 = lean_ctor_get(x_886, 0);
lean_inc(x_1152);
lean_dec(x_886);
x_1153 = l_CakeML_ptree__Expr(x_916, x_1152);
x_889 = x_1153;
goto block_896;
}
else
{
lean_object* x_1154; 
x_1154 = lean_ctor_get(x_1151, 1);
lean_inc(x_1154);
if (lean_obj_tag(x_1154) == 0)
{
lean_object* x_1155; 
lean_dec(x_1151);
lean_dec(x_886);
x_1155 = lean_box(0);
x_889 = x_1155;
goto block_896;
}
else
{
lean_object* x_1156; 
x_1156 = lean_ctor_get(x_1154, 1);
lean_inc(x_1156);
if (lean_obj_tag(x_1156) == 0)
{
lean_object* x_1157; lean_object* x_1158; lean_object* x_1159; lean_object* x_1160; 
x_1157 = lean_ctor_get(x_886, 0);
lean_inc(x_1157);
lean_dec(x_886);
x_1158 = lean_ctor_get(x_1151, 0);
lean_inc(x_1158);
lean_dec(x_1151);
x_1159 = lean_ctor_get(x_1154, 0);
lean_inc(x_1159);
lean_dec(x_1154);
x_1160 = l_CakeML_ptree__Expr(x_919, x_1157);
if (lean_obj_tag(x_1160) == 0)
{
lean_object* x_1161; 
lean_dec(x_1159);
lean_dec(x_1158);
x_1161 = lean_box(0);
x_889 = x_1161;
goto block_896;
}
else
{
lean_object* x_1162; lean_object* x_1163; 
x_1162 = lean_ctor_get(x_1160, 0);
lean_inc(x_1162);
lean_dec(x_1160);
x_1163 = l_CakeML_ptree__Op(x_1158);
if (lean_obj_tag(x_1163) == 0)
{
lean_object* x_1164; 
lean_dec(x_1162);
lean_dec(x_1159);
x_1164 = lean_box(0);
x_889 = x_1164;
goto block_896;
}
else
{
lean_object* x_1165; lean_object* x_1166; 
x_1165 = lean_ctor_get(x_1163, 0);
lean_inc(x_1165);
lean_dec(x_1163);
x_1166 = l_CakeML_ptree__Expr(x_916, x_1159);
if (lean_obj_tag(x_1166) == 0)
{
lean_object* x_1167; 
lean_dec(x_1165);
lean_dec(x_1162);
x_1167 = lean_box(0);
x_889 = x_1167;
goto block_896;
}
else
{
lean_object* x_1168; lean_object* x_1169; lean_object* x_1170; lean_object* x_1171; 
x_1168 = lean_ctor_get(x_1166, 0);
lean_inc(x_1168);
if (lean_is_exclusive(x_1166)) {
 lean_ctor_release(x_1166, 0);
 x_1169 = x_1166;
} else {
 lean_dec_ref(x_1166);
 x_1169 = lean_box(0);
}
x_1170 = l_CakeML_mk__binop(x_1165, x_1162, x_1168);
if (lean_is_scalar(x_1169)) {
 x_1171 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1171 = x_1169;
}
lean_ctor_set(x_1171, 0, x_1170);
x_889 = x_1171;
goto block_896;
}
}
}
}
else
{
lean_object* x_1172; 
lean_dec(x_1156);
lean_dec(x_1154);
lean_dec(x_1151);
lean_dec(x_886);
x_1172 = lean_box(0);
x_889 = x_1172;
goto block_896;
}
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1173; 
x_1173 = lean_box(0);
x_889 = x_1173;
goto block_896;
}
else
{
lean_object* x_1174; 
x_1174 = lean_ctor_get(x_886, 1);
lean_inc(x_1174);
if (lean_obj_tag(x_1174) == 0)
{
lean_object* x_1175; lean_object* x_1176; 
x_1175 = lean_ctor_get(x_886, 0);
lean_inc(x_1175);
lean_dec(x_886);
x_1176 = l_CakeML_ptree__Expr(x_913, x_1175);
x_889 = x_1176;
goto block_896;
}
else
{
lean_object* x_1177; 
x_1177 = lean_ctor_get(x_1174, 1);
lean_inc(x_1177);
if (lean_obj_tag(x_1177) == 0)
{
lean_object* x_1178; 
lean_dec(x_1174);
lean_dec(x_886);
x_1178 = lean_box(0);
x_889 = x_1178;
goto block_896;
}
else
{
lean_object* x_1179; 
x_1179 = lean_ctor_get(x_1177, 1);
lean_inc(x_1179);
if (lean_obj_tag(x_1179) == 0)
{
lean_object* x_1180; lean_object* x_1181; lean_object* x_1182; lean_object* x_1183; 
x_1180 = lean_ctor_get(x_886, 0);
lean_inc(x_1180);
lean_dec(x_886);
x_1181 = lean_ctor_get(x_1174, 0);
lean_inc(x_1181);
lean_dec(x_1174);
x_1182 = lean_ctor_get(x_1177, 0);
lean_inc(x_1182);
lean_dec(x_1177);
x_1183 = l_CakeML_ptree__Expr(x_916, x_1180);
if (lean_obj_tag(x_1183) == 0)
{
lean_object* x_1184; 
lean_dec(x_1182);
lean_dec(x_1181);
x_1184 = lean_box(0);
x_889 = x_1184;
goto block_896;
}
else
{
lean_object* x_1185; lean_object* x_1186; 
x_1185 = lean_ctor_get(x_1183, 0);
lean_inc(x_1185);
lean_dec(x_1183);
x_1186 = l_CakeML_ptree__Op(x_1181);
if (lean_obj_tag(x_1186) == 0)
{
lean_object* x_1187; 
lean_dec(x_1185);
lean_dec(x_1182);
x_1187 = lean_box(0);
x_889 = x_1187;
goto block_896;
}
else
{
lean_object* x_1188; lean_object* x_1189; 
x_1188 = lean_ctor_get(x_1186, 0);
lean_inc(x_1188);
lean_dec(x_1186);
x_1189 = l_CakeML_ptree__Expr(x_913, x_1182);
if (lean_obj_tag(x_1189) == 0)
{
lean_object* x_1190; 
lean_dec(x_1188);
lean_dec(x_1185);
x_1190 = lean_box(0);
x_889 = x_1190;
goto block_896;
}
else
{
lean_object* x_1191; lean_object* x_1192; lean_object* x_1193; lean_object* x_1194; 
x_1191 = lean_ctor_get(x_1189, 0);
lean_inc(x_1191);
if (lean_is_exclusive(x_1189)) {
 lean_ctor_release(x_1189, 0);
 x_1192 = x_1189;
} else {
 lean_dec_ref(x_1189);
 x_1192 = lean_box(0);
}
x_1193 = l_CakeML_mk__binop(x_1188, x_1185, x_1191);
if (lean_is_scalar(x_1192)) {
 x_1194 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1194 = x_1192;
}
lean_ctor_set(x_1194, 0, x_1193);
x_889 = x_1194;
goto block_896;
}
}
}
}
else
{
lean_object* x_1195; 
lean_dec(x_1179);
lean_dec(x_1177);
lean_dec(x_1174);
lean_dec(x_886);
x_1195 = lean_box(0);
x_889 = x_1195;
goto block_896;
}
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1196; 
x_1196 = lean_box(0);
x_889 = x_1196;
goto block_896;
}
else
{
lean_object* x_1197; 
x_1197 = lean_ctor_get(x_886, 1);
lean_inc(x_1197);
if (lean_obj_tag(x_1197) == 0)
{
lean_object* x_1198; lean_object* x_1199; 
x_1198 = lean_ctor_get(x_886, 0);
lean_inc(x_1198);
lean_dec(x_886);
x_1199 = l_CakeML_ptree__Expr(x_910, x_1198);
x_889 = x_1199;
goto block_896;
}
else
{
lean_object* x_1200; 
x_1200 = lean_ctor_get(x_1197, 1);
lean_inc(x_1200);
if (lean_obj_tag(x_1200) == 0)
{
lean_object* x_1201; 
lean_dec(x_1197);
lean_dec(x_886);
x_1201 = lean_box(0);
x_889 = x_1201;
goto block_896;
}
else
{
lean_object* x_1202; 
x_1202 = lean_ctor_get(x_1200, 1);
lean_inc(x_1202);
if (lean_obj_tag(x_1202) == 0)
{
lean_object* x_1203; lean_object* x_1204; lean_object* x_1205; lean_object* x_1206; 
x_1203 = lean_ctor_get(x_886, 0);
lean_inc(x_1203);
lean_dec(x_886);
x_1204 = lean_ctor_get(x_1197, 0);
lean_inc(x_1204);
lean_dec(x_1197);
x_1205 = lean_ctor_get(x_1200, 0);
lean_inc(x_1205);
lean_dec(x_1200);
x_1206 = l_CakeML_ptree__Expr(x_910, x_1203);
if (lean_obj_tag(x_1206) == 0)
{
lean_object* x_1207; 
lean_dec(x_1205);
lean_dec(x_1204);
x_1207 = lean_box(0);
x_889 = x_1207;
goto block_896;
}
else
{
lean_object* x_1208; lean_object* x_1209; 
x_1208 = lean_ctor_get(x_1206, 0);
lean_inc(x_1208);
lean_dec(x_1206);
x_1209 = l_CakeML_ptree__Op(x_1204);
if (lean_obj_tag(x_1209) == 0)
{
lean_object* x_1210; 
lean_dec(x_1208);
lean_dec(x_1205);
x_1210 = lean_box(0);
x_889 = x_1210;
goto block_896;
}
else
{
lean_object* x_1211; lean_object* x_1212; 
x_1211 = lean_ctor_get(x_1209, 0);
lean_inc(x_1211);
lean_dec(x_1209);
x_1212 = l_CakeML_ptree__Expr(x_913, x_1205);
if (lean_obj_tag(x_1212) == 0)
{
lean_object* x_1213; 
lean_dec(x_1211);
lean_dec(x_1208);
x_1213 = lean_box(0);
x_889 = x_1213;
goto block_896;
}
else
{
lean_object* x_1214; lean_object* x_1215; lean_object* x_1216; lean_object* x_1217; 
x_1214 = lean_ctor_get(x_1212, 0);
lean_inc(x_1214);
if (lean_is_exclusive(x_1212)) {
 lean_ctor_release(x_1212, 0);
 x_1215 = x_1212;
} else {
 lean_dec_ref(x_1212);
 x_1215 = lean_box(0);
}
x_1216 = l_CakeML_mk__binop(x_1211, x_1208, x_1214);
if (lean_is_scalar(x_1215)) {
 x_1217 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1217 = x_1215;
}
lean_ctor_set(x_1217, 0, x_1216);
x_889 = x_1217;
goto block_896;
}
}
}
}
else
{
lean_object* x_1218; 
lean_dec(x_1202);
lean_dec(x_1200);
lean_dec(x_1197);
lean_dec(x_886);
x_1218 = lean_box(0);
x_889 = x_1218;
goto block_896;
}
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1219; 
x_1219 = lean_box(0);
x_889 = x_1219;
goto block_896;
}
else
{
lean_object* x_1220; 
x_1220 = lean_ctor_get(x_886, 1);
lean_inc(x_1220);
if (lean_obj_tag(x_1220) == 0)
{
lean_object* x_1221; lean_object* x_1222; 
x_1221 = lean_ctor_get(x_886, 0);
lean_inc(x_1221);
lean_dec(x_886);
x_1222 = l_CakeML_ptree__Expr(x_907, x_1221);
x_889 = x_1222;
goto block_896;
}
else
{
lean_object* x_1223; 
x_1223 = lean_ctor_get(x_1220, 1);
lean_inc(x_1223);
if (lean_obj_tag(x_1223) == 0)
{
lean_object* x_1224; 
lean_dec(x_1220);
lean_dec(x_886);
x_1224 = lean_box(0);
x_889 = x_1224;
goto block_896;
}
else
{
lean_object* x_1225; 
x_1225 = lean_ctor_get(x_1223, 1);
lean_inc(x_1225);
if (lean_obj_tag(x_1225) == 0)
{
lean_object* x_1226; lean_object* x_1227; lean_object* x_1228; lean_object* x_1229; 
x_1226 = lean_ctor_get(x_886, 0);
lean_inc(x_1226);
lean_dec(x_886);
x_1227 = lean_ctor_get(x_1220, 0);
lean_inc(x_1227);
lean_dec(x_1220);
x_1228 = lean_ctor_get(x_1223, 0);
lean_inc(x_1228);
lean_dec(x_1223);
x_1229 = l_CakeML_ptree__Expr(x_910, x_1226);
if (lean_obj_tag(x_1229) == 0)
{
lean_object* x_1230; 
lean_dec(x_1228);
lean_dec(x_1227);
x_1230 = lean_box(0);
x_889 = x_1230;
goto block_896;
}
else
{
lean_object* x_1231; lean_object* x_1232; 
x_1231 = lean_ctor_get(x_1229, 0);
lean_inc(x_1231);
lean_dec(x_1229);
x_1232 = l_CakeML_ptree__Op(x_1227);
if (lean_obj_tag(x_1232) == 0)
{
lean_object* x_1233; 
lean_dec(x_1231);
lean_dec(x_1228);
x_1233 = lean_box(0);
x_889 = x_1233;
goto block_896;
}
else
{
lean_object* x_1234; lean_object* x_1235; 
x_1234 = lean_ctor_get(x_1232, 0);
lean_inc(x_1234);
lean_dec(x_1232);
x_1235 = l_CakeML_ptree__Expr(x_907, x_1228);
if (lean_obj_tag(x_1235) == 0)
{
lean_object* x_1236; 
lean_dec(x_1234);
lean_dec(x_1231);
x_1236 = lean_box(0);
x_889 = x_1236;
goto block_896;
}
else
{
lean_object* x_1237; lean_object* x_1238; lean_object* x_1239; lean_object* x_1240; 
x_1237 = lean_ctor_get(x_1235, 0);
lean_inc(x_1237);
if (lean_is_exclusive(x_1235)) {
 lean_ctor_release(x_1235, 0);
 x_1238 = x_1235;
} else {
 lean_dec_ref(x_1235);
 x_1238 = lean_box(0);
}
x_1239 = l_CakeML_mk__binop(x_1234, x_1231, x_1237);
if (lean_is_scalar(x_1238)) {
 x_1240 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1240 = x_1238;
}
lean_ctor_set(x_1240, 0, x_1239);
x_889 = x_1240;
goto block_896;
}
}
}
}
else
{
lean_object* x_1241; 
lean_dec(x_1225);
lean_dec(x_1223);
lean_dec(x_1220);
lean_dec(x_886);
x_1241 = lean_box(0);
x_889 = x_1241;
goto block_896;
}
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1242; 
x_1242 = lean_box(0);
x_889 = x_1242;
goto block_896;
}
else
{
lean_object* x_1243; 
x_1243 = lean_ctor_get(x_886, 1);
lean_inc(x_1243);
if (lean_obj_tag(x_1243) == 0)
{
lean_object* x_1244; lean_object* x_1245; 
x_1244 = lean_ctor_get(x_886, 0);
lean_inc(x_1244);
lean_dec(x_886);
x_1245 = l_CakeML_ptree__Expr(x_901, x_1244);
x_889 = x_1245;
goto block_896;
}
else
{
lean_object* x_1246; 
x_1246 = lean_ctor_get(x_1243, 1);
lean_inc(x_1246);
if (lean_obj_tag(x_1246) == 0)
{
lean_object* x_1247; 
lean_dec(x_1243);
lean_dec(x_886);
x_1247 = lean_box(0);
x_889 = x_1247;
goto block_896;
}
else
{
lean_object* x_1248; 
x_1248 = lean_ctor_get(x_1246, 1);
lean_inc(x_1248);
if (lean_obj_tag(x_1248) == 0)
{
lean_object* x_1249; lean_object* x_1250; lean_object* x_1251; lean_object* x_1252; 
x_1249 = lean_ctor_get(x_886, 0);
lean_inc(x_1249);
lean_dec(x_886);
x_1250 = lean_ctor_get(x_1243, 0);
lean_inc(x_1250);
lean_dec(x_1243);
x_1251 = lean_ctor_get(x_1246, 0);
lean_inc(x_1251);
lean_dec(x_1246);
x_1252 = l_CakeML_ptree__Expr(x_907, x_1249);
if (lean_obj_tag(x_1252) == 0)
{
lean_object* x_1253; 
lean_dec(x_1251);
lean_dec(x_1250);
x_1253 = lean_box(0);
x_889 = x_1253;
goto block_896;
}
else
{
lean_object* x_1254; lean_object* x_1255; 
x_1254 = lean_ctor_get(x_1252, 0);
lean_inc(x_1254);
lean_dec(x_1252);
x_1255 = l_CakeML_ptree__Op(x_1250);
if (lean_obj_tag(x_1255) == 0)
{
lean_object* x_1256; 
lean_dec(x_1254);
lean_dec(x_1251);
x_1256 = lean_box(0);
x_889 = x_1256;
goto block_896;
}
else
{
lean_object* x_1257; lean_object* x_1258; 
x_1257 = lean_ctor_get(x_1255, 0);
lean_inc(x_1257);
lean_dec(x_1255);
x_1258 = l_CakeML_ptree__Expr(x_901, x_1251);
if (lean_obj_tag(x_1258) == 0)
{
lean_object* x_1259; 
lean_dec(x_1257);
lean_dec(x_1254);
x_1259 = lean_box(0);
x_889 = x_1259;
goto block_896;
}
else
{
lean_object* x_1260; lean_object* x_1261; lean_object* x_1262; lean_object* x_1263; 
x_1260 = lean_ctor_get(x_1258, 0);
lean_inc(x_1260);
if (lean_is_exclusive(x_1258)) {
 lean_ctor_release(x_1258, 0);
 x_1261 = x_1258;
} else {
 lean_dec_ref(x_1258);
 x_1261 = lean_box(0);
}
x_1262 = l_CakeML_mk__binop(x_1257, x_1254, x_1260);
if (lean_is_scalar(x_1261)) {
 x_1263 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1263 = x_1261;
}
lean_ctor_set(x_1263, 0, x_1262);
x_889 = x_1263;
goto block_896;
}
}
}
}
else
{
lean_object* x_1264; 
lean_dec(x_1248);
lean_dec(x_1246);
lean_dec(x_1243);
lean_dec(x_886);
x_1264 = lean_box(0);
x_889 = x_1264;
goto block_896;
}
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1265; 
x_1265 = lean_box(0);
x_889 = x_1265;
goto block_896;
}
else
{
lean_object* x_1266; 
x_1266 = lean_ctor_get(x_886, 1);
lean_inc(x_1266);
if (lean_obj_tag(x_1266) == 0)
{
lean_object* x_1267; 
lean_dec(x_886);
x_1267 = lean_box(0);
x_889 = x_1267;
goto block_896;
}
else
{
lean_object* x_1268; 
x_1268 = lean_ctor_get(x_1266, 1);
lean_inc(x_1268);
if (lean_obj_tag(x_1268) == 0)
{
lean_object* x_1269; 
lean_dec(x_1266);
lean_dec(x_886);
x_1269 = lean_box(0);
x_889 = x_1269;
goto block_896;
}
else
{
lean_object* x_1270; 
x_1270 = lean_ctor_get(x_1268, 1);
lean_inc(x_1270);
if (lean_obj_tag(x_1270) == 0)
{
lean_object* x_1271; lean_object* x_1272; lean_object* x_1273; lean_object* x_1274; lean_object* x_1275; lean_object* x_1276; lean_object* x_1277; lean_object* x_1278; lean_object* x_1279; uint8_t x_1280; 
x_1271 = lean_ctor_get(x_886, 0);
lean_inc(x_1271);
lean_dec(x_886);
x_1272 = lean_ctor_get(x_1266, 0);
lean_inc(x_1272);
if (lean_is_exclusive(x_1266)) {
 lean_ctor_release(x_1266, 0);
 lean_ctor_release(x_1266, 1);
 x_1273 = x_1266;
} else {
 lean_dec_ref(x_1266);
 x_1273 = lean_box(0);
}
x_1274 = lean_ctor_get(x_1268, 0);
lean_inc(x_1274);
if (lean_is_exclusive(x_1268)) {
 lean_ctor_release(x_1268, 0);
 lean_ctor_release(x_1268, 1);
 x_1275 = x_1268;
} else {
 lean_dec_ref(x_1268);
 x_1275 = lean_box(0);
}
x_1276 = lean_box(0);
if (lean_is_scalar(x_1275)) {
 x_1277 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1277 = x_1275;
}
lean_ctor_set(x_1277, 0, x_1274);
lean_ctor_set(x_1277, 1, x_1276);
if (lean_is_scalar(x_1273)) {
 x_1278 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1278 = x_1273;
}
lean_ctor_set(x_1278, 0, x_1271);
lean_ctor_set(x_1278, 1, x_1277);
x_1279 = l_CakeML_ptree__Pattern___closed__2;
x_1280 = l_CakeML_tokcheckl(x_1278, x_1279);
if (x_1280 == 0)
{
lean_object* x_1281; 
lean_dec(x_1272);
x_1281 = lean_box(0);
x_889 = x_1281;
goto block_896;
}
else
{
lean_object* x_1282; 
x_1282 = l_CakeML_ptree__Exprlist___rarg(x_1272);
if (lean_obj_tag(x_1282) == 0)
{
lean_object* x_1283; 
x_1283 = lean_box(0);
x_889 = x_1283;
goto block_896;
}
else
{
lean_object* x_1284; lean_object* x_1285; lean_object* x_1286; lean_object* x_1287; lean_object* x_1288; 
x_1284 = lean_ctor_get(x_1282, 0);
lean_inc(x_1284);
if (lean_is_exclusive(x_1282)) {
 lean_ctor_release(x_1282, 0);
 x_1285 = x_1282;
} else {
 lean_dec_ref(x_1282);
 x_1285 = lean_box(0);
}
x_1286 = lean_box(0);
x_1287 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_1287, 0, x_1286);
lean_ctor_set(x_1287, 1, x_1284);
if (lean_is_scalar(x_1285)) {
 x_1288 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1288 = x_1285;
}
lean_ctor_set(x_1288, 0, x_1287);
x_889 = x_1288;
goto block_896;
}
}
}
else
{
lean_object* x_1289; 
lean_dec(x_1270);
lean_dec(x_1268);
lean_dec(x_1266);
lean_dec(x_886);
x_1289 = lean_box(0);
x_889 = x_1289;
goto block_896;
}
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1290; 
x_1290 = lean_box(0);
x_889 = x_1290;
goto block_896;
}
else
{
lean_object* x_1291; 
x_1291 = lean_ctor_get(x_886, 1);
lean_inc(x_1291);
if (lean_obj_tag(x_1291) == 0)
{
lean_object* x_1292; lean_object* x_1293; 
x_1292 = lean_ctor_get(x_886, 0);
lean_inc(x_1292);
lean_dec(x_886);
x_1293 = l_CakeML_ptree__Expr(x_898, x_1292);
x_889 = x_1293;
goto block_896;
}
else
{
lean_object* x_1294; 
x_1294 = lean_ctor_get(x_1291, 1);
lean_inc(x_1294);
if (lean_obj_tag(x_1294) == 0)
{
lean_object* x_1295; lean_object* x_1296; lean_object* x_1297; 
x_1295 = lean_ctor_get(x_886, 0);
lean_inc(x_1295);
lean_dec(x_886);
x_1296 = lean_ctor_get(x_1291, 0);
lean_inc(x_1296);
lean_dec(x_1291);
x_1297 = l_CakeML_ptree__Expr(x_901, x_1295);
if (lean_obj_tag(x_1297) == 0)
{
lean_object* x_1298; 
lean_dec(x_1296);
x_1298 = lean_box(0);
x_889 = x_1298;
goto block_896;
}
else
{
lean_object* x_1299; lean_object* x_1300; 
x_1299 = lean_ctor_get(x_1297, 0);
lean_inc(x_1299);
lean_dec(x_1297);
x_1300 = l_CakeML_ptree__Expr(x_898, x_1296);
if (lean_obj_tag(x_1300) == 0)
{
lean_object* x_1301; 
lean_dec(x_1299);
x_1301 = lean_box(0);
x_889 = x_1301;
goto block_896;
}
else
{
lean_object* x_1302; lean_object* x_1303; lean_object* x_1304; lean_object* x_1305; 
x_1302 = lean_ctor_get(x_1300, 0);
lean_inc(x_1302);
if (lean_is_exclusive(x_1300)) {
 lean_ctor_release(x_1300, 0);
 x_1303 = x_1300;
} else {
 lean_dec_ref(x_1300);
 x_1303 = lean_box(0);
}
x_1304 = l_CakeML_mkAst__App(x_1299, x_1302);
if (lean_is_scalar(x_1303)) {
 x_1305 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1305 = x_1303;
}
lean_ctor_set(x_1305, 0, x_1304);
x_889 = x_1305;
goto block_896;
}
}
}
else
{
lean_object* x_1306; 
lean_dec(x_1294);
lean_dec(x_1291);
lean_dec(x_886);
x_1306 = lean_box(0);
x_889 = x_1306;
goto block_896;
}
}
}
}
}
else
{
lean_dec(x_885);
if (lean_obj_tag(x_886) == 0)
{
lean_object* x_1307; 
x_1307 = lean_box(0);
x_889 = x_1307;
goto block_896;
}
else
{
lean_object* x_1308; 
x_1308 = lean_ctor_get(x_886, 1);
lean_inc(x_1308);
if (lean_obj_tag(x_1308) == 0)
{
lean_object* x_1309; lean_object* x_1310; 
x_1309 = lean_ctor_get(x_886, 0);
lean_inc(x_1309);
lean_dec(x_886);
lean_inc(x_1309);
x_1310 = l_CakeML_ptree__Eliteral(x_1309);
if (lean_obj_tag(x_1310) == 0)
{
lean_object* x_1311; 
lean_inc(x_1309);
x_1311 = l_CakeML_ptree__FQV(x_1309);
if (lean_obj_tag(x_1311) == 0)
{
lean_object* x_1312; 
lean_inc(x_1309);
x_1312 = l_CakeML_ptree__ConstructorName(x_1309);
if (lean_obj_tag(x_1312) == 0)
{
uint8_t x_1313; lean_object* x_1314; 
x_1313 = 27;
x_1314 = l_CakeML_ptree__Expr(x_1313, x_1309);
x_889 = x_1314;
goto block_896;
}
else
{
lean_object* x_1315; lean_object* x_1316; lean_object* x_1317; lean_object* x_1318; lean_object* x_1319; lean_object* x_1320; 
lean_dec(x_1309);
x_1315 = lean_ctor_get(x_1312, 0);
lean_inc(x_1315);
if (lean_is_exclusive(x_1312)) {
 lean_ctor_release(x_1312, 0);
 x_1316 = x_1312;
} else {
 lean_dec_ref(x_1312);
 x_1316 = lean_box(0);
}
if (lean_is_scalar(x_1316)) {
 x_1317 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1317 = x_1316;
}
lean_ctor_set(x_1317, 0, x_1315);
x_1318 = lean_box(0);
x_1319 = lean_alloc_ctor(3, 2, 0);
lean_ctor_set(x_1319, 0, x_1317);
lean_ctor_set(x_1319, 1, x_1318);
x_1320 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_1320, 0, x_1319);
x_889 = x_1320;
goto block_896;
}
}
else
{
lean_object* x_1321; lean_object* x_1322; lean_object* x_1323; lean_object* x_1324; 
lean_dec(x_1309);
x_1321 = lean_ctor_get(x_1311, 0);
lean_inc(x_1321);
if (lean_is_exclusive(x_1311)) {
 lean_ctor_release(x_1311, 0);
 x_1322 = x_1311;
} else {
 lean_dec_ref(x_1311);
 x_1322 = lean_box(0);
}
x_1323 = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(x_1323, 0, x_1321);
if (lean_is_scalar(x_1322)) {
 x_1324 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1324 = x_1322;
}
lean_ctor_set(x_1324, 0, x_1323);
x_889 = x_1324;
goto block_896;
}
}
else
{
lean_object* x_1325; lean_object* x_1326; lean_object* x_1327; 
lean_dec(x_1309);
x_1325 = lean_ctor_get(x_1310, 0);
lean_inc(x_1325);
if (lean_is_exclusive(x_1310)) {
 lean_ctor_release(x_1310, 0);
 x_1326 = x_1310;
} else {
 lean_dec_ref(x_1310);
 x_1326 = lean_box(0);
}
if (lean_is_scalar(x_1326)) {
 x_1327 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1327 = x_1326;
}
lean_ctor_set(x_1327, 0, x_1325);
x_889 = x_1327;
goto block_896;
}
}
else
{
lean_object* x_1328; 
x_1328 = lean_ctor_get(x_1308, 1);
lean_inc(x_1328);
if (lean_obj_tag(x_1328) == 0)
{
lean_object* x_1329; lean_object* x_1330; lean_object* x_1331; lean_object* x_1332; lean_object* x_1333; lean_object* x_1334; lean_object* x_1335; lean_object* x_1336; uint8_t x_1337; 
x_1329 = lean_ctor_get(x_886, 0);
lean_inc(x_1329);
if (lean_is_exclusive(x_886)) {
 lean_ctor_release(x_886, 0);
 lean_ctor_release(x_886, 1);
 x_1330 = x_886;
} else {
 lean_dec_ref(x_886);
 x_1330 = lean_box(0);
}
x_1331 = lean_ctor_get(x_1308, 0);
lean_inc(x_1331);
if (lean_is_exclusive(x_1308)) {
 lean_ctor_release(x_1308, 0);
 lean_ctor_release(x_1308, 1);
 x_1332 = x_1308;
} else {
 lean_dec_ref(x_1308);
 x_1332 = lean_box(0);
}
x_1333 = lean_box(0);
lean_inc(x_1331);
if (lean_is_scalar(x_1332)) {
 x_1334 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1334 = x_1332;
}
lean_ctor_set(x_1334, 0, x_1331);
lean_ctor_set(x_1334, 1, x_1333);
lean_inc(x_1329);
if (lean_is_scalar(x_1330)) {
 x_1335 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1335 = x_1330;
}
lean_ctor_set(x_1335, 0, x_1329);
lean_ctor_set(x_1335, 1, x_1334);
x_1336 = l_CakeML_ptree__Pattern___closed__2;
lean_inc(x_1335);
x_1337 = l_CakeML_tokcheckl(x_1335, x_1336);
if (x_1337 == 0)
{
lean_object* x_1338; uint8_t x_1339; 
x_1338 = l_CakeML_ptree__Pattern___closed__8;
x_1339 = l_CakeML_tokcheckl(x_1335, x_1338);
if (x_1339 == 0)
{
lean_object* x_1340; uint8_t x_1341; 
x_1340 = lean_box(39);
x_1341 = l_CakeML_tokcheck(x_1329, x_1340);
if (x_1341 == 0)
{
lean_object* x_1342; 
lean_dec(x_1331);
x_1342 = lean_box(0);
x_889 = x_1342;
goto block_896;
}
else
{
lean_object* x_1343; 
x_1343 = l_CakeML_ptree__OpID(x_1331);
x_889 = x_1343;
goto block_896;
}
}
else
{
lean_object* x_1344; 
lean_dec(x_1331);
lean_dec(x_1329);
x_1344 = l_CakeML_ptree__Expr___closed__13;
x_889 = x_1344;
goto block_896;
}
}
else
{
lean_object* x_1345; 
lean_dec(x_1335);
lean_dec(x_1331);
lean_dec(x_1329);
x_1345 = l_CakeML_ptree__Expr___closed__15;
x_889 = x_1345;
goto block_896;
}
}
else
{
lean_object* x_1346; 
x_1346 = lean_ctor_get(x_1328, 1);
lean_inc(x_1346);
if (lean_obj_tag(x_1346) == 0)
{
lean_object* x_1347; lean_object* x_1348; lean_object* x_1349; lean_object* x_1350; lean_object* x_1351; lean_object* x_1352; uint8_t x_1353; 
x_1347 = lean_ctor_get(x_886, 0);
lean_inc(x_1347);
lean_dec(x_886);
x_1348 = lean_ctor_get(x_1308, 0);
lean_inc(x_1348);
if (lean_is_exclusive(x_1308)) {
 lean_ctor_release(x_1308, 0);
 lean_ctor_release(x_1308, 1);
 x_1349 = x_1308;
} else {
 lean_dec_ref(x_1308);
 x_1349 = lean_box(0);
}
x_1350 = lean_ctor_get(x_1328, 0);
lean_inc(x_1350);
if (lean_is_exclusive(x_1328)) {
 lean_ctor_release(x_1328, 0);
 lean_ctor_release(x_1328, 1);
 x_1351 = x_1328;
} else {
 lean_dec_ref(x_1328);
 x_1351 = lean_box(0);
}
x_1352 = lean_box(4);
lean_inc(x_1347);
x_1353 = l_CakeML_tokcheck(x_1347, x_1352);
if (x_1353 == 0)
{
lean_object* x_1354; lean_object* x_1355; lean_object* x_1356; lean_object* x_1357; uint8_t x_1358; 
x_1354 = lean_box(0);
if (lean_is_scalar(x_1351)) {
 x_1355 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1355 = x_1351;
}
lean_ctor_set(x_1355, 0, x_1350);
lean_ctor_set(x_1355, 1, x_1354);
if (lean_is_scalar(x_1349)) {
 x_1356 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1356 = x_1349;
}
lean_ctor_set(x_1356, 0, x_1347);
lean_ctor_set(x_1356, 1, x_1355);
x_1357 = l_CakeML_ptree__Pattern___closed__8;
x_1358 = l_CakeML_tokcheckl(x_1356, x_1357);
if (x_1358 == 0)
{
lean_object* x_1359; 
lean_dec(x_1348);
x_1359 = lean_box(0);
x_889 = x_1359;
goto block_896;
}
else
{
lean_object* x_1360; 
x_1360 = l_CakeML_ptree__Exprlist___rarg(x_1348);
if (lean_obj_tag(x_1360) == 0)
{
lean_object* x_1361; 
x_1361 = lean_box(0);
x_889 = x_1361;
goto block_896;
}
else
{
lean_object* x_1362; lean_object* x_1363; lean_object* x_1364; lean_object* x_1365; lean_object* x_1366; 
x_1362 = lean_ctor_get(x_1360, 0);
lean_inc(x_1362);
if (lean_is_exclusive(x_1360)) {
 lean_ctor_release(x_1360, 0);
 x_1363 = x_1360;
} else {
 lean_dec_ref(x_1360);
 x_1363 = lean_box(0);
}
x_1364 = l_CakeML_ptree__Expr___closed__12;
x_1365 = l_List_foldrTR___at_CakeML_ptree__Expr___spec__1(x_1364, x_1362);
if (lean_is_scalar(x_1363)) {
 x_1366 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1366 = x_1363;
}
lean_ctor_set(x_1366, 0, x_1365);
x_889 = x_1366;
goto block_896;
}
}
}
else
{
lean_object* x_1367; uint8_t x_1368; 
lean_dec(x_1351);
lean_dec(x_1349);
lean_dec(x_1347);
x_1367 = lean_box(5);
x_1368 = l_CakeML_tokcheck(x_1350, x_1367);
if (x_1368 == 0)
{
lean_object* x_1369; 
lean_dec(x_1348);
x_1369 = lean_box(0);
x_889 = x_1369;
goto block_896;
}
else
{
lean_object* x_1370; 
x_1370 = l_CakeML_ptree__Eseq(x_1348);
if (lean_obj_tag(x_1370) == 0)
{
lean_object* x_1371; 
x_1371 = lean_box(0);
x_889 = x_1371;
goto block_896;
}
else
{
lean_object* x_1372; lean_object* x_1373; 
x_1372 = lean_ctor_get(x_1370, 0);
lean_inc(x_1372);
lean_dec(x_1370);
x_1373 = l_CakeML_Eseq__encode(x_1372);
lean_dec(x_1372);
x_889 = x_1373;
goto block_896;
}
}
}
}
else
{
lean_object* x_1374; 
x_1374 = lean_ctor_get(x_1346, 1);
lean_inc(x_1374);
if (lean_obj_tag(x_1374) == 0)
{
lean_object* x_1375; 
lean_dec(x_1346);
lean_dec(x_1328);
lean_dec(x_1308);
lean_dec(x_886);
x_1375 = lean_box(0);
x_889 = x_1375;
goto block_896;
}
else
{
lean_object* x_1376; 
x_1376 = lean_ctor_get(x_1374, 1);
lean_inc(x_1376);
if (lean_obj_tag(x_1376) == 0)
{
lean_object* x_1377; lean_object* x_1378; lean_object* x_1379; lean_object* x_1380; lean_object* x_1381; lean_object* x_1382; lean_object* x_1383; lean_object* x_1384; lean_object* x_1385; lean_object* x_1386; lean_object* x_1387; lean_object* x_1388; lean_object* x_1389; uint8_t x_1390; 
x_1377 = lean_ctor_get(x_886, 0);
lean_inc(x_1377);
lean_dec(x_886);
x_1378 = lean_ctor_get(x_1308, 0);
lean_inc(x_1378);
lean_dec(x_1308);
x_1379 = lean_ctor_get(x_1328, 0);
lean_inc(x_1379);
if (lean_is_exclusive(x_1328)) {
 lean_ctor_release(x_1328, 0);
 lean_ctor_release(x_1328, 1);
 x_1380 = x_1328;
} else {
 lean_dec_ref(x_1328);
 x_1380 = lean_box(0);
}
x_1381 = lean_ctor_get(x_1346, 0);
lean_inc(x_1381);
if (lean_is_exclusive(x_1346)) {
 lean_ctor_release(x_1346, 0);
 lean_ctor_release(x_1346, 1);
 x_1382 = x_1346;
} else {
 lean_dec_ref(x_1346);
 x_1382 = lean_box(0);
}
x_1383 = lean_ctor_get(x_1374, 0);
lean_inc(x_1383);
if (lean_is_exclusive(x_1374)) {
 lean_ctor_release(x_1374, 0);
 lean_ctor_release(x_1374, 1);
 x_1384 = x_1374;
} else {
 lean_dec_ref(x_1374);
 x_1384 = lean_box(0);
}
x_1385 = lean_box(0);
if (lean_is_scalar(x_1384)) {
 x_1386 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1386 = x_1384;
}
lean_ctor_set(x_1386, 0, x_1383);
lean_ctor_set(x_1386, 1, x_1385);
if (lean_is_scalar(x_1382)) {
 x_1387 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1387 = x_1382;
}
lean_ctor_set(x_1387, 0, x_1379);
lean_ctor_set(x_1387, 1, x_1386);
if (lean_is_scalar(x_1380)) {
 x_1388 = lean_alloc_ctor(1, 2, 0);
} else {
 x_1388 = x_1380;
}
lean_ctor_set(x_1388, 0, x_1377);
lean_ctor_set(x_1388, 1, x_1387);
x_1389 = l_CakeML_ptree__Expr___closed__18;
x_1390 = l_CakeML_tokcheckl(x_1388, x_1389);
if (x_1390 == 0)
{
lean_object* x_1391; 
lean_dec(x_1381);
lean_dec(x_1378);
x_1391 = lean_box(0);
x_889 = x_1391;
goto block_896;
}
else
{
lean_object* x_1392; 
x_1392 = l_CakeML_ptree__LetDecs(x_1378);
if (lean_obj_tag(x_1392) == 0)
{
lean_object* x_1393; 
lean_dec(x_1381);
x_1393 = lean_box(0);
x_889 = x_1393;
goto block_896;
}
else
{
lean_object* x_1394; lean_object* x_1395; 
x_1394 = lean_ctor_get(x_1392, 0);
lean_inc(x_1394);
lean_dec(x_1392);
x_1395 = l_CakeML_ptree__Eseq(x_1381);
if (lean_obj_tag(x_1395) == 0)
{
lean_object* x_1396; 
lean_dec(x_1394);
x_1396 = lean_box(0);
x_889 = x_1396;
goto block_896;
}
else
{
lean_object* x_1397; lean_object* x_1398; 
x_1397 = lean_ctor_get(x_1395, 0);
lean_inc(x_1397);
lean_dec(x_1395);
x_1398 = l_CakeML_Eseq__encode(x_1397);
lean_dec(x_1397);
if (lean_obj_tag(x_1398) == 0)
{
lean_object* x_1399; 
lean_dec(x_1394);
x_1399 = lean_box(0);
x_889 = x_1399;
goto block_896;
}
else
{
lean_object* x_1400; lean_object* x_1401; lean_object* x_1402; lean_object* x_1403; 
x_1400 = lean_ctor_get(x_1398, 0);
lean_inc(x_1400);
if (lean_is_exclusive(x_1398)) {
 lean_ctor_release(x_1398, 0);
 x_1401 = x_1398;
} else {
 lean_dec_ref(x_1398);
 x_1401 = lean_box(0);
}
x_1402 = l_List_foldrTR___at_CakeML_ptree__Expr___spec__3(x_1400, x_1394);
if (lean_is_scalar(x_1401)) {
 x_1403 = lean_alloc_ctor(1, 1, 0);
} else {
 x_1403 = x_1401;
}
lean_ctor_set(x_1403, 0, x_1402);
x_889 = x_1403;
goto block_896;
}
}
}
}
}
else
{
lean_object* x_1404; 
lean_dec(x_1376);
lean_dec(x_1374);
lean_dec(x_1346);
lean_dec(x_1328);
lean_dec(x_1308);
lean_dec(x_886);
x_1404 = lean_box(0);
x_889 = x_1404;
goto block_896;
}
}
}
}
}
}
}
}
block_896:
{
if (lean_obj_tag(x_889) == 0)
{
lean_object* x_890; 
x_890 = lean_box(0);
return x_890;
}
else
{
lean_object* x_891; lean_object* x_892; lean_object* x_893; lean_object* x_894; lean_object* x_895; 
x_891 = lean_ctor_get(x_889, 0);
lean_inc(x_891);
if (lean_is_exclusive(x_889)) {
 lean_ctor_release(x_889, 0);
 x_892 = x_889;
} else {
 lean_dec_ref(x_889);
 x_892 = lean_box(0);
}
x_893 = l_CakeML_unknown__loc;
x_894 = l_CakeML_bind__loc(x_891, x_893);
if (lean_is_scalar(x_892)) {
 x_895 = lean_alloc_ctor(1, 1, 0);
} else {
 x_895 = x_892;
}
lean_ctor_set(x_895, 0, x_894);
return x_895;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__PEs(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 62;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
lean_dec(x_10);
lean_dec(x_4);
x_13 = lean_box(0);
return x_13;
}
else
{
lean_object* x_14; 
x_14 = lean_ctor_get(x_12, 1);
lean_inc(x_14);
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_15; lean_object* x_16; uint8_t x_17; 
x_15 = lean_ctor_get(x_4, 0);
lean_inc(x_15);
lean_dec(x_4);
x_16 = lean_ctor_get(x_10, 0);
lean_inc(x_16);
lean_dec(x_10);
x_17 = !lean_is_exclusive(x_12);
if (x_17 == 0)
{
lean_object* x_18; lean_object* x_19; lean_object* x_20; uint8_t x_21; 
x_18 = lean_ctor_get(x_12, 0);
x_19 = lean_ctor_get(x_12, 1);
lean_dec(x_19);
x_20 = lean_box(14);
x_21 = l_CakeML_tokcheck(x_16, x_20);
if (x_21 == 0)
{
lean_object* x_22; 
lean_free_object(x_12);
lean_dec(x_18);
lean_dec(x_15);
x_22 = lean_box(0);
return x_22;
}
else
{
uint8_t x_23; lean_object* x_24; 
x_23 = 56;
x_24 = l_CakeML_ptree__Pattern(x_23, x_15);
if (lean_obj_tag(x_24) == 0)
{
lean_object* x_25; 
lean_free_object(x_12);
lean_dec(x_18);
x_25 = lean_box(0);
return x_25;
}
else
{
lean_object* x_26; lean_object* x_27; 
x_26 = lean_ctor_get(x_24, 0);
lean_inc(x_26);
lean_dec(x_24);
x_27 = l_CakeML_ptree__PE(x_18);
if (lean_obj_tag(x_27) == 0)
{
lean_object* x_28; 
lean_dec(x_26);
lean_free_object(x_12);
x_28 = lean_box(0);
return x_28;
}
else
{
uint8_t x_29; 
x_29 = !lean_is_exclusive(x_27);
if (x_29 == 0)
{
lean_object* x_30; uint8_t x_31; 
x_30 = lean_ctor_get(x_27, 0);
x_31 = !lean_is_exclusive(x_30);
if (x_31 == 0)
{
lean_object* x_32; lean_object* x_33; 
x_32 = lean_ctor_get(x_30, 0);
x_33 = lean_ctor_get(x_30, 1);
lean_ctor_set(x_30, 1, x_32);
lean_ctor_set(x_30, 0, x_26);
lean_ctor_set(x_12, 1, x_33);
lean_ctor_set(x_12, 0, x_30);
lean_ctor_set(x_27, 0, x_12);
return x_27;
}
else
{
lean_object* x_34; lean_object* x_35; lean_object* x_36; 
x_34 = lean_ctor_get(x_30, 0);
x_35 = lean_ctor_get(x_30, 1);
lean_inc(x_35);
lean_inc(x_34);
lean_dec(x_30);
x_36 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_36, 0, x_26);
lean_ctor_set(x_36, 1, x_34);
lean_ctor_set(x_12, 1, x_35);
lean_ctor_set(x_12, 0, x_36);
lean_ctor_set(x_27, 0, x_12);
return x_27;
}
}
else
{
lean_object* x_37; lean_object* x_38; lean_object* x_39; lean_object* x_40; lean_object* x_41; lean_object* x_42; 
x_37 = lean_ctor_get(x_27, 0);
lean_inc(x_37);
lean_dec(x_27);
x_38 = lean_ctor_get(x_37, 0);
lean_inc(x_38);
x_39 = lean_ctor_get(x_37, 1);
lean_inc(x_39);
if (lean_is_exclusive(x_37)) {
 lean_ctor_release(x_37, 0);
 lean_ctor_release(x_37, 1);
 x_40 = x_37;
} else {
 lean_dec_ref(x_37);
 x_40 = lean_box(0);
}
if (lean_is_scalar(x_40)) {
 x_41 = lean_alloc_ctor(0, 2, 0);
} else {
 x_41 = x_40;
}
lean_ctor_set(x_41, 0, x_26);
lean_ctor_set(x_41, 1, x_38);
lean_ctor_set(x_12, 1, x_39);
lean_ctor_set(x_12, 0, x_41);
x_42 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_42, 0, x_12);
return x_42;
}
}
}
}
}
else
{
lean_object* x_43; lean_object* x_44; uint8_t x_45; 
x_43 = lean_ctor_get(x_12, 0);
lean_inc(x_43);
lean_dec(x_12);
x_44 = lean_box(14);
x_45 = l_CakeML_tokcheck(x_16, x_44);
if (x_45 == 0)
{
lean_object* x_46; 
lean_dec(x_43);
lean_dec(x_15);
x_46 = lean_box(0);
return x_46;
}
else
{
uint8_t x_47; lean_object* x_48; 
x_47 = 56;
x_48 = l_CakeML_ptree__Pattern(x_47, x_15);
if (lean_obj_tag(x_48) == 0)
{
lean_object* x_49; 
lean_dec(x_43);
x_49 = lean_box(0);
return x_49;
}
else
{
lean_object* x_50; lean_object* x_51; 
x_50 = lean_ctor_get(x_48, 0);
lean_inc(x_50);
lean_dec(x_48);
x_51 = l_CakeML_ptree__PE(x_43);
if (lean_obj_tag(x_51) == 0)
{
lean_object* x_52; 
lean_dec(x_50);
x_52 = lean_box(0);
return x_52;
}
else
{
lean_object* x_53; lean_object* x_54; lean_object* x_55; lean_object* x_56; lean_object* x_57; lean_object* x_58; lean_object* x_59; lean_object* x_60; 
x_53 = lean_ctor_get(x_51, 0);
lean_inc(x_53);
if (lean_is_exclusive(x_51)) {
 lean_ctor_release(x_51, 0);
 x_54 = x_51;
} else {
 lean_dec_ref(x_51);
 x_54 = lean_box(0);
}
x_55 = lean_ctor_get(x_53, 0);
lean_inc(x_55);
x_56 = lean_ctor_get(x_53, 1);
lean_inc(x_56);
if (lean_is_exclusive(x_53)) {
 lean_ctor_release(x_53, 0);
 lean_ctor_release(x_53, 1);
 x_57 = x_53;
} else {
 lean_dec_ref(x_53);
 x_57 = lean_box(0);
}
if (lean_is_scalar(x_57)) {
 x_58 = lean_alloc_ctor(0, 2, 0);
} else {
 x_58 = x_57;
}
lean_ctor_set(x_58, 0, x_50);
lean_ctor_set(x_58, 1, x_55);
x_59 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_59, 0, x_58);
lean_ctor_set(x_59, 1, x_56);
if (lean_is_scalar(x_54)) {
 x_60 = lean_alloc_ctor(1, 1, 0);
} else {
 x_60 = x_54;
}
lean_ctor_set(x_60, 0, x_59);
return x_60;
}
}
}
}
}
else
{
lean_object* x_61; 
lean_dec(x_14);
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_61 = lean_box(0);
return x_61;
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__PE(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; uint8_t x_6; uint8_t x_7; uint8_t x_8; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
if (lean_is_exclusive(x_1)) {
 lean_ctor_release(x_1, 0);
 lean_ctor_release(x_1, 1);
 x_5 = x_1;
} else {
 lean_dec_ref(x_1);
 x_5 = lean_box(0);
}
x_6 = 60;
x_7 = lean_unbox(x_3);
lean_dec(x_3);
x_8 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_7, x_6);
if (x_8 == 0)
{
lean_object* x_9; 
lean_dec(x_5);
lean_dec(x_4);
x_9 = lean_box(0);
return x_9;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_10; 
lean_dec(x_5);
x_10 = lean_box(0);
return x_10;
}
else
{
lean_object* x_11; 
x_11 = lean_ctor_get(x_4, 1);
lean_inc(x_11);
if (lean_obj_tag(x_11) == 0)
{
lean_object* x_12; 
lean_dec(x_5);
lean_dec(x_4);
x_12 = lean_box(0);
return x_12;
}
else
{
lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; 
x_13 = lean_ctor_get(x_4, 0);
lean_inc(x_13);
if (lean_is_exclusive(x_4)) {
 lean_ctor_release(x_4, 0);
 lean_ctor_release(x_4, 1);
 x_14 = x_4;
} else {
 lean_dec_ref(x_4);
 x_14 = lean_box(0);
}
x_15 = lean_ctor_get(x_11, 0);
lean_inc(x_15);
x_16 = lean_ctor_get(x_11, 1);
lean_inc(x_16);
if (lean_is_exclusive(x_11)) {
 lean_ctor_release(x_11, 0);
 lean_ctor_release(x_11, 1);
 x_17 = x_11;
} else {
 lean_dec_ref(x_11);
 x_17 = lean_box(0);
}
if (lean_obj_tag(x_16) == 0)
{
lean_object* x_56; uint8_t x_57; 
lean_dec(x_14);
lean_dec(x_5);
x_56 = lean_box(42);
lean_inc(x_13);
x_57 = l_CakeML_tokcheck(x_13, x_56);
if (x_57 == 0)
{
lean_object* x_58; 
x_58 = lean_box(0);
x_18 = x_58;
goto block_55;
}
else
{
lean_object* x_59; 
lean_inc(x_15);
x_59 = l_CakeML_ptree__PE(x_15);
if (lean_obj_tag(x_59) == 0)
{
lean_object* x_60; 
x_60 = lean_box(0);
x_18 = x_60;
goto block_55;
}
else
{
uint8_t x_61; 
lean_dec(x_17);
lean_dec(x_15);
lean_dec(x_13);
x_61 = !lean_is_exclusive(x_59);
if (x_61 == 0)
{
lean_object* x_62; uint8_t x_63; 
x_62 = lean_ctor_get(x_59, 0);
x_63 = !lean_is_exclusive(x_62);
if (x_63 == 0)
{
lean_object* x_64; lean_object* x_65; 
x_64 = lean_ctor_get(x_62, 0);
x_65 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_65, 0, x_64);
lean_ctor_set(x_62, 0, x_65);
return x_59;
}
else
{
lean_object* x_66; lean_object* x_67; lean_object* x_68; lean_object* x_69; 
x_66 = lean_ctor_get(x_62, 0);
x_67 = lean_ctor_get(x_62, 1);
lean_inc(x_67);
lean_inc(x_66);
lean_dec(x_62);
x_68 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_68, 0, x_66);
x_69 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_69, 0, x_68);
lean_ctor_set(x_69, 1, x_67);
lean_ctor_set(x_59, 0, x_69);
return x_59;
}
}
else
{
lean_object* x_70; lean_object* x_71; lean_object* x_72; lean_object* x_73; lean_object* x_74; lean_object* x_75; lean_object* x_76; 
x_70 = lean_ctor_get(x_59, 0);
lean_inc(x_70);
lean_dec(x_59);
x_71 = lean_ctor_get(x_70, 0);
lean_inc(x_71);
x_72 = lean_ctor_get(x_70, 1);
lean_inc(x_72);
if (lean_is_exclusive(x_70)) {
 lean_ctor_release(x_70, 0);
 lean_ctor_release(x_70, 1);
 x_73 = x_70;
} else {
 lean_dec_ref(x_70);
 x_73 = lean_box(0);
}
x_74 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_74, 0, x_71);
if (lean_is_scalar(x_73)) {
 x_75 = lean_alloc_ctor(0, 2, 0);
} else {
 x_75 = x_73;
}
lean_ctor_set(x_75, 0, x_74);
lean_ctor_set(x_75, 1, x_72);
x_76 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_76, 0, x_75);
return x_76;
}
}
}
}
else
{
lean_object* x_77; 
lean_dec(x_17);
x_77 = lean_ctor_get(x_16, 1);
lean_inc(x_77);
if (lean_obj_tag(x_77) == 0)
{
lean_object* x_78; 
lean_dec(x_16);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_13);
lean_dec(x_5);
x_78 = lean_box(0);
return x_78;
}
else
{
uint8_t x_79; 
x_79 = !lean_is_exclusive(x_16);
if (x_79 == 0)
{
lean_object* x_80; lean_object* x_81; uint8_t x_82; 
x_80 = lean_ctor_get(x_16, 0);
x_81 = lean_ctor_get(x_16, 1);
lean_dec(x_81);
x_82 = !lean_is_exclusive(x_77);
if (x_82 == 0)
{
lean_object* x_83; lean_object* x_84; lean_object* x_85; 
x_83 = lean_ctor_get(x_77, 0);
x_84 = lean_ctor_get(x_77, 1);
if (lean_obj_tag(x_84) == 0)
{
lean_object* x_103; lean_object* x_104; uint8_t x_105; 
x_103 = lean_box(0);
lean_ctor_set(x_77, 1, x_103);
lean_ctor_set(x_77, 0, x_80);
lean_ctor_set(x_16, 0, x_13);
x_104 = l_CakeML_ptree__Expr___closed__4;
lean_inc(x_16);
x_105 = l_CakeML_tokcheckl(x_16, x_104);
if (x_105 == 0)
{
lean_object* x_106; uint8_t x_107; 
x_106 = l_CakeML_ptree__Expr___closed__2;
x_107 = l_CakeML_tokcheckl(x_16, x_106);
if (x_107 == 0)
{
lean_object* x_108; 
lean_dec(x_83);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_5);
x_108 = lean_box(0);
return x_108;
}
else
{
lean_object* x_109; 
x_109 = lean_box(0);
x_85 = x_109;
goto block_102;
}
}
else
{
uint8_t x_110; lean_object* x_111; 
x_110 = 56;
lean_inc(x_15);
x_111 = l_CakeML_ptree__Pattern(x_110, x_15);
if (lean_obj_tag(x_111) == 0)
{
lean_object* x_112; uint8_t x_113; 
x_112 = l_CakeML_ptree__Expr___closed__2;
x_113 = l_CakeML_tokcheckl(x_16, x_112);
if (x_113 == 0)
{
lean_object* x_114; 
lean_dec(x_83);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_5);
x_114 = lean_box(0);
return x_114;
}
else
{
lean_object* x_115; 
x_115 = lean_box(0);
x_85 = x_115;
goto block_102;
}
}
else
{
lean_object* x_116; uint8_t x_117; lean_object* x_118; 
x_116 = lean_ctor_get(x_111, 0);
lean_inc(x_116);
lean_dec(x_111);
x_117 = 46;
lean_inc(x_83);
x_118 = l_CakeML_ptree__Expr(x_117, x_83);
if (lean_obj_tag(x_118) == 0)
{
lean_object* x_119; uint8_t x_120; 
lean_dec(x_116);
x_119 = l_CakeML_ptree__Expr___closed__2;
x_120 = l_CakeML_tokcheckl(x_16, x_119);
if (x_120 == 0)
{
lean_object* x_121; 
lean_dec(x_83);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_5);
x_121 = lean_box(0);
return x_121;
}
else
{
lean_object* x_122; 
x_122 = lean_box(0);
x_85 = x_122;
goto block_102;
}
}
else
{
uint8_t x_123; 
lean_dec(x_16);
lean_dec(x_83);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_5);
x_123 = !lean_is_exclusive(x_118);
if (x_123 == 0)
{
lean_object* x_124; lean_object* x_125; lean_object* x_126; 
x_124 = lean_ctor_get(x_118, 0);
x_125 = l_CakeML_mkFun(x_116, x_124);
x_126 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_126, 0, x_125);
lean_ctor_set(x_126, 1, x_103);
lean_ctor_set(x_118, 0, x_126);
return x_118;
}
else
{
lean_object* x_127; lean_object* x_128; lean_object* x_129; lean_object* x_130; 
x_127 = lean_ctor_get(x_118, 0);
lean_inc(x_127);
lean_dec(x_118);
x_128 = l_CakeML_mkFun(x_116, x_127);
x_129 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_129, 0, x_128);
lean_ctor_set(x_129, 1, x_103);
x_130 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_130, 0, x_129);
return x_130;
}
}
}
}
}
else
{
lean_object* x_131; 
lean_free_object(x_16);
lean_dec(x_14);
lean_dec(x_5);
x_131 = lean_ctor_get(x_84, 1);
lean_inc(x_131);
if (lean_obj_tag(x_131) == 0)
{
lean_object* x_132; 
lean_free_object(x_77);
lean_dec(x_84);
lean_dec(x_83);
lean_dec(x_80);
lean_dec(x_15);
lean_dec(x_13);
x_132 = lean_box(0);
return x_132;
}
else
{
lean_object* x_133; 
x_133 = lean_ctor_get(x_131, 1);
lean_inc(x_133);
if (lean_obj_tag(x_133) == 0)
{
uint8_t x_134; 
x_134 = !lean_is_exclusive(x_84);
if (x_134 == 0)
{
lean_object* x_135; lean_object* x_136; uint8_t x_137; 
x_135 = lean_ctor_get(x_84, 0);
x_136 = lean_ctor_get(x_84, 1);
lean_dec(x_136);
x_137 = !lean_is_exclusive(x_131);
if (x_137 == 0)
{
lean_object* x_138; lean_object* x_139; lean_object* x_140; lean_object* x_141; uint8_t x_142; 
x_138 = lean_ctor_get(x_131, 0);
x_139 = lean_ctor_get(x_131, 1);
lean_dec(x_139);
x_140 = lean_box(0);
lean_ctor_set(x_131, 1, x_140);
lean_ctor_set(x_131, 0, x_135);
lean_ctor_set(x_84, 0, x_80);
lean_ctor_set(x_77, 0, x_13);
x_141 = l_CakeML_ptree__Expr___closed__7;
x_142 = l_CakeML_tokcheckl(x_77, x_141);
if (x_142 == 0)
{
lean_object* x_143; 
lean_dec(x_138);
lean_dec(x_83);
lean_dec(x_15);
x_143 = lean_box(0);
return x_143;
}
else
{
uint8_t x_144; lean_object* x_145; 
x_144 = 46;
x_145 = l_CakeML_ptree__Expr(x_144, x_15);
if (lean_obj_tag(x_145) == 0)
{
lean_object* x_146; 
lean_dec(x_138);
lean_dec(x_83);
x_146 = lean_box(0);
return x_146;
}
else
{
lean_object* x_147; lean_object* x_148; 
x_147 = lean_ctor_get(x_145, 0);
lean_inc(x_147);
lean_dec(x_145);
x_148 = l_CakeML_ptree__Expr(x_144, x_83);
if (lean_obj_tag(x_148) == 0)
{
lean_object* x_149; 
lean_dec(x_147);
lean_dec(x_138);
x_149 = lean_box(0);
return x_149;
}
else
{
lean_object* x_150; lean_object* x_151; 
x_150 = lean_ctor_get(x_148, 0);
lean_inc(x_150);
lean_dec(x_148);
x_151 = l_CakeML_ptree__PE(x_138);
if (lean_obj_tag(x_151) == 0)
{
lean_object* x_152; 
lean_dec(x_150);
lean_dec(x_147);
x_152 = lean_box(0);
return x_152;
}
else
{
uint8_t x_153; 
x_153 = !lean_is_exclusive(x_151);
if (x_153 == 0)
{
lean_object* x_154; uint8_t x_155; 
x_154 = lean_ctor_get(x_151, 0);
x_155 = !lean_is_exclusive(x_154);
if (x_155 == 0)
{
lean_object* x_156; lean_object* x_157; 
x_156 = lean_ctor_get(x_154, 0);
x_157 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_157, 0, x_147);
lean_ctor_set(x_157, 1, x_150);
lean_ctor_set(x_157, 2, x_156);
lean_ctor_set(x_154, 0, x_157);
return x_151;
}
else
{
lean_object* x_158; lean_object* x_159; lean_object* x_160; lean_object* x_161; 
x_158 = lean_ctor_get(x_154, 0);
x_159 = lean_ctor_get(x_154, 1);
lean_inc(x_159);
lean_inc(x_158);
lean_dec(x_154);
x_160 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_160, 0, x_147);
lean_ctor_set(x_160, 1, x_150);
lean_ctor_set(x_160, 2, x_158);
x_161 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_161, 0, x_160);
lean_ctor_set(x_161, 1, x_159);
lean_ctor_set(x_151, 0, x_161);
return x_151;
}
}
else
{
lean_object* x_162; lean_object* x_163; lean_object* x_164; lean_object* x_165; lean_object* x_166; lean_object* x_167; lean_object* x_168; 
x_162 = lean_ctor_get(x_151, 0);
lean_inc(x_162);
lean_dec(x_151);
x_163 = lean_ctor_get(x_162, 0);
lean_inc(x_163);
x_164 = lean_ctor_get(x_162, 1);
lean_inc(x_164);
if (lean_is_exclusive(x_162)) {
 lean_ctor_release(x_162, 0);
 lean_ctor_release(x_162, 1);
 x_165 = x_162;
} else {
 lean_dec_ref(x_162);
 x_165 = lean_box(0);
}
x_166 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_166, 0, x_147);
lean_ctor_set(x_166, 1, x_150);
lean_ctor_set(x_166, 2, x_163);
if (lean_is_scalar(x_165)) {
 x_167 = lean_alloc_ctor(0, 2, 0);
} else {
 x_167 = x_165;
}
lean_ctor_set(x_167, 0, x_166);
lean_ctor_set(x_167, 1, x_164);
x_168 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_168, 0, x_167);
return x_168;
}
}
}
}
}
}
else
{
lean_object* x_169; lean_object* x_170; lean_object* x_171; lean_object* x_172; uint8_t x_173; 
x_169 = lean_ctor_get(x_131, 0);
lean_inc(x_169);
lean_dec(x_131);
x_170 = lean_box(0);
x_171 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_171, 0, x_135);
lean_ctor_set(x_171, 1, x_170);
lean_ctor_set(x_84, 1, x_171);
lean_ctor_set(x_84, 0, x_80);
lean_ctor_set(x_77, 0, x_13);
x_172 = l_CakeML_ptree__Expr___closed__7;
x_173 = l_CakeML_tokcheckl(x_77, x_172);
if (x_173 == 0)
{
lean_object* x_174; 
lean_dec(x_169);
lean_dec(x_83);
lean_dec(x_15);
x_174 = lean_box(0);
return x_174;
}
else
{
uint8_t x_175; lean_object* x_176; 
x_175 = 46;
x_176 = l_CakeML_ptree__Expr(x_175, x_15);
if (lean_obj_tag(x_176) == 0)
{
lean_object* x_177; 
lean_dec(x_169);
lean_dec(x_83);
x_177 = lean_box(0);
return x_177;
}
else
{
lean_object* x_178; lean_object* x_179; 
x_178 = lean_ctor_get(x_176, 0);
lean_inc(x_178);
lean_dec(x_176);
x_179 = l_CakeML_ptree__Expr(x_175, x_83);
if (lean_obj_tag(x_179) == 0)
{
lean_object* x_180; 
lean_dec(x_178);
lean_dec(x_169);
x_180 = lean_box(0);
return x_180;
}
else
{
lean_object* x_181; lean_object* x_182; 
x_181 = lean_ctor_get(x_179, 0);
lean_inc(x_181);
lean_dec(x_179);
x_182 = l_CakeML_ptree__PE(x_169);
if (lean_obj_tag(x_182) == 0)
{
lean_object* x_183; 
lean_dec(x_181);
lean_dec(x_178);
x_183 = lean_box(0);
return x_183;
}
else
{
lean_object* x_184; lean_object* x_185; lean_object* x_186; lean_object* x_187; lean_object* x_188; lean_object* x_189; lean_object* x_190; lean_object* x_191; 
x_184 = lean_ctor_get(x_182, 0);
lean_inc(x_184);
if (lean_is_exclusive(x_182)) {
 lean_ctor_release(x_182, 0);
 x_185 = x_182;
} else {
 lean_dec_ref(x_182);
 x_185 = lean_box(0);
}
x_186 = lean_ctor_get(x_184, 0);
lean_inc(x_186);
x_187 = lean_ctor_get(x_184, 1);
lean_inc(x_187);
if (lean_is_exclusive(x_184)) {
 lean_ctor_release(x_184, 0);
 lean_ctor_release(x_184, 1);
 x_188 = x_184;
} else {
 lean_dec_ref(x_184);
 x_188 = lean_box(0);
}
x_189 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_189, 0, x_178);
lean_ctor_set(x_189, 1, x_181);
lean_ctor_set(x_189, 2, x_186);
if (lean_is_scalar(x_188)) {
 x_190 = lean_alloc_ctor(0, 2, 0);
} else {
 x_190 = x_188;
}
lean_ctor_set(x_190, 0, x_189);
lean_ctor_set(x_190, 1, x_187);
if (lean_is_scalar(x_185)) {
 x_191 = lean_alloc_ctor(1, 1, 0);
} else {
 x_191 = x_185;
}
lean_ctor_set(x_191, 0, x_190);
return x_191;
}
}
}
}
}
}
else
{
lean_object* x_192; lean_object* x_193; lean_object* x_194; lean_object* x_195; lean_object* x_196; lean_object* x_197; lean_object* x_198; uint8_t x_199; 
x_192 = lean_ctor_get(x_84, 0);
lean_inc(x_192);
lean_dec(x_84);
x_193 = lean_ctor_get(x_131, 0);
lean_inc(x_193);
if (lean_is_exclusive(x_131)) {
 lean_ctor_release(x_131, 0);
 lean_ctor_release(x_131, 1);
 x_194 = x_131;
} else {
 lean_dec_ref(x_131);
 x_194 = lean_box(0);
}
x_195 = lean_box(0);
if (lean_is_scalar(x_194)) {
 x_196 = lean_alloc_ctor(1, 2, 0);
} else {
 x_196 = x_194;
}
lean_ctor_set(x_196, 0, x_192);
lean_ctor_set(x_196, 1, x_195);
x_197 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_197, 0, x_80);
lean_ctor_set(x_197, 1, x_196);
lean_ctor_set(x_77, 1, x_197);
lean_ctor_set(x_77, 0, x_13);
x_198 = l_CakeML_ptree__Expr___closed__7;
x_199 = l_CakeML_tokcheckl(x_77, x_198);
if (x_199 == 0)
{
lean_object* x_200; 
lean_dec(x_193);
lean_dec(x_83);
lean_dec(x_15);
x_200 = lean_box(0);
return x_200;
}
else
{
uint8_t x_201; lean_object* x_202; 
x_201 = 46;
x_202 = l_CakeML_ptree__Expr(x_201, x_15);
if (lean_obj_tag(x_202) == 0)
{
lean_object* x_203; 
lean_dec(x_193);
lean_dec(x_83);
x_203 = lean_box(0);
return x_203;
}
else
{
lean_object* x_204; lean_object* x_205; 
x_204 = lean_ctor_get(x_202, 0);
lean_inc(x_204);
lean_dec(x_202);
x_205 = l_CakeML_ptree__Expr(x_201, x_83);
if (lean_obj_tag(x_205) == 0)
{
lean_object* x_206; 
lean_dec(x_204);
lean_dec(x_193);
x_206 = lean_box(0);
return x_206;
}
else
{
lean_object* x_207; lean_object* x_208; 
x_207 = lean_ctor_get(x_205, 0);
lean_inc(x_207);
lean_dec(x_205);
x_208 = l_CakeML_ptree__PE(x_193);
if (lean_obj_tag(x_208) == 0)
{
lean_object* x_209; 
lean_dec(x_207);
lean_dec(x_204);
x_209 = lean_box(0);
return x_209;
}
else
{
lean_object* x_210; lean_object* x_211; lean_object* x_212; lean_object* x_213; lean_object* x_214; lean_object* x_215; lean_object* x_216; lean_object* x_217; 
x_210 = lean_ctor_get(x_208, 0);
lean_inc(x_210);
if (lean_is_exclusive(x_208)) {
 lean_ctor_release(x_208, 0);
 x_211 = x_208;
} else {
 lean_dec_ref(x_208);
 x_211 = lean_box(0);
}
x_212 = lean_ctor_get(x_210, 0);
lean_inc(x_212);
x_213 = lean_ctor_get(x_210, 1);
lean_inc(x_213);
if (lean_is_exclusive(x_210)) {
 lean_ctor_release(x_210, 0);
 lean_ctor_release(x_210, 1);
 x_214 = x_210;
} else {
 lean_dec_ref(x_210);
 x_214 = lean_box(0);
}
x_215 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_215, 0, x_204);
lean_ctor_set(x_215, 1, x_207);
lean_ctor_set(x_215, 2, x_212);
if (lean_is_scalar(x_214)) {
 x_216 = lean_alloc_ctor(0, 2, 0);
} else {
 x_216 = x_214;
}
lean_ctor_set(x_216, 0, x_215);
lean_ctor_set(x_216, 1, x_213);
if (lean_is_scalar(x_211)) {
 x_217 = lean_alloc_ctor(1, 1, 0);
} else {
 x_217 = x_211;
}
lean_ctor_set(x_217, 0, x_216);
return x_217;
}
}
}
}
}
}
else
{
lean_object* x_218; 
lean_dec(x_133);
lean_dec(x_131);
lean_free_object(x_77);
lean_dec(x_84);
lean_dec(x_83);
lean_dec(x_80);
lean_dec(x_15);
lean_dec(x_13);
x_218 = lean_box(0);
return x_218;
}
}
}
block_102:
{
uint8_t x_86; lean_object* x_87; 
lean_dec(x_85);
x_86 = 46;
x_87 = l_CakeML_ptree__Expr(x_86, x_15);
if (lean_obj_tag(x_87) == 0)
{
lean_object* x_88; 
lean_dec(x_83);
lean_dec(x_14);
lean_dec(x_5);
x_88 = lean_box(0);
return x_88;
}
else
{
lean_object* x_89; lean_object* x_90; 
x_89 = lean_ctor_get(x_87, 0);
lean_inc(x_89);
lean_dec(x_87);
x_90 = l_CakeML_ptree__PEs(x_83);
if (lean_obj_tag(x_90) == 0)
{
lean_object* x_91; 
lean_dec(x_89);
lean_dec(x_14);
lean_dec(x_5);
x_91 = lean_box(0);
return x_91;
}
else
{
uint8_t x_92; 
x_92 = !lean_is_exclusive(x_90);
if (x_92 == 0)
{
lean_object* x_93; lean_object* x_94; lean_object* x_95; lean_object* x_96; 
x_93 = lean_ctor_get(x_90, 0);
if (lean_is_scalar(x_14)) {
 x_94 = lean_alloc_ctor(9, 2, 0);
} else {
 x_94 = x_14;
 lean_ctor_set_tag(x_94, 9);
}
lean_ctor_set(x_94, 0, x_89);
lean_ctor_set(x_94, 1, x_93);
x_95 = lean_box(0);
if (lean_is_scalar(x_5)) {
 x_96 = lean_alloc_ctor(0, 2, 0);
} else {
 x_96 = x_5;
 lean_ctor_set_tag(x_96, 0);
}
lean_ctor_set(x_96, 0, x_94);
lean_ctor_set(x_96, 1, x_95);
lean_ctor_set(x_90, 0, x_96);
return x_90;
}
else
{
lean_object* x_97; lean_object* x_98; lean_object* x_99; lean_object* x_100; lean_object* x_101; 
x_97 = lean_ctor_get(x_90, 0);
lean_inc(x_97);
lean_dec(x_90);
if (lean_is_scalar(x_14)) {
 x_98 = lean_alloc_ctor(9, 2, 0);
} else {
 x_98 = x_14;
 lean_ctor_set_tag(x_98, 9);
}
lean_ctor_set(x_98, 0, x_89);
lean_ctor_set(x_98, 1, x_97);
x_99 = lean_box(0);
if (lean_is_scalar(x_5)) {
 x_100 = lean_alloc_ctor(0, 2, 0);
} else {
 x_100 = x_5;
 lean_ctor_set_tag(x_100, 0);
}
lean_ctor_set(x_100, 0, x_98);
lean_ctor_set(x_100, 1, x_99);
x_101 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_101, 0, x_100);
return x_101;
}
}
}
}
}
else
{
lean_object* x_219; lean_object* x_220; lean_object* x_221; 
x_219 = lean_ctor_get(x_77, 0);
x_220 = lean_ctor_get(x_77, 1);
lean_inc(x_220);
lean_inc(x_219);
lean_dec(x_77);
if (lean_obj_tag(x_220) == 0)
{
lean_object* x_235; lean_object* x_236; lean_object* x_237; uint8_t x_238; 
x_235 = lean_box(0);
x_236 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_236, 0, x_80);
lean_ctor_set(x_236, 1, x_235);
lean_ctor_set(x_16, 1, x_236);
lean_ctor_set(x_16, 0, x_13);
x_237 = l_CakeML_ptree__Expr___closed__4;
lean_inc(x_16);
x_238 = l_CakeML_tokcheckl(x_16, x_237);
if (x_238 == 0)
{
lean_object* x_239; uint8_t x_240; 
x_239 = l_CakeML_ptree__Expr___closed__2;
x_240 = l_CakeML_tokcheckl(x_16, x_239);
if (x_240 == 0)
{
lean_object* x_241; 
lean_dec(x_219);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_5);
x_241 = lean_box(0);
return x_241;
}
else
{
lean_object* x_242; 
x_242 = lean_box(0);
x_221 = x_242;
goto block_234;
}
}
else
{
uint8_t x_243; lean_object* x_244; 
x_243 = 56;
lean_inc(x_15);
x_244 = l_CakeML_ptree__Pattern(x_243, x_15);
if (lean_obj_tag(x_244) == 0)
{
lean_object* x_245; uint8_t x_246; 
x_245 = l_CakeML_ptree__Expr___closed__2;
x_246 = l_CakeML_tokcheckl(x_16, x_245);
if (x_246 == 0)
{
lean_object* x_247; 
lean_dec(x_219);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_5);
x_247 = lean_box(0);
return x_247;
}
else
{
lean_object* x_248; 
x_248 = lean_box(0);
x_221 = x_248;
goto block_234;
}
}
else
{
lean_object* x_249; uint8_t x_250; lean_object* x_251; 
x_249 = lean_ctor_get(x_244, 0);
lean_inc(x_249);
lean_dec(x_244);
x_250 = 46;
lean_inc(x_219);
x_251 = l_CakeML_ptree__Expr(x_250, x_219);
if (lean_obj_tag(x_251) == 0)
{
lean_object* x_252; uint8_t x_253; 
lean_dec(x_249);
x_252 = l_CakeML_ptree__Expr___closed__2;
x_253 = l_CakeML_tokcheckl(x_16, x_252);
if (x_253 == 0)
{
lean_object* x_254; 
lean_dec(x_219);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_5);
x_254 = lean_box(0);
return x_254;
}
else
{
lean_object* x_255; 
x_255 = lean_box(0);
x_221 = x_255;
goto block_234;
}
}
else
{
lean_object* x_256; lean_object* x_257; lean_object* x_258; lean_object* x_259; lean_object* x_260; 
lean_dec(x_16);
lean_dec(x_219);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_5);
x_256 = lean_ctor_get(x_251, 0);
lean_inc(x_256);
if (lean_is_exclusive(x_251)) {
 lean_ctor_release(x_251, 0);
 x_257 = x_251;
} else {
 lean_dec_ref(x_251);
 x_257 = lean_box(0);
}
x_258 = l_CakeML_mkFun(x_249, x_256);
x_259 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_259, 0, x_258);
lean_ctor_set(x_259, 1, x_235);
if (lean_is_scalar(x_257)) {
 x_260 = lean_alloc_ctor(1, 1, 0);
} else {
 x_260 = x_257;
}
lean_ctor_set(x_260, 0, x_259);
return x_260;
}
}
}
}
else
{
lean_object* x_261; 
lean_free_object(x_16);
lean_dec(x_14);
lean_dec(x_5);
x_261 = lean_ctor_get(x_220, 1);
lean_inc(x_261);
if (lean_obj_tag(x_261) == 0)
{
lean_object* x_262; 
lean_dec(x_220);
lean_dec(x_219);
lean_dec(x_80);
lean_dec(x_15);
lean_dec(x_13);
x_262 = lean_box(0);
return x_262;
}
else
{
lean_object* x_263; 
x_263 = lean_ctor_get(x_261, 1);
lean_inc(x_263);
if (lean_obj_tag(x_263) == 0)
{
lean_object* x_264; lean_object* x_265; lean_object* x_266; lean_object* x_267; lean_object* x_268; lean_object* x_269; lean_object* x_270; lean_object* x_271; lean_object* x_272; uint8_t x_273; 
x_264 = lean_ctor_get(x_220, 0);
lean_inc(x_264);
if (lean_is_exclusive(x_220)) {
 lean_ctor_release(x_220, 0);
 lean_ctor_release(x_220, 1);
 x_265 = x_220;
} else {
 lean_dec_ref(x_220);
 x_265 = lean_box(0);
}
x_266 = lean_ctor_get(x_261, 0);
lean_inc(x_266);
if (lean_is_exclusive(x_261)) {
 lean_ctor_release(x_261, 0);
 lean_ctor_release(x_261, 1);
 x_267 = x_261;
} else {
 lean_dec_ref(x_261);
 x_267 = lean_box(0);
}
x_268 = lean_box(0);
if (lean_is_scalar(x_267)) {
 x_269 = lean_alloc_ctor(1, 2, 0);
} else {
 x_269 = x_267;
}
lean_ctor_set(x_269, 0, x_264);
lean_ctor_set(x_269, 1, x_268);
if (lean_is_scalar(x_265)) {
 x_270 = lean_alloc_ctor(1, 2, 0);
} else {
 x_270 = x_265;
}
lean_ctor_set(x_270, 0, x_80);
lean_ctor_set(x_270, 1, x_269);
x_271 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_271, 0, x_13);
lean_ctor_set(x_271, 1, x_270);
x_272 = l_CakeML_ptree__Expr___closed__7;
x_273 = l_CakeML_tokcheckl(x_271, x_272);
if (x_273 == 0)
{
lean_object* x_274; 
lean_dec(x_266);
lean_dec(x_219);
lean_dec(x_15);
x_274 = lean_box(0);
return x_274;
}
else
{
uint8_t x_275; lean_object* x_276; 
x_275 = 46;
x_276 = l_CakeML_ptree__Expr(x_275, x_15);
if (lean_obj_tag(x_276) == 0)
{
lean_object* x_277; 
lean_dec(x_266);
lean_dec(x_219);
x_277 = lean_box(0);
return x_277;
}
else
{
lean_object* x_278; lean_object* x_279; 
x_278 = lean_ctor_get(x_276, 0);
lean_inc(x_278);
lean_dec(x_276);
x_279 = l_CakeML_ptree__Expr(x_275, x_219);
if (lean_obj_tag(x_279) == 0)
{
lean_object* x_280; 
lean_dec(x_278);
lean_dec(x_266);
x_280 = lean_box(0);
return x_280;
}
else
{
lean_object* x_281; lean_object* x_282; 
x_281 = lean_ctor_get(x_279, 0);
lean_inc(x_281);
lean_dec(x_279);
x_282 = l_CakeML_ptree__PE(x_266);
if (lean_obj_tag(x_282) == 0)
{
lean_object* x_283; 
lean_dec(x_281);
lean_dec(x_278);
x_283 = lean_box(0);
return x_283;
}
else
{
lean_object* x_284; lean_object* x_285; lean_object* x_286; lean_object* x_287; lean_object* x_288; lean_object* x_289; lean_object* x_290; lean_object* x_291; 
x_284 = lean_ctor_get(x_282, 0);
lean_inc(x_284);
if (lean_is_exclusive(x_282)) {
 lean_ctor_release(x_282, 0);
 x_285 = x_282;
} else {
 lean_dec_ref(x_282);
 x_285 = lean_box(0);
}
x_286 = lean_ctor_get(x_284, 0);
lean_inc(x_286);
x_287 = lean_ctor_get(x_284, 1);
lean_inc(x_287);
if (lean_is_exclusive(x_284)) {
 lean_ctor_release(x_284, 0);
 lean_ctor_release(x_284, 1);
 x_288 = x_284;
} else {
 lean_dec_ref(x_284);
 x_288 = lean_box(0);
}
x_289 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_289, 0, x_278);
lean_ctor_set(x_289, 1, x_281);
lean_ctor_set(x_289, 2, x_286);
if (lean_is_scalar(x_288)) {
 x_290 = lean_alloc_ctor(0, 2, 0);
} else {
 x_290 = x_288;
}
lean_ctor_set(x_290, 0, x_289);
lean_ctor_set(x_290, 1, x_287);
if (lean_is_scalar(x_285)) {
 x_291 = lean_alloc_ctor(1, 1, 0);
} else {
 x_291 = x_285;
}
lean_ctor_set(x_291, 0, x_290);
return x_291;
}
}
}
}
}
else
{
lean_object* x_292; 
lean_dec(x_263);
lean_dec(x_261);
lean_dec(x_220);
lean_dec(x_219);
lean_dec(x_80);
lean_dec(x_15);
lean_dec(x_13);
x_292 = lean_box(0);
return x_292;
}
}
}
block_234:
{
uint8_t x_222; lean_object* x_223; 
lean_dec(x_221);
x_222 = 46;
x_223 = l_CakeML_ptree__Expr(x_222, x_15);
if (lean_obj_tag(x_223) == 0)
{
lean_object* x_224; 
lean_dec(x_219);
lean_dec(x_14);
lean_dec(x_5);
x_224 = lean_box(0);
return x_224;
}
else
{
lean_object* x_225; lean_object* x_226; 
x_225 = lean_ctor_get(x_223, 0);
lean_inc(x_225);
lean_dec(x_223);
x_226 = l_CakeML_ptree__PEs(x_219);
if (lean_obj_tag(x_226) == 0)
{
lean_object* x_227; 
lean_dec(x_225);
lean_dec(x_14);
lean_dec(x_5);
x_227 = lean_box(0);
return x_227;
}
else
{
lean_object* x_228; lean_object* x_229; lean_object* x_230; lean_object* x_231; lean_object* x_232; lean_object* x_233; 
x_228 = lean_ctor_get(x_226, 0);
lean_inc(x_228);
if (lean_is_exclusive(x_226)) {
 lean_ctor_release(x_226, 0);
 x_229 = x_226;
} else {
 lean_dec_ref(x_226);
 x_229 = lean_box(0);
}
if (lean_is_scalar(x_14)) {
 x_230 = lean_alloc_ctor(9, 2, 0);
} else {
 x_230 = x_14;
 lean_ctor_set_tag(x_230, 9);
}
lean_ctor_set(x_230, 0, x_225);
lean_ctor_set(x_230, 1, x_228);
x_231 = lean_box(0);
if (lean_is_scalar(x_5)) {
 x_232 = lean_alloc_ctor(0, 2, 0);
} else {
 x_232 = x_5;
 lean_ctor_set_tag(x_232, 0);
}
lean_ctor_set(x_232, 0, x_230);
lean_ctor_set(x_232, 1, x_231);
if (lean_is_scalar(x_229)) {
 x_233 = lean_alloc_ctor(1, 1, 0);
} else {
 x_233 = x_229;
}
lean_ctor_set(x_233, 0, x_232);
return x_233;
}
}
}
}
}
else
{
lean_object* x_293; lean_object* x_294; lean_object* x_295; lean_object* x_296; lean_object* x_297; 
x_293 = lean_ctor_get(x_16, 0);
lean_inc(x_293);
lean_dec(x_16);
x_294 = lean_ctor_get(x_77, 0);
lean_inc(x_294);
x_295 = lean_ctor_get(x_77, 1);
lean_inc(x_295);
if (lean_is_exclusive(x_77)) {
 lean_ctor_release(x_77, 0);
 lean_ctor_release(x_77, 1);
 x_296 = x_77;
} else {
 lean_dec_ref(x_77);
 x_296 = lean_box(0);
}
if (lean_obj_tag(x_295) == 0)
{
lean_object* x_311; lean_object* x_312; lean_object* x_313; lean_object* x_314; uint8_t x_315; 
x_311 = lean_box(0);
if (lean_is_scalar(x_296)) {
 x_312 = lean_alloc_ctor(1, 2, 0);
} else {
 x_312 = x_296;
}
lean_ctor_set(x_312, 0, x_293);
lean_ctor_set(x_312, 1, x_311);
x_313 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_313, 0, x_13);
lean_ctor_set(x_313, 1, x_312);
x_314 = l_CakeML_ptree__Expr___closed__4;
lean_inc(x_313);
x_315 = l_CakeML_tokcheckl(x_313, x_314);
if (x_315 == 0)
{
lean_object* x_316; uint8_t x_317; 
x_316 = l_CakeML_ptree__Expr___closed__2;
x_317 = l_CakeML_tokcheckl(x_313, x_316);
if (x_317 == 0)
{
lean_object* x_318; 
lean_dec(x_294);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_5);
x_318 = lean_box(0);
return x_318;
}
else
{
lean_object* x_319; 
x_319 = lean_box(0);
x_297 = x_319;
goto block_310;
}
}
else
{
uint8_t x_320; lean_object* x_321; 
x_320 = 56;
lean_inc(x_15);
x_321 = l_CakeML_ptree__Pattern(x_320, x_15);
if (lean_obj_tag(x_321) == 0)
{
lean_object* x_322; uint8_t x_323; 
x_322 = l_CakeML_ptree__Expr___closed__2;
x_323 = l_CakeML_tokcheckl(x_313, x_322);
if (x_323 == 0)
{
lean_object* x_324; 
lean_dec(x_294);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_5);
x_324 = lean_box(0);
return x_324;
}
else
{
lean_object* x_325; 
x_325 = lean_box(0);
x_297 = x_325;
goto block_310;
}
}
else
{
lean_object* x_326; uint8_t x_327; lean_object* x_328; 
x_326 = lean_ctor_get(x_321, 0);
lean_inc(x_326);
lean_dec(x_321);
x_327 = 46;
lean_inc(x_294);
x_328 = l_CakeML_ptree__Expr(x_327, x_294);
if (lean_obj_tag(x_328) == 0)
{
lean_object* x_329; uint8_t x_330; 
lean_dec(x_326);
x_329 = l_CakeML_ptree__Expr___closed__2;
x_330 = l_CakeML_tokcheckl(x_313, x_329);
if (x_330 == 0)
{
lean_object* x_331; 
lean_dec(x_294);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_5);
x_331 = lean_box(0);
return x_331;
}
else
{
lean_object* x_332; 
x_332 = lean_box(0);
x_297 = x_332;
goto block_310;
}
}
else
{
lean_object* x_333; lean_object* x_334; lean_object* x_335; lean_object* x_336; lean_object* x_337; 
lean_dec(x_313);
lean_dec(x_294);
lean_dec(x_15);
lean_dec(x_14);
lean_dec(x_5);
x_333 = lean_ctor_get(x_328, 0);
lean_inc(x_333);
if (lean_is_exclusive(x_328)) {
 lean_ctor_release(x_328, 0);
 x_334 = x_328;
} else {
 lean_dec_ref(x_328);
 x_334 = lean_box(0);
}
x_335 = l_CakeML_mkFun(x_326, x_333);
x_336 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_336, 0, x_335);
lean_ctor_set(x_336, 1, x_311);
if (lean_is_scalar(x_334)) {
 x_337 = lean_alloc_ctor(1, 1, 0);
} else {
 x_337 = x_334;
}
lean_ctor_set(x_337, 0, x_336);
return x_337;
}
}
}
}
else
{
lean_object* x_338; 
lean_dec(x_14);
lean_dec(x_5);
x_338 = lean_ctor_get(x_295, 1);
lean_inc(x_338);
if (lean_obj_tag(x_338) == 0)
{
lean_object* x_339; 
lean_dec(x_296);
lean_dec(x_295);
lean_dec(x_294);
lean_dec(x_293);
lean_dec(x_15);
lean_dec(x_13);
x_339 = lean_box(0);
return x_339;
}
else
{
lean_object* x_340; 
x_340 = lean_ctor_get(x_338, 1);
lean_inc(x_340);
if (lean_obj_tag(x_340) == 0)
{
lean_object* x_341; lean_object* x_342; lean_object* x_343; lean_object* x_344; lean_object* x_345; lean_object* x_346; lean_object* x_347; lean_object* x_348; lean_object* x_349; uint8_t x_350; 
x_341 = lean_ctor_get(x_295, 0);
lean_inc(x_341);
if (lean_is_exclusive(x_295)) {
 lean_ctor_release(x_295, 0);
 lean_ctor_release(x_295, 1);
 x_342 = x_295;
} else {
 lean_dec_ref(x_295);
 x_342 = lean_box(0);
}
x_343 = lean_ctor_get(x_338, 0);
lean_inc(x_343);
if (lean_is_exclusive(x_338)) {
 lean_ctor_release(x_338, 0);
 lean_ctor_release(x_338, 1);
 x_344 = x_338;
} else {
 lean_dec_ref(x_338);
 x_344 = lean_box(0);
}
x_345 = lean_box(0);
if (lean_is_scalar(x_344)) {
 x_346 = lean_alloc_ctor(1, 2, 0);
} else {
 x_346 = x_344;
}
lean_ctor_set(x_346, 0, x_341);
lean_ctor_set(x_346, 1, x_345);
if (lean_is_scalar(x_342)) {
 x_347 = lean_alloc_ctor(1, 2, 0);
} else {
 x_347 = x_342;
}
lean_ctor_set(x_347, 0, x_293);
lean_ctor_set(x_347, 1, x_346);
if (lean_is_scalar(x_296)) {
 x_348 = lean_alloc_ctor(1, 2, 0);
} else {
 x_348 = x_296;
}
lean_ctor_set(x_348, 0, x_13);
lean_ctor_set(x_348, 1, x_347);
x_349 = l_CakeML_ptree__Expr___closed__7;
x_350 = l_CakeML_tokcheckl(x_348, x_349);
if (x_350 == 0)
{
lean_object* x_351; 
lean_dec(x_343);
lean_dec(x_294);
lean_dec(x_15);
x_351 = lean_box(0);
return x_351;
}
else
{
uint8_t x_352; lean_object* x_353; 
x_352 = 46;
x_353 = l_CakeML_ptree__Expr(x_352, x_15);
if (lean_obj_tag(x_353) == 0)
{
lean_object* x_354; 
lean_dec(x_343);
lean_dec(x_294);
x_354 = lean_box(0);
return x_354;
}
else
{
lean_object* x_355; lean_object* x_356; 
x_355 = lean_ctor_get(x_353, 0);
lean_inc(x_355);
lean_dec(x_353);
x_356 = l_CakeML_ptree__Expr(x_352, x_294);
if (lean_obj_tag(x_356) == 0)
{
lean_object* x_357; 
lean_dec(x_355);
lean_dec(x_343);
x_357 = lean_box(0);
return x_357;
}
else
{
lean_object* x_358; lean_object* x_359; 
x_358 = lean_ctor_get(x_356, 0);
lean_inc(x_358);
lean_dec(x_356);
x_359 = l_CakeML_ptree__PE(x_343);
if (lean_obj_tag(x_359) == 0)
{
lean_object* x_360; 
lean_dec(x_358);
lean_dec(x_355);
x_360 = lean_box(0);
return x_360;
}
else
{
lean_object* x_361; lean_object* x_362; lean_object* x_363; lean_object* x_364; lean_object* x_365; lean_object* x_366; lean_object* x_367; lean_object* x_368; 
x_361 = lean_ctor_get(x_359, 0);
lean_inc(x_361);
if (lean_is_exclusive(x_359)) {
 lean_ctor_release(x_359, 0);
 x_362 = x_359;
} else {
 lean_dec_ref(x_359);
 x_362 = lean_box(0);
}
x_363 = lean_ctor_get(x_361, 0);
lean_inc(x_363);
x_364 = lean_ctor_get(x_361, 1);
lean_inc(x_364);
if (lean_is_exclusive(x_361)) {
 lean_ctor_release(x_361, 0);
 lean_ctor_release(x_361, 1);
 x_365 = x_361;
} else {
 lean_dec_ref(x_361);
 x_365 = lean_box(0);
}
x_366 = lean_alloc_ctor(8, 3, 0);
lean_ctor_set(x_366, 0, x_355);
lean_ctor_set(x_366, 1, x_358);
lean_ctor_set(x_366, 2, x_363);
if (lean_is_scalar(x_365)) {
 x_367 = lean_alloc_ctor(0, 2, 0);
} else {
 x_367 = x_365;
}
lean_ctor_set(x_367, 0, x_366);
lean_ctor_set(x_367, 1, x_364);
if (lean_is_scalar(x_362)) {
 x_368 = lean_alloc_ctor(1, 1, 0);
} else {
 x_368 = x_362;
}
lean_ctor_set(x_368, 0, x_367);
return x_368;
}
}
}
}
}
else
{
lean_object* x_369; 
lean_dec(x_340);
lean_dec(x_338);
lean_dec(x_296);
lean_dec(x_295);
lean_dec(x_294);
lean_dec(x_293);
lean_dec(x_15);
lean_dec(x_13);
x_369 = lean_box(0);
return x_369;
}
}
}
block_310:
{
uint8_t x_298; lean_object* x_299; 
lean_dec(x_297);
x_298 = 46;
x_299 = l_CakeML_ptree__Expr(x_298, x_15);
if (lean_obj_tag(x_299) == 0)
{
lean_object* x_300; 
lean_dec(x_294);
lean_dec(x_14);
lean_dec(x_5);
x_300 = lean_box(0);
return x_300;
}
else
{
lean_object* x_301; lean_object* x_302; 
x_301 = lean_ctor_get(x_299, 0);
lean_inc(x_301);
lean_dec(x_299);
x_302 = l_CakeML_ptree__PEs(x_294);
if (lean_obj_tag(x_302) == 0)
{
lean_object* x_303; 
lean_dec(x_301);
lean_dec(x_14);
lean_dec(x_5);
x_303 = lean_box(0);
return x_303;
}
else
{
lean_object* x_304; lean_object* x_305; lean_object* x_306; lean_object* x_307; lean_object* x_308; lean_object* x_309; 
x_304 = lean_ctor_get(x_302, 0);
lean_inc(x_304);
if (lean_is_exclusive(x_302)) {
 lean_ctor_release(x_302, 0);
 x_305 = x_302;
} else {
 lean_dec_ref(x_302);
 x_305 = lean_box(0);
}
if (lean_is_scalar(x_14)) {
 x_306 = lean_alloc_ctor(9, 2, 0);
} else {
 x_306 = x_14;
 lean_ctor_set_tag(x_306, 9);
}
lean_ctor_set(x_306, 0, x_301);
lean_ctor_set(x_306, 1, x_304);
x_307 = lean_box(0);
if (lean_is_scalar(x_5)) {
 x_308 = lean_alloc_ctor(0, 2, 0);
} else {
 x_308 = x_5;
 lean_ctor_set_tag(x_308, 0);
}
lean_ctor_set(x_308, 0, x_306);
lean_ctor_set(x_308, 1, x_307);
if (lean_is_scalar(x_305)) {
 x_309 = lean_alloc_ctor(1, 1, 0);
} else {
 x_309 = x_305;
}
lean_ctor_set(x_309, 0, x_308);
return x_309;
}
}
}
}
}
}
block_55:
{
uint8_t x_19; lean_object* x_20; 
lean_dec(x_18);
x_19 = 44;
x_20 = l_CakeML_ptree__Expr(x_19, x_13);
if (lean_obj_tag(x_20) == 0)
{
lean_object* x_21; 
lean_dec(x_17);
lean_dec(x_15);
x_21 = lean_box(0);
return x_21;
}
else
{
lean_object* x_22; lean_object* x_23; 
x_22 = lean_ctor_get(x_20, 0);
lean_inc(x_22);
lean_dec(x_20);
x_23 = l_CakeML_ptree__PEsfx(x_15);
if (lean_obj_tag(x_23) == 0)
{
lean_object* x_24; 
lean_dec(x_22);
lean_dec(x_17);
x_24 = lean_box(0);
return x_24;
}
else
{
uint8_t x_25; 
x_25 = !lean_is_exclusive(x_23);
if (x_25 == 0)
{
lean_object* x_26; lean_object* x_27; uint8_t x_28; 
x_26 = lean_ctor_get(x_23, 0);
x_27 = lean_ctor_get(x_26, 0);
lean_inc(x_27);
x_28 = lean_unbox(x_27);
lean_dec(x_27);
if (x_28 == 0)
{
uint8_t x_29; 
lean_dec(x_17);
x_29 = !lean_is_exclusive(x_26);
if (x_29 == 0)
{
lean_object* x_30; 
x_30 = lean_ctor_get(x_26, 0);
lean_dec(x_30);
lean_ctor_set(x_26, 0, x_22);
return x_23;
}
else
{
lean_object* x_31; lean_object* x_32; 
x_31 = lean_ctor_get(x_26, 1);
lean_inc(x_31);
lean_dec(x_26);
x_32 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_32, 0, x_22);
lean_ctor_set(x_32, 1, x_31);
lean_ctor_set(x_23, 0, x_32);
return x_23;
}
}
else
{
uint8_t x_33; 
x_33 = !lean_is_exclusive(x_26);
if (x_33 == 0)
{
lean_object* x_34; lean_object* x_35; lean_object* x_36; lean_object* x_37; 
x_34 = lean_ctor_get(x_26, 1);
x_35 = lean_ctor_get(x_26, 0);
lean_dec(x_35);
if (lean_is_scalar(x_17)) {
 x_36 = lean_alloc_ctor(1, 2, 0);
} else {
 x_36 = x_17;
}
lean_ctor_set(x_36, 0, x_22);
lean_ctor_set(x_36, 1, x_34);
x_37 = lean_box(0);
lean_ctor_set(x_26, 1, x_37);
lean_ctor_set(x_26, 0, x_36);
return x_23;
}
else
{
lean_object* x_38; lean_object* x_39; lean_object* x_40; lean_object* x_41; 
x_38 = lean_ctor_get(x_26, 1);
lean_inc(x_38);
lean_dec(x_26);
if (lean_is_scalar(x_17)) {
 x_39 = lean_alloc_ctor(1, 2, 0);
} else {
 x_39 = x_17;
}
lean_ctor_set(x_39, 0, x_22);
lean_ctor_set(x_39, 1, x_38);
x_40 = lean_box(0);
x_41 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_41, 0, x_39);
lean_ctor_set(x_41, 1, x_40);
lean_ctor_set(x_23, 0, x_41);
return x_23;
}
}
}
else
{
lean_object* x_42; lean_object* x_43; uint8_t x_44; 
x_42 = lean_ctor_get(x_23, 0);
lean_inc(x_42);
lean_dec(x_23);
x_43 = lean_ctor_get(x_42, 0);
lean_inc(x_43);
x_44 = lean_unbox(x_43);
lean_dec(x_43);
if (x_44 == 0)
{
lean_object* x_45; lean_object* x_46; lean_object* x_47; lean_object* x_48; 
lean_dec(x_17);
x_45 = lean_ctor_get(x_42, 1);
lean_inc(x_45);
if (lean_is_exclusive(x_42)) {
 lean_ctor_release(x_42, 0);
 lean_ctor_release(x_42, 1);
 x_46 = x_42;
} else {
 lean_dec_ref(x_42);
 x_46 = lean_box(0);
}
if (lean_is_scalar(x_46)) {
 x_47 = lean_alloc_ctor(0, 2, 0);
} else {
 x_47 = x_46;
}
lean_ctor_set(x_47, 0, x_22);
lean_ctor_set(x_47, 1, x_45);
x_48 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_48, 0, x_47);
return x_48;
}
else
{
lean_object* x_49; lean_object* x_50; lean_object* x_51; lean_object* x_52; lean_object* x_53; lean_object* x_54; 
x_49 = lean_ctor_get(x_42, 1);
lean_inc(x_49);
if (lean_is_exclusive(x_42)) {
 lean_ctor_release(x_42, 0);
 lean_ctor_release(x_42, 1);
 x_50 = x_42;
} else {
 lean_dec_ref(x_42);
 x_50 = lean_box(0);
}
if (lean_is_scalar(x_17)) {
 x_51 = lean_alloc_ctor(1, 2, 0);
} else {
 x_51 = x_17;
}
lean_ctor_set(x_51, 0, x_22);
lean_ctor_set(x_51, 1, x_49);
x_52 = lean_box(0);
if (lean_is_scalar(x_50)) {
 x_53 = lean_alloc_ctor(0, 2, 0);
} else {
 x_53 = x_50;
}
lean_ctor_set(x_53, 0, x_51);
lean_ctor_set(x_53, 1, x_52);
x_54 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_54, 0, x_53);
return x_54;
}
}
}
}
}
}
}
}
}
}
}
static lean_object* _init_l_CakeML_ptree__PEsfx___closed__1() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_box(0);
x_2 = 0;
x_3 = lean_box(x_2);
x_4 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_1);
return x_4;
}
}
static lean_object* _init_l_CakeML_ptree__PEsfx___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__PEsfx___closed__1;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__PEsfx(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 61;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = l_CakeML_ptree__PEsfx___closed__2;
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; uint8_t x_14; 
x_13 = lean_ctor_get(x_4, 0);
lean_inc(x_13);
lean_dec(x_4);
x_14 = !lean_is_exclusive(x_10);
if (x_14 == 0)
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; uint8_t x_18; 
x_15 = lean_ctor_get(x_10, 0);
x_16 = lean_ctor_get(x_10, 1);
lean_dec(x_16);
x_17 = lean_box(32);
lean_inc(x_13);
x_18 = l_CakeML_tokcheck(x_13, x_17);
if (x_18 == 0)
{
lean_object* x_19; uint8_t x_20; 
x_19 = lean_box(19);
x_20 = l_CakeML_tokcheck(x_13, x_19);
if (x_20 == 0)
{
lean_object* x_21; 
lean_free_object(x_10);
lean_dec(x_15);
x_21 = lean_box(0);
return x_21;
}
else
{
lean_object* x_22; 
x_22 = l_CakeML_ptree__PEs(x_15);
if (lean_obj_tag(x_22) == 0)
{
lean_object* x_23; 
lean_free_object(x_10);
x_23 = lean_box(0);
return x_23;
}
else
{
uint8_t x_24; 
x_24 = !lean_is_exclusive(x_22);
if (x_24 == 0)
{
lean_object* x_25; uint8_t x_26; lean_object* x_27; 
x_25 = lean_ctor_get(x_22, 0);
x_26 = 0;
x_27 = lean_box(x_26);
lean_ctor_set_tag(x_10, 0);
lean_ctor_set(x_10, 1, x_25);
lean_ctor_set(x_10, 0, x_27);
lean_ctor_set(x_22, 0, x_10);
return x_22;
}
else
{
lean_object* x_28; uint8_t x_29; lean_object* x_30; lean_object* x_31; 
x_28 = lean_ctor_get(x_22, 0);
lean_inc(x_28);
lean_dec(x_22);
x_29 = 0;
x_30 = lean_box(x_29);
lean_ctor_set_tag(x_10, 0);
lean_ctor_set(x_10, 1, x_28);
lean_ctor_set(x_10, 0, x_30);
x_31 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_31, 0, x_10);
return x_31;
}
}
}
}
else
{
lean_object* x_32; 
lean_dec(x_13);
x_32 = l_CakeML_ptree__PEs(x_15);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; 
lean_free_object(x_10);
x_33 = lean_box(0);
return x_33;
}
else
{
uint8_t x_34; 
x_34 = !lean_is_exclusive(x_32);
if (x_34 == 0)
{
lean_object* x_35; uint8_t x_36; lean_object* x_37; 
x_35 = lean_ctor_get(x_32, 0);
x_36 = 1;
x_37 = lean_box(x_36);
lean_ctor_set_tag(x_10, 0);
lean_ctor_set(x_10, 1, x_35);
lean_ctor_set(x_10, 0, x_37);
lean_ctor_set(x_32, 0, x_10);
return x_32;
}
else
{
lean_object* x_38; uint8_t x_39; lean_object* x_40; lean_object* x_41; 
x_38 = lean_ctor_get(x_32, 0);
lean_inc(x_38);
lean_dec(x_32);
x_39 = 1;
x_40 = lean_box(x_39);
lean_ctor_set_tag(x_10, 0);
lean_ctor_set(x_10, 1, x_38);
lean_ctor_set(x_10, 0, x_40);
x_41 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_41, 0, x_10);
return x_41;
}
}
}
}
else
{
lean_object* x_42; lean_object* x_43; uint8_t x_44; 
x_42 = lean_ctor_get(x_10, 0);
lean_inc(x_42);
lean_dec(x_10);
x_43 = lean_box(32);
lean_inc(x_13);
x_44 = l_CakeML_tokcheck(x_13, x_43);
if (x_44 == 0)
{
lean_object* x_45; uint8_t x_46; 
x_45 = lean_box(19);
x_46 = l_CakeML_tokcheck(x_13, x_45);
if (x_46 == 0)
{
lean_object* x_47; 
lean_dec(x_42);
x_47 = lean_box(0);
return x_47;
}
else
{
lean_object* x_48; 
x_48 = l_CakeML_ptree__PEs(x_42);
if (lean_obj_tag(x_48) == 0)
{
lean_object* x_49; 
x_49 = lean_box(0);
return x_49;
}
else
{
lean_object* x_50; lean_object* x_51; uint8_t x_52; lean_object* x_53; lean_object* x_54; lean_object* x_55; 
x_50 = lean_ctor_get(x_48, 0);
lean_inc(x_50);
if (lean_is_exclusive(x_48)) {
 lean_ctor_release(x_48, 0);
 x_51 = x_48;
} else {
 lean_dec_ref(x_48);
 x_51 = lean_box(0);
}
x_52 = 0;
x_53 = lean_box(x_52);
x_54 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_54, 0, x_53);
lean_ctor_set(x_54, 1, x_50);
if (lean_is_scalar(x_51)) {
 x_55 = lean_alloc_ctor(1, 1, 0);
} else {
 x_55 = x_51;
}
lean_ctor_set(x_55, 0, x_54);
return x_55;
}
}
}
else
{
lean_object* x_56; 
lean_dec(x_13);
x_56 = l_CakeML_ptree__PEs(x_42);
if (lean_obj_tag(x_56) == 0)
{
lean_object* x_57; 
x_57 = lean_box(0);
return x_57;
}
else
{
lean_object* x_58; lean_object* x_59; uint8_t x_60; lean_object* x_61; lean_object* x_62; lean_object* x_63; 
x_58 = lean_ctor_get(x_56, 0);
lean_inc(x_58);
if (lean_is_exclusive(x_56)) {
 lean_ctor_release(x_56, 0);
 x_59 = x_56;
} else {
 lean_dec_ref(x_56);
 x_59 = lean_box(0);
}
x_60 = 1;
x_61 = lean_box(x_60);
x_62 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_62, 0, x_61);
lean_ctor_set(x_62, 1, x_58);
if (lean_is_scalar(x_59)) {
 x_63 = lean_alloc_ctor(1, 1, 0);
} else {
 x_63 = x_59;
}
lean_ctor_set(x_63, 0, x_62);
return x_63;
}
}
}
}
else
{
lean_object* x_64; 
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_64 = lean_box(0);
return x_64;
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__LetDecs(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 50;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = l_CakeML_ptree__TbaseList___closed__1;
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; uint8_t x_14; 
x_13 = lean_ctor_get(x_4, 0);
lean_inc(x_13);
lean_dec(x_4);
x_14 = !lean_is_exclusive(x_10);
if (x_14 == 0)
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; uint8_t x_18; 
x_15 = lean_ctor_get(x_10, 0);
x_16 = lean_ctor_get(x_10, 1);
lean_dec(x_16);
x_17 = lean_box(12);
lean_inc(x_13);
x_18 = l_CakeML_tokcheck(x_13, x_17);
if (x_18 == 0)
{
lean_object* x_19; 
x_19 = l_CakeML_ptree__LetDec(x_13);
if (lean_obj_tag(x_19) == 0)
{
lean_object* x_20; 
lean_free_object(x_10);
lean_dec(x_15);
x_20 = lean_box(0);
return x_20;
}
else
{
lean_object* x_21; lean_object* x_22; 
x_21 = lean_ctor_get(x_19, 0);
lean_inc(x_21);
lean_dec(x_19);
x_22 = l_CakeML_ptree__LetDecs(x_15);
if (lean_obj_tag(x_22) == 0)
{
lean_object* x_23; 
lean_dec(x_21);
lean_free_object(x_10);
x_23 = lean_box(0);
return x_23;
}
else
{
uint8_t x_24; 
x_24 = !lean_is_exclusive(x_22);
if (x_24 == 0)
{
lean_object* x_25; 
x_25 = lean_ctor_get(x_22, 0);
lean_ctor_set(x_10, 1, x_25);
lean_ctor_set(x_10, 0, x_21);
lean_ctor_set(x_22, 0, x_10);
return x_22;
}
else
{
lean_object* x_26; lean_object* x_27; 
x_26 = lean_ctor_get(x_22, 0);
lean_inc(x_26);
lean_dec(x_22);
lean_ctor_set(x_10, 1, x_26);
lean_ctor_set(x_10, 0, x_21);
x_27 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_27, 0, x_10);
return x_27;
}
}
}
}
else
{
lean_free_object(x_10);
lean_dec(x_13);
x_1 = x_15;
goto _start;
}
}
else
{
lean_object* x_29; lean_object* x_30; uint8_t x_31; 
x_29 = lean_ctor_get(x_10, 0);
lean_inc(x_29);
lean_dec(x_10);
x_30 = lean_box(12);
lean_inc(x_13);
x_31 = l_CakeML_tokcheck(x_13, x_30);
if (x_31 == 0)
{
lean_object* x_32; 
x_32 = l_CakeML_ptree__LetDec(x_13);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; 
lean_dec(x_29);
x_33 = lean_box(0);
return x_33;
}
else
{
lean_object* x_34; lean_object* x_35; 
x_34 = lean_ctor_get(x_32, 0);
lean_inc(x_34);
lean_dec(x_32);
x_35 = l_CakeML_ptree__LetDecs(x_29);
if (lean_obj_tag(x_35) == 0)
{
lean_object* x_36; 
lean_dec(x_34);
x_36 = lean_box(0);
return x_36;
}
else
{
lean_object* x_37; lean_object* x_38; lean_object* x_39; lean_object* x_40; 
x_37 = lean_ctor_get(x_35, 0);
lean_inc(x_37);
if (lean_is_exclusive(x_35)) {
 lean_ctor_release(x_35, 0);
 x_38 = x_35;
} else {
 lean_dec_ref(x_35);
 x_38 = lean_box(0);
}
x_39 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_39, 0, x_34);
lean_ctor_set(x_39, 1, x_37);
if (lean_is_scalar(x_38)) {
 x_40 = lean_alloc_ctor(1, 1, 0);
} else {
 x_40 = x_38;
}
lean_ctor_set(x_40, 0, x_39);
return x_40;
}
}
}
else
{
lean_dec(x_13);
x_1 = x_29;
goto _start;
}
}
}
else
{
lean_object* x_42; 
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_42 = lean_box(0);
return x_42;
}
}
}
}
}
}
}
static lean_object* _init_l_CakeML_ptree__LetDec___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(51);
x_2 = l_CakeML_ptree__Op___closed__14;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__LetDec(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 49;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; lean_object* x_14; lean_object* x_15; uint8_t x_16; 
x_13 = lean_ctor_get(x_4, 0);
lean_inc(x_13);
lean_dec(x_4);
x_14 = lean_ctor_get(x_10, 0);
lean_inc(x_14);
lean_dec(x_10);
x_15 = lean_box(31);
x_16 = l_CakeML_tokcheck(x_13, x_15);
if (x_16 == 0)
{
lean_object* x_17; 
lean_dec(x_14);
x_17 = lean_box(0);
return x_17;
}
else
{
lean_object* x_18; 
x_18 = l_CakeML_ptree__AndFDecls(x_14);
if (lean_obj_tag(x_18) == 0)
{
lean_object* x_19; 
x_19 = lean_box(0);
return x_19;
}
else
{
uint8_t x_20; 
x_20 = !lean_is_exclusive(x_18);
if (x_20 == 0)
{
lean_object* x_21; lean_object* x_22; 
x_21 = lean_ctor_get(x_18, 0);
x_22 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_22, 0, x_21);
lean_ctor_set(x_18, 0, x_22);
return x_18;
}
else
{
lean_object* x_23; lean_object* x_24; lean_object* x_25; 
x_23 = lean_ctor_get(x_18, 0);
lean_inc(x_23);
lean_dec(x_18);
x_24 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_24, 0, x_23);
x_25 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_25, 0, x_24);
return x_25;
}
}
}
}
else
{
lean_object* x_26; 
x_26 = lean_ctor_get(x_12, 1);
lean_inc(x_26);
if (lean_obj_tag(x_26) == 0)
{
lean_object* x_27; 
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_27 = lean_box(0);
return x_27;
}
else
{
lean_object* x_28; 
x_28 = lean_ctor_get(x_26, 1);
lean_inc(x_28);
if (lean_obj_tag(x_28) == 0)
{
lean_object* x_29; uint8_t x_30; 
x_29 = lean_ctor_get(x_4, 0);
lean_inc(x_29);
lean_dec(x_4);
x_30 = !lean_is_exclusive(x_10);
if (x_30 == 0)
{
lean_object* x_31; lean_object* x_32; uint8_t x_33; 
x_31 = lean_ctor_get(x_10, 0);
x_32 = lean_ctor_get(x_10, 1);
lean_dec(x_32);
x_33 = !lean_is_exclusive(x_12);
if (x_33 == 0)
{
lean_object* x_34; lean_object* x_35; uint8_t x_36; 
x_34 = lean_ctor_get(x_12, 0);
x_35 = lean_ctor_get(x_12, 1);
lean_dec(x_35);
x_36 = !lean_is_exclusive(x_26);
if (x_36 == 0)
{
lean_object* x_37; lean_object* x_38; lean_object* x_39; lean_object* x_40; uint8_t x_41; 
x_37 = lean_ctor_get(x_26, 0);
x_38 = lean_ctor_get(x_26, 1);
lean_dec(x_38);
x_39 = lean_box(0);
lean_ctor_set(x_26, 1, x_39);
lean_ctor_set(x_26, 0, x_34);
lean_ctor_set(x_12, 0, x_29);
x_40 = l_CakeML_ptree__LetDec___closed__1;
x_41 = l_CakeML_tokcheckl(x_12, x_40);
if (x_41 == 0)
{
lean_object* x_42; 
lean_dec(x_37);
lean_free_object(x_10);
lean_dec(x_31);
x_42 = lean_box(0);
return x_42;
}
else
{
uint8_t x_43; lean_object* x_44; 
x_43 = 56;
x_44 = l_CakeML_ptree__Pattern(x_43, x_31);
if (lean_obj_tag(x_44) == 0)
{
lean_object* x_45; 
lean_dec(x_37);
lean_free_object(x_10);
x_45 = lean_box(0);
return x_45;
}
else
{
uint8_t x_46; 
x_46 = !lean_is_exclusive(x_44);
if (x_46 == 0)
{
lean_object* x_47; uint8_t x_48; lean_object* x_49; 
x_47 = lean_ctor_get(x_44, 0);
x_48 = 46;
x_49 = l_CakeML_ptree__Expr(x_48, x_37);
if (lean_obj_tag(x_49) == 0)
{
lean_object* x_50; 
lean_free_object(x_44);
lean_dec(x_47);
lean_free_object(x_10);
x_50 = lean_box(0);
return x_50;
}
else
{
uint8_t x_51; 
x_51 = !lean_is_exclusive(x_49);
if (x_51 == 0)
{
lean_object* x_52; 
x_52 = lean_ctor_get(x_49, 0);
lean_ctor_set_tag(x_10, 0);
lean_ctor_set(x_10, 1, x_52);
lean_ctor_set(x_10, 0, x_47);
lean_ctor_set_tag(x_44, 0);
lean_ctor_set(x_44, 0, x_10);
lean_ctor_set(x_49, 0, x_44);
return x_49;
}
else
{
lean_object* x_53; lean_object* x_54; 
x_53 = lean_ctor_get(x_49, 0);
lean_inc(x_53);
lean_dec(x_49);
lean_ctor_set_tag(x_10, 0);
lean_ctor_set(x_10, 1, x_53);
lean_ctor_set(x_10, 0, x_47);
lean_ctor_set_tag(x_44, 0);
lean_ctor_set(x_44, 0, x_10);
x_54 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_54, 0, x_44);
return x_54;
}
}
}
else
{
lean_object* x_55; uint8_t x_56; lean_object* x_57; 
x_55 = lean_ctor_get(x_44, 0);
lean_inc(x_55);
lean_dec(x_44);
x_56 = 46;
x_57 = l_CakeML_ptree__Expr(x_56, x_37);
if (lean_obj_tag(x_57) == 0)
{
lean_object* x_58; 
lean_dec(x_55);
lean_free_object(x_10);
x_58 = lean_box(0);
return x_58;
}
else
{
lean_object* x_59; lean_object* x_60; lean_object* x_61; lean_object* x_62; 
x_59 = lean_ctor_get(x_57, 0);
lean_inc(x_59);
if (lean_is_exclusive(x_57)) {
 lean_ctor_release(x_57, 0);
 x_60 = x_57;
} else {
 lean_dec_ref(x_57);
 x_60 = lean_box(0);
}
lean_ctor_set_tag(x_10, 0);
lean_ctor_set(x_10, 1, x_59);
lean_ctor_set(x_10, 0, x_55);
x_61 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_61, 0, x_10);
if (lean_is_scalar(x_60)) {
 x_62 = lean_alloc_ctor(1, 1, 0);
} else {
 x_62 = x_60;
}
lean_ctor_set(x_62, 0, x_61);
return x_62;
}
}
}
}
}
else
{
lean_object* x_63; lean_object* x_64; lean_object* x_65; lean_object* x_66; uint8_t x_67; 
x_63 = lean_ctor_get(x_26, 0);
lean_inc(x_63);
lean_dec(x_26);
x_64 = lean_box(0);
x_65 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_65, 0, x_34);
lean_ctor_set(x_65, 1, x_64);
lean_ctor_set(x_12, 1, x_65);
lean_ctor_set(x_12, 0, x_29);
x_66 = l_CakeML_ptree__LetDec___closed__1;
x_67 = l_CakeML_tokcheckl(x_12, x_66);
if (x_67 == 0)
{
lean_object* x_68; 
lean_dec(x_63);
lean_free_object(x_10);
lean_dec(x_31);
x_68 = lean_box(0);
return x_68;
}
else
{
uint8_t x_69; lean_object* x_70; 
x_69 = 56;
x_70 = l_CakeML_ptree__Pattern(x_69, x_31);
if (lean_obj_tag(x_70) == 0)
{
lean_object* x_71; 
lean_dec(x_63);
lean_free_object(x_10);
x_71 = lean_box(0);
return x_71;
}
else
{
lean_object* x_72; lean_object* x_73; uint8_t x_74; lean_object* x_75; 
x_72 = lean_ctor_get(x_70, 0);
lean_inc(x_72);
if (lean_is_exclusive(x_70)) {
 lean_ctor_release(x_70, 0);
 x_73 = x_70;
} else {
 lean_dec_ref(x_70);
 x_73 = lean_box(0);
}
x_74 = 46;
x_75 = l_CakeML_ptree__Expr(x_74, x_63);
if (lean_obj_tag(x_75) == 0)
{
lean_object* x_76; 
lean_dec(x_73);
lean_dec(x_72);
lean_free_object(x_10);
x_76 = lean_box(0);
return x_76;
}
else
{
lean_object* x_77; lean_object* x_78; lean_object* x_79; lean_object* x_80; 
x_77 = lean_ctor_get(x_75, 0);
lean_inc(x_77);
if (lean_is_exclusive(x_75)) {
 lean_ctor_release(x_75, 0);
 x_78 = x_75;
} else {
 lean_dec_ref(x_75);
 x_78 = lean_box(0);
}
lean_ctor_set_tag(x_10, 0);
lean_ctor_set(x_10, 1, x_77);
lean_ctor_set(x_10, 0, x_72);
if (lean_is_scalar(x_73)) {
 x_79 = lean_alloc_ctor(0, 1, 0);
} else {
 x_79 = x_73;
 lean_ctor_set_tag(x_79, 0);
}
lean_ctor_set(x_79, 0, x_10);
if (lean_is_scalar(x_78)) {
 x_80 = lean_alloc_ctor(1, 1, 0);
} else {
 x_80 = x_78;
}
lean_ctor_set(x_80, 0, x_79);
return x_80;
}
}
}
}
}
else
{
lean_object* x_81; lean_object* x_82; lean_object* x_83; lean_object* x_84; lean_object* x_85; lean_object* x_86; lean_object* x_87; uint8_t x_88; 
x_81 = lean_ctor_get(x_12, 0);
lean_inc(x_81);
lean_dec(x_12);
x_82 = lean_ctor_get(x_26, 0);
lean_inc(x_82);
if (lean_is_exclusive(x_26)) {
 lean_ctor_release(x_26, 0);
 lean_ctor_release(x_26, 1);
 x_83 = x_26;
} else {
 lean_dec_ref(x_26);
 x_83 = lean_box(0);
}
x_84 = lean_box(0);
if (lean_is_scalar(x_83)) {
 x_85 = lean_alloc_ctor(1, 2, 0);
} else {
 x_85 = x_83;
}
lean_ctor_set(x_85, 0, x_81);
lean_ctor_set(x_85, 1, x_84);
x_86 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_86, 0, x_29);
lean_ctor_set(x_86, 1, x_85);
x_87 = l_CakeML_ptree__LetDec___closed__1;
x_88 = l_CakeML_tokcheckl(x_86, x_87);
if (x_88 == 0)
{
lean_object* x_89; 
lean_dec(x_82);
lean_free_object(x_10);
lean_dec(x_31);
x_89 = lean_box(0);
return x_89;
}
else
{
uint8_t x_90; lean_object* x_91; 
x_90 = 56;
x_91 = l_CakeML_ptree__Pattern(x_90, x_31);
if (lean_obj_tag(x_91) == 0)
{
lean_object* x_92; 
lean_dec(x_82);
lean_free_object(x_10);
x_92 = lean_box(0);
return x_92;
}
else
{
lean_object* x_93; lean_object* x_94; uint8_t x_95; lean_object* x_96; 
x_93 = lean_ctor_get(x_91, 0);
lean_inc(x_93);
if (lean_is_exclusive(x_91)) {
 lean_ctor_release(x_91, 0);
 x_94 = x_91;
} else {
 lean_dec_ref(x_91);
 x_94 = lean_box(0);
}
x_95 = 46;
x_96 = l_CakeML_ptree__Expr(x_95, x_82);
if (lean_obj_tag(x_96) == 0)
{
lean_object* x_97; 
lean_dec(x_94);
lean_dec(x_93);
lean_free_object(x_10);
x_97 = lean_box(0);
return x_97;
}
else
{
lean_object* x_98; lean_object* x_99; lean_object* x_100; lean_object* x_101; 
x_98 = lean_ctor_get(x_96, 0);
lean_inc(x_98);
if (lean_is_exclusive(x_96)) {
 lean_ctor_release(x_96, 0);
 x_99 = x_96;
} else {
 lean_dec_ref(x_96);
 x_99 = lean_box(0);
}
lean_ctor_set_tag(x_10, 0);
lean_ctor_set(x_10, 1, x_98);
lean_ctor_set(x_10, 0, x_93);
if (lean_is_scalar(x_94)) {
 x_100 = lean_alloc_ctor(0, 1, 0);
} else {
 x_100 = x_94;
 lean_ctor_set_tag(x_100, 0);
}
lean_ctor_set(x_100, 0, x_10);
if (lean_is_scalar(x_99)) {
 x_101 = lean_alloc_ctor(1, 1, 0);
} else {
 x_101 = x_99;
}
lean_ctor_set(x_101, 0, x_100);
return x_101;
}
}
}
}
}
else
{
lean_object* x_102; lean_object* x_103; lean_object* x_104; lean_object* x_105; lean_object* x_106; lean_object* x_107; lean_object* x_108; lean_object* x_109; lean_object* x_110; uint8_t x_111; 
x_102 = lean_ctor_get(x_10, 0);
lean_inc(x_102);
lean_dec(x_10);
x_103 = lean_ctor_get(x_12, 0);
lean_inc(x_103);
if (lean_is_exclusive(x_12)) {
 lean_ctor_release(x_12, 0);
 lean_ctor_release(x_12, 1);
 x_104 = x_12;
} else {
 lean_dec_ref(x_12);
 x_104 = lean_box(0);
}
x_105 = lean_ctor_get(x_26, 0);
lean_inc(x_105);
if (lean_is_exclusive(x_26)) {
 lean_ctor_release(x_26, 0);
 lean_ctor_release(x_26, 1);
 x_106 = x_26;
} else {
 lean_dec_ref(x_26);
 x_106 = lean_box(0);
}
x_107 = lean_box(0);
if (lean_is_scalar(x_106)) {
 x_108 = lean_alloc_ctor(1, 2, 0);
} else {
 x_108 = x_106;
}
lean_ctor_set(x_108, 0, x_103);
lean_ctor_set(x_108, 1, x_107);
if (lean_is_scalar(x_104)) {
 x_109 = lean_alloc_ctor(1, 2, 0);
} else {
 x_109 = x_104;
}
lean_ctor_set(x_109, 0, x_29);
lean_ctor_set(x_109, 1, x_108);
x_110 = l_CakeML_ptree__LetDec___closed__1;
x_111 = l_CakeML_tokcheckl(x_109, x_110);
if (x_111 == 0)
{
lean_object* x_112; 
lean_dec(x_105);
lean_dec(x_102);
x_112 = lean_box(0);
return x_112;
}
else
{
uint8_t x_113; lean_object* x_114; 
x_113 = 56;
x_114 = l_CakeML_ptree__Pattern(x_113, x_102);
if (lean_obj_tag(x_114) == 0)
{
lean_object* x_115; 
lean_dec(x_105);
x_115 = lean_box(0);
return x_115;
}
else
{
lean_object* x_116; lean_object* x_117; uint8_t x_118; lean_object* x_119; 
x_116 = lean_ctor_get(x_114, 0);
lean_inc(x_116);
if (lean_is_exclusive(x_114)) {
 lean_ctor_release(x_114, 0);
 x_117 = x_114;
} else {
 lean_dec_ref(x_114);
 x_117 = lean_box(0);
}
x_118 = 46;
x_119 = l_CakeML_ptree__Expr(x_118, x_105);
if (lean_obj_tag(x_119) == 0)
{
lean_object* x_120; 
lean_dec(x_117);
lean_dec(x_116);
x_120 = lean_box(0);
return x_120;
}
else
{
lean_object* x_121; lean_object* x_122; lean_object* x_123; lean_object* x_124; lean_object* x_125; 
x_121 = lean_ctor_get(x_119, 0);
lean_inc(x_121);
if (lean_is_exclusive(x_119)) {
 lean_ctor_release(x_119, 0);
 x_122 = x_119;
} else {
 lean_dec_ref(x_119);
 x_122 = lean_box(0);
}
x_123 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_123, 0, x_116);
lean_ctor_set(x_123, 1, x_121);
if (lean_is_scalar(x_117)) {
 x_124 = lean_alloc_ctor(0, 1, 0);
} else {
 x_124 = x_117;
 lean_ctor_set_tag(x_124, 0);
}
lean_ctor_set(x_124, 0, x_123);
if (lean_is_scalar(x_122)) {
 x_125 = lean_alloc_ctor(1, 1, 0);
} else {
 x_125 = x_122;
}
lean_ctor_set(x_125, 0, x_124);
return x_125;
}
}
}
}
}
else
{
lean_object* x_126; 
lean_dec(x_28);
lean_dec(x_26);
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_126 = lean_box(0);
return x_126;
}
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__AndFDecls(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 48;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_4);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_12 = lean_ctor_get(x_4, 0);
x_13 = lean_ctor_get(x_4, 1);
lean_dec(x_13);
x_14 = l_CakeML_ptree__FDecl(x_12);
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_15; 
lean_free_object(x_4);
x_15 = lean_box(0);
return x_15;
}
else
{
uint8_t x_16; 
x_16 = !lean_is_exclusive(x_14);
if (x_16 == 0)
{
lean_object* x_17; lean_object* x_18; 
x_17 = lean_ctor_get(x_14, 0);
x_18 = lean_box(0);
lean_ctor_set(x_4, 1, x_18);
lean_ctor_set(x_4, 0, x_17);
lean_ctor_set(x_14, 0, x_4);
return x_14;
}
else
{
lean_object* x_19; lean_object* x_20; lean_object* x_21; 
x_19 = lean_ctor_get(x_14, 0);
lean_inc(x_19);
lean_dec(x_14);
x_20 = lean_box(0);
lean_ctor_set(x_4, 1, x_20);
lean_ctor_set(x_4, 0, x_19);
x_21 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_21, 0, x_4);
return x_21;
}
}
}
else
{
lean_object* x_22; lean_object* x_23; 
x_22 = lean_ctor_get(x_4, 0);
lean_inc(x_22);
lean_dec(x_4);
x_23 = l_CakeML_ptree__FDecl(x_22);
if (lean_obj_tag(x_23) == 0)
{
lean_object* x_24; 
x_24 = lean_box(0);
return x_24;
}
else
{
lean_object* x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; 
x_25 = lean_ctor_get(x_23, 0);
lean_inc(x_25);
if (lean_is_exclusive(x_23)) {
 lean_ctor_release(x_23, 0);
 x_26 = x_23;
} else {
 lean_dec_ref(x_23);
 x_26 = lean_box(0);
}
x_27 = lean_box(0);
x_28 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_28, 0, x_25);
lean_ctor_set(x_28, 1, x_27);
if (lean_is_scalar(x_26)) {
 x_29 = lean_alloc_ctor(1, 1, 0);
} else {
 x_29 = x_26;
}
lean_ctor_set(x_29, 0, x_28);
return x_29;
}
}
}
else
{
lean_object* x_30; 
x_30 = lean_ctor_get(x_10, 1);
lean_inc(x_30);
if (lean_obj_tag(x_30) == 0)
{
lean_object* x_31; 
lean_dec(x_10);
lean_dec(x_4);
x_31 = lean_box(0);
return x_31;
}
else
{
lean_object* x_32; 
x_32 = lean_ctor_get(x_30, 1);
lean_inc(x_32);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; lean_object* x_34; uint8_t x_35; 
x_33 = lean_ctor_get(x_4, 0);
lean_inc(x_33);
lean_dec(x_4);
x_34 = lean_ctor_get(x_10, 0);
lean_inc(x_34);
lean_dec(x_10);
x_35 = !lean_is_exclusive(x_30);
if (x_35 == 0)
{
lean_object* x_36; lean_object* x_37; lean_object* x_38; uint8_t x_39; 
x_36 = lean_ctor_get(x_30, 0);
x_37 = lean_ctor_get(x_30, 1);
lean_dec(x_37);
x_38 = lean_box(21);
x_39 = l_CakeML_tokcheck(x_34, x_38);
if (x_39 == 0)
{
lean_object* x_40; 
lean_free_object(x_30);
lean_dec(x_36);
lean_dec(x_33);
x_40 = lean_box(0);
return x_40;
}
else
{
lean_object* x_41; 
x_41 = l_CakeML_ptree__AndFDecls(x_33);
if (lean_obj_tag(x_41) == 0)
{
lean_object* x_42; 
lean_free_object(x_30);
lean_dec(x_36);
x_42 = lean_box(0);
return x_42;
}
else
{
lean_object* x_43; lean_object* x_44; 
x_43 = lean_ctor_get(x_41, 0);
lean_inc(x_43);
lean_dec(x_41);
x_44 = l_CakeML_ptree__FDecl(x_36);
if (lean_obj_tag(x_44) == 0)
{
lean_object* x_45; 
lean_dec(x_43);
lean_free_object(x_30);
x_45 = lean_box(0);
return x_45;
}
else
{
uint8_t x_46; 
x_46 = !lean_is_exclusive(x_44);
if (x_46 == 0)
{
lean_object* x_47; lean_object* x_48; lean_object* x_49; 
x_47 = lean_ctor_get(x_44, 0);
x_48 = lean_box(0);
lean_ctor_set(x_30, 1, x_48);
lean_ctor_set(x_30, 0, x_47);
x_49 = l_List_appendTR___rarg(x_43, x_30);
lean_ctor_set(x_44, 0, x_49);
return x_44;
}
else
{
lean_object* x_50; lean_object* x_51; lean_object* x_52; lean_object* x_53; 
x_50 = lean_ctor_get(x_44, 0);
lean_inc(x_50);
lean_dec(x_44);
x_51 = lean_box(0);
lean_ctor_set(x_30, 1, x_51);
lean_ctor_set(x_30, 0, x_50);
x_52 = l_List_appendTR___rarg(x_43, x_30);
x_53 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_53, 0, x_52);
return x_53;
}
}
}
}
}
else
{
lean_object* x_54; lean_object* x_55; uint8_t x_56; 
x_54 = lean_ctor_get(x_30, 0);
lean_inc(x_54);
lean_dec(x_30);
x_55 = lean_box(21);
x_56 = l_CakeML_tokcheck(x_34, x_55);
if (x_56 == 0)
{
lean_object* x_57; 
lean_dec(x_54);
lean_dec(x_33);
x_57 = lean_box(0);
return x_57;
}
else
{
lean_object* x_58; 
x_58 = l_CakeML_ptree__AndFDecls(x_33);
if (lean_obj_tag(x_58) == 0)
{
lean_object* x_59; 
lean_dec(x_54);
x_59 = lean_box(0);
return x_59;
}
else
{
lean_object* x_60; lean_object* x_61; 
x_60 = lean_ctor_get(x_58, 0);
lean_inc(x_60);
lean_dec(x_58);
x_61 = l_CakeML_ptree__FDecl(x_54);
if (lean_obj_tag(x_61) == 0)
{
lean_object* x_62; 
lean_dec(x_60);
x_62 = lean_box(0);
return x_62;
}
else
{
lean_object* x_63; lean_object* x_64; lean_object* x_65; lean_object* x_66; lean_object* x_67; lean_object* x_68; 
x_63 = lean_ctor_get(x_61, 0);
lean_inc(x_63);
if (lean_is_exclusive(x_61)) {
 lean_ctor_release(x_61, 0);
 x_64 = x_61;
} else {
 lean_dec_ref(x_61);
 x_64 = lean_box(0);
}
x_65 = lean_box(0);
x_66 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_66, 0, x_63);
lean_ctor_set(x_66, 1, x_65);
x_67 = l_List_appendTR___rarg(x_60, x_66);
if (lean_is_scalar(x_64)) {
 x_68 = lean_alloc_ctor(1, 1, 0);
} else {
 x_68 = x_64;
}
lean_ctor_set(x_68, 0, x_67);
return x_68;
}
}
}
}
}
else
{
lean_object* x_69; 
lean_dec(x_32);
lean_dec(x_30);
lean_dec(x_10);
lean_dec(x_4);
x_69 = lean_box(0);
return x_69;
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__FDecl___spec__2(lean_object* x_1, size_t x_2, size_t x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; 
x_5 = lean_usize_dec_eq(x_2, x_3);
if (x_5 == 0)
{
size_t x_6; size_t x_7; lean_object* x_8; lean_object* x_9; 
x_6 = 1;
x_7 = lean_usize_sub(x_2, x_6);
x_8 = lean_array_uget(x_1, x_7);
x_9 = l_CakeML_mkFun(x_8, x_4);
x_2 = x_7;
x_4 = x_9;
goto _start;
}
else
{
return x_4;
}
}
}
LEAN_EXPORT lean_object* l_List_foldrTR___at_CakeML_ptree__FDecl___spec__1(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; uint8_t x_6; 
x_3 = lean_array_mk(x_2);
x_4 = lean_array_get_size(x_3);
x_5 = lean_unsigned_to_nat(0u);
x_6 = lean_nat_dec_lt(x_5, x_4);
if (x_6 == 0)
{
lean_dec(x_4);
lean_dec(x_3);
return x_1;
}
else
{
size_t x_7; size_t x_8; lean_object* x_9; 
x_7 = lean_usize_of_nat(x_4);
lean_dec(x_4);
x_8 = 0;
x_9 = l_Array_foldrMUnsafe_fold___at_CakeML_ptree__FDecl___spec__2(x_3, x_7, x_8, x_1);
lean_dec(x_3);
return x_9;
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__FDecl(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 47;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
lean_dec(x_10);
lean_dec(x_4);
x_13 = lean_box(0);
return x_13;
}
else
{
lean_object* x_14; 
x_14 = lean_ctor_get(x_12, 1);
lean_inc(x_14);
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_15; 
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_15 = lean_box(0);
return x_15;
}
else
{
lean_object* x_16; 
x_16 = lean_ctor_get(x_14, 1);
lean_inc(x_16);
if (lean_obj_tag(x_16) == 0)
{
lean_object* x_17; lean_object* x_18; lean_object* x_19; uint8_t x_20; 
x_17 = lean_ctor_get(x_4, 0);
lean_inc(x_17);
lean_dec(x_4);
x_18 = lean_ctor_get(x_10, 0);
lean_inc(x_18);
lean_dec(x_10);
x_19 = lean_ctor_get(x_12, 0);
lean_inc(x_19);
lean_dec(x_12);
x_20 = !lean_is_exclusive(x_14);
if (x_20 == 0)
{
lean_object* x_21; lean_object* x_22; lean_object* x_23; uint8_t x_24; 
x_21 = lean_ctor_get(x_14, 0);
x_22 = lean_ctor_get(x_14, 1);
lean_dec(x_22);
x_23 = lean_box(13);
x_24 = l_CakeML_tokcheck(x_19, x_23);
if (x_24 == 0)
{
lean_object* x_25; 
lean_free_object(x_14);
lean_dec(x_21);
lean_dec(x_18);
lean_dec(x_17);
x_25 = lean_box(0);
return x_25;
}
else
{
lean_object* x_26; 
x_26 = l_CakeML_ptree__V(x_17);
if (lean_obj_tag(x_26) == 0)
{
lean_object* x_27; 
lean_free_object(x_14);
lean_dec(x_21);
lean_dec(x_18);
x_27 = lean_box(0);
return x_27;
}
else
{
lean_object* x_28; lean_object* x_29; 
x_28 = lean_ctor_get(x_26, 0);
lean_inc(x_28);
lean_dec(x_26);
x_29 = l_CakeML_ptree__PbaseList1(x_18);
if (lean_obj_tag(x_29) == 0)
{
lean_object* x_30; 
lean_dec(x_28);
lean_free_object(x_14);
lean_dec(x_21);
x_30 = lean_box(0);
return x_30;
}
else
{
lean_object* x_31; lean_object* x_32; 
x_31 = lean_ctor_get(x_29, 0);
lean_inc(x_31);
lean_dec(x_29);
x_32 = l_List_head_x3f___rarg(x_31);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; 
lean_dec(x_31);
lean_dec(x_28);
lean_free_object(x_14);
lean_dec(x_21);
x_33 = lean_box(0);
return x_33;
}
else
{
lean_object* x_34; uint8_t x_35; lean_object* x_36; 
x_34 = lean_ctor_get(x_32, 0);
lean_inc(x_34);
lean_dec(x_32);
x_35 = 46;
x_36 = l_CakeML_ptree__Expr(x_35, x_21);
if (lean_obj_tag(x_36) == 0)
{
lean_object* x_37; 
lean_dec(x_34);
lean_dec(x_31);
lean_dec(x_28);
lean_free_object(x_14);
x_37 = lean_box(0);
return x_37;
}
else
{
uint8_t x_38; 
x_38 = !lean_is_exclusive(x_36);
if (x_38 == 0)
{
lean_object* x_39; lean_object* x_40; lean_object* x_41; lean_object* x_42; 
x_39 = lean_ctor_get(x_36, 0);
x_40 = l_List_tail___rarg(x_31);
lean_dec(x_31);
x_41 = l_List_foldrTR___at_CakeML_ptree__FDecl___spec__1(x_39, x_40);
x_42 = l_CakeML_dePat(x_34, x_41);
lean_ctor_set_tag(x_14, 0);
lean_ctor_set(x_14, 1, x_42);
lean_ctor_set(x_14, 0, x_28);
lean_ctor_set(x_36, 0, x_14);
return x_36;
}
else
{
lean_object* x_43; lean_object* x_44; lean_object* x_45; lean_object* x_46; lean_object* x_47; 
x_43 = lean_ctor_get(x_36, 0);
lean_inc(x_43);
lean_dec(x_36);
x_44 = l_List_tail___rarg(x_31);
lean_dec(x_31);
x_45 = l_List_foldrTR___at_CakeML_ptree__FDecl___spec__1(x_43, x_44);
x_46 = l_CakeML_dePat(x_34, x_45);
lean_ctor_set_tag(x_14, 0);
lean_ctor_set(x_14, 1, x_46);
lean_ctor_set(x_14, 0, x_28);
x_47 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_47, 0, x_14);
return x_47;
}
}
}
}
}
}
}
else
{
lean_object* x_48; lean_object* x_49; uint8_t x_50; 
x_48 = lean_ctor_get(x_14, 0);
lean_inc(x_48);
lean_dec(x_14);
x_49 = lean_box(13);
x_50 = l_CakeML_tokcheck(x_19, x_49);
if (x_50 == 0)
{
lean_object* x_51; 
lean_dec(x_48);
lean_dec(x_18);
lean_dec(x_17);
x_51 = lean_box(0);
return x_51;
}
else
{
lean_object* x_52; 
x_52 = l_CakeML_ptree__V(x_17);
if (lean_obj_tag(x_52) == 0)
{
lean_object* x_53; 
lean_dec(x_48);
lean_dec(x_18);
x_53 = lean_box(0);
return x_53;
}
else
{
lean_object* x_54; lean_object* x_55; 
x_54 = lean_ctor_get(x_52, 0);
lean_inc(x_54);
lean_dec(x_52);
x_55 = l_CakeML_ptree__PbaseList1(x_18);
if (lean_obj_tag(x_55) == 0)
{
lean_object* x_56; 
lean_dec(x_54);
lean_dec(x_48);
x_56 = lean_box(0);
return x_56;
}
else
{
lean_object* x_57; lean_object* x_58; 
x_57 = lean_ctor_get(x_55, 0);
lean_inc(x_57);
lean_dec(x_55);
x_58 = l_List_head_x3f___rarg(x_57);
if (lean_obj_tag(x_58) == 0)
{
lean_object* x_59; 
lean_dec(x_57);
lean_dec(x_54);
lean_dec(x_48);
x_59 = lean_box(0);
return x_59;
}
else
{
lean_object* x_60; uint8_t x_61; lean_object* x_62; 
x_60 = lean_ctor_get(x_58, 0);
lean_inc(x_60);
lean_dec(x_58);
x_61 = 46;
x_62 = l_CakeML_ptree__Expr(x_61, x_48);
if (lean_obj_tag(x_62) == 0)
{
lean_object* x_63; 
lean_dec(x_60);
lean_dec(x_57);
lean_dec(x_54);
x_63 = lean_box(0);
return x_63;
}
else
{
lean_object* x_64; lean_object* x_65; lean_object* x_66; lean_object* x_67; lean_object* x_68; lean_object* x_69; lean_object* x_70; 
x_64 = lean_ctor_get(x_62, 0);
lean_inc(x_64);
if (lean_is_exclusive(x_62)) {
 lean_ctor_release(x_62, 0);
 x_65 = x_62;
} else {
 lean_dec_ref(x_62);
 x_65 = lean_box(0);
}
x_66 = l_List_tail___rarg(x_57);
lean_dec(x_57);
x_67 = l_List_foldrTR___at_CakeML_ptree__FDecl___spec__1(x_64, x_66);
x_68 = l_CakeML_dePat(x_60, x_67);
x_69 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_69, 0, x_54);
lean_ctor_set(x_69, 1, x_68);
if (lean_is_scalar(x_65)) {
 x_70 = lean_alloc_ctor(1, 1, 0);
} else {
 x_70 = x_65;
}
lean_ctor_set(x_70, 0, x_69);
return x_70;
}
}
}
}
}
}
}
else
{
lean_object* x_71; 
lean_dec(x_16);
lean_dec(x_14);
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_71 = lean_box(0);
return x_71;
}
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Exprlist___rarg(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 29;
x_6 = lean_unbox(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
uint8_t x_8; uint8_t x_9; uint8_t x_10; 
x_8 = 28;
x_9 = lean_unbox(x_3);
lean_dec(x_3);
x_10 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_9, x_8);
if (x_10 == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_12; 
x_12 = lean_box(0);
return x_12;
}
else
{
lean_object* x_13; 
x_13 = lean_ctor_get(x_4, 1);
lean_inc(x_13);
if (lean_obj_tag(x_13) == 0)
{
lean_object* x_14; 
lean_dec(x_4);
x_14 = lean_box(0);
return x_14;
}
else
{
lean_object* x_15; 
x_15 = lean_ctor_get(x_13, 1);
lean_inc(x_15);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
lean_dec(x_13);
lean_dec(x_4);
x_16 = lean_box(0);
return x_16;
}
else
{
lean_object* x_17; 
x_17 = lean_ctor_get(x_15, 1);
lean_inc(x_17);
if (lean_obj_tag(x_17) == 0)
{
lean_object* x_18; lean_object* x_19; uint8_t x_20; 
x_18 = lean_ctor_get(x_4, 0);
lean_inc(x_18);
lean_dec(x_4);
x_19 = lean_ctor_get(x_13, 0);
lean_inc(x_19);
lean_dec(x_13);
x_20 = !lean_is_exclusive(x_15);
if (x_20 == 0)
{
lean_object* x_21; lean_object* x_22; lean_object* x_23; uint8_t x_24; 
x_21 = lean_ctor_get(x_15, 0);
x_22 = lean_ctor_get(x_15, 1);
lean_dec(x_22);
x_23 = lean_box(7);
x_24 = l_CakeML_tokcheck(x_19, x_23);
if (x_24 == 0)
{
lean_object* x_25; 
lean_free_object(x_15);
lean_dec(x_21);
lean_dec(x_18);
x_25 = lean_box(0);
return x_25;
}
else
{
uint8_t x_26; lean_object* x_27; 
x_26 = 46;
x_27 = l_CakeML_ptree__Expr(x_26, x_18);
if (lean_obj_tag(x_27) == 0)
{
lean_object* x_28; 
lean_free_object(x_15);
lean_dec(x_21);
x_28 = lean_box(0);
return x_28;
}
else
{
lean_object* x_29; lean_object* x_30; 
x_29 = lean_ctor_get(x_27, 0);
lean_inc(x_29);
lean_dec(x_27);
x_30 = l_CakeML_ptree__Exprlist___rarg(x_21);
if (lean_obj_tag(x_30) == 0)
{
lean_object* x_31; 
lean_dec(x_29);
lean_free_object(x_15);
x_31 = lean_box(0);
return x_31;
}
else
{
uint8_t x_32; 
x_32 = !lean_is_exclusive(x_30);
if (x_32 == 0)
{
lean_object* x_33; 
x_33 = lean_ctor_get(x_30, 0);
lean_ctor_set(x_15, 1, x_33);
lean_ctor_set(x_15, 0, x_29);
lean_ctor_set(x_30, 0, x_15);
return x_30;
}
else
{
lean_object* x_34; lean_object* x_35; 
x_34 = lean_ctor_get(x_30, 0);
lean_inc(x_34);
lean_dec(x_30);
lean_ctor_set(x_15, 1, x_34);
lean_ctor_set(x_15, 0, x_29);
x_35 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_35, 0, x_15);
return x_35;
}
}
}
}
}
else
{
lean_object* x_36; lean_object* x_37; uint8_t x_38; 
x_36 = lean_ctor_get(x_15, 0);
lean_inc(x_36);
lean_dec(x_15);
x_37 = lean_box(7);
x_38 = l_CakeML_tokcheck(x_19, x_37);
if (x_38 == 0)
{
lean_object* x_39; 
lean_dec(x_36);
lean_dec(x_18);
x_39 = lean_box(0);
return x_39;
}
else
{
uint8_t x_40; lean_object* x_41; 
x_40 = 46;
x_41 = l_CakeML_ptree__Expr(x_40, x_18);
if (lean_obj_tag(x_41) == 0)
{
lean_object* x_42; 
lean_dec(x_36);
x_42 = lean_box(0);
return x_42;
}
else
{
lean_object* x_43; lean_object* x_44; 
x_43 = lean_ctor_get(x_41, 0);
lean_inc(x_43);
lean_dec(x_41);
x_44 = l_CakeML_ptree__Exprlist___rarg(x_36);
if (lean_obj_tag(x_44) == 0)
{
lean_object* x_45; 
lean_dec(x_43);
x_45 = lean_box(0);
return x_45;
}
else
{
lean_object* x_46; lean_object* x_47; lean_object* x_48; lean_object* x_49; 
x_46 = lean_ctor_get(x_44, 0);
lean_inc(x_46);
if (lean_is_exclusive(x_44)) {
 lean_ctor_release(x_44, 0);
 x_47 = x_44;
} else {
 lean_dec_ref(x_44);
 x_47 = lean_box(0);
}
x_48 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_48, 0, x_43);
lean_ctor_set(x_48, 1, x_46);
if (lean_is_scalar(x_47)) {
 x_49 = lean_alloc_ctor(1, 1, 0);
} else {
 x_49 = x_47;
}
lean_ctor_set(x_49, 0, x_48);
return x_49;
}
}
}
}
}
else
{
lean_object* x_50; 
lean_dec(x_17);
lean_dec(x_15);
lean_dec(x_13);
lean_dec(x_4);
x_50 = lean_box(0);
return x_50;
}
}
}
}
}
}
else
{
lean_dec(x_3);
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_51; 
x_51 = lean_box(0);
return x_51;
}
else
{
lean_object* x_52; 
x_52 = lean_ctor_get(x_4, 1);
lean_inc(x_52);
if (lean_obj_tag(x_52) == 0)
{
uint8_t x_53; 
x_53 = !lean_is_exclusive(x_4);
if (x_53 == 0)
{
lean_object* x_54; lean_object* x_55; uint8_t x_56; lean_object* x_57; 
x_54 = lean_ctor_get(x_4, 0);
x_55 = lean_ctor_get(x_4, 1);
lean_dec(x_55);
x_56 = 46;
x_57 = l_CakeML_ptree__Expr(x_56, x_54);
if (lean_obj_tag(x_57) == 0)
{
lean_object* x_58; 
lean_free_object(x_4);
x_58 = lean_box(0);
return x_58;
}
else
{
uint8_t x_59; 
x_59 = !lean_is_exclusive(x_57);
if (x_59 == 0)
{
lean_object* x_60; lean_object* x_61; 
x_60 = lean_ctor_get(x_57, 0);
x_61 = lean_box(0);
lean_ctor_set(x_4, 1, x_61);
lean_ctor_set(x_4, 0, x_60);
lean_ctor_set(x_57, 0, x_4);
return x_57;
}
else
{
lean_object* x_62; lean_object* x_63; lean_object* x_64; 
x_62 = lean_ctor_get(x_57, 0);
lean_inc(x_62);
lean_dec(x_57);
x_63 = lean_box(0);
lean_ctor_set(x_4, 1, x_63);
lean_ctor_set(x_4, 0, x_62);
x_64 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_64, 0, x_4);
return x_64;
}
}
}
else
{
lean_object* x_65; uint8_t x_66; lean_object* x_67; 
x_65 = lean_ctor_get(x_4, 0);
lean_inc(x_65);
lean_dec(x_4);
x_66 = 46;
x_67 = l_CakeML_ptree__Expr(x_66, x_65);
if (lean_obj_tag(x_67) == 0)
{
lean_object* x_68; 
x_68 = lean_box(0);
return x_68;
}
else
{
lean_object* x_69; lean_object* x_70; lean_object* x_71; lean_object* x_72; lean_object* x_73; 
x_69 = lean_ctor_get(x_67, 0);
lean_inc(x_69);
if (lean_is_exclusive(x_67)) {
 lean_ctor_release(x_67, 0);
 x_70 = x_67;
} else {
 lean_dec_ref(x_67);
 x_70 = lean_box(0);
}
x_71 = lean_box(0);
x_72 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_72, 0, x_69);
lean_ctor_set(x_72, 1, x_71);
if (lean_is_scalar(x_70)) {
 x_73 = lean_alloc_ctor(1, 1, 0);
} else {
 x_73 = x_70;
}
lean_ctor_set(x_73, 0, x_72);
return x_73;
}
}
}
else
{
lean_object* x_74; 
x_74 = lean_ctor_get(x_52, 1);
lean_inc(x_74);
if (lean_obj_tag(x_74) == 0)
{
lean_object* x_75; 
lean_dec(x_52);
lean_dec(x_4);
x_75 = lean_box(0);
return x_75;
}
else
{
lean_object* x_76; 
x_76 = lean_ctor_get(x_74, 1);
lean_inc(x_76);
if (lean_obj_tag(x_76) == 0)
{
lean_object* x_77; lean_object* x_78; uint8_t x_79; 
x_77 = lean_ctor_get(x_4, 0);
lean_inc(x_77);
lean_dec(x_4);
x_78 = lean_ctor_get(x_52, 0);
lean_inc(x_78);
lean_dec(x_52);
x_79 = !lean_is_exclusive(x_74);
if (x_79 == 0)
{
lean_object* x_80; lean_object* x_81; lean_object* x_82; uint8_t x_83; 
x_80 = lean_ctor_get(x_74, 0);
x_81 = lean_ctor_get(x_74, 1);
lean_dec(x_81);
x_82 = lean_box(7);
x_83 = l_CakeML_tokcheck(x_78, x_82);
if (x_83 == 0)
{
lean_object* x_84; 
lean_free_object(x_74);
lean_dec(x_80);
lean_dec(x_77);
x_84 = lean_box(0);
return x_84;
}
else
{
uint8_t x_85; lean_object* x_86; 
x_85 = 46;
x_86 = l_CakeML_ptree__Expr(x_85, x_77);
if (lean_obj_tag(x_86) == 0)
{
lean_object* x_87; 
lean_free_object(x_74);
lean_dec(x_80);
x_87 = lean_box(0);
return x_87;
}
else
{
lean_object* x_88; lean_object* x_89; 
x_88 = lean_ctor_get(x_86, 0);
lean_inc(x_88);
lean_dec(x_86);
x_89 = l_CakeML_ptree__Exprlist___rarg(x_80);
if (lean_obj_tag(x_89) == 0)
{
lean_object* x_90; 
lean_dec(x_88);
lean_free_object(x_74);
x_90 = lean_box(0);
return x_90;
}
else
{
uint8_t x_91; 
x_91 = !lean_is_exclusive(x_89);
if (x_91 == 0)
{
lean_object* x_92; 
x_92 = lean_ctor_get(x_89, 0);
lean_ctor_set(x_74, 1, x_92);
lean_ctor_set(x_74, 0, x_88);
lean_ctor_set(x_89, 0, x_74);
return x_89;
}
else
{
lean_object* x_93; lean_object* x_94; 
x_93 = lean_ctor_get(x_89, 0);
lean_inc(x_93);
lean_dec(x_89);
lean_ctor_set(x_74, 1, x_93);
lean_ctor_set(x_74, 0, x_88);
x_94 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_94, 0, x_74);
return x_94;
}
}
}
}
}
else
{
lean_object* x_95; lean_object* x_96; uint8_t x_97; 
x_95 = lean_ctor_get(x_74, 0);
lean_inc(x_95);
lean_dec(x_74);
x_96 = lean_box(7);
x_97 = l_CakeML_tokcheck(x_78, x_96);
if (x_97 == 0)
{
lean_object* x_98; 
lean_dec(x_95);
lean_dec(x_77);
x_98 = lean_box(0);
return x_98;
}
else
{
uint8_t x_99; lean_object* x_100; 
x_99 = 46;
x_100 = l_CakeML_ptree__Expr(x_99, x_77);
if (lean_obj_tag(x_100) == 0)
{
lean_object* x_101; 
lean_dec(x_95);
x_101 = lean_box(0);
return x_101;
}
else
{
lean_object* x_102; lean_object* x_103; 
x_102 = lean_ctor_get(x_100, 0);
lean_inc(x_102);
lean_dec(x_100);
x_103 = l_CakeML_ptree__Exprlist___rarg(x_95);
if (lean_obj_tag(x_103) == 0)
{
lean_object* x_104; 
lean_dec(x_102);
x_104 = lean_box(0);
return x_104;
}
else
{
lean_object* x_105; lean_object* x_106; lean_object* x_107; lean_object* x_108; 
x_105 = lean_ctor_get(x_103, 0);
lean_inc(x_105);
if (lean_is_exclusive(x_103)) {
 lean_ctor_release(x_103, 0);
 x_106 = x_103;
} else {
 lean_dec_ref(x_103);
 x_106 = lean_box(0);
}
x_107 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_107, 0, x_102);
lean_ctor_set(x_107, 1, x_105);
if (lean_is_scalar(x_106)) {
 x_108 = lean_alloc_ctor(1, 1, 0);
} else {
 x_108 = x_106;
}
lean_ctor_set(x_108, 0, x_107);
return x_108;
}
}
}
}
}
else
{
lean_object* x_109; 
lean_dec(x_76);
lean_dec(x_74);
lean_dec(x_52);
lean_dec(x_4);
x_109 = lean_box(0);
return x_109;
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Exprlist(uint8_t x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_CakeML_ptree__Exprlist___rarg), 1, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Eseq(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 26;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_4);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; uint8_t x_14; lean_object* x_15; 
x_12 = lean_ctor_get(x_4, 0);
x_13 = lean_ctor_get(x_4, 1);
lean_dec(x_13);
x_14 = 46;
x_15 = l_CakeML_ptree__Expr(x_14, x_12);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
lean_free_object(x_4);
x_16 = lean_box(0);
return x_16;
}
else
{
uint8_t x_17; 
x_17 = !lean_is_exclusive(x_15);
if (x_17 == 0)
{
lean_object* x_18; lean_object* x_19; 
x_18 = lean_ctor_get(x_15, 0);
x_19 = lean_box(0);
lean_ctor_set(x_4, 1, x_19);
lean_ctor_set(x_4, 0, x_18);
lean_ctor_set(x_15, 0, x_4);
return x_15;
}
else
{
lean_object* x_20; lean_object* x_21; lean_object* x_22; 
x_20 = lean_ctor_get(x_15, 0);
lean_inc(x_20);
lean_dec(x_15);
x_21 = lean_box(0);
lean_ctor_set(x_4, 1, x_21);
lean_ctor_set(x_4, 0, x_20);
x_22 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_22, 0, x_4);
return x_22;
}
}
}
else
{
lean_object* x_23; uint8_t x_24; lean_object* x_25; 
x_23 = lean_ctor_get(x_4, 0);
lean_inc(x_23);
lean_dec(x_4);
x_24 = 46;
x_25 = l_CakeML_ptree__Expr(x_24, x_23);
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_26; 
x_26 = lean_box(0);
return x_26;
}
else
{
lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; 
x_27 = lean_ctor_get(x_25, 0);
lean_inc(x_27);
if (lean_is_exclusive(x_25)) {
 lean_ctor_release(x_25, 0);
 x_28 = x_25;
} else {
 lean_dec_ref(x_25);
 x_28 = lean_box(0);
}
x_29 = lean_box(0);
x_30 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_30, 0, x_27);
lean_ctor_set(x_30, 1, x_29);
if (lean_is_scalar(x_28)) {
 x_31 = lean_alloc_ctor(1, 1, 0);
} else {
 x_31 = x_28;
}
lean_ctor_set(x_31, 0, x_30);
return x_31;
}
}
}
else
{
lean_object* x_32; 
x_32 = lean_ctor_get(x_10, 1);
lean_inc(x_32);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; 
lean_dec(x_10);
lean_dec(x_4);
x_33 = lean_box(0);
return x_33;
}
else
{
lean_object* x_34; 
x_34 = lean_ctor_get(x_32, 1);
lean_inc(x_34);
if (lean_obj_tag(x_34) == 0)
{
lean_object* x_35; lean_object* x_36; uint8_t x_37; 
x_35 = lean_ctor_get(x_4, 0);
lean_inc(x_35);
lean_dec(x_4);
x_36 = lean_ctor_get(x_10, 0);
lean_inc(x_36);
lean_dec(x_10);
x_37 = !lean_is_exclusive(x_32);
if (x_37 == 0)
{
lean_object* x_38; lean_object* x_39; lean_object* x_40; uint8_t x_41; 
x_38 = lean_ctor_get(x_32, 0);
x_39 = lean_ctor_get(x_32, 1);
lean_dec(x_39);
x_40 = lean_box(12);
x_41 = l_CakeML_tokcheck(x_36, x_40);
if (x_41 == 0)
{
lean_object* x_42; 
lean_free_object(x_32);
lean_dec(x_38);
lean_dec(x_35);
x_42 = lean_box(0);
return x_42;
}
else
{
uint8_t x_43; lean_object* x_44; 
x_43 = 46;
x_44 = l_CakeML_ptree__Expr(x_43, x_35);
if (lean_obj_tag(x_44) == 0)
{
lean_object* x_45; 
lean_free_object(x_32);
lean_dec(x_38);
x_45 = lean_box(0);
return x_45;
}
else
{
lean_object* x_46; lean_object* x_47; 
x_46 = lean_ctor_get(x_44, 0);
lean_inc(x_46);
lean_dec(x_44);
x_47 = l_CakeML_ptree__Eseq(x_38);
if (lean_obj_tag(x_47) == 0)
{
lean_object* x_48; 
lean_dec(x_46);
lean_free_object(x_32);
x_48 = lean_box(0);
return x_48;
}
else
{
uint8_t x_49; 
x_49 = !lean_is_exclusive(x_47);
if (x_49 == 0)
{
lean_object* x_50; 
x_50 = lean_ctor_get(x_47, 0);
lean_ctor_set(x_32, 1, x_50);
lean_ctor_set(x_32, 0, x_46);
lean_ctor_set(x_47, 0, x_32);
return x_47;
}
else
{
lean_object* x_51; lean_object* x_52; 
x_51 = lean_ctor_get(x_47, 0);
lean_inc(x_51);
lean_dec(x_47);
lean_ctor_set(x_32, 1, x_51);
lean_ctor_set(x_32, 0, x_46);
x_52 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_52, 0, x_32);
return x_52;
}
}
}
}
}
else
{
lean_object* x_53; lean_object* x_54; uint8_t x_55; 
x_53 = lean_ctor_get(x_32, 0);
lean_inc(x_53);
lean_dec(x_32);
x_54 = lean_box(12);
x_55 = l_CakeML_tokcheck(x_36, x_54);
if (x_55 == 0)
{
lean_object* x_56; 
lean_dec(x_53);
lean_dec(x_35);
x_56 = lean_box(0);
return x_56;
}
else
{
uint8_t x_57; lean_object* x_58; 
x_57 = 46;
x_58 = l_CakeML_ptree__Expr(x_57, x_35);
if (lean_obj_tag(x_58) == 0)
{
lean_object* x_59; 
lean_dec(x_53);
x_59 = lean_box(0);
return x_59;
}
else
{
lean_object* x_60; lean_object* x_61; 
x_60 = lean_ctor_get(x_58, 0);
lean_inc(x_60);
lean_dec(x_58);
x_61 = l_CakeML_ptree__Eseq(x_53);
if (lean_obj_tag(x_61) == 0)
{
lean_object* x_62; 
lean_dec(x_60);
x_62 = lean_box(0);
return x_62;
}
else
{
lean_object* x_63; lean_object* x_64; lean_object* x_65; lean_object* x_66; 
x_63 = lean_ctor_get(x_61, 0);
lean_inc(x_63);
if (lean_is_exclusive(x_61)) {
 lean_ctor_release(x_61, 0);
 x_64 = x_61;
} else {
 lean_dec_ref(x_61);
 x_64 = lean_box(0);
}
x_65 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_65, 0, x_60);
lean_ctor_set(x_65, 1, x_63);
if (lean_is_scalar(x_64)) {
 x_66 = lean_alloc_ctor(1, 1, 0);
} else {
 x_66 = x_64;
}
lean_ctor_set(x_66, 0, x_65);
return x_66;
}
}
}
}
}
else
{
lean_object* x_67; 
lean_dec(x_34);
lean_dec(x_32);
lean_dec(x_10);
lean_dec(x_4);
x_67 = lean_box(0);
return x_67;
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Expr___spec__2___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
size_t x_5; size_t x_6; lean_object* x_7; 
x_5 = lean_unbox_usize(x_2);
lean_dec(x_2);
x_6 = lean_unbox_usize(x_3);
lean_dec(x_3);
x_7 = l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Expr___spec__2(x_1, x_5, x_6, x_4);
lean_dec(x_1);
return x_7;
}
}
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Expr___spec__4___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
size_t x_5; size_t x_6; lean_object* x_7; 
x_5 = lean_unbox_usize(x_2);
lean_dec(x_2);
x_6 = lean_unbox_usize(x_3);
lean_dec(x_3);
x_7 = l_Array_foldrMUnsafe_fold___at_CakeML_ptree__Expr___spec__4(x_1, x_5, x_6, x_4);
lean_dec(x_1);
return x_7;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Expr___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = lean_unbox(x_1);
lean_dec(x_1);
x_4 = l_CakeML_ptree__Expr(x_3, x_2);
return x_4;
}
}
LEAN_EXPORT lean_object* l_Array_foldrMUnsafe_fold___at_CakeML_ptree__FDecl___spec__2___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
size_t x_5; size_t x_6; lean_object* x_7; 
x_5 = lean_unbox_usize(x_2);
lean_dec(x_2);
x_6 = lean_unbox_usize(x_3);
lean_dec(x_3);
x_7 = l_Array_foldrMUnsafe_fold___at_CakeML_ptree__FDecl___spec__2(x_1, x_5, x_6, x_4);
lean_dec(x_1);
return x_7;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Exprlist___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = lean_unbox(x_1);
lean_dec(x_1);
x_3 = l_CakeML_ptree__Exprlist(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__StructName(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 63;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; lean_object* x_12; 
x_11 = lean_ctor_get(x_4, 0);
lean_inc(x_11);
lean_dec(x_4);
x_12 = l_CakeML_destLf___rarg(x_11);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
x_13 = lean_box(0);
return x_13;
}
else
{
lean_object* x_14; lean_object* x_15; 
x_14 = lean_ctor_get(x_12, 0);
lean_inc(x_14);
lean_dec(x_12);
x_15 = l_CakeML_destTOK___rarg(x_14);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
x_16 = lean_box(0);
return x_16;
}
else
{
lean_object* x_17; lean_object* x_18; 
x_17 = lean_ctor_get(x_15, 0);
lean_inc(x_17);
lean_dec(x_15);
x_18 = l_CakeML_destAlphaT(x_17);
return x_18;
}
}
}
else
{
lean_object* x_19; 
lean_dec(x_10);
lean_dec(x_4);
x_19 = lean_box(0);
return x_19;
}
}
}
}
}
}
static lean_object* _init_l_CakeML_ptree__OptTypEqn___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_box(0);
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__OptTypEqn(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 65;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = l_CakeML_ptree__OptTypEqn___closed__1;
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; lean_object* x_14; lean_object* x_15; uint8_t x_16; 
x_13 = lean_ctor_get(x_4, 0);
lean_inc(x_13);
lean_dec(x_4);
x_14 = lean_ctor_get(x_10, 0);
lean_inc(x_14);
lean_dec(x_10);
x_15 = lean_box(13);
x_16 = l_CakeML_tokcheck(x_13, x_15);
if (x_16 == 0)
{
lean_object* x_17; 
lean_dec(x_14);
x_17 = lean_box(0);
return x_17;
}
else
{
uint8_t x_18; lean_object* x_19; 
x_18 = 8;
x_19 = l_CakeML_ptree__Type(x_18, x_14);
if (lean_obj_tag(x_19) == 0)
{
lean_object* x_20; 
x_20 = lean_box(0);
return x_20;
}
else
{
uint8_t x_21; 
x_21 = !lean_is_exclusive(x_19);
if (x_21 == 0)
{
lean_object* x_22; 
x_22 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_22, 0, x_19);
return x_22;
}
else
{
lean_object* x_23; lean_object* x_24; lean_object* x_25; 
x_23 = lean_ctor_get(x_19, 0);
lean_inc(x_23);
lean_dec(x_19);
x_24 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_24, 0, x_23);
x_25 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_25, 0, x_24);
return x_25;
}
}
}
}
else
{
lean_object* x_26; 
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_26 = lean_box(0);
return x_26;
}
}
}
}
}
}
}
static lean_object* _init_l_CakeML_ptree__SpecLine___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_box(0);
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__SpecLine___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_box(10);
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__SpecLine___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(51);
x_2 = l_CakeML_ptree__SpecLine___closed__2;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__SpecLine(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 64;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; lean_object* x_12; 
x_11 = lean_ctor_get(x_4, 0);
lean_inc(x_11);
lean_dec(x_4);
x_12 = l_CakeML_ptree__TypeDec(x_11);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
x_13 = lean_box(0);
return x_13;
}
else
{
lean_object* x_14; 
lean_dec(x_12);
x_14 = l_CakeML_ptree__SpecLine___closed__1;
return x_14;
}
}
else
{
lean_object* x_15; 
x_15 = lean_ctor_get(x_10, 1);
lean_inc(x_15);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; lean_object* x_17; lean_object* x_18; uint8_t x_19; 
x_16 = lean_ctor_get(x_4, 0);
lean_inc(x_16);
lean_dec(x_4);
x_17 = lean_ctor_get(x_10, 0);
lean_inc(x_17);
lean_dec(x_10);
x_18 = lean_box(29);
x_19 = l_CakeML_tokcheck(x_16, x_18);
if (x_19 == 0)
{
lean_object* x_20; 
lean_dec(x_17);
x_20 = lean_box(0);
return x_20;
}
else
{
lean_object* x_21; 
x_21 = l_CakeML_ptree__Dconstructor(x_17);
if (lean_obj_tag(x_21) == 0)
{
lean_object* x_22; 
x_22 = lean_box(0);
return x_22;
}
else
{
lean_object* x_23; 
lean_dec(x_21);
x_23 = l_CakeML_ptree__SpecLine___closed__1;
return x_23;
}
}
}
else
{
lean_object* x_24; 
x_24 = lean_ctor_get(x_15, 1);
lean_inc(x_24);
if (lean_obj_tag(x_24) == 0)
{
lean_object* x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; uint8_t x_29; 
x_25 = lean_ctor_get(x_4, 0);
lean_inc(x_25);
lean_dec(x_4);
x_26 = lean_ctor_get(x_10, 0);
lean_inc(x_26);
lean_dec(x_10);
x_27 = lean_ctor_get(x_15, 0);
lean_inc(x_27);
lean_dec(x_15);
x_28 = lean_box(50);
x_29 = l_CakeML_tokcheck(x_25, x_28);
if (x_29 == 0)
{
lean_object* x_30; 
lean_dec(x_27);
lean_dec(x_26);
x_30 = lean_box(0);
return x_30;
}
else
{
lean_object* x_31; 
x_31 = l_CakeML_ptree__TypeName(x_26);
if (lean_obj_tag(x_31) == 0)
{
lean_object* x_32; 
lean_dec(x_27);
x_32 = lean_box(0);
return x_32;
}
else
{
lean_object* x_33; 
lean_dec(x_31);
x_33 = l_CakeML_ptree__OptTypEqn(x_27);
if (lean_obj_tag(x_33) == 0)
{
lean_object* x_34; 
x_34 = lean_box(0);
return x_34;
}
else
{
lean_object* x_35; 
lean_dec(x_33);
x_35 = l_CakeML_ptree__SpecLine___closed__1;
return x_35;
}
}
}
}
else
{
lean_object* x_36; 
x_36 = lean_ctor_get(x_24, 1);
lean_inc(x_36);
if (lean_obj_tag(x_36) == 0)
{
lean_object* x_37; lean_object* x_38; uint8_t x_39; 
x_37 = lean_ctor_get(x_4, 0);
lean_inc(x_37);
lean_dec(x_4);
x_38 = lean_ctor_get(x_10, 0);
lean_inc(x_38);
lean_dec(x_10);
x_39 = !lean_is_exclusive(x_15);
if (x_39 == 0)
{
lean_object* x_40; lean_object* x_41; uint8_t x_42; 
x_40 = lean_ctor_get(x_15, 0);
x_41 = lean_ctor_get(x_15, 1);
lean_dec(x_41);
x_42 = !lean_is_exclusive(x_24);
if (x_42 == 0)
{
lean_object* x_43; lean_object* x_44; lean_object* x_45; lean_object* x_46; uint8_t x_47; 
x_43 = lean_ctor_get(x_24, 0);
x_44 = lean_ctor_get(x_24, 1);
lean_dec(x_44);
x_45 = lean_box(0);
lean_ctor_set(x_24, 1, x_45);
lean_ctor_set(x_24, 0, x_40);
lean_ctor_set(x_15, 0, x_37);
x_46 = l_CakeML_ptree__SpecLine___closed__3;
x_47 = l_CakeML_tokcheckl(x_15, x_46);
if (x_47 == 0)
{
lean_object* x_48; 
lean_dec(x_43);
lean_dec(x_38);
x_48 = lean_box(0);
return x_48;
}
else
{
lean_object* x_49; 
x_49 = l_CakeML_ptree__V(x_38);
if (lean_obj_tag(x_49) == 0)
{
lean_object* x_50; 
lean_dec(x_43);
x_50 = lean_box(0);
return x_50;
}
else
{
uint8_t x_51; lean_object* x_52; 
lean_dec(x_49);
x_51 = 8;
x_52 = l_CakeML_ptree__Type(x_51, x_43);
if (lean_obj_tag(x_52) == 0)
{
lean_object* x_53; 
x_53 = lean_box(0);
return x_53;
}
else
{
lean_object* x_54; 
lean_dec(x_52);
x_54 = l_CakeML_ptree__SpecLine___closed__1;
return x_54;
}
}
}
}
else
{
lean_object* x_55; lean_object* x_56; lean_object* x_57; lean_object* x_58; uint8_t x_59; 
x_55 = lean_ctor_get(x_24, 0);
lean_inc(x_55);
lean_dec(x_24);
x_56 = lean_box(0);
x_57 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_57, 0, x_40);
lean_ctor_set(x_57, 1, x_56);
lean_ctor_set(x_15, 1, x_57);
lean_ctor_set(x_15, 0, x_37);
x_58 = l_CakeML_ptree__SpecLine___closed__3;
x_59 = l_CakeML_tokcheckl(x_15, x_58);
if (x_59 == 0)
{
lean_object* x_60; 
lean_dec(x_55);
lean_dec(x_38);
x_60 = lean_box(0);
return x_60;
}
else
{
lean_object* x_61; 
x_61 = l_CakeML_ptree__V(x_38);
if (lean_obj_tag(x_61) == 0)
{
lean_object* x_62; 
lean_dec(x_55);
x_62 = lean_box(0);
return x_62;
}
else
{
uint8_t x_63; lean_object* x_64; 
lean_dec(x_61);
x_63 = 8;
x_64 = l_CakeML_ptree__Type(x_63, x_55);
if (lean_obj_tag(x_64) == 0)
{
lean_object* x_65; 
x_65 = lean_box(0);
return x_65;
}
else
{
lean_object* x_66; 
lean_dec(x_64);
x_66 = l_CakeML_ptree__SpecLine___closed__1;
return x_66;
}
}
}
}
}
else
{
lean_object* x_67; lean_object* x_68; lean_object* x_69; lean_object* x_70; lean_object* x_71; lean_object* x_72; lean_object* x_73; uint8_t x_74; 
x_67 = lean_ctor_get(x_15, 0);
lean_inc(x_67);
lean_dec(x_15);
x_68 = lean_ctor_get(x_24, 0);
lean_inc(x_68);
if (lean_is_exclusive(x_24)) {
 lean_ctor_release(x_24, 0);
 lean_ctor_release(x_24, 1);
 x_69 = x_24;
} else {
 lean_dec_ref(x_24);
 x_69 = lean_box(0);
}
x_70 = lean_box(0);
if (lean_is_scalar(x_69)) {
 x_71 = lean_alloc_ctor(1, 2, 0);
} else {
 x_71 = x_69;
}
lean_ctor_set(x_71, 0, x_67);
lean_ctor_set(x_71, 1, x_70);
x_72 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_72, 0, x_37);
lean_ctor_set(x_72, 1, x_71);
x_73 = l_CakeML_ptree__SpecLine___closed__3;
x_74 = l_CakeML_tokcheckl(x_72, x_73);
if (x_74 == 0)
{
lean_object* x_75; 
lean_dec(x_68);
lean_dec(x_38);
x_75 = lean_box(0);
return x_75;
}
else
{
lean_object* x_76; 
x_76 = l_CakeML_ptree__V(x_38);
if (lean_obj_tag(x_76) == 0)
{
lean_object* x_77; 
lean_dec(x_68);
x_77 = lean_box(0);
return x_77;
}
else
{
uint8_t x_78; lean_object* x_79; 
lean_dec(x_76);
x_78 = 8;
x_79 = l_CakeML_ptree__Type(x_78, x_68);
if (lean_obj_tag(x_79) == 0)
{
lean_object* x_80; 
x_80 = lean_box(0);
return x_80;
}
else
{
lean_object* x_81; 
lean_dec(x_79);
x_81 = l_CakeML_ptree__SpecLine___closed__1;
return x_81;
}
}
}
}
}
else
{
lean_object* x_82; 
lean_dec(x_36);
lean_dec(x_24);
lean_dec(x_15);
lean_dec(x_10);
lean_dec(x_4);
x_82 = lean_box(0);
return x_82;
}
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__SpeclineList(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 66;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = l_CakeML_ptree__SpecLine___closed__1;
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; lean_object* x_14; lean_object* x_15; uint8_t x_16; 
x_13 = lean_ctor_get(x_4, 0);
lean_inc(x_13);
lean_dec(x_4);
x_14 = lean_ctor_get(x_10, 0);
lean_inc(x_14);
lean_dec(x_10);
x_15 = lean_box(12);
lean_inc(x_13);
x_16 = l_CakeML_tokcheck(x_13, x_15);
if (x_16 == 0)
{
lean_object* x_17; 
x_17 = l_CakeML_ptree__SpecLine(x_13);
if (lean_obj_tag(x_17) == 0)
{
lean_object* x_18; 
lean_dec(x_14);
x_18 = lean_box(0);
return x_18;
}
else
{
lean_dec(x_17);
x_1 = x_14;
goto _start;
}
}
else
{
lean_dec(x_13);
x_1 = x_14;
goto _start;
}
}
else
{
lean_object* x_21; 
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_21 = lean_box(0);
return x_21;
}
}
}
}
}
}
}
static lean_object* _init_l_CakeML_ptree__SignatureValue___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(45);
x_2 = l_CakeML_ptree__Expr___closed__16;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__SignatureValue(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 67;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
lean_dec(x_10);
lean_dec(x_4);
x_13 = lean_box(0);
return x_13;
}
else
{
lean_object* x_14; 
x_14 = lean_ctor_get(x_12, 1);
lean_inc(x_14);
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_15; uint8_t x_16; 
x_15 = lean_ctor_get(x_4, 0);
lean_inc(x_15);
lean_dec(x_4);
x_16 = !lean_is_exclusive(x_10);
if (x_16 == 0)
{
lean_object* x_17; lean_object* x_18; uint8_t x_19; 
x_17 = lean_ctor_get(x_10, 0);
x_18 = lean_ctor_get(x_10, 1);
lean_dec(x_18);
x_19 = !lean_is_exclusive(x_12);
if (x_19 == 0)
{
lean_object* x_20; lean_object* x_21; lean_object* x_22; uint8_t x_23; 
x_20 = lean_ctor_get(x_12, 1);
lean_dec(x_20);
x_21 = lean_box(0);
lean_ctor_set(x_12, 1, x_21);
lean_ctor_set(x_10, 0, x_15);
x_22 = l_CakeML_ptree__SignatureValue___closed__1;
x_23 = l_CakeML_tokcheckl(x_10, x_22);
if (x_23 == 0)
{
lean_object* x_24; 
lean_dec(x_17);
x_24 = lean_box(0);
return x_24;
}
else
{
lean_object* x_25; 
x_25 = l_CakeML_ptree__SpeclineList(x_17);
return x_25;
}
}
else
{
lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; uint8_t x_30; 
x_26 = lean_ctor_get(x_12, 0);
lean_inc(x_26);
lean_dec(x_12);
x_27 = lean_box(0);
x_28 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_28, 0, x_26);
lean_ctor_set(x_28, 1, x_27);
lean_ctor_set(x_10, 1, x_28);
lean_ctor_set(x_10, 0, x_15);
x_29 = l_CakeML_ptree__SignatureValue___closed__1;
x_30 = l_CakeML_tokcheckl(x_10, x_29);
if (x_30 == 0)
{
lean_object* x_31; 
lean_dec(x_17);
x_31 = lean_box(0);
return x_31;
}
else
{
lean_object* x_32; 
x_32 = l_CakeML_ptree__SpeclineList(x_17);
return x_32;
}
}
}
else
{
lean_object* x_33; lean_object* x_34; lean_object* x_35; lean_object* x_36; lean_object* x_37; lean_object* x_38; lean_object* x_39; uint8_t x_40; 
x_33 = lean_ctor_get(x_10, 0);
lean_inc(x_33);
lean_dec(x_10);
x_34 = lean_ctor_get(x_12, 0);
lean_inc(x_34);
if (lean_is_exclusive(x_12)) {
 lean_ctor_release(x_12, 0);
 lean_ctor_release(x_12, 1);
 x_35 = x_12;
} else {
 lean_dec_ref(x_12);
 x_35 = lean_box(0);
}
x_36 = lean_box(0);
if (lean_is_scalar(x_35)) {
 x_37 = lean_alloc_ctor(1, 2, 0);
} else {
 x_37 = x_35;
}
lean_ctor_set(x_37, 0, x_34);
lean_ctor_set(x_37, 1, x_36);
x_38 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_38, 0, x_15);
lean_ctor_set(x_38, 1, x_37);
x_39 = l_CakeML_ptree__SignatureValue___closed__1;
x_40 = l_CakeML_tokcheckl(x_38, x_39);
if (x_40 == 0)
{
lean_object* x_41; 
lean_dec(x_33);
x_41 = lean_box(0);
return x_41;
}
else
{
lean_object* x_42; 
x_42 = l_CakeML_ptree__SpeclineList(x_33);
return x_42;
}
}
}
else
{
lean_object* x_43; 
lean_dec(x_14);
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_43 = lean_box(0);
return x_43;
}
}
}
}
}
}
}
}
static lean_object* _init_l_CakeML_ptree__Decl___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(37);
x_2 = l_CakeML_ptree__Expr___closed__17;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Decl(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 69;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_4);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_12 = lean_ctor_get(x_4, 0);
x_13 = lean_ctor_get(x_4, 1);
lean_dec(x_13);
lean_inc(x_12);
x_14 = l_CakeML_ptree__TypeDec(x_12);
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_15; 
lean_free_object(x_4);
lean_inc(x_12);
x_15 = l_CakeML_ptree__TypeAbbrevDec(x_12);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; 
x_16 = l_CakeML_ptree__Structure(x_12);
return x_16;
}
else
{
uint8_t x_17; 
lean_dec(x_12);
x_17 = !lean_is_exclusive(x_15);
if (x_17 == 0)
{
return x_15;
}
else
{
lean_object* x_18; lean_object* x_19; 
x_18 = lean_ctor_get(x_15, 0);
lean_inc(x_18);
lean_dec(x_15);
x_19 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_19, 0, x_18);
return x_19;
}
}
}
else
{
uint8_t x_20; 
lean_dec(x_12);
x_20 = !lean_is_exclusive(x_14);
if (x_20 == 0)
{
lean_object* x_21; lean_object* x_22; 
x_21 = lean_ctor_get(x_14, 0);
x_22 = l_CakeML_unknown__loc;
lean_ctor_set_tag(x_4, 2);
lean_ctor_set(x_4, 1, x_21);
lean_ctor_set(x_4, 0, x_22);
lean_ctor_set(x_14, 0, x_4);
return x_14;
}
else
{
lean_object* x_23; lean_object* x_24; lean_object* x_25; 
x_23 = lean_ctor_get(x_14, 0);
lean_inc(x_23);
lean_dec(x_14);
x_24 = l_CakeML_unknown__loc;
lean_ctor_set_tag(x_4, 2);
lean_ctor_set(x_4, 1, x_23);
lean_ctor_set(x_4, 0, x_24);
x_25 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_25, 0, x_4);
return x_25;
}
}
}
else
{
lean_object* x_26; lean_object* x_27; 
x_26 = lean_ctor_get(x_4, 0);
lean_inc(x_26);
lean_dec(x_4);
lean_inc(x_26);
x_27 = l_CakeML_ptree__TypeDec(x_26);
if (lean_obj_tag(x_27) == 0)
{
lean_object* x_28; 
lean_inc(x_26);
x_28 = l_CakeML_ptree__TypeAbbrevDec(x_26);
if (lean_obj_tag(x_28) == 0)
{
lean_object* x_29; 
x_29 = l_CakeML_ptree__Structure(x_26);
return x_29;
}
else
{
lean_object* x_30; lean_object* x_31; lean_object* x_32; 
lean_dec(x_26);
x_30 = lean_ctor_get(x_28, 0);
lean_inc(x_30);
if (lean_is_exclusive(x_28)) {
 lean_ctor_release(x_28, 0);
 x_31 = x_28;
} else {
 lean_dec_ref(x_28);
 x_31 = lean_box(0);
}
if (lean_is_scalar(x_31)) {
 x_32 = lean_alloc_ctor(1, 1, 0);
} else {
 x_32 = x_31;
}
lean_ctor_set(x_32, 0, x_30);
return x_32;
}
}
else
{
lean_object* x_33; lean_object* x_34; lean_object* x_35; lean_object* x_36; lean_object* x_37; 
lean_dec(x_26);
x_33 = lean_ctor_get(x_27, 0);
lean_inc(x_33);
if (lean_is_exclusive(x_27)) {
 lean_ctor_release(x_27, 0);
 x_34 = x_27;
} else {
 lean_dec_ref(x_27);
 x_34 = lean_box(0);
}
x_35 = l_CakeML_unknown__loc;
x_36 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_36, 0, x_35);
lean_ctor_set(x_36, 1, x_33);
if (lean_is_scalar(x_34)) {
 x_37 = lean_alloc_ctor(1, 1, 0);
} else {
 x_37 = x_34;
}
lean_ctor_set(x_37, 0, x_36);
return x_37;
}
}
}
else
{
lean_object* x_38; 
x_38 = lean_ctor_get(x_10, 1);
lean_inc(x_38);
if (lean_obj_tag(x_38) == 0)
{
lean_object* x_39; uint8_t x_40; 
x_39 = lean_ctor_get(x_4, 0);
lean_inc(x_39);
lean_dec(x_4);
x_40 = !lean_is_exclusive(x_10);
if (x_40 == 0)
{
lean_object* x_41; lean_object* x_42; lean_object* x_43; uint8_t x_44; 
x_41 = lean_ctor_get(x_10, 0);
x_42 = lean_ctor_get(x_10, 1);
lean_dec(x_42);
x_43 = lean_box(31);
lean_inc(x_39);
x_44 = l_CakeML_tokcheck(x_39, x_43);
if (x_44 == 0)
{
lean_object* x_45; uint8_t x_46; 
lean_free_object(x_10);
x_45 = lean_box(29);
x_46 = l_CakeML_tokcheck(x_39, x_45);
if (x_46 == 0)
{
lean_object* x_47; 
lean_dec(x_41);
x_47 = lean_box(0);
return x_47;
}
else
{
lean_object* x_48; 
x_48 = l_CakeML_ptree__Dconstructor(x_41);
if (lean_obj_tag(x_48) == 0)
{
lean_object* x_49; 
x_49 = lean_box(0);
return x_49;
}
else
{
uint8_t x_50; 
x_50 = !lean_is_exclusive(x_48);
if (x_50 == 0)
{
lean_object* x_51; lean_object* x_52; lean_object* x_53; lean_object* x_54; lean_object* x_55; 
x_51 = lean_ctor_get(x_48, 0);
x_52 = lean_ctor_get(x_51, 0);
lean_inc(x_52);
x_53 = lean_ctor_get(x_51, 1);
lean_inc(x_53);
lean_dec(x_51);
x_54 = l_CakeML_unknown__loc;
x_55 = lean_alloc_ctor(4, 3, 0);
lean_ctor_set(x_55, 0, x_54);
lean_ctor_set(x_55, 1, x_52);
lean_ctor_set(x_55, 2, x_53);
lean_ctor_set(x_48, 0, x_55);
return x_48;
}
else
{
lean_object* x_56; lean_object* x_57; lean_object* x_58; lean_object* x_59; lean_object* x_60; lean_object* x_61; 
x_56 = lean_ctor_get(x_48, 0);
lean_inc(x_56);
lean_dec(x_48);
x_57 = lean_ctor_get(x_56, 0);
lean_inc(x_57);
x_58 = lean_ctor_get(x_56, 1);
lean_inc(x_58);
lean_dec(x_56);
x_59 = l_CakeML_unknown__loc;
x_60 = lean_alloc_ctor(4, 3, 0);
lean_ctor_set(x_60, 0, x_59);
lean_ctor_set(x_60, 1, x_57);
lean_ctor_set(x_60, 2, x_58);
x_61 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_61, 0, x_60);
return x_61;
}
}
}
}
else
{
lean_object* x_62; 
lean_inc(x_41);
x_62 = l_CakeML_ptree__AndFDecls(x_41);
if (lean_obj_tag(x_62) == 0)
{
lean_object* x_63; uint8_t x_64; 
lean_free_object(x_10);
x_63 = lean_box(29);
x_64 = l_CakeML_tokcheck(x_39, x_63);
if (x_64 == 0)
{
lean_object* x_65; 
lean_dec(x_41);
x_65 = lean_box(0);
return x_65;
}
else
{
lean_object* x_66; 
x_66 = l_CakeML_ptree__Dconstructor(x_41);
if (lean_obj_tag(x_66) == 0)
{
lean_object* x_67; 
x_67 = lean_box(0);
return x_67;
}
else
{
uint8_t x_68; 
x_68 = !lean_is_exclusive(x_66);
if (x_68 == 0)
{
lean_object* x_69; lean_object* x_70; lean_object* x_71; lean_object* x_72; lean_object* x_73; 
x_69 = lean_ctor_get(x_66, 0);
x_70 = lean_ctor_get(x_69, 0);
lean_inc(x_70);
x_71 = lean_ctor_get(x_69, 1);
lean_inc(x_71);
lean_dec(x_69);
x_72 = l_CakeML_unknown__loc;
x_73 = lean_alloc_ctor(4, 3, 0);
lean_ctor_set(x_73, 0, x_72);
lean_ctor_set(x_73, 1, x_70);
lean_ctor_set(x_73, 2, x_71);
lean_ctor_set(x_66, 0, x_73);
return x_66;
}
else
{
lean_object* x_74; lean_object* x_75; lean_object* x_76; lean_object* x_77; lean_object* x_78; lean_object* x_79; 
x_74 = lean_ctor_get(x_66, 0);
lean_inc(x_74);
lean_dec(x_66);
x_75 = lean_ctor_get(x_74, 0);
lean_inc(x_75);
x_76 = lean_ctor_get(x_74, 1);
lean_inc(x_76);
lean_dec(x_74);
x_77 = l_CakeML_unknown__loc;
x_78 = lean_alloc_ctor(4, 3, 0);
lean_ctor_set(x_78, 0, x_77);
lean_ctor_set(x_78, 1, x_75);
lean_ctor_set(x_78, 2, x_76);
x_79 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_79, 0, x_78);
return x_79;
}
}
}
}
else
{
uint8_t x_80; 
lean_dec(x_41);
lean_dec(x_39);
x_80 = !lean_is_exclusive(x_62);
if (x_80 == 0)
{
lean_object* x_81; lean_object* x_82; 
x_81 = lean_ctor_get(x_62, 0);
x_82 = l_CakeML_unknown__loc;
lean_ctor_set(x_10, 1, x_81);
lean_ctor_set(x_10, 0, x_82);
lean_ctor_set(x_62, 0, x_10);
return x_62;
}
else
{
lean_object* x_83; lean_object* x_84; lean_object* x_85; 
x_83 = lean_ctor_get(x_62, 0);
lean_inc(x_83);
lean_dec(x_62);
x_84 = l_CakeML_unknown__loc;
lean_ctor_set(x_10, 1, x_83);
lean_ctor_set(x_10, 0, x_84);
x_85 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_85, 0, x_10);
return x_85;
}
}
}
}
else
{
lean_object* x_86; lean_object* x_87; uint8_t x_88; 
x_86 = lean_ctor_get(x_10, 0);
lean_inc(x_86);
lean_dec(x_10);
x_87 = lean_box(31);
lean_inc(x_39);
x_88 = l_CakeML_tokcheck(x_39, x_87);
if (x_88 == 0)
{
lean_object* x_89; uint8_t x_90; 
x_89 = lean_box(29);
x_90 = l_CakeML_tokcheck(x_39, x_89);
if (x_90 == 0)
{
lean_object* x_91; 
lean_dec(x_86);
x_91 = lean_box(0);
return x_91;
}
else
{
lean_object* x_92; 
x_92 = l_CakeML_ptree__Dconstructor(x_86);
if (lean_obj_tag(x_92) == 0)
{
lean_object* x_93; 
x_93 = lean_box(0);
return x_93;
}
else
{
lean_object* x_94; lean_object* x_95; lean_object* x_96; lean_object* x_97; lean_object* x_98; lean_object* x_99; lean_object* x_100; 
x_94 = lean_ctor_get(x_92, 0);
lean_inc(x_94);
if (lean_is_exclusive(x_92)) {
 lean_ctor_release(x_92, 0);
 x_95 = x_92;
} else {
 lean_dec_ref(x_92);
 x_95 = lean_box(0);
}
x_96 = lean_ctor_get(x_94, 0);
lean_inc(x_96);
x_97 = lean_ctor_get(x_94, 1);
lean_inc(x_97);
lean_dec(x_94);
x_98 = l_CakeML_unknown__loc;
x_99 = lean_alloc_ctor(4, 3, 0);
lean_ctor_set(x_99, 0, x_98);
lean_ctor_set(x_99, 1, x_96);
lean_ctor_set(x_99, 2, x_97);
if (lean_is_scalar(x_95)) {
 x_100 = lean_alloc_ctor(1, 1, 0);
} else {
 x_100 = x_95;
}
lean_ctor_set(x_100, 0, x_99);
return x_100;
}
}
}
else
{
lean_object* x_101; 
lean_inc(x_86);
x_101 = l_CakeML_ptree__AndFDecls(x_86);
if (lean_obj_tag(x_101) == 0)
{
lean_object* x_102; uint8_t x_103; 
x_102 = lean_box(29);
x_103 = l_CakeML_tokcheck(x_39, x_102);
if (x_103 == 0)
{
lean_object* x_104; 
lean_dec(x_86);
x_104 = lean_box(0);
return x_104;
}
else
{
lean_object* x_105; 
x_105 = l_CakeML_ptree__Dconstructor(x_86);
if (lean_obj_tag(x_105) == 0)
{
lean_object* x_106; 
x_106 = lean_box(0);
return x_106;
}
else
{
lean_object* x_107; lean_object* x_108; lean_object* x_109; lean_object* x_110; lean_object* x_111; lean_object* x_112; lean_object* x_113; 
x_107 = lean_ctor_get(x_105, 0);
lean_inc(x_107);
if (lean_is_exclusive(x_105)) {
 lean_ctor_release(x_105, 0);
 x_108 = x_105;
} else {
 lean_dec_ref(x_105);
 x_108 = lean_box(0);
}
x_109 = lean_ctor_get(x_107, 0);
lean_inc(x_109);
x_110 = lean_ctor_get(x_107, 1);
lean_inc(x_110);
lean_dec(x_107);
x_111 = l_CakeML_unknown__loc;
x_112 = lean_alloc_ctor(4, 3, 0);
lean_ctor_set(x_112, 0, x_111);
lean_ctor_set(x_112, 1, x_109);
lean_ctor_set(x_112, 2, x_110);
if (lean_is_scalar(x_108)) {
 x_113 = lean_alloc_ctor(1, 1, 0);
} else {
 x_113 = x_108;
}
lean_ctor_set(x_113, 0, x_112);
return x_113;
}
}
}
else
{
lean_object* x_114; lean_object* x_115; lean_object* x_116; lean_object* x_117; lean_object* x_118; 
lean_dec(x_86);
lean_dec(x_39);
x_114 = lean_ctor_get(x_101, 0);
lean_inc(x_114);
if (lean_is_exclusive(x_101)) {
 lean_ctor_release(x_101, 0);
 x_115 = x_101;
} else {
 lean_dec_ref(x_101);
 x_115 = lean_box(0);
}
x_116 = l_CakeML_unknown__loc;
x_117 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_117, 0, x_116);
lean_ctor_set(x_117, 1, x_114);
if (lean_is_scalar(x_115)) {
 x_118 = lean_alloc_ctor(1, 1, 0);
} else {
 x_118 = x_115;
}
lean_ctor_set(x_118, 0, x_117);
return x_118;
}
}
}
}
else
{
lean_object* x_119; 
x_119 = lean_ctor_get(x_38, 1);
lean_inc(x_119);
if (lean_obj_tag(x_119) == 0)
{
lean_object* x_120; 
lean_dec(x_38);
lean_dec(x_10);
lean_dec(x_4);
x_120 = lean_box(0);
return x_120;
}
else
{
lean_object* x_121; 
x_121 = lean_ctor_get(x_119, 1);
lean_inc(x_121);
if (lean_obj_tag(x_121) == 0)
{
lean_object* x_122; lean_object* x_123; uint8_t x_124; 
x_122 = lean_ctor_get(x_4, 0);
lean_inc(x_122);
lean_dec(x_4);
x_123 = lean_ctor_get(x_10, 0);
lean_inc(x_123);
lean_dec(x_10);
x_124 = !lean_is_exclusive(x_38);
if (x_124 == 0)
{
lean_object* x_125; lean_object* x_126; uint8_t x_127; 
x_125 = lean_ctor_get(x_38, 0);
x_126 = lean_ctor_get(x_38, 1);
lean_dec(x_126);
x_127 = !lean_is_exclusive(x_119);
if (x_127 == 0)
{
lean_object* x_128; lean_object* x_129; lean_object* x_130; lean_object* x_131; uint8_t x_132; 
x_128 = lean_ctor_get(x_119, 0);
x_129 = lean_ctor_get(x_119, 1);
lean_dec(x_129);
x_130 = lean_box(0);
lean_ctor_set(x_119, 1, x_130);
lean_ctor_set(x_119, 0, x_125);
lean_ctor_set(x_38, 0, x_122);
x_131 = l_CakeML_ptree__LetDec___closed__1;
x_132 = l_CakeML_tokcheckl(x_38, x_131);
if (x_132 == 0)
{
lean_object* x_133; 
lean_dec(x_128);
lean_dec(x_123);
x_133 = lean_box(0);
return x_133;
}
else
{
uint8_t x_134; lean_object* x_135; 
x_134 = 56;
x_135 = l_CakeML_ptree__Pattern(x_134, x_123);
if (lean_obj_tag(x_135) == 0)
{
lean_object* x_136; 
lean_dec(x_128);
x_136 = lean_box(0);
return x_136;
}
else
{
lean_object* x_137; uint8_t x_138; lean_object* x_139; 
x_137 = lean_ctor_get(x_135, 0);
lean_inc(x_137);
lean_dec(x_135);
x_138 = 46;
x_139 = l_CakeML_ptree__Expr(x_138, x_128);
if (lean_obj_tag(x_139) == 0)
{
lean_object* x_140; 
lean_dec(x_137);
x_140 = lean_box(0);
return x_140;
}
else
{
uint8_t x_141; 
x_141 = !lean_is_exclusive(x_139);
if (x_141 == 0)
{
lean_object* x_142; lean_object* x_143; lean_object* x_144; 
x_142 = lean_ctor_get(x_139, 0);
x_143 = l_CakeML_unknown__loc;
x_144 = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(x_144, 0, x_143);
lean_ctor_set(x_144, 1, x_137);
lean_ctor_set(x_144, 2, x_142);
lean_ctor_set(x_139, 0, x_144);
return x_139;
}
else
{
lean_object* x_145; lean_object* x_146; lean_object* x_147; lean_object* x_148; 
x_145 = lean_ctor_get(x_139, 0);
lean_inc(x_145);
lean_dec(x_139);
x_146 = l_CakeML_unknown__loc;
x_147 = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(x_147, 0, x_146);
lean_ctor_set(x_147, 1, x_137);
lean_ctor_set(x_147, 2, x_145);
x_148 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_148, 0, x_147);
return x_148;
}
}
}
}
}
else
{
lean_object* x_149; lean_object* x_150; lean_object* x_151; lean_object* x_152; uint8_t x_153; 
x_149 = lean_ctor_get(x_119, 0);
lean_inc(x_149);
lean_dec(x_119);
x_150 = lean_box(0);
x_151 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_151, 0, x_125);
lean_ctor_set(x_151, 1, x_150);
lean_ctor_set(x_38, 1, x_151);
lean_ctor_set(x_38, 0, x_122);
x_152 = l_CakeML_ptree__LetDec___closed__1;
x_153 = l_CakeML_tokcheckl(x_38, x_152);
if (x_153 == 0)
{
lean_object* x_154; 
lean_dec(x_149);
lean_dec(x_123);
x_154 = lean_box(0);
return x_154;
}
else
{
uint8_t x_155; lean_object* x_156; 
x_155 = 56;
x_156 = l_CakeML_ptree__Pattern(x_155, x_123);
if (lean_obj_tag(x_156) == 0)
{
lean_object* x_157; 
lean_dec(x_149);
x_157 = lean_box(0);
return x_157;
}
else
{
lean_object* x_158; uint8_t x_159; lean_object* x_160; 
x_158 = lean_ctor_get(x_156, 0);
lean_inc(x_158);
lean_dec(x_156);
x_159 = 46;
x_160 = l_CakeML_ptree__Expr(x_159, x_149);
if (lean_obj_tag(x_160) == 0)
{
lean_object* x_161; 
lean_dec(x_158);
x_161 = lean_box(0);
return x_161;
}
else
{
lean_object* x_162; lean_object* x_163; lean_object* x_164; lean_object* x_165; lean_object* x_166; 
x_162 = lean_ctor_get(x_160, 0);
lean_inc(x_162);
if (lean_is_exclusive(x_160)) {
 lean_ctor_release(x_160, 0);
 x_163 = x_160;
} else {
 lean_dec_ref(x_160);
 x_163 = lean_box(0);
}
x_164 = l_CakeML_unknown__loc;
x_165 = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(x_165, 0, x_164);
lean_ctor_set(x_165, 1, x_158);
lean_ctor_set(x_165, 2, x_162);
if (lean_is_scalar(x_163)) {
 x_166 = lean_alloc_ctor(1, 1, 0);
} else {
 x_166 = x_163;
}
lean_ctor_set(x_166, 0, x_165);
return x_166;
}
}
}
}
}
else
{
lean_object* x_167; lean_object* x_168; lean_object* x_169; lean_object* x_170; lean_object* x_171; lean_object* x_172; lean_object* x_173; uint8_t x_174; 
x_167 = lean_ctor_get(x_38, 0);
lean_inc(x_167);
lean_dec(x_38);
x_168 = lean_ctor_get(x_119, 0);
lean_inc(x_168);
if (lean_is_exclusive(x_119)) {
 lean_ctor_release(x_119, 0);
 lean_ctor_release(x_119, 1);
 x_169 = x_119;
} else {
 lean_dec_ref(x_119);
 x_169 = lean_box(0);
}
x_170 = lean_box(0);
if (lean_is_scalar(x_169)) {
 x_171 = lean_alloc_ctor(1, 2, 0);
} else {
 x_171 = x_169;
}
lean_ctor_set(x_171, 0, x_167);
lean_ctor_set(x_171, 1, x_170);
x_172 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_172, 0, x_122);
lean_ctor_set(x_172, 1, x_171);
x_173 = l_CakeML_ptree__LetDec___closed__1;
x_174 = l_CakeML_tokcheckl(x_172, x_173);
if (x_174 == 0)
{
lean_object* x_175; 
lean_dec(x_168);
lean_dec(x_123);
x_175 = lean_box(0);
return x_175;
}
else
{
uint8_t x_176; lean_object* x_177; 
x_176 = 56;
x_177 = l_CakeML_ptree__Pattern(x_176, x_123);
if (lean_obj_tag(x_177) == 0)
{
lean_object* x_178; 
lean_dec(x_168);
x_178 = lean_box(0);
return x_178;
}
else
{
lean_object* x_179; uint8_t x_180; lean_object* x_181; 
x_179 = lean_ctor_get(x_177, 0);
lean_inc(x_179);
lean_dec(x_177);
x_180 = 46;
x_181 = l_CakeML_ptree__Expr(x_180, x_168);
if (lean_obj_tag(x_181) == 0)
{
lean_object* x_182; 
lean_dec(x_179);
x_182 = lean_box(0);
return x_182;
}
else
{
lean_object* x_183; lean_object* x_184; lean_object* x_185; lean_object* x_186; lean_object* x_187; 
x_183 = lean_ctor_get(x_181, 0);
lean_inc(x_183);
if (lean_is_exclusive(x_181)) {
 lean_ctor_release(x_181, 0);
 x_184 = x_181;
} else {
 lean_dec_ref(x_181);
 x_184 = lean_box(0);
}
x_185 = l_CakeML_unknown__loc;
x_186 = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(x_186, 0, x_185);
lean_ctor_set(x_186, 1, x_179);
lean_ctor_set(x_186, 2, x_183);
if (lean_is_scalar(x_184)) {
 x_187 = lean_alloc_ctor(1, 1, 0);
} else {
 x_187 = x_184;
}
lean_ctor_set(x_187, 0, x_186);
return x_187;
}
}
}
}
}
else
{
lean_object* x_188; 
x_188 = lean_ctor_get(x_121, 1);
lean_inc(x_188);
if (lean_obj_tag(x_188) == 0)
{
lean_object* x_189; uint8_t x_190; 
x_189 = lean_ctor_get(x_4, 0);
lean_inc(x_189);
lean_dec(x_4);
x_190 = !lean_is_exclusive(x_10);
if (x_190 == 0)
{
lean_object* x_191; lean_object* x_192; uint8_t x_193; 
x_191 = lean_ctor_get(x_10, 0);
x_192 = lean_ctor_get(x_10, 1);
lean_dec(x_192);
x_193 = !lean_is_exclusive(x_38);
if (x_193 == 0)
{
lean_object* x_194; lean_object* x_195; uint8_t x_196; 
x_194 = lean_ctor_get(x_38, 0);
x_195 = lean_ctor_get(x_38, 1);
lean_dec(x_195);
x_196 = !lean_is_exclusive(x_119);
if (x_196 == 0)
{
lean_object* x_197; lean_object* x_198; uint8_t x_199; 
x_197 = lean_ctor_get(x_119, 0);
x_198 = lean_ctor_get(x_119, 1);
lean_dec(x_198);
x_199 = !lean_is_exclusive(x_121);
if (x_199 == 0)
{
lean_object* x_200; lean_object* x_201; lean_object* x_202; uint8_t x_203; 
x_200 = lean_ctor_get(x_121, 1);
lean_dec(x_200);
x_201 = lean_box(0);
lean_ctor_set(x_121, 1, x_201);
lean_ctor_set(x_119, 0, x_194);
lean_ctor_set(x_38, 0, x_189);
x_202 = l_CakeML_ptree__Decl___closed__1;
x_203 = l_CakeML_tokcheckl(x_38, x_202);
if (x_203 == 0)
{
lean_object* x_204; 
lean_dec(x_197);
lean_free_object(x_10);
lean_dec(x_191);
x_204 = lean_box(0);
return x_204;
}
else
{
lean_object* x_205; 
x_205 = l_CakeML_ptree__Decls(x_191);
if (lean_obj_tag(x_205) == 0)
{
lean_object* x_206; 
lean_dec(x_197);
lean_free_object(x_10);
x_206 = lean_box(0);
return x_206;
}
else
{
lean_object* x_207; lean_object* x_208; 
x_207 = lean_ctor_get(x_205, 0);
lean_inc(x_207);
lean_dec(x_205);
x_208 = l_CakeML_ptree__Decls(x_197);
if (lean_obj_tag(x_208) == 0)
{
lean_object* x_209; 
lean_dec(x_207);
lean_free_object(x_10);
x_209 = lean_box(0);
return x_209;
}
else
{
uint8_t x_210; 
x_210 = !lean_is_exclusive(x_208);
if (x_210 == 0)
{
lean_object* x_211; 
x_211 = lean_ctor_get(x_208, 0);
lean_ctor_set_tag(x_10, 6);
lean_ctor_set(x_10, 1, x_211);
lean_ctor_set(x_10, 0, x_207);
lean_ctor_set(x_208, 0, x_10);
return x_208;
}
else
{
lean_object* x_212; lean_object* x_213; 
x_212 = lean_ctor_get(x_208, 0);
lean_inc(x_212);
lean_dec(x_208);
lean_ctor_set_tag(x_10, 6);
lean_ctor_set(x_10, 1, x_212);
lean_ctor_set(x_10, 0, x_207);
x_213 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_213, 0, x_10);
return x_213;
}
}
}
}
}
else
{
lean_object* x_214; lean_object* x_215; lean_object* x_216; lean_object* x_217; uint8_t x_218; 
x_214 = lean_ctor_get(x_121, 0);
lean_inc(x_214);
lean_dec(x_121);
x_215 = lean_box(0);
x_216 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_216, 0, x_214);
lean_ctor_set(x_216, 1, x_215);
lean_ctor_set(x_119, 1, x_216);
lean_ctor_set(x_119, 0, x_194);
lean_ctor_set(x_38, 0, x_189);
x_217 = l_CakeML_ptree__Decl___closed__1;
x_218 = l_CakeML_tokcheckl(x_38, x_217);
if (x_218 == 0)
{
lean_object* x_219; 
lean_dec(x_197);
lean_free_object(x_10);
lean_dec(x_191);
x_219 = lean_box(0);
return x_219;
}
else
{
lean_object* x_220; 
x_220 = l_CakeML_ptree__Decls(x_191);
if (lean_obj_tag(x_220) == 0)
{
lean_object* x_221; 
lean_dec(x_197);
lean_free_object(x_10);
x_221 = lean_box(0);
return x_221;
}
else
{
lean_object* x_222; lean_object* x_223; 
x_222 = lean_ctor_get(x_220, 0);
lean_inc(x_222);
lean_dec(x_220);
x_223 = l_CakeML_ptree__Decls(x_197);
if (lean_obj_tag(x_223) == 0)
{
lean_object* x_224; 
lean_dec(x_222);
lean_free_object(x_10);
x_224 = lean_box(0);
return x_224;
}
else
{
lean_object* x_225; lean_object* x_226; lean_object* x_227; 
x_225 = lean_ctor_get(x_223, 0);
lean_inc(x_225);
if (lean_is_exclusive(x_223)) {
 lean_ctor_release(x_223, 0);
 x_226 = x_223;
} else {
 lean_dec_ref(x_223);
 x_226 = lean_box(0);
}
lean_ctor_set_tag(x_10, 6);
lean_ctor_set(x_10, 1, x_225);
lean_ctor_set(x_10, 0, x_222);
if (lean_is_scalar(x_226)) {
 x_227 = lean_alloc_ctor(1, 1, 0);
} else {
 x_227 = x_226;
}
lean_ctor_set(x_227, 0, x_10);
return x_227;
}
}
}
}
}
else
{
lean_object* x_228; lean_object* x_229; lean_object* x_230; lean_object* x_231; lean_object* x_232; lean_object* x_233; lean_object* x_234; uint8_t x_235; 
x_228 = lean_ctor_get(x_119, 0);
lean_inc(x_228);
lean_dec(x_119);
x_229 = lean_ctor_get(x_121, 0);
lean_inc(x_229);
if (lean_is_exclusive(x_121)) {
 lean_ctor_release(x_121, 0);
 lean_ctor_release(x_121, 1);
 x_230 = x_121;
} else {
 lean_dec_ref(x_121);
 x_230 = lean_box(0);
}
x_231 = lean_box(0);
if (lean_is_scalar(x_230)) {
 x_232 = lean_alloc_ctor(1, 2, 0);
} else {
 x_232 = x_230;
}
lean_ctor_set(x_232, 0, x_229);
lean_ctor_set(x_232, 1, x_231);
x_233 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_233, 0, x_194);
lean_ctor_set(x_233, 1, x_232);
lean_ctor_set(x_38, 1, x_233);
lean_ctor_set(x_38, 0, x_189);
x_234 = l_CakeML_ptree__Decl___closed__1;
x_235 = l_CakeML_tokcheckl(x_38, x_234);
if (x_235 == 0)
{
lean_object* x_236; 
lean_dec(x_228);
lean_free_object(x_10);
lean_dec(x_191);
x_236 = lean_box(0);
return x_236;
}
else
{
lean_object* x_237; 
x_237 = l_CakeML_ptree__Decls(x_191);
if (lean_obj_tag(x_237) == 0)
{
lean_object* x_238; 
lean_dec(x_228);
lean_free_object(x_10);
x_238 = lean_box(0);
return x_238;
}
else
{
lean_object* x_239; lean_object* x_240; 
x_239 = lean_ctor_get(x_237, 0);
lean_inc(x_239);
lean_dec(x_237);
x_240 = l_CakeML_ptree__Decls(x_228);
if (lean_obj_tag(x_240) == 0)
{
lean_object* x_241; 
lean_dec(x_239);
lean_free_object(x_10);
x_241 = lean_box(0);
return x_241;
}
else
{
lean_object* x_242; lean_object* x_243; lean_object* x_244; 
x_242 = lean_ctor_get(x_240, 0);
lean_inc(x_242);
if (lean_is_exclusive(x_240)) {
 lean_ctor_release(x_240, 0);
 x_243 = x_240;
} else {
 lean_dec_ref(x_240);
 x_243 = lean_box(0);
}
lean_ctor_set_tag(x_10, 6);
lean_ctor_set(x_10, 1, x_242);
lean_ctor_set(x_10, 0, x_239);
if (lean_is_scalar(x_243)) {
 x_244 = lean_alloc_ctor(1, 1, 0);
} else {
 x_244 = x_243;
}
lean_ctor_set(x_244, 0, x_10);
return x_244;
}
}
}
}
}
else
{
lean_object* x_245; lean_object* x_246; lean_object* x_247; lean_object* x_248; lean_object* x_249; lean_object* x_250; lean_object* x_251; lean_object* x_252; lean_object* x_253; lean_object* x_254; uint8_t x_255; 
x_245 = lean_ctor_get(x_38, 0);
lean_inc(x_245);
lean_dec(x_38);
x_246 = lean_ctor_get(x_119, 0);
lean_inc(x_246);
if (lean_is_exclusive(x_119)) {
 lean_ctor_release(x_119, 0);
 lean_ctor_release(x_119, 1);
 x_247 = x_119;
} else {
 lean_dec_ref(x_119);
 x_247 = lean_box(0);
}
x_248 = lean_ctor_get(x_121, 0);
lean_inc(x_248);
if (lean_is_exclusive(x_121)) {
 lean_ctor_release(x_121, 0);
 lean_ctor_release(x_121, 1);
 x_249 = x_121;
} else {
 lean_dec_ref(x_121);
 x_249 = lean_box(0);
}
x_250 = lean_box(0);
if (lean_is_scalar(x_249)) {
 x_251 = lean_alloc_ctor(1, 2, 0);
} else {
 x_251 = x_249;
}
lean_ctor_set(x_251, 0, x_248);
lean_ctor_set(x_251, 1, x_250);
if (lean_is_scalar(x_247)) {
 x_252 = lean_alloc_ctor(1, 2, 0);
} else {
 x_252 = x_247;
}
lean_ctor_set(x_252, 0, x_245);
lean_ctor_set(x_252, 1, x_251);
x_253 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_253, 0, x_189);
lean_ctor_set(x_253, 1, x_252);
x_254 = l_CakeML_ptree__Decl___closed__1;
x_255 = l_CakeML_tokcheckl(x_253, x_254);
if (x_255 == 0)
{
lean_object* x_256; 
lean_dec(x_246);
lean_free_object(x_10);
lean_dec(x_191);
x_256 = lean_box(0);
return x_256;
}
else
{
lean_object* x_257; 
x_257 = l_CakeML_ptree__Decls(x_191);
if (lean_obj_tag(x_257) == 0)
{
lean_object* x_258; 
lean_dec(x_246);
lean_free_object(x_10);
x_258 = lean_box(0);
return x_258;
}
else
{
lean_object* x_259; lean_object* x_260; 
x_259 = lean_ctor_get(x_257, 0);
lean_inc(x_259);
lean_dec(x_257);
x_260 = l_CakeML_ptree__Decls(x_246);
if (lean_obj_tag(x_260) == 0)
{
lean_object* x_261; 
lean_dec(x_259);
lean_free_object(x_10);
x_261 = lean_box(0);
return x_261;
}
else
{
lean_object* x_262; lean_object* x_263; lean_object* x_264; 
x_262 = lean_ctor_get(x_260, 0);
lean_inc(x_262);
if (lean_is_exclusive(x_260)) {
 lean_ctor_release(x_260, 0);
 x_263 = x_260;
} else {
 lean_dec_ref(x_260);
 x_263 = lean_box(0);
}
lean_ctor_set_tag(x_10, 6);
lean_ctor_set(x_10, 1, x_262);
lean_ctor_set(x_10, 0, x_259);
if (lean_is_scalar(x_263)) {
 x_264 = lean_alloc_ctor(1, 1, 0);
} else {
 x_264 = x_263;
}
lean_ctor_set(x_264, 0, x_10);
return x_264;
}
}
}
}
}
else
{
lean_object* x_265; lean_object* x_266; lean_object* x_267; lean_object* x_268; lean_object* x_269; lean_object* x_270; lean_object* x_271; lean_object* x_272; lean_object* x_273; lean_object* x_274; lean_object* x_275; lean_object* x_276; uint8_t x_277; 
x_265 = lean_ctor_get(x_10, 0);
lean_inc(x_265);
lean_dec(x_10);
x_266 = lean_ctor_get(x_38, 0);
lean_inc(x_266);
if (lean_is_exclusive(x_38)) {
 lean_ctor_release(x_38, 0);
 lean_ctor_release(x_38, 1);
 x_267 = x_38;
} else {
 lean_dec_ref(x_38);
 x_267 = lean_box(0);
}
x_268 = lean_ctor_get(x_119, 0);
lean_inc(x_268);
if (lean_is_exclusive(x_119)) {
 lean_ctor_release(x_119, 0);
 lean_ctor_release(x_119, 1);
 x_269 = x_119;
} else {
 lean_dec_ref(x_119);
 x_269 = lean_box(0);
}
x_270 = lean_ctor_get(x_121, 0);
lean_inc(x_270);
if (lean_is_exclusive(x_121)) {
 lean_ctor_release(x_121, 0);
 lean_ctor_release(x_121, 1);
 x_271 = x_121;
} else {
 lean_dec_ref(x_121);
 x_271 = lean_box(0);
}
x_272 = lean_box(0);
if (lean_is_scalar(x_271)) {
 x_273 = lean_alloc_ctor(1, 2, 0);
} else {
 x_273 = x_271;
}
lean_ctor_set(x_273, 0, x_270);
lean_ctor_set(x_273, 1, x_272);
if (lean_is_scalar(x_269)) {
 x_274 = lean_alloc_ctor(1, 2, 0);
} else {
 x_274 = x_269;
}
lean_ctor_set(x_274, 0, x_266);
lean_ctor_set(x_274, 1, x_273);
if (lean_is_scalar(x_267)) {
 x_275 = lean_alloc_ctor(1, 2, 0);
} else {
 x_275 = x_267;
}
lean_ctor_set(x_275, 0, x_189);
lean_ctor_set(x_275, 1, x_274);
x_276 = l_CakeML_ptree__Decl___closed__1;
x_277 = l_CakeML_tokcheckl(x_275, x_276);
if (x_277 == 0)
{
lean_object* x_278; 
lean_dec(x_268);
lean_dec(x_265);
x_278 = lean_box(0);
return x_278;
}
else
{
lean_object* x_279; 
x_279 = l_CakeML_ptree__Decls(x_265);
if (lean_obj_tag(x_279) == 0)
{
lean_object* x_280; 
lean_dec(x_268);
x_280 = lean_box(0);
return x_280;
}
else
{
lean_object* x_281; lean_object* x_282; 
x_281 = lean_ctor_get(x_279, 0);
lean_inc(x_281);
lean_dec(x_279);
x_282 = l_CakeML_ptree__Decls(x_268);
if (lean_obj_tag(x_282) == 0)
{
lean_object* x_283; 
lean_dec(x_281);
x_283 = lean_box(0);
return x_283;
}
else
{
lean_object* x_284; lean_object* x_285; lean_object* x_286; lean_object* x_287; 
x_284 = lean_ctor_get(x_282, 0);
lean_inc(x_284);
if (lean_is_exclusive(x_282)) {
 lean_ctor_release(x_282, 0);
 x_285 = x_282;
} else {
 lean_dec_ref(x_282);
 x_285 = lean_box(0);
}
x_286 = lean_alloc_ctor(6, 2, 0);
lean_ctor_set(x_286, 0, x_281);
lean_ctor_set(x_286, 1, x_284);
if (lean_is_scalar(x_285)) {
 x_287 = lean_alloc_ctor(1, 1, 0);
} else {
 x_287 = x_285;
}
lean_ctor_set(x_287, 0, x_286);
return x_287;
}
}
}
}
}
else
{
lean_object* x_288; 
lean_dec(x_188);
lean_dec(x_121);
lean_dec(x_119);
lean_dec(x_38);
lean_dec(x_10);
lean_dec(x_4);
x_288 = lean_box(0);
return x_288;
}
}
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Decls(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 70;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = l_CakeML_ptree__TbaseList___closed__1;
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; uint8_t x_14; 
x_13 = lean_ctor_get(x_4, 0);
lean_inc(x_13);
lean_dec(x_4);
x_14 = !lean_is_exclusive(x_10);
if (x_14 == 0)
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; uint8_t x_18; 
x_15 = lean_ctor_get(x_10, 0);
x_16 = lean_ctor_get(x_10, 1);
lean_dec(x_16);
x_17 = lean_box(12);
lean_inc(x_13);
x_18 = l_CakeML_tokcheck(x_13, x_17);
if (x_18 == 0)
{
lean_object* x_19; 
x_19 = l_CakeML_ptree__Decl(x_13);
if (lean_obj_tag(x_19) == 0)
{
lean_object* x_20; 
lean_free_object(x_10);
lean_dec(x_15);
x_20 = lean_box(0);
return x_20;
}
else
{
lean_object* x_21; lean_object* x_22; 
x_21 = lean_ctor_get(x_19, 0);
lean_inc(x_21);
lean_dec(x_19);
x_22 = l_CakeML_ptree__Decls(x_15);
if (lean_obj_tag(x_22) == 0)
{
lean_object* x_23; 
lean_dec(x_21);
lean_free_object(x_10);
x_23 = lean_box(0);
return x_23;
}
else
{
uint8_t x_24; 
x_24 = !lean_is_exclusive(x_22);
if (x_24 == 0)
{
lean_object* x_25; 
x_25 = lean_ctor_get(x_22, 0);
lean_ctor_set(x_10, 1, x_25);
lean_ctor_set(x_10, 0, x_21);
lean_ctor_set(x_22, 0, x_10);
return x_22;
}
else
{
lean_object* x_26; lean_object* x_27; 
x_26 = lean_ctor_get(x_22, 0);
lean_inc(x_26);
lean_dec(x_22);
lean_ctor_set(x_10, 1, x_26);
lean_ctor_set(x_10, 0, x_21);
x_27 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_27, 0, x_10);
return x_27;
}
}
}
}
else
{
lean_free_object(x_10);
lean_dec(x_13);
x_1 = x_15;
goto _start;
}
}
else
{
lean_object* x_29; lean_object* x_30; uint8_t x_31; 
x_29 = lean_ctor_get(x_10, 0);
lean_inc(x_29);
lean_dec(x_10);
x_30 = lean_box(12);
lean_inc(x_13);
x_31 = l_CakeML_tokcheck(x_13, x_30);
if (x_31 == 0)
{
lean_object* x_32; 
x_32 = l_CakeML_ptree__Decl(x_13);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; 
lean_dec(x_29);
x_33 = lean_box(0);
return x_33;
}
else
{
lean_object* x_34; lean_object* x_35; 
x_34 = lean_ctor_get(x_32, 0);
lean_inc(x_34);
lean_dec(x_32);
x_35 = l_CakeML_ptree__Decls(x_29);
if (lean_obj_tag(x_35) == 0)
{
lean_object* x_36; 
lean_dec(x_34);
x_36 = lean_box(0);
return x_36;
}
else
{
lean_object* x_37; lean_object* x_38; lean_object* x_39; lean_object* x_40; 
x_37 = lean_ctor_get(x_35, 0);
lean_inc(x_37);
if (lean_is_exclusive(x_35)) {
 lean_ctor_release(x_35, 0);
 x_38 = x_35;
} else {
 lean_dec_ref(x_35);
 x_38 = lean_box(0);
}
x_39 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_39, 0, x_34);
lean_ctor_set(x_39, 1, x_37);
if (lean_is_scalar(x_38)) {
 x_40 = lean_alloc_ctor(1, 1, 0);
} else {
 x_40 = x_38;
}
lean_ctor_set(x_40, 0, x_39);
return x_40;
}
}
}
else
{
lean_dec(x_13);
x_1 = x_29;
goto _start;
}
}
}
else
{
lean_object* x_42; 
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_42 = lean_box(0);
return x_42;
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Structure___lambda__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_CakeML_ptree__Decls(x_1);
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_5; 
lean_dec(x_2);
x_5 = lean_box(0);
return x_5;
}
else
{
uint8_t x_6; 
x_6 = !lean_is_exclusive(x_4);
if (x_6 == 0)
{
lean_object* x_7; lean_object* x_8; 
x_7 = lean_ctor_get(x_4, 0);
x_8 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_8, 0, x_2);
lean_ctor_set(x_8, 1, x_7);
lean_ctor_set(x_4, 0, x_8);
return x_4;
}
else
{
lean_object* x_9; lean_object* x_10; lean_object* x_11; 
x_9 = lean_ctor_get(x_4, 0);
lean_inc(x_9);
lean_dec(x_4);
x_10 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_10, 0, x_2);
lean_ctor_set(x_10, 1, x_9);
x_11 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_11, 0, x_10);
return x_11;
}
}
}
}
static lean_object* _init_l_CakeML_ptree__Structure___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(13);
x_2 = l_CakeML_ptree__Expr___closed__16;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Structure___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(48);
x_2 = l_CakeML_ptree__Structure___closed__1;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_CakeML_ptree__Structure___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(47);
x_2 = l_CakeML_ptree__Structure___closed__2;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Structure(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 71;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; 
lean_dec(x_10);
lean_dec(x_4);
x_13 = lean_box(0);
return x_13;
}
else
{
lean_object* x_14; 
x_14 = lean_ctor_get(x_12, 1);
lean_inc(x_14);
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_15; 
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_15 = lean_box(0);
return x_15;
}
else
{
lean_object* x_16; 
x_16 = lean_ctor_get(x_14, 1);
lean_inc(x_16);
if (lean_obj_tag(x_16) == 0)
{
lean_object* x_17; 
lean_dec(x_14);
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_17 = lean_box(0);
return x_17;
}
else
{
lean_object* x_18; 
x_18 = lean_ctor_get(x_16, 1);
lean_inc(x_18);
if (lean_obj_tag(x_18) == 0)
{
lean_object* x_19; 
lean_dec(x_16);
lean_dec(x_14);
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_19 = lean_box(0);
return x_19;
}
else
{
lean_object* x_20; 
x_20 = lean_ctor_get(x_18, 1);
lean_inc(x_20);
if (lean_obj_tag(x_20) == 0)
{
lean_object* x_21; 
lean_dec(x_18);
lean_dec(x_16);
lean_dec(x_14);
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_21 = lean_box(0);
return x_21;
}
else
{
lean_object* x_22; 
x_22 = lean_ctor_get(x_20, 1);
lean_inc(x_22);
if (lean_obj_tag(x_22) == 0)
{
lean_object* x_23; lean_object* x_24; lean_object* x_25; uint8_t x_26; 
x_23 = lean_ctor_get(x_4, 0);
lean_inc(x_23);
lean_dec(x_4);
x_24 = lean_ctor_get(x_10, 0);
lean_inc(x_24);
lean_dec(x_10);
x_25 = lean_ctor_get(x_12, 0);
lean_inc(x_25);
lean_dec(x_12);
x_26 = !lean_is_exclusive(x_14);
if (x_26 == 0)
{
lean_object* x_27; lean_object* x_28; uint8_t x_29; 
x_27 = lean_ctor_get(x_14, 0);
x_28 = lean_ctor_get(x_14, 1);
lean_dec(x_28);
x_29 = !lean_is_exclusive(x_16);
if (x_29 == 0)
{
lean_object* x_30; lean_object* x_31; uint8_t x_32; 
x_30 = lean_ctor_get(x_16, 0);
x_31 = lean_ctor_get(x_16, 1);
lean_dec(x_31);
x_32 = !lean_is_exclusive(x_18);
if (x_32 == 0)
{
lean_object* x_33; lean_object* x_34; uint8_t x_35; 
x_33 = lean_ctor_get(x_18, 0);
x_34 = lean_ctor_get(x_18, 1);
lean_dec(x_34);
x_35 = !lean_is_exclusive(x_20);
if (x_35 == 0)
{
lean_object* x_36; lean_object* x_37; lean_object* x_38; uint8_t x_39; 
x_36 = lean_ctor_get(x_20, 1);
lean_dec(x_36);
x_37 = lean_box(0);
lean_ctor_set(x_20, 1, x_37);
lean_ctor_set(x_18, 0, x_27);
lean_ctor_set(x_16, 0, x_23);
lean_ctor_set(x_14, 0, x_30);
x_38 = l_CakeML_ptree__Structure___closed__3;
x_39 = l_CakeML_tokcheckl(x_14, x_38);
if (x_39 == 0)
{
lean_object* x_40; 
lean_dec(x_33);
lean_dec(x_25);
lean_dec(x_24);
x_40 = lean_box(0);
return x_40;
}
else
{
lean_object* x_41; 
x_41 = l_CakeML_ptree__StructName(x_24);
if (lean_obj_tag(x_41) == 0)
{
lean_object* x_42; 
lean_dec(x_33);
lean_dec(x_25);
x_42 = lean_box(0);
return x_42;
}
else
{
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_43; 
lean_dec(x_41);
lean_dec(x_33);
lean_dec(x_25);
x_43 = lean_box(0);
return x_43;
}
else
{
lean_object* x_44; lean_object* x_45; lean_object* x_46; uint8_t x_47; uint8_t x_48; uint8_t x_49; 
x_44 = lean_ctor_get(x_41, 0);
lean_inc(x_44);
lean_dec(x_41);
x_45 = lean_ctor_get(x_25, 0);
lean_inc(x_45);
x_46 = lean_ctor_get(x_25, 1);
lean_inc(x_46);
lean_dec(x_25);
x_47 = 68;
x_48 = lean_unbox(x_45);
lean_dec(x_45);
x_49 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_48, x_47);
if (x_49 == 0)
{
lean_object* x_50; 
lean_dec(x_46);
lean_dec(x_44);
lean_dec(x_33);
x_50 = lean_box(0);
return x_50;
}
else
{
if (lean_obj_tag(x_46) == 0)
{
lean_object* x_51; lean_object* x_52; 
x_51 = lean_box(0);
x_52 = l_CakeML_ptree__Structure___lambda__1(x_33, x_44, x_51);
return x_52;
}
else
{
lean_object* x_53; 
x_53 = lean_ctor_get(x_46, 1);
lean_inc(x_53);
if (lean_obj_tag(x_53) == 0)
{
lean_object* x_54; 
lean_dec(x_46);
lean_dec(x_44);
lean_dec(x_33);
x_54 = lean_box(0);
return x_54;
}
else
{
lean_object* x_55; 
x_55 = lean_ctor_get(x_53, 1);
lean_inc(x_55);
if (lean_obj_tag(x_55) == 0)
{
lean_object* x_56; lean_object* x_57; lean_object* x_58; uint8_t x_59; 
x_56 = lean_ctor_get(x_46, 0);
lean_inc(x_56);
lean_dec(x_46);
x_57 = lean_ctor_get(x_53, 0);
lean_inc(x_57);
lean_dec(x_53);
x_58 = lean_box(11);
x_59 = l_CakeML_tokcheck(x_56, x_58);
if (x_59 == 0)
{
lean_object* x_60; 
lean_dec(x_57);
lean_dec(x_44);
lean_dec(x_33);
x_60 = lean_box(0);
return x_60;
}
else
{
lean_object* x_61; 
x_61 = l_CakeML_ptree__SignatureValue(x_57);
if (lean_obj_tag(x_61) == 0)
{
lean_object* x_62; 
lean_dec(x_44);
lean_dec(x_33);
x_62 = lean_box(0);
return x_62;
}
else
{
uint8_t x_63; 
x_63 = !lean_is_exclusive(x_61);
if (x_63 == 0)
{
lean_object* x_64; 
x_64 = l_CakeML_ptree__Structure___lambda__1(x_33, x_44, x_61);
lean_dec(x_61);
return x_64;
}
else
{
lean_object* x_65; lean_object* x_66; lean_object* x_67; 
x_65 = lean_ctor_get(x_61, 0);
lean_inc(x_65);
lean_dec(x_61);
x_66 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_66, 0, x_65);
x_67 = l_CakeML_ptree__Structure___lambda__1(x_33, x_44, x_66);
lean_dec(x_66);
return x_67;
}
}
}
}
else
{
lean_object* x_68; 
lean_dec(x_55);
lean_dec(x_53);
lean_dec(x_46);
lean_dec(x_44);
lean_dec(x_33);
x_68 = lean_box(0);
return x_68;
}
}
}
}
}
}
}
}
else
{
lean_object* x_69; lean_object* x_70; lean_object* x_71; lean_object* x_72; uint8_t x_73; 
x_69 = lean_ctor_get(x_20, 0);
lean_inc(x_69);
lean_dec(x_20);
x_70 = lean_box(0);
x_71 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_71, 0, x_69);
lean_ctor_set(x_71, 1, x_70);
lean_ctor_set(x_18, 1, x_71);
lean_ctor_set(x_18, 0, x_27);
lean_ctor_set(x_16, 0, x_23);
lean_ctor_set(x_14, 0, x_30);
x_72 = l_CakeML_ptree__Structure___closed__3;
x_73 = l_CakeML_tokcheckl(x_14, x_72);
if (x_73 == 0)
{
lean_object* x_74; 
lean_dec(x_33);
lean_dec(x_25);
lean_dec(x_24);
x_74 = lean_box(0);
return x_74;
}
else
{
lean_object* x_75; 
x_75 = l_CakeML_ptree__StructName(x_24);
if (lean_obj_tag(x_75) == 0)
{
lean_object* x_76; 
lean_dec(x_33);
lean_dec(x_25);
x_76 = lean_box(0);
return x_76;
}
else
{
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_77; 
lean_dec(x_75);
lean_dec(x_33);
lean_dec(x_25);
x_77 = lean_box(0);
return x_77;
}
else
{
lean_object* x_78; lean_object* x_79; lean_object* x_80; uint8_t x_81; uint8_t x_82; uint8_t x_83; 
x_78 = lean_ctor_get(x_75, 0);
lean_inc(x_78);
lean_dec(x_75);
x_79 = lean_ctor_get(x_25, 0);
lean_inc(x_79);
x_80 = lean_ctor_get(x_25, 1);
lean_inc(x_80);
lean_dec(x_25);
x_81 = 68;
x_82 = lean_unbox(x_79);
lean_dec(x_79);
x_83 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_82, x_81);
if (x_83 == 0)
{
lean_object* x_84; 
lean_dec(x_80);
lean_dec(x_78);
lean_dec(x_33);
x_84 = lean_box(0);
return x_84;
}
else
{
if (lean_obj_tag(x_80) == 0)
{
lean_object* x_85; lean_object* x_86; 
x_85 = lean_box(0);
x_86 = l_CakeML_ptree__Structure___lambda__1(x_33, x_78, x_85);
return x_86;
}
else
{
lean_object* x_87; 
x_87 = lean_ctor_get(x_80, 1);
lean_inc(x_87);
if (lean_obj_tag(x_87) == 0)
{
lean_object* x_88; 
lean_dec(x_80);
lean_dec(x_78);
lean_dec(x_33);
x_88 = lean_box(0);
return x_88;
}
else
{
lean_object* x_89; 
x_89 = lean_ctor_get(x_87, 1);
lean_inc(x_89);
if (lean_obj_tag(x_89) == 0)
{
lean_object* x_90; lean_object* x_91; lean_object* x_92; uint8_t x_93; 
x_90 = lean_ctor_get(x_80, 0);
lean_inc(x_90);
lean_dec(x_80);
x_91 = lean_ctor_get(x_87, 0);
lean_inc(x_91);
lean_dec(x_87);
x_92 = lean_box(11);
x_93 = l_CakeML_tokcheck(x_90, x_92);
if (x_93 == 0)
{
lean_object* x_94; 
lean_dec(x_91);
lean_dec(x_78);
lean_dec(x_33);
x_94 = lean_box(0);
return x_94;
}
else
{
lean_object* x_95; 
x_95 = l_CakeML_ptree__SignatureValue(x_91);
if (lean_obj_tag(x_95) == 0)
{
lean_object* x_96; 
lean_dec(x_78);
lean_dec(x_33);
x_96 = lean_box(0);
return x_96;
}
else
{
lean_object* x_97; lean_object* x_98; lean_object* x_99; lean_object* x_100; 
x_97 = lean_ctor_get(x_95, 0);
lean_inc(x_97);
if (lean_is_exclusive(x_95)) {
 lean_ctor_release(x_95, 0);
 x_98 = x_95;
} else {
 lean_dec_ref(x_95);
 x_98 = lean_box(0);
}
if (lean_is_scalar(x_98)) {
 x_99 = lean_alloc_ctor(1, 1, 0);
} else {
 x_99 = x_98;
}
lean_ctor_set(x_99, 0, x_97);
x_100 = l_CakeML_ptree__Structure___lambda__1(x_33, x_78, x_99);
lean_dec(x_99);
return x_100;
}
}
}
else
{
lean_object* x_101; 
lean_dec(x_89);
lean_dec(x_87);
lean_dec(x_80);
lean_dec(x_78);
lean_dec(x_33);
x_101 = lean_box(0);
return x_101;
}
}
}
}
}
}
}
}
}
else
{
lean_object* x_102; lean_object* x_103; lean_object* x_104; lean_object* x_105; lean_object* x_106; lean_object* x_107; lean_object* x_108; uint8_t x_109; 
x_102 = lean_ctor_get(x_18, 0);
lean_inc(x_102);
lean_dec(x_18);
x_103 = lean_ctor_get(x_20, 0);
lean_inc(x_103);
if (lean_is_exclusive(x_20)) {
 lean_ctor_release(x_20, 0);
 lean_ctor_release(x_20, 1);
 x_104 = x_20;
} else {
 lean_dec_ref(x_20);
 x_104 = lean_box(0);
}
x_105 = lean_box(0);
if (lean_is_scalar(x_104)) {
 x_106 = lean_alloc_ctor(1, 2, 0);
} else {
 x_106 = x_104;
}
lean_ctor_set(x_106, 0, x_103);
lean_ctor_set(x_106, 1, x_105);
x_107 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_107, 0, x_27);
lean_ctor_set(x_107, 1, x_106);
lean_ctor_set(x_16, 1, x_107);
lean_ctor_set(x_16, 0, x_23);
lean_ctor_set(x_14, 0, x_30);
x_108 = l_CakeML_ptree__Structure___closed__3;
x_109 = l_CakeML_tokcheckl(x_14, x_108);
if (x_109 == 0)
{
lean_object* x_110; 
lean_dec(x_102);
lean_dec(x_25);
lean_dec(x_24);
x_110 = lean_box(0);
return x_110;
}
else
{
lean_object* x_111; 
x_111 = l_CakeML_ptree__StructName(x_24);
if (lean_obj_tag(x_111) == 0)
{
lean_object* x_112; 
lean_dec(x_102);
lean_dec(x_25);
x_112 = lean_box(0);
return x_112;
}
else
{
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_113; 
lean_dec(x_111);
lean_dec(x_102);
lean_dec(x_25);
x_113 = lean_box(0);
return x_113;
}
else
{
lean_object* x_114; lean_object* x_115; lean_object* x_116; uint8_t x_117; uint8_t x_118; uint8_t x_119; 
x_114 = lean_ctor_get(x_111, 0);
lean_inc(x_114);
lean_dec(x_111);
x_115 = lean_ctor_get(x_25, 0);
lean_inc(x_115);
x_116 = lean_ctor_get(x_25, 1);
lean_inc(x_116);
lean_dec(x_25);
x_117 = 68;
x_118 = lean_unbox(x_115);
lean_dec(x_115);
x_119 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_118, x_117);
if (x_119 == 0)
{
lean_object* x_120; 
lean_dec(x_116);
lean_dec(x_114);
lean_dec(x_102);
x_120 = lean_box(0);
return x_120;
}
else
{
if (lean_obj_tag(x_116) == 0)
{
lean_object* x_121; lean_object* x_122; 
x_121 = lean_box(0);
x_122 = l_CakeML_ptree__Structure___lambda__1(x_102, x_114, x_121);
return x_122;
}
else
{
lean_object* x_123; 
x_123 = lean_ctor_get(x_116, 1);
lean_inc(x_123);
if (lean_obj_tag(x_123) == 0)
{
lean_object* x_124; 
lean_dec(x_116);
lean_dec(x_114);
lean_dec(x_102);
x_124 = lean_box(0);
return x_124;
}
else
{
lean_object* x_125; 
x_125 = lean_ctor_get(x_123, 1);
lean_inc(x_125);
if (lean_obj_tag(x_125) == 0)
{
lean_object* x_126; lean_object* x_127; lean_object* x_128; uint8_t x_129; 
x_126 = lean_ctor_get(x_116, 0);
lean_inc(x_126);
lean_dec(x_116);
x_127 = lean_ctor_get(x_123, 0);
lean_inc(x_127);
lean_dec(x_123);
x_128 = lean_box(11);
x_129 = l_CakeML_tokcheck(x_126, x_128);
if (x_129 == 0)
{
lean_object* x_130; 
lean_dec(x_127);
lean_dec(x_114);
lean_dec(x_102);
x_130 = lean_box(0);
return x_130;
}
else
{
lean_object* x_131; 
x_131 = l_CakeML_ptree__SignatureValue(x_127);
if (lean_obj_tag(x_131) == 0)
{
lean_object* x_132; 
lean_dec(x_114);
lean_dec(x_102);
x_132 = lean_box(0);
return x_132;
}
else
{
lean_object* x_133; lean_object* x_134; lean_object* x_135; lean_object* x_136; 
x_133 = lean_ctor_get(x_131, 0);
lean_inc(x_133);
if (lean_is_exclusive(x_131)) {
 lean_ctor_release(x_131, 0);
 x_134 = x_131;
} else {
 lean_dec_ref(x_131);
 x_134 = lean_box(0);
}
if (lean_is_scalar(x_134)) {
 x_135 = lean_alloc_ctor(1, 1, 0);
} else {
 x_135 = x_134;
}
lean_ctor_set(x_135, 0, x_133);
x_136 = l_CakeML_ptree__Structure___lambda__1(x_102, x_114, x_135);
lean_dec(x_135);
return x_136;
}
}
}
else
{
lean_object* x_137; 
lean_dec(x_125);
lean_dec(x_123);
lean_dec(x_116);
lean_dec(x_114);
lean_dec(x_102);
x_137 = lean_box(0);
return x_137;
}
}
}
}
}
}
}
}
}
else
{
lean_object* x_138; lean_object* x_139; lean_object* x_140; lean_object* x_141; lean_object* x_142; lean_object* x_143; lean_object* x_144; lean_object* x_145; lean_object* x_146; lean_object* x_147; uint8_t x_148; 
x_138 = lean_ctor_get(x_16, 0);
lean_inc(x_138);
lean_dec(x_16);
x_139 = lean_ctor_get(x_18, 0);
lean_inc(x_139);
if (lean_is_exclusive(x_18)) {
 lean_ctor_release(x_18, 0);
 lean_ctor_release(x_18, 1);
 x_140 = x_18;
} else {
 lean_dec_ref(x_18);
 x_140 = lean_box(0);
}
x_141 = lean_ctor_get(x_20, 0);
lean_inc(x_141);
if (lean_is_exclusive(x_20)) {
 lean_ctor_release(x_20, 0);
 lean_ctor_release(x_20, 1);
 x_142 = x_20;
} else {
 lean_dec_ref(x_20);
 x_142 = lean_box(0);
}
x_143 = lean_box(0);
if (lean_is_scalar(x_142)) {
 x_144 = lean_alloc_ctor(1, 2, 0);
} else {
 x_144 = x_142;
}
lean_ctor_set(x_144, 0, x_141);
lean_ctor_set(x_144, 1, x_143);
if (lean_is_scalar(x_140)) {
 x_145 = lean_alloc_ctor(1, 2, 0);
} else {
 x_145 = x_140;
}
lean_ctor_set(x_145, 0, x_27);
lean_ctor_set(x_145, 1, x_144);
x_146 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_146, 0, x_23);
lean_ctor_set(x_146, 1, x_145);
lean_ctor_set(x_14, 1, x_146);
lean_ctor_set(x_14, 0, x_138);
x_147 = l_CakeML_ptree__Structure___closed__3;
x_148 = l_CakeML_tokcheckl(x_14, x_147);
if (x_148 == 0)
{
lean_object* x_149; 
lean_dec(x_139);
lean_dec(x_25);
lean_dec(x_24);
x_149 = lean_box(0);
return x_149;
}
else
{
lean_object* x_150; 
x_150 = l_CakeML_ptree__StructName(x_24);
if (lean_obj_tag(x_150) == 0)
{
lean_object* x_151; 
lean_dec(x_139);
lean_dec(x_25);
x_151 = lean_box(0);
return x_151;
}
else
{
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_152; 
lean_dec(x_150);
lean_dec(x_139);
lean_dec(x_25);
x_152 = lean_box(0);
return x_152;
}
else
{
lean_object* x_153; lean_object* x_154; lean_object* x_155; uint8_t x_156; uint8_t x_157; uint8_t x_158; 
x_153 = lean_ctor_get(x_150, 0);
lean_inc(x_153);
lean_dec(x_150);
x_154 = lean_ctor_get(x_25, 0);
lean_inc(x_154);
x_155 = lean_ctor_get(x_25, 1);
lean_inc(x_155);
lean_dec(x_25);
x_156 = 68;
x_157 = lean_unbox(x_154);
lean_dec(x_154);
x_158 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_157, x_156);
if (x_158 == 0)
{
lean_object* x_159; 
lean_dec(x_155);
lean_dec(x_153);
lean_dec(x_139);
x_159 = lean_box(0);
return x_159;
}
else
{
if (lean_obj_tag(x_155) == 0)
{
lean_object* x_160; lean_object* x_161; 
x_160 = lean_box(0);
x_161 = l_CakeML_ptree__Structure___lambda__1(x_139, x_153, x_160);
return x_161;
}
else
{
lean_object* x_162; 
x_162 = lean_ctor_get(x_155, 1);
lean_inc(x_162);
if (lean_obj_tag(x_162) == 0)
{
lean_object* x_163; 
lean_dec(x_155);
lean_dec(x_153);
lean_dec(x_139);
x_163 = lean_box(0);
return x_163;
}
else
{
lean_object* x_164; 
x_164 = lean_ctor_get(x_162, 1);
lean_inc(x_164);
if (lean_obj_tag(x_164) == 0)
{
lean_object* x_165; lean_object* x_166; lean_object* x_167; uint8_t x_168; 
x_165 = lean_ctor_get(x_155, 0);
lean_inc(x_165);
lean_dec(x_155);
x_166 = lean_ctor_get(x_162, 0);
lean_inc(x_166);
lean_dec(x_162);
x_167 = lean_box(11);
x_168 = l_CakeML_tokcheck(x_165, x_167);
if (x_168 == 0)
{
lean_object* x_169; 
lean_dec(x_166);
lean_dec(x_153);
lean_dec(x_139);
x_169 = lean_box(0);
return x_169;
}
else
{
lean_object* x_170; 
x_170 = l_CakeML_ptree__SignatureValue(x_166);
if (lean_obj_tag(x_170) == 0)
{
lean_object* x_171; 
lean_dec(x_153);
lean_dec(x_139);
x_171 = lean_box(0);
return x_171;
}
else
{
lean_object* x_172; lean_object* x_173; lean_object* x_174; lean_object* x_175; 
x_172 = lean_ctor_get(x_170, 0);
lean_inc(x_172);
if (lean_is_exclusive(x_170)) {
 lean_ctor_release(x_170, 0);
 x_173 = x_170;
} else {
 lean_dec_ref(x_170);
 x_173 = lean_box(0);
}
if (lean_is_scalar(x_173)) {
 x_174 = lean_alloc_ctor(1, 1, 0);
} else {
 x_174 = x_173;
}
lean_ctor_set(x_174, 0, x_172);
x_175 = l_CakeML_ptree__Structure___lambda__1(x_139, x_153, x_174);
lean_dec(x_174);
return x_175;
}
}
}
else
{
lean_object* x_176; 
lean_dec(x_164);
lean_dec(x_162);
lean_dec(x_155);
lean_dec(x_153);
lean_dec(x_139);
x_176 = lean_box(0);
return x_176;
}
}
}
}
}
}
}
}
}
else
{
lean_object* x_177; lean_object* x_178; lean_object* x_179; lean_object* x_180; lean_object* x_181; lean_object* x_182; lean_object* x_183; lean_object* x_184; lean_object* x_185; lean_object* x_186; lean_object* x_187; lean_object* x_188; lean_object* x_189; uint8_t x_190; 
x_177 = lean_ctor_get(x_14, 0);
lean_inc(x_177);
lean_dec(x_14);
x_178 = lean_ctor_get(x_16, 0);
lean_inc(x_178);
if (lean_is_exclusive(x_16)) {
 lean_ctor_release(x_16, 0);
 lean_ctor_release(x_16, 1);
 x_179 = x_16;
} else {
 lean_dec_ref(x_16);
 x_179 = lean_box(0);
}
x_180 = lean_ctor_get(x_18, 0);
lean_inc(x_180);
if (lean_is_exclusive(x_18)) {
 lean_ctor_release(x_18, 0);
 lean_ctor_release(x_18, 1);
 x_181 = x_18;
} else {
 lean_dec_ref(x_18);
 x_181 = lean_box(0);
}
x_182 = lean_ctor_get(x_20, 0);
lean_inc(x_182);
if (lean_is_exclusive(x_20)) {
 lean_ctor_release(x_20, 0);
 lean_ctor_release(x_20, 1);
 x_183 = x_20;
} else {
 lean_dec_ref(x_20);
 x_183 = lean_box(0);
}
x_184 = lean_box(0);
if (lean_is_scalar(x_183)) {
 x_185 = lean_alloc_ctor(1, 2, 0);
} else {
 x_185 = x_183;
}
lean_ctor_set(x_185, 0, x_182);
lean_ctor_set(x_185, 1, x_184);
if (lean_is_scalar(x_181)) {
 x_186 = lean_alloc_ctor(1, 2, 0);
} else {
 x_186 = x_181;
}
lean_ctor_set(x_186, 0, x_177);
lean_ctor_set(x_186, 1, x_185);
if (lean_is_scalar(x_179)) {
 x_187 = lean_alloc_ctor(1, 2, 0);
} else {
 x_187 = x_179;
}
lean_ctor_set(x_187, 0, x_23);
lean_ctor_set(x_187, 1, x_186);
x_188 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_188, 0, x_178);
lean_ctor_set(x_188, 1, x_187);
x_189 = l_CakeML_ptree__Structure___closed__3;
x_190 = l_CakeML_tokcheckl(x_188, x_189);
if (x_190 == 0)
{
lean_object* x_191; 
lean_dec(x_180);
lean_dec(x_25);
lean_dec(x_24);
x_191 = lean_box(0);
return x_191;
}
else
{
lean_object* x_192; 
x_192 = l_CakeML_ptree__StructName(x_24);
if (lean_obj_tag(x_192) == 0)
{
lean_object* x_193; 
lean_dec(x_180);
lean_dec(x_25);
x_193 = lean_box(0);
return x_193;
}
else
{
if (lean_obj_tag(x_25) == 0)
{
lean_object* x_194; 
lean_dec(x_192);
lean_dec(x_180);
lean_dec(x_25);
x_194 = lean_box(0);
return x_194;
}
else
{
lean_object* x_195; lean_object* x_196; lean_object* x_197; uint8_t x_198; uint8_t x_199; uint8_t x_200; 
x_195 = lean_ctor_get(x_192, 0);
lean_inc(x_195);
lean_dec(x_192);
x_196 = lean_ctor_get(x_25, 0);
lean_inc(x_196);
x_197 = lean_ctor_get(x_25, 1);
lean_inc(x_197);
lean_dec(x_25);
x_198 = 68;
x_199 = lean_unbox(x_196);
lean_dec(x_196);
x_200 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_199, x_198);
if (x_200 == 0)
{
lean_object* x_201; 
lean_dec(x_197);
lean_dec(x_195);
lean_dec(x_180);
x_201 = lean_box(0);
return x_201;
}
else
{
if (lean_obj_tag(x_197) == 0)
{
lean_object* x_202; lean_object* x_203; 
x_202 = lean_box(0);
x_203 = l_CakeML_ptree__Structure___lambda__1(x_180, x_195, x_202);
return x_203;
}
else
{
lean_object* x_204; 
x_204 = lean_ctor_get(x_197, 1);
lean_inc(x_204);
if (lean_obj_tag(x_204) == 0)
{
lean_object* x_205; 
lean_dec(x_197);
lean_dec(x_195);
lean_dec(x_180);
x_205 = lean_box(0);
return x_205;
}
else
{
lean_object* x_206; 
x_206 = lean_ctor_get(x_204, 1);
lean_inc(x_206);
if (lean_obj_tag(x_206) == 0)
{
lean_object* x_207; lean_object* x_208; lean_object* x_209; uint8_t x_210; 
x_207 = lean_ctor_get(x_197, 0);
lean_inc(x_207);
lean_dec(x_197);
x_208 = lean_ctor_get(x_204, 0);
lean_inc(x_208);
lean_dec(x_204);
x_209 = lean_box(11);
x_210 = l_CakeML_tokcheck(x_207, x_209);
if (x_210 == 0)
{
lean_object* x_211; 
lean_dec(x_208);
lean_dec(x_195);
lean_dec(x_180);
x_211 = lean_box(0);
return x_211;
}
else
{
lean_object* x_212; 
x_212 = l_CakeML_ptree__SignatureValue(x_208);
if (lean_obj_tag(x_212) == 0)
{
lean_object* x_213; 
lean_dec(x_195);
lean_dec(x_180);
x_213 = lean_box(0);
return x_213;
}
else
{
lean_object* x_214; lean_object* x_215; lean_object* x_216; lean_object* x_217; 
x_214 = lean_ctor_get(x_212, 0);
lean_inc(x_214);
if (lean_is_exclusive(x_212)) {
 lean_ctor_release(x_212, 0);
 x_215 = x_212;
} else {
 lean_dec_ref(x_212);
 x_215 = lean_box(0);
}
if (lean_is_scalar(x_215)) {
 x_216 = lean_alloc_ctor(1, 1, 0);
} else {
 x_216 = x_215;
}
lean_ctor_set(x_216, 0, x_214);
x_217 = l_CakeML_ptree__Structure___lambda__1(x_180, x_195, x_216);
lean_dec(x_216);
return x_217;
}
}
}
else
{
lean_object* x_218; 
lean_dec(x_206);
lean_dec(x_204);
lean_dec(x_197);
lean_dec(x_195);
lean_dec(x_180);
x_218 = lean_box(0);
return x_218;
}
}
}
}
}
}
}
}
}
else
{
lean_object* x_219; 
lean_dec(x_22);
lean_dec(x_20);
lean_dec(x_18);
lean_dec(x_16);
lean_dec(x_14);
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_219 = lean_box(0);
return x_219;
}
}
}
}
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__Structure___lambda__1___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_CakeML_ptree__Structure___lambda__1(x_1, x_2, x_3);
lean_dec(x_3);
return x_4;
}
}
static lean_object* _init_l_CakeML_ptree__TopLevelDecs___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("it", 2, 2);
return x_1;
}
}
static lean_object* _init_l_CakeML_ptree__TopLevelDecs___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__TopLevelDecs___closed__1;
x_2 = lean_string_data(x_1);
return x_2;
}
}
static lean_object* _init_l_CakeML_ptree__TopLevelDecs___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_CakeML_ptree__TopLevelDecs___closed__2;
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__TopLevelDecs(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 72;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = l_CakeML_ptree__TbaseList___closed__1;
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; uint8_t x_14; 
x_13 = lean_ctor_get(x_4, 0);
lean_inc(x_13);
lean_dec(x_4);
x_14 = !lean_is_exclusive(x_10);
if (x_14 == 0)
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; uint8_t x_18; 
x_15 = lean_ctor_get(x_10, 0);
x_16 = lean_ctor_get(x_10, 1);
lean_dec(x_16);
x_17 = lean_box(12);
lean_inc(x_13);
x_18 = l_CakeML_tokcheck(x_13, x_17);
if (x_18 == 0)
{
lean_object* x_19; 
x_19 = l_CakeML_ptree__Decl(x_13);
if (lean_obj_tag(x_19) == 0)
{
lean_object* x_20; 
lean_free_object(x_10);
lean_dec(x_15);
x_20 = lean_box(0);
return x_20;
}
else
{
lean_object* x_21; lean_object* x_22; 
x_21 = lean_ctor_get(x_19, 0);
lean_inc(x_21);
lean_dec(x_19);
x_22 = l_CakeML_ptree__NonETopLevelDecs(x_15);
if (lean_obj_tag(x_22) == 0)
{
lean_object* x_23; 
lean_dec(x_21);
lean_free_object(x_10);
x_23 = lean_box(0);
return x_23;
}
else
{
uint8_t x_24; 
x_24 = !lean_is_exclusive(x_22);
if (x_24 == 0)
{
lean_object* x_25; 
x_25 = lean_ctor_get(x_22, 0);
lean_ctor_set(x_10, 1, x_25);
lean_ctor_set(x_10, 0, x_21);
lean_ctor_set(x_22, 0, x_10);
return x_22;
}
else
{
lean_object* x_26; lean_object* x_27; 
x_26 = lean_ctor_get(x_22, 0);
lean_inc(x_26);
lean_dec(x_22);
lean_ctor_set(x_10, 1, x_26);
lean_ctor_set(x_10, 0, x_21);
x_27 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_27, 0, x_10);
return x_27;
}
}
}
}
else
{
lean_free_object(x_10);
lean_dec(x_13);
x_1 = x_15;
goto _start;
}
}
else
{
lean_object* x_29; lean_object* x_30; uint8_t x_31; 
x_29 = lean_ctor_get(x_10, 0);
lean_inc(x_29);
lean_dec(x_10);
x_30 = lean_box(12);
lean_inc(x_13);
x_31 = l_CakeML_tokcheck(x_13, x_30);
if (x_31 == 0)
{
lean_object* x_32; 
x_32 = l_CakeML_ptree__Decl(x_13);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; 
lean_dec(x_29);
x_33 = lean_box(0);
return x_33;
}
else
{
lean_object* x_34; lean_object* x_35; 
x_34 = lean_ctor_get(x_32, 0);
lean_inc(x_34);
lean_dec(x_32);
x_35 = l_CakeML_ptree__NonETopLevelDecs(x_29);
if (lean_obj_tag(x_35) == 0)
{
lean_object* x_36; 
lean_dec(x_34);
x_36 = lean_box(0);
return x_36;
}
else
{
lean_object* x_37; lean_object* x_38; lean_object* x_39; lean_object* x_40; 
x_37 = lean_ctor_get(x_35, 0);
lean_inc(x_37);
if (lean_is_exclusive(x_35)) {
 lean_ctor_release(x_35, 0);
 x_38 = x_35;
} else {
 lean_dec_ref(x_35);
 x_38 = lean_box(0);
}
x_39 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_39, 0, x_34);
lean_ctor_set(x_39, 1, x_37);
if (lean_is_scalar(x_38)) {
 x_40 = lean_alloc_ctor(1, 1, 0);
} else {
 x_40 = x_38;
}
lean_ctor_set(x_40, 0, x_39);
return x_40;
}
}
}
else
{
lean_dec(x_13);
x_1 = x_29;
goto _start;
}
}
}
else
{
lean_object* x_42; 
x_42 = lean_ctor_get(x_12, 1);
lean_inc(x_42);
if (lean_obj_tag(x_42) == 0)
{
lean_object* x_43; lean_object* x_44; uint8_t x_45; 
x_43 = lean_ctor_get(x_4, 0);
lean_inc(x_43);
lean_dec(x_4);
x_44 = lean_ctor_get(x_10, 0);
lean_inc(x_44);
lean_dec(x_10);
x_45 = !lean_is_exclusive(x_12);
if (x_45 == 0)
{
lean_object* x_46; lean_object* x_47; lean_object* x_48; uint8_t x_49; 
x_46 = lean_ctor_get(x_12, 0);
x_47 = lean_ctor_get(x_12, 1);
lean_dec(x_47);
x_48 = lean_box(12);
x_49 = l_CakeML_tokcheck(x_44, x_48);
if (x_49 == 0)
{
lean_object* x_50; 
lean_free_object(x_12);
lean_dec(x_46);
lean_dec(x_43);
x_50 = lean_box(0);
return x_50;
}
else
{
uint8_t x_51; lean_object* x_52; 
x_51 = 46;
x_52 = l_CakeML_ptree__Expr(x_51, x_43);
if (lean_obj_tag(x_52) == 0)
{
lean_object* x_53; 
lean_free_object(x_12);
lean_dec(x_46);
x_53 = lean_box(0);
return x_53;
}
else
{
lean_object* x_54; lean_object* x_55; 
x_54 = lean_ctor_get(x_52, 0);
lean_inc(x_54);
lean_dec(x_52);
x_55 = l_CakeML_ptree__TopLevelDecs(x_46);
if (lean_obj_tag(x_55) == 0)
{
lean_object* x_56; 
lean_dec(x_54);
lean_free_object(x_12);
x_56 = lean_box(0);
return x_56;
}
else
{
uint8_t x_57; 
x_57 = !lean_is_exclusive(x_55);
if (x_57 == 0)
{
lean_object* x_58; lean_object* x_59; lean_object* x_60; lean_object* x_61; 
x_58 = lean_ctor_get(x_55, 0);
x_59 = l_CakeML_unknown__loc;
x_60 = l_CakeML_ptree__TopLevelDecs___closed__3;
x_61 = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(x_61, 0, x_59);
lean_ctor_set(x_61, 1, x_60);
lean_ctor_set(x_61, 2, x_54);
lean_ctor_set(x_12, 1, x_58);
lean_ctor_set(x_12, 0, x_61);
lean_ctor_set(x_55, 0, x_12);
return x_55;
}
else
{
lean_object* x_62; lean_object* x_63; lean_object* x_64; lean_object* x_65; lean_object* x_66; 
x_62 = lean_ctor_get(x_55, 0);
lean_inc(x_62);
lean_dec(x_55);
x_63 = l_CakeML_unknown__loc;
x_64 = l_CakeML_ptree__TopLevelDecs___closed__3;
x_65 = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(x_65, 0, x_63);
lean_ctor_set(x_65, 1, x_64);
lean_ctor_set(x_65, 2, x_54);
lean_ctor_set(x_12, 1, x_62);
lean_ctor_set(x_12, 0, x_65);
x_66 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_66, 0, x_12);
return x_66;
}
}
}
}
}
else
{
lean_object* x_67; lean_object* x_68; uint8_t x_69; 
x_67 = lean_ctor_get(x_12, 0);
lean_inc(x_67);
lean_dec(x_12);
x_68 = lean_box(12);
x_69 = l_CakeML_tokcheck(x_44, x_68);
if (x_69 == 0)
{
lean_object* x_70; 
lean_dec(x_67);
lean_dec(x_43);
x_70 = lean_box(0);
return x_70;
}
else
{
uint8_t x_71; lean_object* x_72; 
x_71 = 46;
x_72 = l_CakeML_ptree__Expr(x_71, x_43);
if (lean_obj_tag(x_72) == 0)
{
lean_object* x_73; 
lean_dec(x_67);
x_73 = lean_box(0);
return x_73;
}
else
{
lean_object* x_74; lean_object* x_75; 
x_74 = lean_ctor_get(x_72, 0);
lean_inc(x_74);
lean_dec(x_72);
x_75 = l_CakeML_ptree__TopLevelDecs(x_67);
if (lean_obj_tag(x_75) == 0)
{
lean_object* x_76; 
lean_dec(x_74);
x_76 = lean_box(0);
return x_76;
}
else
{
lean_object* x_77; lean_object* x_78; lean_object* x_79; lean_object* x_80; lean_object* x_81; lean_object* x_82; lean_object* x_83; 
x_77 = lean_ctor_get(x_75, 0);
lean_inc(x_77);
if (lean_is_exclusive(x_75)) {
 lean_ctor_release(x_75, 0);
 x_78 = x_75;
} else {
 lean_dec_ref(x_75);
 x_78 = lean_box(0);
}
x_79 = l_CakeML_unknown__loc;
x_80 = l_CakeML_ptree__TopLevelDecs___closed__3;
x_81 = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(x_81, 0, x_79);
lean_ctor_set(x_81, 1, x_80);
lean_ctor_set(x_81, 2, x_74);
x_82 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_82, 0, x_81);
lean_ctor_set(x_82, 1, x_77);
if (lean_is_scalar(x_78)) {
 x_83 = lean_alloc_ctor(1, 1, 0);
} else {
 x_83 = x_78;
}
lean_ctor_set(x_83, 0, x_82);
return x_83;
}
}
}
}
}
else
{
lean_object* x_84; 
lean_dec(x_42);
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_84 = lean_box(0);
return x_84;
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_CakeML_ptree__NonETopLevelDecs(lean_object* x_1) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_2; 
lean_dec(x_1);
x_2 = lean_box(0);
return x_2;
}
else
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; uint8_t x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = 73;
x_6 = lean_unbox(x_3);
lean_dec(x_3);
x_7 = l___private_CakeML_Core_Gram_0__CakeML_beqMMLnonT____x40_CakeML_Core_Gram___hyg_2463_(x_6, x_5);
if (x_7 == 0)
{
lean_object* x_8; 
lean_dec(x_4);
x_8 = lean_box(0);
return x_8;
}
else
{
if (lean_obj_tag(x_4) == 0)
{
lean_object* x_9; 
x_9 = l_CakeML_ptree__TbaseList___closed__1;
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_ctor_get(x_4, 1);
lean_inc(x_10);
if (lean_obj_tag(x_10) == 0)
{
lean_object* x_11; 
lean_dec(x_4);
x_11 = lean_box(0);
return x_11;
}
else
{
lean_object* x_12; 
x_12 = lean_ctor_get(x_10, 1);
lean_inc(x_12);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; uint8_t x_14; 
x_13 = lean_ctor_get(x_4, 0);
lean_inc(x_13);
lean_dec(x_4);
x_14 = !lean_is_exclusive(x_10);
if (x_14 == 0)
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; uint8_t x_18; 
x_15 = lean_ctor_get(x_10, 0);
x_16 = lean_ctor_get(x_10, 1);
lean_dec(x_16);
x_17 = lean_box(12);
lean_inc(x_13);
x_18 = l_CakeML_tokcheck(x_13, x_17);
if (x_18 == 0)
{
lean_object* x_19; 
x_19 = l_CakeML_ptree__Decl(x_13);
if (lean_obj_tag(x_19) == 0)
{
lean_object* x_20; 
lean_free_object(x_10);
lean_dec(x_15);
x_20 = lean_box(0);
return x_20;
}
else
{
lean_object* x_21; lean_object* x_22; 
x_21 = lean_ctor_get(x_19, 0);
lean_inc(x_21);
lean_dec(x_19);
x_22 = l_CakeML_ptree__NonETopLevelDecs(x_15);
if (lean_obj_tag(x_22) == 0)
{
lean_object* x_23; 
lean_dec(x_21);
lean_free_object(x_10);
x_23 = lean_box(0);
return x_23;
}
else
{
uint8_t x_24; 
x_24 = !lean_is_exclusive(x_22);
if (x_24 == 0)
{
lean_object* x_25; 
x_25 = lean_ctor_get(x_22, 0);
lean_ctor_set(x_10, 1, x_25);
lean_ctor_set(x_10, 0, x_21);
lean_ctor_set(x_22, 0, x_10);
return x_22;
}
else
{
lean_object* x_26; lean_object* x_27; 
x_26 = lean_ctor_get(x_22, 0);
lean_inc(x_26);
lean_dec(x_22);
lean_ctor_set(x_10, 1, x_26);
lean_ctor_set(x_10, 0, x_21);
x_27 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_27, 0, x_10);
return x_27;
}
}
}
}
else
{
lean_object* x_28; 
lean_free_object(x_10);
lean_dec(x_13);
x_28 = l_CakeML_ptree__TopLevelDecs(x_15);
return x_28;
}
}
else
{
lean_object* x_29; lean_object* x_30; uint8_t x_31; 
x_29 = lean_ctor_get(x_10, 0);
lean_inc(x_29);
lean_dec(x_10);
x_30 = lean_box(12);
lean_inc(x_13);
x_31 = l_CakeML_tokcheck(x_13, x_30);
if (x_31 == 0)
{
lean_object* x_32; 
x_32 = l_CakeML_ptree__Decl(x_13);
if (lean_obj_tag(x_32) == 0)
{
lean_object* x_33; 
lean_dec(x_29);
x_33 = lean_box(0);
return x_33;
}
else
{
lean_object* x_34; lean_object* x_35; 
x_34 = lean_ctor_get(x_32, 0);
lean_inc(x_34);
lean_dec(x_32);
x_35 = l_CakeML_ptree__NonETopLevelDecs(x_29);
if (lean_obj_tag(x_35) == 0)
{
lean_object* x_36; 
lean_dec(x_34);
x_36 = lean_box(0);
return x_36;
}
else
{
lean_object* x_37; lean_object* x_38; lean_object* x_39; lean_object* x_40; 
x_37 = lean_ctor_get(x_35, 0);
lean_inc(x_37);
if (lean_is_exclusive(x_35)) {
 lean_ctor_release(x_35, 0);
 x_38 = x_35;
} else {
 lean_dec_ref(x_35);
 x_38 = lean_box(0);
}
x_39 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_39, 0, x_34);
lean_ctor_set(x_39, 1, x_37);
if (lean_is_scalar(x_38)) {
 x_40 = lean_alloc_ctor(1, 1, 0);
} else {
 x_40 = x_38;
}
lean_ctor_set(x_40, 0, x_39);
return x_40;
}
}
}
else
{
lean_object* x_41; 
lean_dec(x_13);
x_41 = l_CakeML_ptree__TopLevelDecs(x_29);
return x_41;
}
}
}
else
{
lean_object* x_42; 
lean_dec(x_12);
lean_dec(x_10);
lean_dec(x_4);
x_42 = lean_box(0);
return x_42;
}
}
}
}
}
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Ast(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Tokens(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_Gram(uint8_t builtin, lean_object*);
lean_object* initialize_CakeML_Core_TokenUtils(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_CakeML_Core_CmlPtreeConversion(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Ast(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Tokens(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_Gram(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_CakeML_Core_TokenUtils(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_CakeML_instInhabitedPCstate0___closed__1 = _init_l_CakeML_instInhabitedPCstate0___closed__1();
lean_mark_persistent(l_CakeML_instInhabitedPCstate0___closed__1);
l_CakeML_instInhabitedPCstate0 = _init_l_CakeML_instInhabitedPCstate0();
lean_mark_persistent(l_CakeML_instInhabitedPCstate0);
l_CakeML_empty__PCstate0 = _init_l_CakeML_empty__PCstate0();
lean_mark_persistent(l_CakeML_empty__PCstate0);
l_CakeML_mk__binop___closed__1 = _init_l_CakeML_mk__binop___closed__1();
lean_mark_persistent(l_CakeML_mk__binop___closed__1);
l_CakeML_mk__binop___closed__2 = _init_l_CakeML_mk__binop___closed__2();
lean_mark_persistent(l_CakeML_mk__binop___closed__2);
l_CakeML_mk__binop___closed__3 = _init_l_CakeML_mk__binop___closed__3();
lean_mark_persistent(l_CakeML_mk__binop___closed__3);
l_CakeML_mk__binop___closed__4 = _init_l_CakeML_mk__binop___closed__4();
lean_mark_persistent(l_CakeML_mk__binop___closed__4);
l_CakeML_ptree__TypeName___closed__1 = _init_l_CakeML_ptree__TypeName___closed__1();
lean_mark_persistent(l_CakeML_ptree__TypeName___closed__1);
l_CakeML_ptree__TbaseList___closed__1 = _init_l_CakeML_ptree__TbaseList___closed__1();
lean_mark_persistent(l_CakeML_ptree__TbaseList___closed__1);
l_CakeML_ptree__DtypeDecl___closed__1 = _init_l_CakeML_ptree__DtypeDecl___closed__1();
lean_mark_persistent(l_CakeML_ptree__DtypeDecl___closed__1);
l_CakeML_ptree__TypeDec___closed__1 = _init_l_CakeML_ptree__TypeDec___closed__1();
lean_mark_persistent(l_CakeML_ptree__TypeDec___closed__1);
l_CakeML_ptree__Op___closed__1 = _init_l_CakeML_ptree__Op___closed__1();
lean_mark_persistent(l_CakeML_ptree__Op___closed__1);
l_CakeML_ptree__Op___closed__2 = _init_l_CakeML_ptree__Op___closed__2();
lean_mark_persistent(l_CakeML_ptree__Op___closed__2);
l_CakeML_ptree__Op___closed__3 = _init_l_CakeML_ptree__Op___closed__3();
lean_mark_persistent(l_CakeML_ptree__Op___closed__3);
l_CakeML_ptree__Op___closed__4 = _init_l_CakeML_ptree__Op___closed__4();
lean_mark_persistent(l_CakeML_ptree__Op___closed__4);
l_CakeML_ptree__Op___closed__5 = _init_l_CakeML_ptree__Op___closed__5();
lean_mark_persistent(l_CakeML_ptree__Op___closed__5);
l_CakeML_ptree__Op___closed__6 = _init_l_CakeML_ptree__Op___closed__6();
lean_mark_persistent(l_CakeML_ptree__Op___closed__6);
l_CakeML_ptree__Op___closed__7 = _init_l_CakeML_ptree__Op___closed__7();
lean_mark_persistent(l_CakeML_ptree__Op___closed__7);
l_CakeML_ptree__Op___closed__8 = _init_l_CakeML_ptree__Op___closed__8();
lean_mark_persistent(l_CakeML_ptree__Op___closed__8);
l_CakeML_ptree__Op___closed__9 = _init_l_CakeML_ptree__Op___closed__9();
lean_mark_persistent(l_CakeML_ptree__Op___closed__9);
l_CakeML_ptree__Op___closed__10 = _init_l_CakeML_ptree__Op___closed__10();
lean_mark_persistent(l_CakeML_ptree__Op___closed__10);
l_CakeML_ptree__Op___closed__11 = _init_l_CakeML_ptree__Op___closed__11();
lean_mark_persistent(l_CakeML_ptree__Op___closed__11);
l_CakeML_ptree__Op___closed__12 = _init_l_CakeML_ptree__Op___closed__12();
lean_mark_persistent(l_CakeML_ptree__Op___closed__12);
l_CakeML_ptree__Op___closed__13 = _init_l_CakeML_ptree__Op___closed__13();
lean_mark_persistent(l_CakeML_ptree__Op___closed__13);
l_CakeML_ptree__Op___closed__14 = _init_l_CakeML_ptree__Op___closed__14();
lean_mark_persistent(l_CakeML_ptree__Op___closed__14);
l_CakeML_ptree__Op___closed__15 = _init_l_CakeML_ptree__Op___closed__15();
lean_mark_persistent(l_CakeML_ptree__Op___closed__15);
l_CakeML_ptree__Op___closed__16 = _init_l_CakeML_ptree__Op___closed__16();
lean_mark_persistent(l_CakeML_ptree__Op___closed__16);
l_CakeML_ptree__Op___closed__17 = _init_l_CakeML_ptree__Op___closed__17();
lean_mark_persistent(l_CakeML_ptree__Op___closed__17);
l_CakeML_ptree__Op___closed__18 = _init_l_CakeML_ptree__Op___closed__18();
lean_mark_persistent(l_CakeML_ptree__Op___closed__18);
l_CakeML_ptree__Op___closed__19 = _init_l_CakeML_ptree__Op___closed__19();
lean_mark_persistent(l_CakeML_ptree__Op___closed__19);
l_CakeML_ptree__Op___closed__20 = _init_l_CakeML_ptree__Op___closed__20();
lean_mark_persistent(l_CakeML_ptree__Op___closed__20);
l_CakeML_ptree__Op___closed__21 = _init_l_CakeML_ptree__Op___closed__21();
lean_mark_persistent(l_CakeML_ptree__Op___closed__21);
l_CakeML_ptree__Op___closed__22 = _init_l_CakeML_ptree__Op___closed__22();
lean_mark_persistent(l_CakeML_ptree__Op___closed__22);
l_CakeML_ptree__Op___closed__23 = _init_l_CakeML_ptree__Op___closed__23();
lean_mark_persistent(l_CakeML_ptree__Op___closed__23);
l_CakeML_ptree__Op___closed__24 = _init_l_CakeML_ptree__Op___closed__24();
lean_mark_persistent(l_CakeML_ptree__Op___closed__24);
l_CakeML_ptree__Op___closed__25 = _init_l_CakeML_ptree__Op___closed__25();
lean_mark_persistent(l_CakeML_ptree__Op___closed__25);
l_CakeML_ptree__Op___closed__26 = _init_l_CakeML_ptree__Op___closed__26();
lean_mark_persistent(l_CakeML_ptree__Op___closed__26);
l_CakeML_ptree__Op___closed__27 = _init_l_CakeML_ptree__Op___closed__27();
lean_mark_persistent(l_CakeML_ptree__Op___closed__27);
l_CakeML_ptree__Op___closed__28 = _init_l_CakeML_ptree__Op___closed__28();
lean_mark_persistent(l_CakeML_ptree__Op___closed__28);
l_CakeML_ptree__Op___closed__29 = _init_l_CakeML_ptree__Op___closed__29();
lean_mark_persistent(l_CakeML_ptree__Op___closed__29);
l_CakeML_ptree__Op___closed__30 = _init_l_CakeML_ptree__Op___closed__30();
lean_mark_persistent(l_CakeML_ptree__Op___closed__30);
l_CakeML_ptree__Op___closed__31 = _init_l_CakeML_ptree__Op___closed__31();
lean_mark_persistent(l_CakeML_ptree__Op___closed__31);
l_CakeML_ptree__Op___closed__32 = _init_l_CakeML_ptree__Op___closed__32();
lean_mark_persistent(l_CakeML_ptree__Op___closed__32);
l_CakeML_ptree__Op___closed__33 = _init_l_CakeML_ptree__Op___closed__33();
lean_mark_persistent(l_CakeML_ptree__Op___closed__33);
l_CakeML_ptree__Op___closed__34 = _init_l_CakeML_ptree__Op___closed__34();
lean_mark_persistent(l_CakeML_ptree__Op___closed__34);
l_CakeML_ptree__Op___closed__35 = _init_l_CakeML_ptree__Op___closed__35();
lean_mark_persistent(l_CakeML_ptree__Op___closed__35);
l_CakeML_ptree__Op___closed__36 = _init_l_CakeML_ptree__Op___closed__36();
lean_mark_persistent(l_CakeML_ptree__Op___closed__36);
l_CakeML_ptree__Op___closed__37 = _init_l_CakeML_ptree__Op___closed__37();
lean_mark_persistent(l_CakeML_ptree__Op___closed__37);
l_CakeML_ptree__Op___closed__38 = _init_l_CakeML_ptree__Op___closed__38();
lean_mark_persistent(l_CakeML_ptree__Op___closed__38);
l_CakeML_isConstructor___closed__1 = _init_l_CakeML_isConstructor___closed__1();
lean_mark_persistent(l_CakeML_isConstructor___closed__1);
l_CakeML_isConstructor___closed__2 = _init_l_CakeML_isConstructor___closed__2();
lean_mark_persistent(l_CakeML_isConstructor___closed__2);
l_CakeML_ptree__OpID___closed__1 = _init_l_CakeML_ptree__OpID___closed__1();
lean_mark_persistent(l_CakeML_ptree__OpID___closed__1);
l_CakeML_ptree__OpID___closed__2 = _init_l_CakeML_ptree__OpID___closed__2();
lean_mark_persistent(l_CakeML_ptree__OpID___closed__2);
l_CakeML_ptree__OpID___closed__3 = _init_l_CakeML_ptree__OpID___closed__3();
lean_mark_persistent(l_CakeML_ptree__OpID___closed__3);
l_CakeML_ptree__OpID___closed__4 = _init_l_CakeML_ptree__OpID___closed__4();
lean_mark_persistent(l_CakeML_ptree__OpID___closed__4);
l_CakeML_ptree__OpID___closed__5 = _init_l_CakeML_ptree__OpID___closed__5();
lean_mark_persistent(l_CakeML_ptree__OpID___closed__5);
l_CakeML_ptree__OpID___closed__6 = _init_l_CakeML_ptree__OpID___closed__6();
lean_mark_persistent(l_CakeML_ptree__OpID___closed__6);
l_CakeML_ptree__OpID___closed__7 = _init_l_CakeML_ptree__OpID___closed__7();
lean_mark_persistent(l_CakeML_ptree__OpID___closed__7);
l_CakeML_ptree__OpID___closed__8 = _init_l_CakeML_ptree__OpID___closed__8();
lean_mark_persistent(l_CakeML_ptree__OpID___closed__8);
l_CakeML_maybe__handleRef___closed__1 = _init_l_CakeML_maybe__handleRef___closed__1();
lean_mark_persistent(l_CakeML_maybe__handleRef___closed__1);
l_CakeML_maybe__handleRef___closed__2 = _init_l_CakeML_maybe__handleRef___closed__2();
lean_mark_persistent(l_CakeML_maybe__handleRef___closed__2);
l_CakeML_ptree__Pattern___closed__1 = _init_l_CakeML_ptree__Pattern___closed__1();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__1);
l_CakeML_ptree__Pattern___closed__2 = _init_l_CakeML_ptree__Pattern___closed__2();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__2);
l_CakeML_ptree__Pattern___closed__3 = _init_l_CakeML_ptree__Pattern___closed__3();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__3);
l_CakeML_ptree__Pattern___closed__4 = _init_l_CakeML_ptree__Pattern___closed__4();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__4);
l_CakeML_ptree__Pattern___closed__5 = _init_l_CakeML_ptree__Pattern___closed__5();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__5);
l_CakeML_ptree__Pattern___closed__6 = _init_l_CakeML_ptree__Pattern___closed__6();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__6);
l_CakeML_ptree__Pattern___closed__7 = _init_l_CakeML_ptree__Pattern___closed__7();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__7);
l_CakeML_ptree__Pattern___closed__8 = _init_l_CakeML_ptree__Pattern___closed__8();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__8);
l_CakeML_ptree__Pattern___closed__9 = _init_l_CakeML_ptree__Pattern___closed__9();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__9);
l_CakeML_ptree__Pattern___closed__10 = _init_l_CakeML_ptree__Pattern___closed__10();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__10);
l_CakeML_ptree__Pattern___closed__11 = _init_l_CakeML_ptree__Pattern___closed__11();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__11);
l_CakeML_ptree__Pattern___closed__12 = _init_l_CakeML_ptree__Pattern___closed__12();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__12);
l_CakeML_ptree__Pattern___closed__13 = _init_l_CakeML_ptree__Pattern___closed__13();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__13);
l_CakeML_ptree__Pattern___closed__14 = _init_l_CakeML_ptree__Pattern___closed__14();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__14);
l_CakeML_ptree__Pattern___closed__15 = _init_l_CakeML_ptree__Pattern___closed__15();
lean_mark_persistent(l_CakeML_ptree__Pattern___closed__15);
l_CakeML_mkAst__App___lambda__1___closed__1 = _init_l_CakeML_mkAst__App___lambda__1___closed__1();
lean_mark_persistent(l_CakeML_mkAst__App___lambda__1___closed__1);
l_CakeML_mkAst__App___lambda__1___closed__2 = _init_l_CakeML_mkAst__App___lambda__1___closed__2();
lean_mark_persistent(l_CakeML_mkAst__App___lambda__1___closed__2);
l_CakeML_dePat___closed__1 = _init_l_CakeML_dePat___closed__1();
lean_mark_persistent(l_CakeML_dePat___closed__1);
l_CakeML_dePat___closed__2 = _init_l_CakeML_dePat___closed__2();
lean_mark_persistent(l_CakeML_dePat___closed__2);
l_CakeML_ptree__Eliteral___closed__1 = _init_l_CakeML_ptree__Eliteral___closed__1();
lean_mark_persistent(l_CakeML_ptree__Eliteral___closed__1);
l_CakeML_ptree__Expr___closed__1 = _init_l_CakeML_ptree__Expr___closed__1();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__1);
l_CakeML_ptree__Expr___closed__2 = _init_l_CakeML_ptree__Expr___closed__2();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__2);
l_CakeML_ptree__Expr___closed__3 = _init_l_CakeML_ptree__Expr___closed__3();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__3);
l_CakeML_ptree__Expr___closed__4 = _init_l_CakeML_ptree__Expr___closed__4();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__4);
l_CakeML_ptree__Expr___closed__5 = _init_l_CakeML_ptree__Expr___closed__5();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__5);
l_CakeML_ptree__Expr___closed__6 = _init_l_CakeML_ptree__Expr___closed__6();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__6);
l_CakeML_ptree__Expr___closed__7 = _init_l_CakeML_ptree__Expr___closed__7();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__7);
l_CakeML_ptree__Expr___closed__8 = _init_l_CakeML_ptree__Expr___closed__8();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__8);
l_CakeML_ptree__Expr___closed__9 = _init_l_CakeML_ptree__Expr___closed__9();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__9);
l_CakeML_ptree__Expr___closed__10 = _init_l_CakeML_ptree__Expr___closed__10();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__10);
l_CakeML_ptree__Expr___closed__11 = _init_l_CakeML_ptree__Expr___closed__11();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__11);
l_CakeML_ptree__Expr___closed__12 = _init_l_CakeML_ptree__Expr___closed__12();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__12);
l_CakeML_ptree__Expr___closed__13 = _init_l_CakeML_ptree__Expr___closed__13();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__13);
l_CakeML_ptree__Expr___closed__14 = _init_l_CakeML_ptree__Expr___closed__14();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__14);
l_CakeML_ptree__Expr___closed__15 = _init_l_CakeML_ptree__Expr___closed__15();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__15);
l_CakeML_ptree__Expr___closed__16 = _init_l_CakeML_ptree__Expr___closed__16();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__16);
l_CakeML_ptree__Expr___closed__17 = _init_l_CakeML_ptree__Expr___closed__17();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__17);
l_CakeML_ptree__Expr___closed__18 = _init_l_CakeML_ptree__Expr___closed__18();
lean_mark_persistent(l_CakeML_ptree__Expr___closed__18);
l_CakeML_ptree__PEsfx___closed__1 = _init_l_CakeML_ptree__PEsfx___closed__1();
lean_mark_persistent(l_CakeML_ptree__PEsfx___closed__1);
l_CakeML_ptree__PEsfx___closed__2 = _init_l_CakeML_ptree__PEsfx___closed__2();
lean_mark_persistent(l_CakeML_ptree__PEsfx___closed__2);
l_CakeML_ptree__LetDec___closed__1 = _init_l_CakeML_ptree__LetDec___closed__1();
lean_mark_persistent(l_CakeML_ptree__LetDec___closed__1);
l_CakeML_ptree__OptTypEqn___closed__1 = _init_l_CakeML_ptree__OptTypEqn___closed__1();
lean_mark_persistent(l_CakeML_ptree__OptTypEqn___closed__1);
l_CakeML_ptree__SpecLine___closed__1 = _init_l_CakeML_ptree__SpecLine___closed__1();
lean_mark_persistent(l_CakeML_ptree__SpecLine___closed__1);
l_CakeML_ptree__SpecLine___closed__2 = _init_l_CakeML_ptree__SpecLine___closed__2();
lean_mark_persistent(l_CakeML_ptree__SpecLine___closed__2);
l_CakeML_ptree__SpecLine___closed__3 = _init_l_CakeML_ptree__SpecLine___closed__3();
lean_mark_persistent(l_CakeML_ptree__SpecLine___closed__3);
l_CakeML_ptree__SignatureValue___closed__1 = _init_l_CakeML_ptree__SignatureValue___closed__1();
lean_mark_persistent(l_CakeML_ptree__SignatureValue___closed__1);
l_CakeML_ptree__Decl___closed__1 = _init_l_CakeML_ptree__Decl___closed__1();
lean_mark_persistent(l_CakeML_ptree__Decl___closed__1);
l_CakeML_ptree__Structure___closed__1 = _init_l_CakeML_ptree__Structure___closed__1();
lean_mark_persistent(l_CakeML_ptree__Structure___closed__1);
l_CakeML_ptree__Structure___closed__2 = _init_l_CakeML_ptree__Structure___closed__2();
lean_mark_persistent(l_CakeML_ptree__Structure___closed__2);
l_CakeML_ptree__Structure___closed__3 = _init_l_CakeML_ptree__Structure___closed__3();
lean_mark_persistent(l_CakeML_ptree__Structure___closed__3);
l_CakeML_ptree__TopLevelDecs___closed__1 = _init_l_CakeML_ptree__TopLevelDecs___closed__1();
lean_mark_persistent(l_CakeML_ptree__TopLevelDecs___closed__1);
l_CakeML_ptree__TopLevelDecs___closed__2 = _init_l_CakeML_ptree__TopLevelDecs___closed__2();
lean_mark_persistent(l_CakeML_ptree__TopLevelDecs___closed__2);
l_CakeML_ptree__TopLevelDecs___closed__3 = _init_l_CakeML_ptree__TopLevelDecs___closed__3();
lean_mark_persistent(l_CakeML_ptree__TopLevelDecs___closed__3);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
