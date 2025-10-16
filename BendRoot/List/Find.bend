
def Find<A>(xs: A[], pred: A -> Bool) -> Maybe<A>:
  match xs:
    case []:
      @None{}
    case x <> xs:
      if pred(x):
        @Some{x}
      else:
        Find<A>(xs, pred)
  
