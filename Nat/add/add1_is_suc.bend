
def Nat/add/add1_is_suc(a:Nat) -> Nat{Nat/add(a,1n) == 1n+a}:
  match a:
    case 0n: finally
    case 1n+p:
      ind = Nat/add/add1_is_suc(p)
      rewrite ind finally
