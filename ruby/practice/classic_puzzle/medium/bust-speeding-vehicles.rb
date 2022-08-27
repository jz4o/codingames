# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

l = gets.to_i
n = gets.to_i
rs = []
n.times do
  r = gets.chomp
  rs << r
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Record = Struct.new :number, :distance, :timestamp

records = rs.map do |r|
  number, distance, timestamp = r.split
  distance = distance.to_i
  timestamp = timestamp.to_i

  Record.new number, distance, timestamp
end

results = []
records.chunk(&:number).each do |number, number_records|
  number_records.each_cons(2) do |l_record, r_record|
    time = r_record.timestamp - l_record.timestamp
    distance = r_record.distance - l_record.distance

    speed = distance / (time.to_f / 60 / 60)

    results << [number, r_record.distance].join(' ') if l < speed
  end
end

results << 'OK' if results.empty?

# puts "result"
results.each do |result|
  puts result
end
