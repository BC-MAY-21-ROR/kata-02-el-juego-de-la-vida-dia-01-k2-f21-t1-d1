# frozen_string_literal: true

line_num = 0
celulas = []
sizes = []
text = File.open('cells.txt').read
text.each_line do |line|
  line_num += 1
  if line_num == 2
    sizes.push(line.strip.split(' '))
  elsif line_num >= 3
    celulas.push(line.strip.split(''))
  end
end

x = sizes[0]
y = sizes[1]

print celulas
