# (A ∨ B)<->(B ∨ A)
def Set/Identities/or_commutes2 : ∀A: Set . (∀B : Set . Set/Iff(Set/Or(A,B), Set/Or(B,A))) =
  λA.λB.
    leftToRight = Set/Identities/or_commutes1<A,B>
    rightToLeft = Set/Identities/or_commutes1<B,A>
    Set/Iff/Intro<Set/Or(A,B),Set/Or(B,A)>(leftToRight, rightToLeft)
