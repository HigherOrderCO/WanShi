type Foo:
  case @A:
    a: Nat
    b: Nat
    c: Nat
    d: Nat

def bug(x: Foo) -> Foo:
  match x:
    case @A{a,b,c,d}:
      ()

