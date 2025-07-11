
def Tree/fold<A,B>(f: A -> B -> B, a: B, tree: Tree<A>) -> B:
  match tree:
    case @Leaf{value}:
      return f(value)(a)
    case @Node{left, right}:
      l = Tree/fold<A,B>(f, a, left)
      r = Tree/fold<A,B>(f, l, right)
      return r
