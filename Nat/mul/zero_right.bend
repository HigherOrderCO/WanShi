def Nat/mul/zero_right() -> Algebra/zero_right(Nat, Nat/mul, 0n):
  λa.
    match a:
      case 0n:
        finally
      case 1n+p:
        ind = Nat/mul/zero_right(p)
        rewrite ind
        finally
