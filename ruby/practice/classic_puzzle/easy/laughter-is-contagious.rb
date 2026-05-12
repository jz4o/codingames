# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

row = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

people = row.chars.each_slice(2).map(&:join)

people.map! do |person|
  people.include?(person.upcase) ? person.upcase : person
end

people = people.map.with_index do |person, index|
  next person unless person.match?(/[A-Z][a-z]/)

  neighbours = [
    people[[index - 1, 0].max],
    people[[index + 1, people.size - 1].min]
  ]
  next person if neighbours.all?(/[a-z]{2}/)

  laughings = (1..3).filter_map do |distance|
    l_distance_person = people[[index - distance, 0].max]
    r_distance_person = people[[index + distance, people.size - 1].min]

    is_l_laughing = l_distance_person.match?(/[A-Z]{2}/)
    is_r_laughing = r_distance_person.match?(/[A-Z]{2}/)

    if [is_l_laughing, is_r_laughing].all?
      "#{l_distance_person[-1]}#{r_distance_person[0]}"
    elsif is_l_laughing
      l_distance_person
    elsif is_r_laughing
      r_distance_person
    end
  end

  laughings.first || person
end

result = people.join

# puts "row"
puts result
