# {A} ⊢ A ∨ B
def Set/Or/IntroLeft : ∀A:Set . (∀B:Set . (∀a:A . (Set/Or(A,B)))) =
  λA.λB.λa.λC.λAC.λBC.AC(a)
