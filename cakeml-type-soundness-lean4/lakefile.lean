import Lake
open Lake DSL

package «cakeml-type-soundness-lean4» where
  leanOptions := #[
    ⟨`autoImplicit, true⟩
  ]

@[default_target]
lean_lib «CakeML» where
  srcDir := "."
