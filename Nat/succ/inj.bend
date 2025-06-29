def Nat/succ/inj(n: Nat, m: Nat, e: Nat{(1n+n)==(1n+m)}) -> Nat{n==m}:
  match n m:
    case 0n 0n:
      finally
    case 1n+n 0n:
      ()
    case 0n 1n+m:
      ()
    case 1n+n 1n+m:
      ()
