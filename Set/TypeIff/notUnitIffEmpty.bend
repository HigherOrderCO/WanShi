# ¬(Unit<->Empty):
def notUnitIffEmpty : Set/Not(Set/Iff(Bool, Empty)) =
  λI.I(Empty)(λbe.λeb.be(True))
