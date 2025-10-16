def Fold<A>(xs: A[]) -> ∀P:Set. P -> (A -> P -> P) -> P:
  match xs:
    case []:
      lambda P nil cons.
      nil
    case x <> xs:
      lambda P nil cons.
      cons(x, Fold(A,xs,P,nil,cons))
