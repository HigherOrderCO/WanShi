def iso_A_vs_pair_A_unit<A>() -> Set/Iso(A, Σa:A.Unit):
  Set/Exists/Intro(
    A->Σa:A.Unit
    ,λf.Set/Function/is_bijection<A,Σa:A.Unit>(f)
    ,Set/Examples/_forget_unit_from_pair_right(A)
    ,λC.λnd.nd(λC.λx.x(λp.~p{(,):λa.λu.a}, λa.finally),λC.λx.x(λp. ~p{(,):λa.λu.a}, λau.~au{(,):λa.λu. (~u{(): finally})}))
  )
