# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
input_rows = []
n.times do
  f, dir = gets.split
  f = f.to_i
  input_rows << [f, dir]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

forces = {}
forces.default = 0
input_rows.each do |f, dir|
  forces[dir.downcase.to_sym] += f
end

fx = forces[:right] - forces[:left]
fy = forces[:up] - forces[:down]

x = -fx
y = -fy

balancing_force = Math.sqrt(x**2 + y**2)

theta = Math.atan(y.abs / x.abs.to_f) * 180 / Math::PI
base_theta = x.positive? ? 0 : 180
theta = x.positive? == y.positive? ? base_theta + theta : base_theta - theta
theta %= 360
theta = 0 if theta.nan?

results = [
  format('%.2f', balancing_force),
  format('%.2f', theta)
]

# puts "answer"
results.each do |result|
  puts result
end
