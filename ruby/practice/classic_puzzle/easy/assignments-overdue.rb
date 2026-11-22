# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
input_rows = []
n.times do
  d, p = gets.split.map(&:to_i)
  input_rows << [d, p]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Assignment = Struct.new :index, :days_required, :penalty

assignments = input_rows.map.with_index(1) do |(days, penalty), index|
  Assignment.new index, days, penalty
end

sorted_assignments = assignments.sort_by do |assignment|
  [-(assignment.penalty / assignment.days_required.to_f), assignment.index]
end

sequence = sorted_assignments.map(&:index).join ' '

days = 0
total_penalty = 0
sorted_assignments.each do |assignment|
  total_penalty += (days + assignment.days_required) * assignment.penalty
  days += assignment.days_required
end

results = [sequence, total_penalty]

# puts "answer"
results.each do |result|
  puts result
end
