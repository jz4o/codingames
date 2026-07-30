# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

offset1, offset2 = gets.split

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

offset1_int = offset1.to_i
offset2_int = offset2.to_i
offset1_seconds = (offset1_int.negative? ? -1 : 1) * ((offset1_int.abs / 100 * 60) + (offset1_int.abs % 100)) * 60
offset2_seconds = (offset2_int.negative? ? -1 : 1) * ((offset2_int.abs / 100 * 60) + (offset2_int.abs % 100)) * 60
border_time1 = Time.at(offset1_seconds)
border_time2 = Time.at(offset2_seconds)

results = (60 * 24).times.filter_map do |i|
  additional_seconds = i * 60
  time1 = (border_time1 + additional_seconds).strftime('%H%M')
  time2 = (border_time2 + additional_seconds).strftime('%H%M')
  next if time1.chars.sort != time2.chars.sort

  "#{time1}, #{time2}"
end.sort

# puts "answer"
results.each do |result|
  puts result
end
