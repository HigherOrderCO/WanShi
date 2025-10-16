def zero_right() -> Algebra/zero_right(Nat, Nat/mul, 0n):
  λa.
    match a:
      case 0n:
        finally
      case 1n+p:
        ind = zero_right(p)
        rewrite ind
        finally
