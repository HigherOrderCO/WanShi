# Proof of De Morgan's Law for AND
# not (a and b) == (not a) or (not b)
def De_morgan_and(a: Bool, b: Bool) -> Bool{Bool/Not(Bool/And(a, b)) == Bool/Or(Bool/Not(a), Bool/Not(b))}:
  # We prove this by case analysis on 'a' and 'b'.
  if a:
    if b:
      # Case a=T, b=T: not(T and T) == (not T) or (not T)
      #                not(T)      == F or F
      #                F           == F
      finally
    else:
      # Case a=T, b=F: not(T and F) == (not T) or (not F)
      #                not(F)      == F or T
      #                T           == T
      finally
  else:
    if b:
      # Case a=F, b=T: not(F and T) == (not F) or (not T)
      #                not(F)      == T or F
      #                T           == T
      finally
    else:
      # Case a=F, b=F: not(F and F) == (not F) or (not F)
      #                not(F)      == T or T
      #                T           == T
      finally
