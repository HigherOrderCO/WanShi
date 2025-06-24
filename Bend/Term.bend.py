#./../../Bend2/src/Core/Type.hs#

type Bend/Term:
  # Variables
  case @Var: # x
    k: String
    i: U64
  case @Ref: # x
    k: String
  case @Sub: # x
    t: Bend/Term

  # Definitions
  case @Fix: # μx. f
    k: String
    f: Bend/Term -> Bend/Term
  case @Let: # !v; f
    v: Bend/Term
    f: Bend/Term

  # Universe
  case @Set: # Set

  # Annotation
  case @Ann: # <x:t>
    x: Bend/Term
    t: Bend/Term
  case @Chk: # x::t
    x: Bend/Term
    t: Bend/Term

  # Empty
  case @Emp: # Empty
  case @Efq: # λ{}

  # Unit
  case @Uni: # Unit
  case @One: # ()
  case @Use: # λ{():f}
    f: Bend/Term

  # Bool
  case @Bit: # Bool
  case @Bt0: # False
  case @Bt1: # True
  case @Bif: # λ{False:f;True:t}
    f: Bend/Term
    t: Bend/Term

  # Nat
  case @Nat: # Nat
  case @Zer: # 0
  case @Suc: # ↑n
    n: Bend/Term
  case @Swi: # λ{0:z;+:s}
    z: Bend/Term
    s: Bend/Term

  # List
  case @Lst: # T[]
    t: Bend/Term
  case @Nil: # []
  case @Con: # h<>t
    h: Bend/Term
    t: Bend/Term
  case @Mat: # λ{[]:n;<>:c}
    n: Bend/Term
    c: Bend/Term

  # Enum
  case @Enu: # {@foo,@bar...}
    s: String[]
  case @Sym: # @foo
    s: String
  case @Cse: # λ{@foo:f;@bar:b;...}
    c: (String & Bend/Term)[]

  # NUmbers
  case @Num: # CHR | U64 | I64 | F64
    t: Bend/NTyp
  case @Val: # 123 | +123 | +123.0
    v: Bend/NVal
  case @Op2: # x + y
    o: Bend/NOp2
    a: Bend/Term
    b: Bend/Term
  case @Op1: # !x
    o: Bend/NOp1
    a: Bend/Term

  # Pair
  case @Sig: # ΣA.B
    a: Bend/Term
    b: Bend/Term
  case @Tup: # (a,b)
    a: Bend/Term
    b: Bend/Term
  case @Get: # λ{(,):f}
    f: Bend/Term

  # Function
  case @All: # ∀A.B
    a: Bend/Term
    b: Bend/Term
  case @Lam: # λx.f
    k: String
    f: Bend/Term -> Bend/Term
  case @App: # (f x)
    f: Bend/Term
    x: Bend/Term

  # Equality
  case @Eql: # T{a==b}
    t: Bend/Term
    a: Bend/Term
    b: Bend/Term
  case @Rfl: # {=}
  case @Rwt: # λ{{=}:f}
    f: Bend/Term

  # MetaVar
  case @Met: # ?N:T{x0,x1,...}
    n: U64
    t: Bend/Term
    x: Bend/Term[]
