def IntroRight : ∀A:Set . (∀B:Set . (∀a:A . (Proof/Or(B,A)))) =
  λA.λB.λa.(True,a)
