# A simple Map with Bits keys
type Map<V: Set>:
  case @Leaf:
  case @Node:
    val: V
    lft: Map<V>
    rgt: Map<V>
