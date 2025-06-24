def String/join(xs: String[], sep: String) -> String:
  match xs:
    case []:
      []
    case x <> []:
      x
    case x <> xs:
      List/append<Char>(x, List/append<Char>(sep, String/join(xs, sep)))
