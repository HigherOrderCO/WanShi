# A->B->A
def Set/Identities/AthenBthenA : ∀A:Set . (∀B: Set . (A -> B -> A)) =
  λA.λB.λa.λb.a
