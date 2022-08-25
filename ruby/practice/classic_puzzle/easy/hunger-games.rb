# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

tributes = gets.to_i
tribute_hash = {}
tributes.times do
  player_name = gets.chomp
  tribute_hash[player_name] = { killed: [] }
end
turns = gets.to_i
infos = []
turns.times do
  info = gets.chomp
  infos << info
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

infos.each do |info|
  killer, _, *people_killed = info.split

  people_killed.each do |killed|
    killed.delete! ','
    tribute_hash[killed][:killer] = killer
    tribute_hash[killer][:killed] << killed
  end
end

results = []
tribute_hash.sort.each do |player_name, result|
  killed = result[:killed].empty? ? 'None' : result[:killed].sort.join(', ')
  killer = result[:killer] || 'Winner'

  results << "Name: #{player_name}"
  results << "Killed: #{killed}"
  results << "Killer: #{killer}"
  results << nil # for empty line
end

# remove last empty line
results.pop

# puts "Name:"
# puts "Killed:"
# puts "Killer:"
results.each do |result|
  puts result
end
