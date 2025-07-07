def Proof/algebra/associative<A>(f: A->A->A) -> Set:
  ∀a:A . ∀b:A . ∀c:A . A{f(a,(f(b,c))) == f(f(a,b),c) }
