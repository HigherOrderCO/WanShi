# A Lambda Term
type Lambda/Term:
  case @Var:
    i: String
  case @App:
    f: Lambda/Term
    x: Lambda/Term
  case @Lam:
    k: String
    f: Lambda/Term -> Lambda/Term

# Reduces a term to weak normal form
def Lambda/whnf(term: Lambda/Term) -> Lambda/Term:
  match term:
    case @App{f, x}:
      match Lambda/whnf(f):
        case @Lam{k, f}:
          return Lambda/whnf(f(Lambda/whnf(x))) # β-reduction
        case f:
          return @App{f, x}
    case x:
      return x

# Stringifies a term
def Lambda/show(term: Lambda/Term) -> String:
  match Lambda/whnf(term):
    case @Var{k}:
      return k
    case @App{f, x}:
      return String/flat(["(", Lambda/show(f), " ", Lambda/show(x), ")"])
    case @Lam{k, f}:
      return String/flat(["λ", k, ".", Lambda/show(f(@Var{k}))])

# Tests the program:
#   n3    = λf. λx. (f (f (f x)))
#   true  = λt. λf. t
#   false = λt. λf. f
#   not   = λb. (b false true)
#   (n3 not true)
def main() -> String:
  n3    = @Lam{"f", λf. @Lam{"x", λx. @App{f,@App{f,@App{f,x}}}}} :: Lambda/Term
  true  = @Lam{"t", λt. @Lam{"f", λf. t}} :: Lambda/Term
  false = @Lam{"t", λt. @Lam{"f", λf. f}} :: Lambda/Term
  not   = @Lam{"b", λb. @App{@App{b, false}, true}} :: Lambda/Term
  return Lambda/show(@App{@App{n3,not},true}) # result: λt. λf. f







