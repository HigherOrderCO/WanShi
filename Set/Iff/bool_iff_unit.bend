# Bool<->Unit
def Set/TypeIff/bool_iff_unit : Set/Iff(Bool, Unit) =
  λC.λI.I(λx.())(λx.True)
