# Beta reduction evaluation for Lambda Calculus
def LC/eval(term: LC/Term) -> LC/Term:
  match term:
    case @Var{name}:
      # Variables cannot be reduced further
      return term
    case @Lam{param, body}:
      # Lambdas are values, but we can evaluate their body
      eval_body = LC/eval(body)
      return @Lam{param, eval_body}
    case @App{func, arg}:
      # Evaluate function and argument
      eval_func = LC/eval(func)
      eval_arg = LC/eval(arg)
      
      # Try to apply if function is a lambda
      match eval_func:
        case @Lam{param, body}:
          # Beta reduction: substitute parameter with argument
          substituted = LC/substitute(body, param, eval_arg)
          return LC/eval(substituted)
        case other:
          # Cannot reduce further
          return @App{other, eval_arg}