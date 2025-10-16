
def invert<A>(tree: Tree<A>) -> Tree<A>:
  match tree:
    case @Leaf{value}:
      return @Leaf{value}
    case @Node{left, right}:
      l = invert<A>(left)
      r = invert<A>(right)
      return @Node{r, l}
