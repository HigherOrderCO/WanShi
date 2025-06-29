def distance(ax: F64, ay: F64, bx: F64, by: F64) -> F64:
  x_dist = ((bx - ax) ** 2.0) 
  y_dist = ((by - ay) ** 2.0)
  return (x_dist + y_dist) ** 0.5

def main() -> F64:
  return distance(0.0, 0.0, 1.0, 1.0)
