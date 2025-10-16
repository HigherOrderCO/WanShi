def suc_add_right() -> ∀a:Nat . ∀b:Nat . Nat{1n + Nat/add(a,b) == Nat/add(a,1n+b)}:
  λa.λb.
    match a:
      case 0n: finally
      case 1n+pa:
        ind = suc_add_right(pa,b)
        rewrite ind finally
