# ¬(Unit<->Empty):
def not__unit_iff_empty : Set/Not(Set/Iff(Bool, Empty)) =
  λI.I(Empty)(λbe.λeb.be(True))
