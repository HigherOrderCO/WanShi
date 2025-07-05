# {A<->B} ⊢ A->B
def Set/Iff/ElimLeft : ∀A : Set. (∀B: Set . (∀ab:Set/Iff(A,B) . (A -> B))) =
  λA.λB.λab.Set/And/ElimLeft<(A->B),(B->A)>(ab)
