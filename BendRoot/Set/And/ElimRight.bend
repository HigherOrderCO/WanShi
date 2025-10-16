# A ∧ B ⊢ B
def ElimRight : ∀A:Set. (∀B:Set. (∀ab: Set/And(A,B). (B))) =
  λA.λB.λab.ab(B)(Set/Identities/A_then_B_then_B(A,B))
