def Nat/neq/succ_zero/swap(n: Nat) -> Set:
  match n:
    case 0n:
      Unit
    case 1n+p:
      Empty

def Nat/neq/succ_zero(n: Nat) -> Nat{0n != (1n+n)}:
  lambda e. match e {}
