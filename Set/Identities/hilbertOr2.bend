def Set/Identities/hilbertOr2<A,B>() -> A -> Set/Or(B,A):
  λa.Set/Deduction/orIntroRight<A,B>(a)
