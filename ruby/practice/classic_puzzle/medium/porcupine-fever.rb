@n = gets.to_i
@y = gets.to_i
cages = []
@n.times do
  s, h, a = gets.split(' ').collect(&:to_i)
  cages << [s, h, a]
end

SICK     = 0
SURVIVAL = 2

@y.times do |y|
  alive = 0
  cages.each do |cage|
    sick = cage[SICK] * (2**y)
    survival = cage[SURVIVAL] -= sick
    alive += [survival, 0].max
  end

  puts alive

  break if alive.zero?
end
