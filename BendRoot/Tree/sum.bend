
def sum(tree: Tree<Nat>) -> Nat:
  match tree:
    case @Leaf{value}:
      return value
    case @Node{left, right}:
      return Nat/add(sum(left), sum(right))
