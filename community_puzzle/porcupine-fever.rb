@n = gets.to_i
@y = gets.to_i
cages = []
@n.times do
  s, h, a = gets.split(" ").collect {|x| x.to_i}
  cages << [s, h, a]
end

SICK   = 0.freeze
SURVIVAL = 2.freeze

@y.times do |y|
  alive = 0
  cages.each do |cage|
    sick = cage[SICK] * (2 ** y)
    survival = cage[SURVIVAL] -= sick
    alive += [survival, 0].max
  end

  puts alive

  break if alive.zero?
end

