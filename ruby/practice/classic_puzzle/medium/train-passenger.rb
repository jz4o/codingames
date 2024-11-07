# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

start_station = gets.chomp
end_station = gets.chomp
n = gets.to_i
station_rows = []
n.times do
  station1, station2 = gets.split
  station_rows << [station1, station2]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

station_mapping = {}
station_mapping.default = []
station_rows.each do |station1, station2|
  station_mapping[station1] += [station2]
  station_mapping[station2] += [station1]
end

temp_station_paths = [[start_station]]
until station_path = temp_station_paths.find { |path| path.last == end_station }
  temp_station_paths = temp_station_paths.flat_map do |temp_station_path|
    station_mapping[temp_station_path.last].filter_map do |next_station|
      temp_station_path + [next_station] unless temp_station_path.include? next_station
    end
  end
end

result = station_path.join ' > '

# puts "answer"
puts result
