# (A ∨ B)<->(B ∨ A)
def Set/Identities/orCommutes2 : ∀A: Set . (∀B : Set . Set/Iff(Set/Or(A,B), Set/Or(B,A))) =
  λA.λB.
    leftToRight = Set/Identities/orCommutes1<A,B>
    rightToLeft = Set/Identities/orCommutes1<B,A>
    Set/Deduction/iffIntro<Set/Or(A,B),Set/Or(B,A)>(leftToRight, rightToLeft)
