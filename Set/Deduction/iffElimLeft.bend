# {A<->B} ⊢ A->B
def Set/Deduction/iffElimLeft : ∀A : Set. (∀B: Set . (∀ab:Set/Iff(A,B) . (A -> B))) =
  λA.λB.λab.Set/Deduction/andElimLeft<(A->B),(B->A)>(ab)
