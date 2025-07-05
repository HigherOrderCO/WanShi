# (A ∧ B)<->(B ∧ A)
def Set/Identities/andCommutes2 : ∀A: Set . (∀B: Set . Set/Iff(Set/And(A,B), Set/And(B,A))) =
  λA.λB.
    leftToRight = Set/Identities/andCommutes1<A,B>
    rightToLeft = Set/Identities/andCommutes1<B,A>
    Set/Deduction/iffIntro<Set/And(A,B),Set/And(B,A)>(leftToRight, rightToLeft)
