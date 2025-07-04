# Bool<->Unit
def Set/TypeIff/boolIffUnit : Set/Iff(Bool, Unit) =
  λC.λI.I(λx.())(λx.True)
