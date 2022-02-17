# frozen_string_literal: true

# variable definition
line_num = 0
contenedor_celulas = []
sizes = []
base = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
]

# Methods
def matriz_to_binary(contenedor_celulas)
  contenedor_celulas.each do |celulas|
    celulas.map! do |celula|
      celula = if celula == '.'
                 0
               else
                 1
               end
    end
  end
  contenedor_celulas
end

def dibujar(contenedor_celulas, filas, columnas)
  (0..filas - 1).each do |i|
    (0..columnas - 1).each do |j|
      if contenedor_celulas[i][j] == 1
        print('*')
      else
        print('.')
      end
    end
    print "\n"
  end
end

def next_gen(contenedor_celulas, base, filas, columnas)
  (1..filas - 2).each do |i|
    (1..columnas - 2).each do |j|
      celulas_vivas = 0
      (-1..1).each do |a|
        (-1..1).each do |b|
          celulas_vivas += contenedor_celulas[i - a][j - b]
        end
      end
      celulas_vivas -= contenedor_celulas[i][j]
      base[i][j] = if contenedor_celulas[i][j] == 1 && celulas_vivas < 2
                     0
                   elsif contenedor_celulas[i][j] == 1 && celulas_vivas > 3
                     0
                   elsif contenedor_celulas[i][j].zero? && celulas_vivas == 3
                     1
                   else
                     contenedor_celulas[i][j]
                   end
    end
  end
end

text = File.open('cells.txt').read
text.each_line do |line|
  line_num += 1
  if line_num == 2
    sizes = line.strip.split(' ')
  elsif line_num >= 3
    contenedor_celulas.push(line.strip.split(''))
  end
end
contenedor_celulas = matriz_to_binary(contenedor_celulas)
filas = sizes[0].to_i
columnas = sizes[1].to_i

if filas <= 10 && filas.positive? && columnas <= 10 && columnas.positive?
  dibujar(contenedor_celulas, filas, columnas)
  puts
  next_gen(contenedor_celulas, base, filas, columnas)
  puts
  dibujar(base, filas, columnas)
else
  puts 'Error: El tamaño tiene que ser menor de 2 digitos y mayor a 0 '
end
