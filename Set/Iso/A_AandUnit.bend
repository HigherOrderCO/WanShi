def Set/Iso/A_AandUnit<A>() -> Set/Iso(A, Σa:A.Unit):
  Set/Exists/Intro(A->Σa:A.Unit, λf.Set/Function/is_bijection<A,Σa:A.Unit>(f), Set/Iso/_PairWithUnit<A>, Set/Iso/_PairWithUnit_isBijection<A>)
