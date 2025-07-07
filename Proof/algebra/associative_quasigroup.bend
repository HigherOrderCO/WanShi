def Proof/algebra/associative_quasigroup<A>(f:A->A->A) -> Set:
  is_ass = Proof/algebra/associative<A>(f)
  is_div = Proof/algebra/divisible<A>(f)
  Proof/and(is_ass, is_div)
