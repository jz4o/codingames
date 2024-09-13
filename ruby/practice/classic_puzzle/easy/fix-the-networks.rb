# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m = gets.to_i
rs = []
m.times do
  r = gets.chomp
  rs << r
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def calc_number_of_address(suffix)
  host_address_size = 32 - suffix
  2**host_address_size
end

results = rs.map do |r|
  prefix, suffix = r.split '/'
  suffix = suffix.to_i

  bits = prefix.split('.').map { |b| b.to_i.to_s(2).rjust(8, '0') }.join
  last_one_bit_index = bits.rindex('1') || -1
  if last_one_bit_index < suffix
    number_of_address = calc_number_of_address suffix

    "valid #{number_of_address}"
  else
    new_suffix = last_one_bit_index + 1
    number_of_address = calc_number_of_address new_suffix

    "invalid #{prefix}/#{new_suffix} #{number_of_address}"
  end
end

# puts "answer"
results.each do |result|
  puts result
end
