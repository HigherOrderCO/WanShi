def injective() -> Proof/Function/Injective(Nat, Nat, Nat/succ):
  λx.λy.λeq1.λeq2.
    eq1(Nat/pred/preserves_eq(1n+x,1n+y, eq2))
