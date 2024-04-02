# 6 Degrees of Kevin Bacon!

actor_name = gets.chomp
n = gets.to_i
movie_casts = []
n.times do
  movie_cast = gets.chomp
  movie_casts << movie_cast
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

kevin = 'Kevin Bacon'

casts_array = movie_casts.map do |movie_cast|
  movie_cast.split(': ').last.split(', ')
end

target_casts = [actor_name]
bacon_number = 0
until target_casts.include? kevin
  bacon_number += 1
  target_casts = casts_array.filter { |casts| target_casts.any? { |target| casts.include? target } }.flatten.uniq
end

result = bacon_number

# puts "N degrees to Kevin Bacon"
puts result
