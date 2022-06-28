# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
v = gets.to_i
speeds = []
n.times do
  speed = gets.to_i
  speeds << speed
end
bends = []
v.times do
  bend = gets.to_i
  bends << bend
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Motorcycle = Struct.new :name, :speed

alphabets = ('a'..'z').to_a
motorcycles = speeds.map.with_index { |speed, index| Motorcycle.new alphabets[index], speed }
staled_motorcycles = []

border_tan = Math.tan(60 * Math::PI / 180)
g = 9.81
border_speeds = []
bends.each do |bend|
  border_speed = Math.sqrt(border_tan * bend * g)
  border_speeds << border_speed

  bend_staled_motorcycles = motorcycles.select { |motorcycle| motorcycle.speed > border_speed }
  motorcycles -= bend_staled_motorcycles

  staled_motorcycles.unshift(*bend_staled_motorcycles.sort_by(&:speed).reverse)
end

results = []
results << border_speeds.min.to_i
results << 'y'
results << motorcycles.sort_by(&:speed).reverse.map(&:name)
results << staled_motorcycles.map(&:name)

# puts "answer"
results.each do |result|
  puts result
end
