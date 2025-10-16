def associative_quasigroup<A>(f:A->A->A) -> Set:
  is_ass = Algebra/associative<A>(f)
  is_div = Algebra/divisible<A>(f)
  Proof/And(is_ass, is_div)
