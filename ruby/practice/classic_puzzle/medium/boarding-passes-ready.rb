# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h = gets.to_i
w = gets.to_i
n = gets.to_i
passengers = []
n.times do
  passenger = gets.chomp
  passengers << passenger
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

sheet_names = passengers.to_h do |passenger|
  name, sheet = passenger.split ','
  [sheet, name]
end

# row: back to front
# column: outer to inner
sheet_columns = ('A'..'H').to_a
center_w = w / 2
left_sheet_names = h.downto(1).map do |row|
  sheet_columns[...center_w].filter_map { |column| sheet_names["#{row}#{column}"] }
end
right_sheet_names = h.downto(1).map do |row|
  sheet_columns[center_w...(w)].reverse.filter_map { |column| sheet_names["#{row}#{column}"] }
end

results = w.times.filter_map do |i|
  target_sheet_names = i.even? ? left_sheet_names : right_sheet_names
  names = target_sheet_names.filter_map(&:shift)

  "Now boarding: #{names.join ','}" if names.any?
end

# puts "Now boarding: Tinky Winky,Dipsy,La La,Po"
results.each do |result|
  puts result
end
