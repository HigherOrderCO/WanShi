# A Lambda Term
type Term:
  case @Var:
    i: String
  case @App:
    f: Term
    x: Term
  case @Lam:
    k: String
    f: Term -> Term

# Reduces a term to weak normal form
def whnf(term: Term) -> Term:
  match term:
    case @App{f, x}:
      match whnf(f):
        case @Lam{k, f}:
          return whnf(f(whnf(x))) # β-reduction
        case f:
          return @App{f, x}
    case x:
      return x

# Stringifies a term
def show(term: Term) -> String:
  match whnf(term):
    case @Var{k}:
      return k
    case @App{f, x}:
      return String/flat(["(", show(f), " ", show(x), ")"])
    case @Lam{k, f}:
      return String/flat(["λ", k, ".", show(f(@Var{k}))])

# Tests the program:
#   n3    = λf. λx. (f (f (f x)))
#   true  = λt. λf. t
#   false = λt. λf. f
#   not   = λb. (b false true)
#   (n3 not true)
def main() -> String:
  n3    = @Lam{"f", λf. @Lam{"x", λx. @App{f,@App{f,@App{f,x}}}}} :: Term
  true  = @Lam{"t", λt. @Lam{"f", λf. t}} :: Term
  false = @Lam{"t", λt. @Lam{"f", λf. f}} :: Term
  Not   = @Lam{"b", λb. @App{@App{b, false}, true}} :: Term
  return show(@App{@App{n3,Not},true}) # result: λt. λf. f







