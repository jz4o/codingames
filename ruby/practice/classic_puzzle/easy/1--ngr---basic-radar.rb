# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

ScanResult = Struct.new(:plate, :radarname, :radarpoint, :timestamp)

n = gets.to_i
scan_results = []
n.times do
  plate, radarname, timestamp = gets.split
  timestamp = timestamp.to_i

  radarpoint = radarname.split('-').last.to_i

  scan_results << ScanResult.new(plate, radarname, radarpoint, timestamp)
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

scan_results_each_car = scan_results.sort_by { |sr| [sr.plate, sr.radarpoint] }.chunk(&:plate).to_h

results = []
scan_results_each_car.each do |plate, scan_results_for_car|
  speeds = []
  scan_results_for_car.each_cons(2) do |l, r|
    distance = r.radarpoint - l.radarpoint
    time = r.timestamp - l.timestamp

    speeds << distance / time.to_f * 1000 * 60 * 60
  end
  max_speed = speeds.max.to_i

  results << "#{plate} #{max_speed}" if max_speed > 130
end

# puts "ticket"
results.each do |result|
  puts result
end
