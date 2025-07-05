def Nat/succ/inj(n: Nat, m: Nat, e: Nat{(1n+n)==(1n+m)}) -> Nat{n==m}:
  match n m e:
    case 0n 0n e:
      finally
    case 1n+n 0n e:
      absurd e
    case 0n 1n+m e:
      absurd e
    case 1n+n 1n+m e:
      ()
