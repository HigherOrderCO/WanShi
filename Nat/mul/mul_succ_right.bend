def Nat/mul/mul_succ_right(a: Nat, b: Nat) -> Nat{Nat/mul(a,1n+b) == Nat/add(a, Nat/mul(a,b))}:
  match a:
    case 0n:
      finally
    case 1n+pa:
      ind = Nat/mul/mul_succ_right(pa,b)
      rewrite ind
      rewrite Nat/add/associative(pa,b,Nat/mul(pa,b))
      rewrite Nat/add/commutative(pa,b)
      l = Nat/add(b,Nat/add(pa,Nat/mul(pa,b)))
      r = Nat/add(Nat/add(b,pa),Nat/mul(pa,b))
      rewrite Proof/equal/symmetry(Nat, l, r, Nat/add/associative(b,pa,Nat/mul(pa,b)))
      finally
