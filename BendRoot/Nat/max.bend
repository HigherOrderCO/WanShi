# def Nat/max(a: Nat, b: Nat) -> Nat:
#   if Nat/lte(a, b):
#     b
#   else:
#     a

def aux(a:Nat, b:Nat, c:Bool) -> Nat:
  if c:
    b
  else:
    a
def max(a: Nat, b: Nat) -> Nat:
  aux(a,b,Nat/lte(a,b))
