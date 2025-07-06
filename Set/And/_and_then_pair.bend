def Set/And/_and_then_pair<A,B>() -> Set/And(A,B) -> Σa:A.B:
  λnd.
    a = nd(A,Set/Identities/A_then_B_then_A<A,B>)
    b = nd(A,Set/Identities/A_then_B_then_B<A,B>)
    a_then_b_then_pair = λa1.λb1.(a1,b1)
    nd(Σa:A.B)(a_then_b_then_pair)
