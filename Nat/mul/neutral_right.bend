def Nat/mul/neutral_right(a:Nat) -> Nat{Nat/mul(a, 1n) == a}:
  match a:
    case 0n:
      finally
    case 1n+p:
      ind = Nat/mul/neutral_right(p)
      rewrite ind
      finally
