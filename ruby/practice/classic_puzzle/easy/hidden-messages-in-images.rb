# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

pixels = []
w, h = gets.split.collect(&:to_i)
h.times do
  inputs = gets.split
  (0...w).each do |j|
    pixel = inputs[j].to_i

    pixels << pixel
  end
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

bits = pixels.map { |pixel| pixel % 2 }.join
result = bits.scan(/.{8}/).map { |b| b.to_i(2).chr }.join

# puts "answer"
puts result
