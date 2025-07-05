# {A->B, B->A} ⊢ A<->B
def Set/Deduction/iffIntro : ∀A:Set. (∀B: Set . (∀ab: A -> B . (∀ba: B -> A . (Set/Iff(A,B))))) =
  λA.λB.λab.λba.λI.λJ.J(ab)(ba)
