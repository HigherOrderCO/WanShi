def has_right_inverse<A,B>(f: A->B) -> Set:
  Set/Exists(B->A, λg . Set/Function/is_right_inverse<A,B>(g,f)) 
