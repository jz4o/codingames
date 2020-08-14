# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@lon = gets.chomp.sub(',', '.').to_f
@lat = gets.chomp.sub(',', '.').to_f
@n = gets.to_i
defibs = []
@n.times do
  tmp = gets.chomp.split(';')

  defib = {}
  defib[:id]        = tmp[0]
  defib[:name]      = tmp[1]
  defib[:address]   = tmp[2]
  defib[:phone]     = tmp[3]
  defib[:longitude] = tmp[4].sub(',', '.').to_f
  defib[:latitude]  = tmp[5].sub(',', '.').to_f

  defibs << defib
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

near_defib = defibs[0]
distance = 10_000
defibs.each do |defib|
  x = (@lon - defib[:longitude]) * Math.cos((defib[:latitude] + @lat) / 2)
  y = @lat - defib[:latitude]
  d = Math.sqrt(x**2 + y**2) * 6371

  if distance > d
    distance = d
    near_defib = defib
  end
end

puts near_defib[:name]
