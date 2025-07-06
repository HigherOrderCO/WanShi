# Equal(a,b) -> A{a==b}
def Set/Equal/_equal_type_then_equal_bend<A>(a:A,b:A) -> (Set/Equal<A>(a,b) -> A{a == b}):
  λC.C(λx.A{a==x}, finally)
