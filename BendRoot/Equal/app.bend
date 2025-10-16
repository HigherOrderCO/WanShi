def app<A,B>(a: A, b: A, f: A -> B, e: A{a == b}) -> B{f(a) == f(b)}:
  rewrite e
  finally
