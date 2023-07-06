# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a_speed = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Converter = Struct.new :name, :rate

DISTANCE_CONVERTERS = [
  Converter.new('miles', 1),
  Converter.new('furlongs', 8),
  Converter.new('chains', 10),
  Converter.new('yards', 22),
  Converter.new('feet', 3),
  Converter.new('inches', 12)
].freeze

UNIT_CONVERTERS = [
  Converter.new('fortnights', 1),
  Converter.new('weeks', 2),
  Converter.new('days', 7),
  Converter.new('hours', 24),
  Converter.new('minutes', 60),
  Converter.new('seconds', 60)
].freeze

speed, dist1, time1, dist2, time2 = a_speed.scan(/(\d+)\s(.*)\sper\s(.*)\sCONVERT\sTO\s(.*)\sper\s(.*)/).flatten

from_dist_index = DISTANCE_CONVERTERS.index { |converter| converter.name.match? Regexp.new("#{dist1}s?") }
to_dist_index = DISTANCE_CONVERTERS.index { |converter| converter.name.match? Regexp.new("#{dist2}s?") }
distance_rate =
  if from_dist_index < to_dist_index
    (from_dist_index.next..to_dist_index).inject(1) { |result, index| result * DISTANCE_CONVERTERS[index].rate }
  elsif from_dist_index == to_dist_index
    1
  else
    1.0 / (to_dist_index.next..from_dist_index).inject(1) { |result, index| result * DISTANCE_CONVERTERS[index].rate }
  end

from_unit_index = UNIT_CONVERTERS.index { |converter| converter.name.match? Regexp.new("#{time1}s?") }
to_unit_index = UNIT_CONVERTERS.index { |converter| converter.name.match? Regexp.new("#{time2}s?") }
unit_rate =
  if from_unit_index < to_unit_index
    (from_unit_index.next..to_unit_index).inject(1) { |result, index| result * UNIT_CONVERTERS[index].rate }
  elsif from_unit_index == to_unit_index
    1
  else
    1.0 / (to_unit_index.next..from_unit_index).inject(1) { |result, index| result * UNIT_CONVERTERS[index].rate }
  end

to_speed = (speed.to_i * distance_rate / unit_rate.to_f).round(1)

result = "#{to_speed} #{dist2} per #{time2}"

# puts "The Converted Speed"
puts result
