# Nat<->Unit
def Set/TypeIff/natIffUnit : Set/Iff(Nat, Unit) =
  λC.λI.I(λx.())(λx.0n)
