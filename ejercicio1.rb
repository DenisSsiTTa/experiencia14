a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]

# 1 aumentar los elementos en 1
a.map { |e| e + 1 }
# 2 transformar a float
a.map { |e| e.to_f }
# 3 transformar a string
a.map { |e| e.to_s }
# 4 todos los menores que 5
a.reject { |e| e >= 5 }
# 5 los mayores a 5
a.select { |e| e > 5 }
# 6 suma de los elementos
a.inject(0) { |sum, x| sum + x }
# 7 agrupar en pares e impares
a.group_by { |x| x.even? }
# 8 mayores y menores q 6
a.group_by { |x| x > 6 }
