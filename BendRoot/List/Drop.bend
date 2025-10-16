
def Drop<A>(xs: A[], n: Nat) -> A[]:
  match xs n:
    case [] i:
      []
    case xs 0n:
      xs
    case h <> t 1n+p:
      Drop<A>(t, p)

