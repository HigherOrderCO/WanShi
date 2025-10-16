# {A,¬A} ⊢ ⊥
def absurdIntro : ∀A:Set . (∀a:A . (∀b: Not(A) . (Empty))) =
  λA.λa.λb.b(a)
