# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

bottom_radius, top_radius, glass_height, beer_vol = gets.split.map(&:to_f)

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def calc_volume(bottom_radius, top_radius, height)
  Rational(1, 3) * Math::PI * height * (bottom_radius**2 + bottom_radius * top_radius + top_radius**2)
end

inclination = (top_radius - bottom_radius) / glass_height

min_height = 0
max_height = glass_height
temp_height = max_height

height_volume_hash = {}
until height_volume_hash.key? temp_height
  temp_top_radius = bottom_radius + temp_height * inclination
  volume = calc_volume bottom_radius, temp_top_radius, temp_height

  height_volume_hash[temp_height] = volume

  if volume < beer_vol
    min_height = temp_height
    temp_height = (temp_height + ((max_height - temp_height) / 2)).round(1)
  else
    max_height = temp_height
    temp_height = (temp_height - ((temp_height - min_height) / 2)).round(1)
  end
end

result = height_volume_hash.min_by { |_k, v| (v - beer_vol).abs }.first

# puts "height of beer"
puts result
