
def Nat/compare_refl(n: Nat) -> Ordering{Nat/compare(n, n) == @EQ{}}:
  match n:
    case 0n:
      # Nat/compare(0n, 0n) == @EQ{}
      finally
    case 1n+p:
      # Nat/compare(1n+p, 1n+p) == Nat/compare(p, p) == @EQ{}
      return Nat/compare_refl(p)
