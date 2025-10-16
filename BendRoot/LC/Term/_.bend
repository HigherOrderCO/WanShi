# Lambda Calculus Term definition
type Term:
  case @Var:
    name: String
  case @Lam:
    param: String
    body: Term
  case @App:
    func: Term
    arg: Term
