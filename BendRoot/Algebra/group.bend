def group<A>(f:A->A->A, u:A) -> Set:
  is_ass = Algebra/associative<A>(f)
  is_uni = Algebra/unit<A>(f, u)
  is_div = Algebra/divisible<A>(f)
  Proof/And(is_ass, Proof/And(is_uni, is_div))
