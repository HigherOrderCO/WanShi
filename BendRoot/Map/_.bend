# A simple Map with Bits keys
type Map<V: Set>:
  case @Leaf:
  case @Node:
    val: Maybe<V>
    lft: Map<V>
    rgt: Map<V>
