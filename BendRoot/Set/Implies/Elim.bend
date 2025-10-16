# {A->B,A} ⊢ B
def Elim : ∀A:Set . (∀B: Set . (∀ab:A->B . (∀a:A . (B)))) =
  λA.λB.λab.λa.ab(a)
