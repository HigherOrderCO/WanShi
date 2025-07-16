def Algebra/commutative<A,B>(f: A->A->B) -> Set:
  ∀a:A . ∀b:A . B{f(a,b) == f(b,a)}
