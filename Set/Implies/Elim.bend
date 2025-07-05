# {A->B,A} ⊢ B
def Set/Implies/Elim : ∀A:Set . (∀B: Set . (∀ab:A->B . (∀a:A . (B)))) =
  λA.λB.λab.λa.ab(a)
