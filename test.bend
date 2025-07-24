

def List/unzip<A,B>(ls: (A&B)[]) -> (A[] & B[]):
  match ls:
    case []: ([] , [])
    case (h <> tail):
      (xs,ys) = List/unzip<A,B>(tail)
      (x,y) = h
      (x <> xs, y <> ys)
      


def main () -> Nat[] & Nat[]:
  (List/unzip Nat Nat [(1n,2n),(3n,4n),(5n,6n)])