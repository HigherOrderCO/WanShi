def List/fold<A>(xs: A[]) -> ∀P:Set. P -> (A -> P -> P) -> P:
  match xs:
    case []:
      lambda P nil cons.
      nil
    case x <> xs:
      lambda P nil cons.
      cons(x, List/fold(A,xs,P,nil,cons))
