def set<V>(map: Map<V>, key: Bits, val: V) -> Map<V>:
  match map:
    case @Leaf:
      match key:
        case @E:
          return @Node{@Some{val}, @Leaf, @Leaf}
        case @O{key}:
          lft = set<V>(@Leaf, key, val)
          return @Node{@None, lft, @Leaf}
        case @I{key}:
          rgt = set<V>(@Leaf, key, val)
          return @Node{@None, @Leaf, rgt}
    case @Node{x, l, r}:
      match key:
        case @E:
          return @Node{@Some{val}, l, r}
        case @O{key}:
          lft = set<V>(l, key, val)
          return @Node{x, lft, r}
        case @I{key}:
          rgt = set<V>(r, key, val)
          return @Node{x, l, rgt}
