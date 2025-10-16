def IntroLeft : ∀A:Set . (∀B:Set . (∀a:A . (Proof/Or(A,B)))) =
  λA.λB.λa.(False, a)
