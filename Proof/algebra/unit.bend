def Proof/algebra/unit<A>(f: A->A->A, u: A) -> Set:
  is_left_unit  = Proof/algebra/unit_left<A>(f, u)
  is_right_unit = Proof/algebra/unit_right<A>(f, u)
  Proof/and(is_left_unit,is_right_unit)
