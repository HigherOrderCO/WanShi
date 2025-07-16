def String/equal(x: String, y: String) -> Bool:
  match x y:
    case [] []:
      True
    case x<>xs []:
      False
    case [] y<>ys:
      False
    case x<>xs y<>ys:
      Bool/and(x === y, String/equal(xs, ys))
      
#def main : Bool = String/equal("fox","foo")
