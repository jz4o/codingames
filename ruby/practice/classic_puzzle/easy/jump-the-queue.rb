# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

g, e = gets.split.map(&:to_i)
groups = []
g.times do
  group = gets.chomp
  groups << group
end
inputs = gets.split
events = []
e.times do |i|
  event = inputs[i].to_i
  events << event
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Student = Struct.new :id, :group_id
DEQUEUEING_EVENT = -1

groups.map!(&:split)
event_items = events.map do |event|
  if event == DEQUEUEING_EVENT
    DEQUEUEING_EVENT
  else
    group_id = groups.index { |group| group.include? event.to_s }
    Student.new event, group_id
  end
end

student_queue = []
leaved_students = []
event_items.each do |event_item|
  leaved_students << student_queue.shift and next if event_item == DEQUEUEING_EVENT

  student = event_item
  insert_index = student.group_id && student_queue.rindex { |s| s.group_id == student.group_id }
  if insert_index
    student_queue.insert insert_index + 1, student
  else
    student_queue << student
  end
end

results = leaved_students.map(&:id)

# puts "answer"
results.each do |result|
  puts result
end
