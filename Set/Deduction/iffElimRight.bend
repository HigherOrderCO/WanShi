# {A<->B} ⊢ B->A
def Set/Deduction/iffElimRight : ∀A: Set. (∀B: Set. (∀ab:Set/Iff(A,B) . (B -> A))) =
  λA.λB.λab.Set/Deduction/andElimRight<(A->B),(B->A)>(ab)
