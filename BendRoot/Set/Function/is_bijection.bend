def is_bijection<A,B>(f: A->B) -> Set:
  Set/And(Set/Function/has_left_inverse<A,B>(f), Set/Function/has_right_inverse<A,B>(f))
