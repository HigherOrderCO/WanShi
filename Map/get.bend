def Map/get<V>(map: Map<V>, key: Bits) -> Maybe<V>:
  match map:
    case @Leaf:
      return @None
    case @Node{val, lft, rgt}:
      match key:
        case @E:
          return @Some{val}
        case @O{tail}:
          return Map/get<V>(lft, tail)
        case @I{tail}:
          return Map/get<V>(rgt, tail)
