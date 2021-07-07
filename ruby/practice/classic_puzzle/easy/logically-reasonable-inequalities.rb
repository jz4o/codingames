# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
rows = []
n.times do
  row = gets.chomp

  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

inheritances = {}
inheritances.default = []
rows.each do |row|
  parent, child = row.split(' > ')
  inheritances[parent] = inheritances[parent] + [child]
end

temps = inheritances.keys
catch :check do
  while temps.any?
    temp = temps.pop

    inheritances[temp[-1]].each do |inheritance_child|
      temps << temp + inheritance_child

      throw :check if temp.include? inheritance_child
    end
  end
end

# puts "consistent/contradiction"
puts temps.empty? ? 'consistent' : 'contradiction'
