
def BendRW/main : BendRW/Term =
  @Def{x, T} = BendRW/Def/bft_f
  match BendRW/Term/check(0n, [], x, T):
    case @None:
      @Var{"", 0n}
    case @Some{_}:
      BendRW/Term/whnf(x)

def main() -> BendRW/Term:
  BendRW/main
