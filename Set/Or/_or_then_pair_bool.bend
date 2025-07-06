def Set/Or/_or_then_pair_bool<A,B>() -> Set/Or(A,B) -> Σb:Bool . ~b {False: A; True: B}:
  λI.I(Σb:Bool . ~b {False: A; True: B})(λa.(False,a), λb.(True,b))
