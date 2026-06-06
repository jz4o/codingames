# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

num1_lines = []
5.times do
  num1_line = gets.chomp
  num1_lines << num1_line
end
num2_lines = []
5.times do
  num2_line = gets.chomp
  num2_lines << num2_line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class CistercianNumeral
  Map = Struct.new :row, :column

  PLACE_CHAR_MAP = {
    ones: {
      chars: ['   ', '_  ', ' _ ', ' \\ ', ' / ', '_/ ', '  |', '_ |', ' _|', '__|'],
      maps: [Map.new(0, 3), Map.new(1, 3), Map.new(1, 4)]
    },
    tens: {
      chars: ['   ', '_  ', '  _', '  /', '  \\', '_ \\', ' | ', '_| ', ' |_', '_|_'],
      maps: [Map.new(0, 1), Map.new(1, 0), Map.new(1, 1)]
    },
    hundreds: {
      chars: ['    ', ' _  ', '_   ', ' /  ', ' \\  ', ' \\ ‾', '  | ', ' _| ', '_ | ', '__| '],
      maps: [Map.new(2, 3), Map.new(3, 3), Map.new(3, 4), Map.new(4, 3)]
    },
    thousands: {
      chars: ['    ', '  _ ', '_   ', '  \\ ', '  / ', '  /‾', ' |  ', ' |_ ', '_|  ', '_|_ '],
      maps: [Map.new(2, 1), Map.new(3, 0), Map.new(3, 1), Map.new(4, 1)]
    }
  }.freeze

  def self.to_arabic(cistercian_lines)
    grid = cistercian_lines.map(&:chars)

    thousands, hundreds, tens, ones = %i[thousands hundreds tens ones].map do |place_key|
      char_map = PLACE_CHAR_MAP[place_key]
      char = char_map[:maps].map { |map| grid[map.row][map.column] }.join

      char_map[:chars].index(char)
    end

    [thousands, hundreds, tens, ones].join.to_i
  end

  def self.from_arabic(num)
    grid = [
      '     ',
      '  |  ',
      '  |  ',
      '  |  ',
      '     '
    ].map(&:chars)

    ones, tens, hundreds, thousands = num.digits
    place_nums = {
      ones: ones || 0,
      tens: tens || 0,
      hundreds: hundreds || 0,
      thousands: thousands || 0
    }

    place_nums.each do |place_key, place_num|
      char_map = PLACE_CHAR_MAP[place_key]

      place_char = char_map[:chars][place_num]
      place_char.chars.each_with_index do |char, index|
        map = char_map[:maps][index]
        grid[map.row][map.column] = char
      end
    end

    grid.map(&:join)
  end
end

num1 = CistercianNumeral.to_arabic(num1_lines)
num2 = CistercianNumeral.to_arabic(num2_lines)

addition = num1 + num2

results = CistercianNumeral.from_arabic addition

# puts "result"
results.each do |result|
  puts result
end
