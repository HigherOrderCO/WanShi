# ¬(A ∧ ¬A)
def Set/Identities/no_contradiction : ∀A:Set . (Set/Not(Set/And(A, Set/Not(A)))) =
  λA.λI.I(Empty)(λa.λae.ae(a))
