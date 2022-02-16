# frozen_string_literal: true

line_num = 0
contenedor_celulas = []
sizes = []
text = File.open('cells.txt').read
text.each_line do |line|
  line_num += 1
  if line_num == 2
    sizes.push(line.strip.split(' '))
  elsif line_num >= 3
    contenedor_celulas.push(line.strip.split(''))
  end
end

x = sizes[0]
y = sizes[1]

print contenedor_celulas

contenedor_celulas.each do |celulas|
  celulas.each do |celula|
    if(status_celula(celula) == true)
      
    end
    else

    end
  end
end

def status_celula(celula)
  celula=='*' ? true : false
end