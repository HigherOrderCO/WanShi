# (A ∧ B)<->(B ∧ A)
def and_commutes2 : ∀A: Set . (∀B: Set . Set/Iff(Set/And(A,B), Set/And(B,A))) =
  λA.λB.
    leftToRight = Set/Identities/and_commutes1<A,B>
    rightToLeft = Set/Identities/and_commutes1<B,A>
    Set/Iff/Intro<Set/And(A,B),Set/And(B,A)>(leftToRight, rightToLeft)
