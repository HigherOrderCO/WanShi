def add_eq_zero_then_both_zerol(a:Nat, b:Nat) -> Nat{Nat/add(a,b) == 0n} -> Proof/And(Nat{a==0n}, Nat{b==0n}):
  λabz.
    match a:
      case 0n:
        (finally, abz)
      case 1n+pa:
        ~abz{}
