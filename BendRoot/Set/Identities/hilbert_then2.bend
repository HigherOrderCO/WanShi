def hilbert_then2<A,B,C>() -> (A -> B -> C) -> ((A -> B) -> (A -> C)):
  λabc.λab.λa.abc(a)(ab(a))
