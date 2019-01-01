# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

cgscontents = []
@n = gets.to_i
@n.times do
  cgscontent = gets.chomp
  cgscontents << cgscontent
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "minified all CGS content"

variables = {}
characters = []
cgscontents.map! do |cgscontent|
  # replace variable part
  cgscontent.scan(/\$.+?\$/).each do |variable|
    unless variables[variable]
      max_value = variables.values.max
      next_value = max_value ? max_value[1..-2].next : 'a'
      variables[variable] = "$#{next_value}$"
    end
    cgscontent.gsub!(variable, variables[variable])
  end

  # replace character part
  cgscontent.scan(/'.+'/).each do |character|
    cgscontent.gsub!(character, "$#{characters.size}")
    characters << character
  end

  cgscontent.delete("\s")
end

# restore character part
cgscontents = cgscontents.join
characters.each_with_index do |character, index|
  cgscontents.gsub!("$#{index}", character)
end

puts cgscontents
