def neutral_left(a:Nat) -> Nat{Nat/mul(1n, a) == a}:
  match a:
    case 0n:
      finally
    case 1n+p:
      ind = neutral_left(p)
      rewrite ind
      finally
