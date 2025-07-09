def Proof/or/introRight : ∀A:Set . (∀B:Set . (∀a:A . (Proof/or(B,A)))) =
  λA.λB.λa.(True,a)
