def Equal<A>(a:A,b:A) -> Set:
  ∀P: A->Set . (P(a) -> P(b))
