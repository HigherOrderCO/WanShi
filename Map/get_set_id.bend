def Map/get_set_id<V>(map: Map<V>, k: Bits, v: V) -> 
  map = Map/set<V>(map, k, v) # if  we set 'map[k] = v'
  got = Map/get<V>(map, k)    # and we get 'map[k]'
  Maybe<V>{got == @Some{v}}:  # the result is 'v'

  match map:
    case @Leaf:
      match k:
        case @E:
          finally
        case @O{key}:
          Map/get_set_id<V>(@Leaf, key, v)
        case @I{key}:
          Map/get_set_id<V>(@Leaf, key, v)
    case @Node{val, lft, rgt}:
      match k:
        case @E:
          finally
        case @O{key}:
          Map/get_set_id<V>(lft, key, v)
        case @I{key}:
          Map/get_set_id<V>(rgt, key, v)
