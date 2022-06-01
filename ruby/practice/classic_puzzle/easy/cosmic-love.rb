# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

Planet = Struct.new :name, :r, :m, :c

n = gets.to_i
planets = []
n.times do
  name, r, m, c = gets.split

  planets << Planet.new(name, r.to_f, m.to_f, c.to_f)
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

alice = planets.find { |planet| planet.name == 'Alice' }
planets.delete(alice)

closest_planet = planets.sort_by(&:c).find do |planet|
  ra = alice.r
  va = 4 / 3 * Math::PI * ra**3
  da = alice.m / va

  rp = planet.r
  vp = 4 / 3 * Math::PI * rp**3
  dp = planet.m / vp

  roche_limit = ra * Math.cbrt(2 * da / dp)

  roche_limit < planet.c
end

result = closest_planet.name

# puts "answer"
puts result
