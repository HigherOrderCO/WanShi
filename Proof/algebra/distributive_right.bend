# f distributes over g from the right
def Proof/algebra/distributive_right<A>(f:A->A->A, g: A->A->A) -> Set:
  ∀a:A . ∀b:A . ∀c:A . A{f(g(a,b), c) == g(f(a,c), f(b,c))}
