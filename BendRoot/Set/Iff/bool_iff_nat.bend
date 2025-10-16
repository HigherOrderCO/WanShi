# Bool<->Nat
def bool_iff_nat : Set/Iff(Nat, Bool) =
  λC.λI.I(λx.True)(λx.0n)
