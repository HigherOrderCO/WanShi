# def Nat/div(a: Nat, b: Nat) -> Nat:
#   match b:
#     case 0n:
#       0n
#     case 1n + q:
#       match Nat/lt(a, b):
#         case True:
#           0n
#         case False:
#           1n + Nat/div(Nat/sub(a, b), b)

def aux(a:Nat, b:Nat, c:Bool) -> Nat:
  match b:
    case 0n:
      0n
    case 1n + q:
      match c:
        case True:
          0n
        case False:
          1n + Nat/div(Nat/sub(a, b), b)
  
def div(a: Nat, b: Nat) -> Nat:
  aux(a,b,Nat/lt(a,b))
