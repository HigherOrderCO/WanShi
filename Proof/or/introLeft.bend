def Proof/or/introLeft : ∀A:Set . (∀B:Set . (∀a:A . (Proof/or(A,B)))) =
  λA.λB.λa.(False, a)
