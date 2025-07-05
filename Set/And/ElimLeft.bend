# A ∧ B ⊢ A
def Set/And/ElimLeft : ∀A:Set. (∀B:Set. (∀ab:Set/And(A,B). (A))) =
  λA.λB.λab.ab(A)(Set/Identities/AthenBthenA(A,B))
