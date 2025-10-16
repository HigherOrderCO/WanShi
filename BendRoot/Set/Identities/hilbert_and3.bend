def hilbert_and3<A,B>() -> A -> (B -> Set/And(A,B)):
  λa.λb.Set/And/Intro<A,B>(a,b)
