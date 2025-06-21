def Equal/sym<A>(a: A, b: A, e: A{a == b}) -> A{b == a}:
  rewrite e
  finally
