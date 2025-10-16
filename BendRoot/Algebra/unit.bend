def unit<A>(f: A->A->A, u: A) -> Set:
  is_left_unit  = Algebra/unit_left<A>(f, u)
  is_right_unit = Algebra/unit_right<A>(f, u)
  Proof/And(is_left_unit,is_right_unit)
