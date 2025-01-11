# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

ship = gets.chomp
wormhole = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

# puts "Direction:"

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

# puts "Distance:"

def get_component_value(vector, component_name)
  regexp = Regexp.new "([+-]?\\d*)#{component_name}"
  component_value = vector.scan(regexp).flatten.first || '0'
  return component_value.to_i if component_value.match?(/\d/)

  "#{component_value}1".to_i
end

def get_direction(i, j, k)
  gcd = [i, j, k].filter(&:itself).inject(&:gcd)

  i /= gcd
  j /= gcd
  k /= gcd

  direction_components = [
    i.zero? ? '' : "+#{i}i",
    j.zero? ? '' : "+#{j}j",
    k.zero? ? '' : "+#{k}k"
  ]

  direction_components
    .join
    .gsub(/[+-]1[ijk]/) { $&.delete '1' }
    .gsub('+-', '-')
    .delete_prefix('+')
end

def get_distance(i, j, k)
  Math.sqrt(i**2 + j**2 + k**2).round(2)
end

packed_ship = ship.delete ' '
packed_wormhole = wormhole.delete ' '

ship_i = get_component_value packed_ship, 'i'
ship_j = get_component_value packed_ship, 'j'
ship_k = get_component_value packed_ship, 'k'

wormhole_i = get_component_value packed_wormhole, 'i'
wormhole_j = get_component_value packed_wormhole, 'j'
wormhole_k = get_component_value packed_wormhole, 'k'

diff_i = wormhole_i - ship_i
diff_j = wormhole_j - ship_j
diff_k = wormhole_k - ship_k
direction = get_direction diff_i, diff_j, diff_k
distance = get_distance diff_i, diff_j, diff_k

results = [
  "Direction: #{direction}",
  "Distance: #{distance}"
]

results.each do |result|
  puts result
end
