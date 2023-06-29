# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

road_length = gets.to_i # The total kilometers of the route.
zone_quantity = gets.to_i # The number of road construction sites.
zone_rows = []
zone_quantity.times do
  # zone_km: The kilometer in which the road construction site begins.
  # zone_speed: The speed limit of the road construction site.
  zone_km, zone_speed = gets.split.collect(&:to_i)

  zone_rows << [zone_km, zone_speed]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

LIMIT_SPEED = 130.0
HOUR_MINUTES = 60

ideal_minutes = road_length / LIMIT_SPEED * HOUR_MINUTES

zone_rows.unshift [0, LIMIT_SPEED]
zone_rows << [road_length, 0]
actual_minutes = zone_rows.each_cons(2).sum do |zone_row, next_zone_row|
  zone_km, zone_speed = zone_row
  next_zone_km, _next_zone_speed = next_zone_row

  (next_zone_km - zone_km) / zone_speed.to_f * HOUR_MINUTES
end

result = (actual_minutes - ideal_minutes).round

# Difference between theoretical time and travel time
# puts "0.00"
puts result
