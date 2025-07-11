
def Tree/invert<A>(tree: Tree<A>) -> Tree<A>:
  match tree:
    case @Leaf{value}:
      return @Leaf{value}
    case @Node{left, right}:
      l = Tree/invert<A>(left)
      r = Tree/invert<A>(right)
      return @Node{r, l}
