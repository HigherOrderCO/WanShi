def Nat/add/associative() -> Proof/algebra/associative(Nat, Nat/add):
  λa.λb.λc.
    match a:
      case 0n:
        finally
      case 1n+pa:
        ind = Nat/add/associative(pa,b,c)
        Nat/succ/preserves_eq(Nat/add(pa,Nat/add(b,c)), Nat/add(Nat/add(pa,b),c), ind)
