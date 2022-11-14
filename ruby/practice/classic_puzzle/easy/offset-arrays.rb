# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
assignments = []
n.times do
  assignment = gets.chomp

  assignments << assignment
end
x = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

assignment_hash = {}
assignments.each do |assignment|
  _, array_name, range_begin, range_end, values = */([A-Z]+)\[([-\d]+)\.\.([-\d]+)\] = ([-\s\d]+)/.match(assignment)
  values = values.split

  assignment_hash[array_name] ||= {}
  target_hash = assignment_hash[array_name]
  ((range_begin.to_i)..(range_end.to_i)).each_with_index do |r, i|
    target_hash[r.to_s] = values[i]
  end
end

answer = x.dup
while /([A-Z]+)\[([-\d]+)\]/.match? answer do
  _, array_name, key = */([A-Z]+)\[([-\d]+)\]/.match(answer)

  answer.sub! "#{array_name}[#{key}]", assignment_hash[array_name][key]
end

# puts "0"
puts answer
