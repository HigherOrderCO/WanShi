def Algebra/divisible<A>(f:A->A->A) -> Set:
  is_left_divisible = Algebra/left_divisible<A>(f)
  is_right_divisible = Algebra/right_divisible<A>(f)
  Proof/and(is_left_divisible, is_right_divisible)
