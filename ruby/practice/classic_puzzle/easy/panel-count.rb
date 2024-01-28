# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

p = gets.to_i
properties = []
p.times do
  property = gets.chomp
  properties << property
end
n = gets.to_i
person_rows = []
n.times do
  person = gets.chomp
  person_rows << person
end
f = gets.to_i
formulas = []
f.times do
  formula = gets.chomp
  formulas << formula
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

properties.unshift 'name'

persons = person_rows.map do |person_row|
  person_properties = person_row.split

  person = {}
  properties.zip(person_properties).each do |property_name, person_property|
    person[property_name] = person_property
  end

  person
end

results = formulas.map do |formula|
  formula
    .split(' AND ')
    .map { |condition| condition.split '=' }
    .inject(persons) do |result_persons, condition|
      condition_name, condition_value = condition
      result_persons.filter { |person| person[condition_name] == condition_value }
    end
    .size
end

# puts "answer"
results.each do |result|
  puts result
end
