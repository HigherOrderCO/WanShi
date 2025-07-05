# {B} ⊢ A->B
def Set/Implies/Intro : ∀A:Set . (∀B: Set . (∀b:B . (A -> B))) =
  λA.λB.λb.λa.b
