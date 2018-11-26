# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
@m = gets.to_i

voters = []
@n.times do
  person_name, nb_vote = gets.split(" ")
  voters << [person_name, nb_vote.to_i]
end

votes = {}
@m.times do
  voter_name, vote_value = gets.split(" ")
  votes[voter_name] = [] unless votes[voter_name]
  votes[voter_name] << vote_value
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "output"

yes = no = 0
voters.each do |name, count|
  next unless votes[name] && votes[name].size <= count
  yes += votes[name].count 'Yes'
  no  += votes[name].count 'No'
end

puts "#{yes} #{no}"

