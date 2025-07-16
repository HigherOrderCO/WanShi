
# def Nat/compare(a: Nat, b: Nat) -> Ordering:
#   match a b:
#     case 0n 0n:
#       return @EQ{}
#     case 0n 1n+b:
#       return @LT{}
#     case 1n+a 0n:
#       return @GT{}
#     case 1n+a 1n+b:
#       return Nat/compare(a, b)
