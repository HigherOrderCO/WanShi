
def Proof/algebra/right_identity<A>(f: A->A->A, u:A) -> Set:
  ∀a:A . A{f(a,u) == a}
