# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
ss = []
n.times do
  s = gets.chomp
  ss << s
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

key_value_store = {}
results = ss.filter_map do |s|
  command, *command_values = s.split

  case command
  when 'SET'
    key_value_store.merge!(command_values.to_h { |key_value| key_value.split '=' })
    nil
  when 'GET'
    command_values.map { |key| key_value_store[key] || 'null' }.join(' ')
  when 'EXISTS'
    command_values.map { |key| key_value_store.key? key }.join(' ')
  when 'KEYS'
    key_value_store.any? ? key_value_store.keys.join(' ') : 'EMPTY'
  end
end

# puts "value1 value2 value3"
results.each do |result|
  puts result
end
