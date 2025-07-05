# (A ∧ B)->(B ∧ A)
def Set/Identities/and_commutes1 : ∀A: Set . (∀B: Set . (Set/And(A,B) -> Set/And(B,A))) =
  λA.λB.λC1.λC2.λbac.
    abb = Set/Identities/AthenBthenB<A,B>
    aba = Set/Identities/AthenBthenA<A,B>
    b = C1(B)(abb)
    a = C1(A)(aba)
    bac(b,a)
