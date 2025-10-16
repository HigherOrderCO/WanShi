def add_eq_zero_then_both_zero(a:Nat, b:Nat, abz: Nat{Nat/add(a,b) == 0n}) -> Proof/And(Nat{a==0n}, Nat{b==0n}):
  match a:
    case 0n:
      (finally, abz)
      # ((), abz)
    case 1n+pa:
      ~abz{}
