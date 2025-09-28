# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
time_stamps = []
n.times do
  time_stamp = gets.chomp

  time_stamps << time_stamp
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

MAX_PLAYER_SIZE = 8

time_seconds = time_stamps.map do |time_stamp|
  minutes, seconds = time_stamp.split(':').map(&:to_i)

  minutes * 60 + seconds
end

result =
  if time_seconds.empty?
    'NO GAME'
  else
    limit = 0
    time_seconds.each_with_index do |time_second, index|
      break if time_second < limit
      limit = time_second and break if index == MAX_PLAYER_SIZE - 2

      limit = time_second - 256 / (2**index)
    end
    limit = 0 if limit < 0

    minutes, seconds = limit.divmod 60

    "#{minutes}:#{seconds.to_s.rjust 2, '0'}"
  end

# puts "m:ss"
puts result
