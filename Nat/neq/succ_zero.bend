def Nat/neq/succ_zero/(n: Nat) -> Set:
  match n:
    case 0n:
      Unit
    case 1n+p:
      Empty

def Nat/neq/succ_zero(n: Nat) -> Not(Nat{0n == (1n+n)}):
  λe.
    bad = () :: Foo(0n)
    rewrite e
    ()
