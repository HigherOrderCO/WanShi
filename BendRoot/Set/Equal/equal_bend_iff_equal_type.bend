# A{a==b} <-> Equal(a,b)
def equal_bend_iff_equal_type<A>() -> ∀a:A. (∀b:A . (Set/Iff(Set/Equal<A>(a,b), A{a == b}))):
  λa.λb. Set/Iff/Intro<Set/Equal<A>(a,b),A{a == b}>(Set/Equal/_equal_type_then_equal_bend<A>(a,b), Set/Equal/_equal_bend_then_equal_type<A>(a,b))
