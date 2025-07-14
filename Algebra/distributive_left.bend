# f distributes over g from the left
def Algebra/distributive_left<A>(f:A->A->A, g: A->A->A) -> Set:
  ∀a:A . ∀b:A . ∀c:A . A{f(c,g(a,b)) == g(f(c,a), f(c,b))}
