def Algebra/left_cancellative<A>(f:A->A->A) -> Set:
  ∀a:A . ∀b:A . ∀c:A . (A{f(a,b) == f(a,c)} -> A{b == c})
