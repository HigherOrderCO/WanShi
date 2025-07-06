def Set/Iso/_PairWithUnit_hasLeftInverse<A>() -> Set/Function/has_left_inverse<A,Σa:A.Unit>(Set/Iso/_PairWithUnit<A>):
  X = Σa:A.Unit
  Y = A
  f = Set/Iso/_PairWithUnit<Y>
  g = Set/Iso/_ForgetUnit<Y>
  isLeftInverse = λh.Set/Function/is_left_inverse<Y,X>(h,f)
  gIsLeftInverse = Set/Iso/_ForgetUnit_LeftInv_PairWithUnit<Y>()
  Set/Exists/Intro(X -> Y, isLeftInverse, g, gIsLeftInverse)
