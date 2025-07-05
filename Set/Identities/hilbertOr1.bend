def Set/Identities/hilbertOr1<A,B>() -> A -> Set/Or(A,B):
  λa.Set/Deduction/orIntroLeft<A,B>(a)
