
def LC/main() -> LC/Term:
  # Church successor: λn. λf. λx. f (n f x)
  succ = @Abs{
    @Abs{
      @Abs{
        @App{
          @Var{1n},                           # f
          @App{
            @App{ @Var{2n}, @Var{1n} },       # n f
            @Var{0n}                          #   x
          }
        }
      }
    }
  }

  # Church numeral 1: λf. λx. f x
  one = @Abs{
    @Abs{
      @App{ @Var{1n}, @Var{0n} }
    }
  }

  # compute succ 1
  term = @App{ succ, one }
  LC/whnf(term)
