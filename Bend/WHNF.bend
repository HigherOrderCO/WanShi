# WHNF in Bend.hs:
#./../../Bend2/src/Core/Type.hs#
#./../../Bend2/src/Core/WHNF.hs#

# Bend guide:

#./../Bend.md#

# WHNF in Bend.bend:

#./Term.bend.py#

# TASK: implement the WHNF.bend file now:

# NOTE: do NOT implement OP2/OP1 functions or built-in primitives - just the
# core reductions for now. also, don't implement levels - just plain redunction.
# note tehre is no book yet, so don't implement it. don't implemen tundo
# (assume lv=2)

def whnf(term: Bend/Term) -> Bend/Term:
  match term:
    case @App{f, x}:
      whnf_app(f, x)
    case term:
      term

def whnf_ref(k: String) -> Bend/Term:
  ()
  #@Ref{k}

def whnf_fix(k: String, f: Bend/Term -> Bend/Term) -> Bend/Term:
  ()
  #whnf(f(@Fix{k, f}))

def whnf_app(f: Bend/Term, x: Bend/Term) -> Bend/Term:
  ()
  #match whnf(f):
    #case @Lam{k, body}:
      #whnf(body(x))
    #case @Fix{k, body}:
      #whnf_app(body(@Fix{k, body}), x)
    #case @Ref{k}:
      #@App{@Ref{k}, x}
    #case @Use{body}:
      #match whnf(x):
        #case @One{}:
          #whnf(body)
        #case _:
          #@App{@Use{body}, x}
    #case @Bif{f0, f1}:
      #match whnf(x):
        #case @Bt0{}:
          #whnf(f0)
        #case @Bt1{}:
          #whnf(f1)
        #case _:
          #@App{@Bif{f0, f1}, x}
    #case @Swi{z, s}:
      #match whnf(x):
        #case @Zer{}:
          #whnf(z)
        #case @Suc{n}:
          #whnf(@App{s, whnf(n)})
        #case _:
          #@App{@Swi{z, s}, x}
    #case @Mat{n, c}:
      #match whnf(x):
        #case @Nil{}:
          #whnf(n)
        #case @Con{h, t}:
          #whnf(@App{@App{c, whnf(h)}, whnf(t)})
        #case _:
          #@App{@Mat{n, c}, x}
    #case @Get{body}:
      #match whnf(x):
        #case @Tup{a, b}:
          #whnf(@App{@App{body, whnf(a)}, whnf(b)})
        #case _:
          #@App{@Get{body}, x}
    #case @Cse{cases}:
      #match whnf(x):
        #case @Sym{s}:
          #()
        #case _:
          #@App{@Cse{cases}, x}
    #case f_reduced:
      #@App{f_reduced, x}

#def lookup_case(cases: (String & Bend/Term)[], s: String) -> Bend/Term:
  #match cases:
    #case []:
      #@App{@Cse{[]}, @Sym{s}}
    #case (tag, term) <> rest:
      #if String/equal(tag, s):
        #term
      #else:
        #lookup_case(rest, s)

#def String/equal(a: String, b: String) -> Bool:
  #match a:
    #case []:
      #match b:
        #case []:
          #True
        #case _ <> _:
          #False
    #case a_head <> a_tail:
      #match b:
        #case []:
          #False
        #case b_head <> b_tail:
          #if Char/equal(a_head, b_head):
            #String/equal(a_tail, b_tail)
          #else:
            #False

#def Char/equal(a: Char, b: Char) -> Bool:
  #a == b












