
def Tree/map<A,B>(f: A -> B, tree: Tree<A>) -> Tree<B>:
  match tree:
    case @Leaf{value}:
      return @Leaf{f(value)}
    case @Node{left, right}:
      l = Tree/map<A,B>(f, left)
      r = Tree/map<A,B>(f, right)
      return @Node{l, r}
