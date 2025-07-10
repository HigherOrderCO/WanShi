def Map/set<V>(map: Map<V>, key: Bits, val: V) -> Map<V>:
  match map:
    case @Leaf:
      match key:
        case @E:
          return @Node{val, @Leaf, @Leaf}
        case @O{key}:
          return @Node{val, Map/set<V>(@Leaf, key, val), @Leaf}
        case @I{key}:
          return @Node{val, @Leaf, Map/set<V>(@Leaf, key, val)}
    case @Node{x, l, r}:
      match key:
        case @E:
          return @Node{val, l, r}
        case @O{key}:
          return @Node{x, Map/set<V>(l, key, val), r}
        case @I{key}:
          return @Node{x, l, Map/set<V>(r, key, val)}
