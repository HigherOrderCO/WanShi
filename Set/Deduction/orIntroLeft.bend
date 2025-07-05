# {A} ⊢ A ∨ B
def Set/Deduction/orIntroLeft : ∀A:Set . (∀B:Set . (∀a:A . (Set/Or(A,B)))) =
  λA.λB.λa.λC.λAC.λBC.AC(a)
