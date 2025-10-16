# def Nat/min(a: Nat, b: Nat) -> Nat:
#   if Nat/lte(a, b):
#     a
#   else:
#     b

def aux(a:Nat, b:Nat, c:Bool) -> Nat:
  if c:
    a
  else:
    b
def min(a: Nat, b: Nat) -> Nat:
  aux(a,b,Nat/lte(a,b))
