# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
telephones = []
@n.times do
  telephones << gets.chomp
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."
number_hash = {}
telephones.each do |telephone|
  target_hash = number_hash
  telephone.split('').each do |number|
    target_hash[number] = {} unless target_hash.keys.include? number
    target_hash = target_hash[number]
  end
end

# The number of elements (referencing a number) stored in the structure.
puts number_hash.inspect.scan('=>').count

