# A->B->B
def Set/Identities/A_then_B_then_B : ∀A:Set . (∀B: Set . (A -> B -> B)) =
  λA.λB.λa.λb.b
