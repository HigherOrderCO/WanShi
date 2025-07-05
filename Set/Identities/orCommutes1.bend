# (A ∨ B)->(B ∨ A)
def Set/Identities/orCommutes1 : ∀A: Set . (∀B : Set . (Set/Or(A,B) -> Set/Or(B,A))) =
  λA.λB.λI.λC.λbc.λac.I(C)(ac,bc)
