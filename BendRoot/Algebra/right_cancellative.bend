def right_cancellative<A>(f:A->A->A) -> Set:
  ∀a:A . ∀b:A . ∀c:A . (A{f(b,a) == f(c,a)} -> A{b == c})
