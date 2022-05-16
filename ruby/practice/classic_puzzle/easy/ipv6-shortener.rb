# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

ip = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

temp_ip = ip

ommit = temp_ip.scan(/(0000(:0000)+)/).flatten.max_by(&:length)
temp_ip = temp_ip.sub(ommit, ':').sub(':::', '::') if ommit

temp_ip = temp_ip.sub(/^0+/, '0')
temp_ip = temp_ip.gsub(/:0+/, ':0')
temp_ip = temp_ip.gsub(/:0([1-9a-f])/) { ":#{$1}" }

result = temp_ip

# puts "output"
puts result
