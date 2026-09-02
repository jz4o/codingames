# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

t = gets.chomp
n = gets.to_i
fnames = []
n.times do
  fname = gets.chomp
  fnames << fname
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def calc_train_minutes(betweens)
  to_station = 35
  to_destination = 30

  move = betweens.sum do |between|
    ([6, between].min * 60.0 / 50.0) + ([between - 6, 0].max * 60.0 / 284.0)
  end
  pause = betweens.size.pred * 8

  (to_station + move + pause + to_destination).floor
end

def calc_car_minutes(betweens)
  move = betweens.sum do |between|
    ([14, between].min * 60.0 / 50.0) + ([between - 14, 0].max * 60.0 / 105.0)
  end

  move.floor
end

routes = fnames.to_h do |fname|
  city1, city2, distance = fname.split
  distance = distance.to_f

  [city1, { to: city2, distance: distance }]
end

starting_city, destination = t.split

between_distances = []
from_city = starting_city
while from_city != destination
  between_distances << routes[from_city][:distance]

  from_city = routes[from_city][:to]
end

train_minutes = calc_train_minutes between_distances
car_minutes = calc_car_minutes between_distances

faster_vehicle = train_minutes < car_minutes ? :TRAIN : :CAR
faster_minutes = [train_minutes, car_minutes].min

h, m = faster_minutes.divmod 60
m = m.to_s.rjust 2, '0'

result = "#{faster_vehicle} #{h}:#{m}"

# puts "answer"
puts result
