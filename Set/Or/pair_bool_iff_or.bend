def Set/Or/pair_bool_iff_or<A,B>() -> Set/Iff(Proof/or(A,B), Set/Or(A,B)):
  Set/Iff/Intro<Proof/or(A,B), Set/Or(A,B)>(Set/Or/_pair_bool_then_or<A,B>, Set/Or/_or_then_pair_bool<A,B>)
