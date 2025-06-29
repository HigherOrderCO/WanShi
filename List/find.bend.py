
def List/find<A>(xs: A[], pred: A -> Bool) -> Maybe<A>:
  match xs:
    case []:
      @None{}
    case x <> xs:
      if pred(x):
        @Some{x}
      else:
        List/find<A>(xs, pred)
  
