
def BendRW/Term/show(term: BendRW/Term) -> String:
  match term:
    case @Let{k, T, v, f}:
      return String/flat(["let ", k, " : ", BendRW/Term/show(T), " = ", BendRW/Term/show(v), "; ", BendRW/Term/show(f(@Var{k, 0n}))])
    case @Var{k, i}:
      return k
    case @Sub{t}:
      return BendRW/Term/show(t)
    case @Fix{k, f}:
      return String/flat(["μ", k, ".", BendRW/Term/show(f(@Var{k, 0n}))])
    case @Set:
      return "Set"
    case @All{k, a, b}:
      return String/flat(["∀", k, ":", BendRW/Term/show(a), ".", BendRW/Term/show(b(@Var{k, 0n}))])
    case @Lam{k, f}:
      return String/flat(["λ", k, ".", BendRW/Term/show(f(@Var{k, 0n}))])
    case @App{f, x}:
      return String/flat(["(", BendRW/Term/show(f), " ", BendRW/Term/show(x), ")"])
    case @Emp:
      return "Empty"
    case @EmpM{x}:
      return String/flat(["~", BendRW/Term/show(x), "{}"])
    case @Uni:
      return "Unit"
    case @One:
      return "()"
    case @UniM{x, f}:
      return String/flat(["~", BendRW/Term/show(x), "{():", BendRW/Term/show(f), "}"])
    case @Bit:
      return "Bool"
    case @Bt0:
      return "False"
    case @Bt1:
      return "True"
    case @BitM{x, f, t}:
      return String/flat(["~", BendRW/Term/show(x), "{#0:", BendRW/Term/show(f), ";#1:", BendRW/Term/show(t), "}"])
    case @Nat:
      return "Nat"
    case @Zer:
      return "0"
    case @Suc{n}:
      return String/flat(["↑", BendRW/Term/show(n)])
    case @NatM{x, z, s}:
      return String/flat(["~", BendRW/Term/show(x), "{0:", BendRW/Term/show(z), ";↑:", BendRW/Term/show(s), "}"])
    case @Lst{t}:
      return String/flat([BendRW/Term/show(t), "[]"])
    case @Nil:
      return "[]"
    case @Con{h, t}:
      return String/flat([BendRW/Term/show(h), "<>", BendRW/Term/show(t)])
    case @LstM{x, n, c}:
      return String/flat(["~", BendRW/Term/show(x), "{[]:", BendRW/Term/show(n), ";<>:", BendRW/Term/show(c), "}"])
    case @Sig{k, a, b}:
      return String/flat(["Σ", k, ":", BendRW/Term/show(a), ".", BendRW/Term/show(b(@Var{k, 0n}))])
    case @Tup{a, b}:
      return String/flat(["(", BendRW/Term/show(a), ",", BendRW/Term/show(b), ")"])
    case @SigM{x, f}:
      return String/flat(["~", BendRW/Term/show(x), "{(,):", BendRW/Term/show(f), "}"])
    case @Eql{t, a, b}:
      return String/flat([BendRW/Term/show(t), "{", BendRW/Term/show(a), "==", BendRW/Term/show(b), "}"])
    case @Rfl:
      return "{==}"
    case @EqlM{x, f}:
      return String/flat(["~", BendRW/Term/show(x), "{{==}:", BendRW/Term/show(f), "}"])
    case @Rwt{a, b, x}:
      return String/flat(["rewrite ", BendRW/Term/show(a), " by ", BendRW/Term/show(b), " in ", BendRW/Term/show(x)])
