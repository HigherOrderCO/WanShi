def Set/Function/is_right_inverse<A,B>(g: B->A, f:A->B) -> Set:
  ∀b:B . B{f(g(b)) == b}
