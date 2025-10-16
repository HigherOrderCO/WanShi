
def Insert_at<A>(xs: A[], i: Nat, el: A) -> A[]:
  match i:
    case 0n:
      el <> xs
    case 1n+p:
      match xs:
        case []:
          [el]
        case h <> t:
          h <> List/Insert_at<A>(t, p, el)
