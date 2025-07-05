# {A} ⊢ B ∨ A
def Set/Or/IntroRight : ∀A:Set . (∀B:Set . (∀a:A . (Set/Or(B,A)))) =
  λA.λB.λa.λC.λBC.λAC.AC(a)
