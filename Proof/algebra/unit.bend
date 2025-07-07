def Proof/algebra/unit<A>(f: A->A->A, u: A) -> Set:
  is_left_identity  = Proof/algebra/left_identity<A>(f, u)
  is_right_identity = Proof/algebra/right_identity<A>(f, u)
  Proof/and(is_left_identity,is_right_identity)
