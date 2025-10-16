def equal(x: String, y: String) -> Bool:
  match x y:
    case [] []:
      True
    case x<>xs []:
      False
    case [] y<>ys:
      False
    case x<>xs y<>ys:
      Bool/And(x === y, equal(xs, ys))
      
#def main : Bool = String/equal("fox","foo")
