# Bool<->Nat
def Set/TypeIff/boolIffNat : Set/Iff(Nat, Bool) =
  λC.λI.I(λx.True)(λx.0n)
