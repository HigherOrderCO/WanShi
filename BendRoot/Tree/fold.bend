
def fold<A,B>(f: A -> B -> B, a: B, tree: Tree<A>) -> B:
  match tree:
    case @Leaf{value}:
      return f(value)(a)
    case @Node{left, right}:
      l = fold<A,B>(f, a, left)
      r = fold<A,B>(f, l, right)
      return r
