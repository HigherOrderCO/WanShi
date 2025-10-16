# def WanShi/Nat/succ/add_suc_right() -> ∀a:Nat . ∀b:Nat . Nat{WanShi/Nat/add(a, 1n+b) == 1n + WanShi/Nat/add(a,b)}:
def add_suc_right() -> ∀a:Nat . ∀b:Nat . Nat{Nat/add(a, 1n+b) == 1n + Nat/add(a,b)}:
  λa.λb.
    match a:
      case 0n:
        finally
      case 1n+pa:
        ind = add_suc_right(pa, b)
        rewrite ind
        finally
