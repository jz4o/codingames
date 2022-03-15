# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

Report = Struct.new(:st, :ed)

l = gets.to_i
n = gets.to_i
reports = []
n.times do
  st, ed = gets.split.collect(&:to_i)

  reports << Report.new(st, ed)
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

reports.sort_by!(&:st)

results = []

position = 0
reports.each do |report|
  results << "#{position} #{report.st}" if position < report.st

  position = [position, report.ed].max
end

results << "#{position} #{l}" if position < l
results << 'All painted' if results.empty?

# puts "answer"
results.each do |result|
  puts result
end
