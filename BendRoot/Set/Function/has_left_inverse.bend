def has_left_inverse<A,B>(f: A->B) -> Set:
  Set/Exists(B->A, λg . Set/Function/is_left_inverse<A,B>(g,f)) 
