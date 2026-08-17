# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s = gets.to_i
h = gets.to_i
flow = gets.to_i
n = gets.to_i
leak_rows = []
n.times do
  leak_height, leak_flow = gets.split.map(&:to_i)
  leak_rows << [leak_height, leak_flow]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Leak = Struct.new :height, :flow

leaks =
  leak_rows
  .map { |leak_height, leak_flow| Leak.new leak_height, leak_flow }
  .sort_by(&:height)
  .chunk(&:height)
  .map do |leak_height, chunk_leaks|
    Leak.new leak_height, chunk_leaks.sum(&:flow)
  end

leaks << Leak.new(h, 0)

current_height = 0
current_flow = flow
elapsed_time = 0
leaks.each do |leak|
  diff_height = leak.height - current_height
  elapsed_time += (s / current_flow.to_f / 1000 * diff_height) if diff_height > 0

  current_height = leak.height

  current_flow -= leak.flow
  break if current_flow <= 0
end

result =
  if current_height == h
    elapsed_seconds = (elapsed_time * 60).floor

    hour, elapsed_seconds = elapsed_seconds.divmod 3600
    minute, seconds = elapsed_seconds.divmod 60

    [hour, minute, seconds].map { |t| t.to_s.rjust(2, '0') }.join ':'
  else
    "Impossible, #{current_height} cm."
  end

# puts "00:00:00"
puts result
