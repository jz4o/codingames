# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

c = gets.to_i
p = gets.to_i
items = []
c.times do
  item = gets.chomp
  items << item
end
orders = []
p.times do
  order = gets.chomp
  orders << order
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

inventory = {}
inventory.default = []
items.each do |item|
  category, size, price = item.split
  price = price.to_i

  inventory["#{category} #{size}"] += [price]
end
inventory.transform_values!(&:sort)

results = orders.map do |order|
  inventory[order].shift || 'NONE'
end

# puts "NONE"
results.each do |result|
  puts result
end
