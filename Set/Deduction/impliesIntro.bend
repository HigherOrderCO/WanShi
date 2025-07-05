# {B} ⊢ A->B
def Set/Deduction/impliesIntro : ∀A:Set . (∀B: Set . (∀b:B . (A -> B))) =
  λA.λB.λb.λa.b
