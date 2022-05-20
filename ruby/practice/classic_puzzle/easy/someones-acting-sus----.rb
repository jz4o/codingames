# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

Log = Struct.new :time, :room_index

_l = gets.to_i
f = gets.chomp
n, _k = gets.split.collect(&:to_i)
crewmates = []
n.times do
  crewmate = gets.chomp
  crewmates << crewmate
end
n.times do
  # Write an answer using puts
  # To debug: STDERR.puts "Debug messages..."

  crewmate = crewmates.shift
  logs = crewmate.chars.map.with_index { |char, index| Log.new(index, f.index(char)) if f.include? char }.compact
  is_sus = logs.each_cons(2).any? do |l, r|
    time = r.time - l.time
    distance = (r.room_index - l.room_index).abs
    distance = [distance, f.length - distance].min

    time < distance
  end

  result = is_sus ? 'SUS' : 'NOT SUS'

  # puts "answer"
  puts result
end
