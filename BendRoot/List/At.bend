
def At<A>(xs: A[], i: Nat) -> Maybe<A>:
  match xs i:
    case [] i:
      @None{}
    case x <> xs 0n:
      @Some{x}
    case x <> xs 1n+p:
      At<A>(xs, p)

