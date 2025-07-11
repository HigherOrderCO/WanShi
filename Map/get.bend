def Map/get<V>(map: Map<V>, key: Bits) -> Maybe<V>:
  match map:
    case @Leaf:
      return @None
    case @Node{val, lft, rgt}:
      match key:
        case @E:
          return val
        case @O{key}:
          return Map/get<V>(lft, key)
        case @I{key}:
          return Map/get<V>(rgt, key)
