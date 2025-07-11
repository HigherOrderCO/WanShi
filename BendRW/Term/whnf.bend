
def BendRW/Term/whnf(term: BendRW/Term) -> BendRW/Term:
  match term:
    case @Let{k, T, v, f}:
      BendRW/Term/whnf_let(k, T, v, f)
    case @Fix{k, f}:
      BendRW/Term/whnf_fix(k, f)
    case @App{f, x}:
      BendRW/Term/whnf_app(f, x)
    case @UniM{x, f}:
      BendRW/Term/whnf_uni(x, f)
    case @BitM{x, f, t}:
      BendRW/Term/whnf_bit(x, f, t)
    case @NatM{x, z, s}:
      BendRW/Term/whnf_nat(x, z, s)
    case @LstM{x, n, c}:
      BendRW/Term/whnf_lst(x, n, c)
    case @SigM{x, f}:
      BendRW/Term/whnf_sig(x, f)
    case @EqlM{x, f}:
      BendRW/Term/whnf_eql(x, f)
    case x:
      x

def BendRW/Term/whnf_let(k: String, T: BendRW/Term, v: BendRW/Term, f: BendRW/Term -> BendRW/Term) -> BendRW/Term:
  BendRW/Term/whnf(f(v))

def BendRW/Term/whnf_fix(k: String, f: BendRW/Term -> BendRW/Term) -> BendRW/Term:
  BendRW/Term/whnf(f(@Fix{k, f}))

def BendRW/Term/whnf_app(f: BendRW/Term, x: BendRW/Term) -> BendRW/Term:
  match BendRW/Term/whnf(f):
    case @Lam{k, f}:
      BendRW/Term/whnf(f(BendRW/Term/whnf(x)))
    case f:
      @App{f, x}

def BendRW/Term/whnf_uni(x: BendRW/Term, f: BendRW/Term) -> BendRW/Term:
  match BendRW/Term/whnf(x):
    case @One:
      BendRW/Term/whnf(f)
    case x:
      @UniM{x, f}

def BendRW/Term/whnf_bit(x: BendRW/Term, f: BendRW/Term, t: BendRW/Term) -> BendRW/Term:
  match BendRW/Term/whnf(x):
    case @Bt0:
      BendRW/Term/whnf(f)
    case @Bt1:
      BendRW/Term/whnf(t)
    case x:
      @BitM{x, f, t}

def BendRW/Term/whnf_nat(x: BendRW/Term, z: BendRW/Term, s: BendRW/Term) -> BendRW/Term:
  match BendRW/Term/whnf(x):
    case @Zer:
      BendRW/Term/whnf(z)
    case @Suc{n}:
      BendRW/Term/whnf(@App{s, BendRW/Term/whnf(n)})
    case x:
      @NatM{x, z, s}

def BendRW/Term/whnf_lst(x: BendRW/Term, n: BendRW/Term, c: BendRW/Term) -> BendRW/Term:
  match BendRW/Term/whnf(x):
    case @Nil:
      BendRW/Term/whnf(n)
    case @Con{h, t}:
      BendRW/Term/whnf(@App{@App{c, BendRW/Term/whnf(h)}, BendRW/Term/whnf(t)})
    case x:
      @LstM{x, n, c}

def BendRW/Term/whnf_sig(x: BendRW/Term, f: BendRW/Term) -> BendRW/Term:
  match BendRW/Term/whnf(x):
    case @Tup{a, b}:
      BendRW/Term/whnf(@App{@App{f, BendRW/Term/whnf(a)}, BendRW/Term/whnf(b)})
    case x:
      @SigM{x, f}

def BendRW/Term/whnf_eql(x: BendRW/Term, f: BendRW/Term) -> BendRW/Term:
  match BendRW/Term/whnf(x):
    case @Rfl:
      BendRW/Term/whnf(f)
    case x:
      @EqlM{x, f}
