# {B} ⊢ A->B
def Intro : ∀A:Set . (∀B: Set . (∀b:B . (A -> B))) =
  λA.λB.λb.λa.b
