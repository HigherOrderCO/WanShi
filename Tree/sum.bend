
def Tree/sum(tree: Tree<Nat>) -> Nat:
  match tree:
    case @Leaf{value}:
      return value
    case @Node{left, right}:
      return Nat/add(Tree/sum(left), Tree/sum(right))
