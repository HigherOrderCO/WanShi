# Nat<->Unit
def Set/TypeIff/nat_iff_unit : Set/Iff(Nat, Unit) =
  λC.λI.I(λx.())(λx.0n)
