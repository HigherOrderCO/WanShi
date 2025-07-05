def Set/Iso/_PairWithUnit_hasLeftInverse<A>() -> Set/Function/has_left_inverse<A,Σa:A.Unit>(Set/Iso/_PairWithUnit<A>):
  Set/Exists/Intro(Σa:A.Unit -> A, λh.Set/Function/is_left_inverse<A,Σa:A.Unit>(h,Set/Iso/_PairWithUnit<A>), Set/Iso/_ForgetUnit<A>, Set/Iso/_ForgetUnit_LeftInv_PairWithUnit<A>())
