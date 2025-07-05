def Set/Function/is_left_inverse<A,B>(g: B->A, f:A->B) -> Set:
  ∀a:A . A{g(f(a)) == a}
