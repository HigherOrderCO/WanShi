# {A<->B} ⊢ B->A
def ElimRight : ∀A: Set. (∀B: Set. (∀ab:Set/Iff(A,B) . (B -> A))) =
  λA.λB.λab.Set/And/ElimRight<(A->B),(B->A)>(ab)
