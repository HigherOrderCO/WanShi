# A ∧ B ⊢ B
def Set/Deduction/andElimRight : ∀A:Set. (∀B:Set. (∀ab: Set/And(A,B). (B))) =
  λA.λB.λab.ab(B)(Set/Identities/AthenBthenB(A,B))
