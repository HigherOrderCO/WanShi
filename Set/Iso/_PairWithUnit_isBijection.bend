def Set/Iso/_PairWithUnit_isBijection<A>() -> Set/Function/is_bijection<A,Σa:A.Unit>(Set/Iso/_PairWithUnit<A>):
  Set/And/Intro<Set/Function/has_left_inverse<A,Σa:A.Unit>(Set/Iso/_PairWithUnit<A>), Set/Function/has_right_inverse<A,Σa:A.Unit>(Set/Iso/_PairWithUnit<A>)>(Set/Iso/_PairWithUnit_hasLeftInverse<A>, Set/Iso/_PairWithUnit_hasRightInverse<A>)
