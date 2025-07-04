# {A,¬A} ⊢ ⊥
def Set/Deduction/absurdIntro : ∀A:Set . (∀a:A . (∀b: Not(A) . (Empty))) =
  λA.λa.λb.b(a)
