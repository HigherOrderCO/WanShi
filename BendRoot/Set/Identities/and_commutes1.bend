# (A ∧ B)->(B ∧ A)
def and_commutes1 : ∀A: Set . (∀B: Set . (Set/And(A,B) -> Set/And(B,A))) =
  λA.λB.λC1.λC2.λbac.
    abb = Set/Identities/A_then_B_then_B<A,B>
    aba = Set/Identities/A_then_B_then_A<A,B>
    b = C1(B)(abb)
    a = C1(A)(aba)
    bac(b,a)
