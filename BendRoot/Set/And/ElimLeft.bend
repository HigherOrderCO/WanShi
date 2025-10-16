# A ∧ B ⊢ A
def ElimLeft : ∀A:Set. (∀B:Set. (∀ab:Set/And(A,B). (A))) =
  λA.λB.λab.ab(A)(Set/Identities/A_then_B_then_A(A,B))
