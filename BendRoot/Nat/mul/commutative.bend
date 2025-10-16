def commutative() -> Algebra/commutative(Nat, Nat, Nat/mul):
  λa.λb.
    match b:
      case 0n:
        rewrite Nat/mul/zero_right(a)
        finally
      case 1n+pb:
        ind = commutative(a,pb)
        rewrite Nat/mul/mul_succ_right(a,pb)
        rewrite ind
        finally
