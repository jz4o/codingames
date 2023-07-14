# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rows = []
23.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class DigitalNumber
  def initialize(score_rows)
    @bits_array = to_bits_array score_rows
  end

  def subtract_score(score_rows)
    @bits_array = @bits_array.zip(to_bits_array(score_rows)).map { |s1, s2| s1 & (s2 ^ '1111111'.to_i(2)) }
  end

  def add_score(score_rows)
    @bits_array = @bits_array.zip(to_bits_array(score_rows)).map { |s1, s2| s1 | s2 }
  end

  def to_s
    digit_bits = %w[
      1110111 0000011 0111110 0011111 1001011
      1011101 1111101 0010011 1111111 1011111
    ]

    @bits_array.reverse.map { |s| digit_bits.index s.to_s(2).rjust(7, '0') }.join
  end

  private

  def to_bits_array(score_rows)
    bits_array = []
    score_rows.map(&:chars).transpose.each_slice(8) do |digit_rows|
      break unless digit_rows.size == 8

      bits = ''
      bits += digit_rows[2][2] == '|' ? '1' : '0' # left top
      bits += digit_rows[2][4] == '|' ? '1' : '0' # left bottom
      bits += digit_rows[4][1] == '~' ? '1' : '0' # center top
      bits += digit_rows[4][3] == '~' ? '1' : '0' # center
      bits += digit_rows[4][5] == '~' ? '1' : '0' # center bottom
      bits += digit_rows[6][2] == '|' ? '1' : '0' # right top
      bits += digit_rows[6][4] == '|' ? '1' : '0' # right bottom

      bits_array.unshift bits.to_i(2)
    end

    bits_array
  end
end

digital_rows1 = rows[0, 7]
digital_rows2 = rows[8, 7]
digital_rows3 = rows[16, 7]

digital_number = DigitalNumber.new digital_rows1
digital_number.subtract_score digital_rows2
digital_number.add_score digital_rows3

result = digital_number.to_s

# puts "newScore"
puts result
