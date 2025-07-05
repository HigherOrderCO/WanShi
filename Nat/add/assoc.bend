def Nat/add/assoc(a: Nat, b: Nat, c: Nat) -> Nat{Nat/add(Nat/add(a,b),c) == Nat/add(a,Nat/add(b,c))}:
  match a:
    case 0n:
      finally
    case 1n+ap:
      ()
