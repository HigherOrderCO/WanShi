# A{a==b} -> Equal(a,b)
def Set/Equal/_equal_bend_then_equal_type<A>(a:A,b:A) -> (A{a == b} -> Set/Equal<A>(a,b)):
  λEQ.λP.λPa.
  rewrite EQ Pa
