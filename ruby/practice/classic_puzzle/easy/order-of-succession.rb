# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
input_rows = []
@n.times do
  name, parent, birth, death, religion, gender = gets.split
  birth = birth.to_i

  input_rows << [name, parent, birth, death, religion, gender]
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

Person = Struct.new :name, :parent, :birth, :death, :religion, :gender

people = input_rows.map do |input_row|
  name, parent, birth, death, religion, gender = input_row
  Person.new name, parent, birth, death, religion, gender
end

results = []
temp_people = people.filter { |person| person.parent == '-' }
while temp_person = temp_people.shift
  results << temp_person.name if temp_person.death == '-' && !temp_person.religion.casecmp?('catholic')

  next_people = people.filter { |person| person.parent == temp_person.name }
                      .sort_by { |person| [-person.gender.ord, person.birth] }

  temp_people.unshift(*next_people)
end

# puts "orDeroFsucceSsion"
results.each do |result|
  puts result
end
