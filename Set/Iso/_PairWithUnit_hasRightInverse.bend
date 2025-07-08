def Set/Iso/_PairWithUnit_hasRightInverse<A>() -> Set/Function/has_right_inverse<A,Σa:A.Unit>(Set/Iso/_PairWithUnit<A>):
  Set/Exists/Intro((Σa:A.Unit) -> A, λh.Set/Function/is_right_inverse<A,Σa:A.Unit>(h,Set/Iso/_PairWithUnit<A>), Set/Iso/_ForgetUnit<A>, Set/Iso/_ForgetUnit_RightInv_PairWithUnit<A>())
