def Map/get_set_id<V>(map: Map<V>, key: Bits, val: V) -> 
  Maybe<V>{Map/get<V>(Map/set<V>(map, key, val), key) == @Some{val}}:
  ()
