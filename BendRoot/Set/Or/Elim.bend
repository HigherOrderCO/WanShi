# {A∨B, A->C, B->C} ⊢ C
def Elim : ∀A:Set . (∀B:Set . (∀C:Set . (∀ab:Set/Or(A,B) . (∀ac: A -> C. (∀bc: B -> C . (C)))))) =
  λA.λB.λC.λab.λac.λbc.ab(C)(ac)(bc)
