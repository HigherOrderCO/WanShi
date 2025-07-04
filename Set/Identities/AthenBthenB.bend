# A->B->B
def Set/Identities/AthenBthenB : ∀A:Set . (∀B: Set . (A -> B -> B)) =
  λA.λB.λa.λb.b
