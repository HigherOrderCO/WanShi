def Algebra/unit_right<A>(f: A->A->A, u:A) -> Set:
  ∀a:A . A{f(a,u) == a}
