def Set/Identities/hilbertAnd3<A,B>() -> A -> (B -> Set/And(A,B)):
  λa.λb.Set/Deduction/andIntro<A,B>(a,b)
