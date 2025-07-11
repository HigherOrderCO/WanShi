
type LC/Term:
  case @Var:
    idx: Nat
  case @Abs:
    body: LC/Term
  case @App:
    f: LC/Term
    arg: LC/Term
