# Lambda Calculus Term definition
type LC/Term:
  case @Var:
    name: String
  case @Lam:
    param: String
    body: LC/Term
  case @App:
    func: LC/Term
    arg: LC/Term