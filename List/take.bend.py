
def List/take<A>(n: Nat, xs: A[]) -> A[]:
  match n xs:
    case 0n   _:
      []
    case _    []:
      []
    case 1n+p h <> t:
      h <> List/take<A>(p, t)

