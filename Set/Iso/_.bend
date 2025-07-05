def Set/Iso(A: Set,B: Set) -> Set:
  Set/Exists(A->B, λf.Set/Function/is_bijection<A,B>(f))
