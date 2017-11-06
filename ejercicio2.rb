nombres = ['Violeta', 'Andino', 'Clemente', 'Javiera', 'Paula', 'Pia', 'Ray']

# 1 elementos de mas de 5 caracteres
nombres.select { |x| x.length > 5 }
# 2 nombres en mayuscula
nomb_may = nombres.map { |x| x.upcase }
# 3 nombre que comienzan con P
nombres.select { |x| x[0] == 'P' }
# 4 nombre que comienzan con P
unico = nombres.map { |x| x.length }
# 5 nombre que comienzan con P
puts nombres.map { |x| x.gsub(/[AEIOUaeiou]/, '') }
