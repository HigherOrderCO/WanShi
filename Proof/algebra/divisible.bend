def Proof/algebra/divisible<A>(f:A->A->A) -> Set:
  is_left_divisible = Proof/algebra/left_divisible<A>(f)
  is_right_divisible = Proof/algebra/right_divisible<A>(f)
  Proof/and(is_left_divisible, is_right_divisible)
