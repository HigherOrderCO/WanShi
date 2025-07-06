def Set/And/pair_iff_and<A,B>() -> Set/Iff(Σa:A.B,Set/And(A,B)) :
  sg_and = Set/And/_pair_then_and<A,B>
  and_sg = Set/And/_and_then_pair<A,B>
  Set/Iff/Intro<Σa:A.B,Set/And(A,B)>(sg_and, and_sg)
