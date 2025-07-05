def Set/Iso/_ForgetUnit_RightInv_PairWithUnit<A>() -> Set/Function/is_right_inverse<A,Σa:A.Unit>(Set/Iso/_ForgetUnit<A>,Set/Iso/_PairWithUnit<A>):
  λau.
    match au:
      case (a,u):
        match u:
          case (): finally
