# A->B->A
def Set/Identities/A_then_B_then_A : ∀A:Set . (∀B: Set . (A -> B -> A)) =
  λA.λB.λa.λb.a
