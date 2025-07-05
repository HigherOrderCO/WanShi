#./../PROMPT.bend#

# Returns the element at index i
def List/get<A>(xs: A[], i: Nat) -> Maybe<A>:
  match xs i:
    case [] 0n:
      return @None
    case (x <> xs) 0n:
      return @Some{x}
    case [] 1n+i:
      return @None
    case (x <> xs) 1n+i:
      return List/get<A>(xs, i)
