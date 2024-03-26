# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

fingerprint = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Bishop
  ART_MAX_HEIGHT = 8
  ART_MAX_WIDTH = 16
  SYMBOLS = ' .o+=*BOX@%&#/^'.freeze

  def self.draw_art(fingerprint)
    walk fingerprint

    ascii_art = (0..ART_MAX_HEIGHT).map do |y|
      (0..ART_MAX_WIDTH).map do |x|
        SYMBOLS[@counter["#{y}:#{x}"]]
      end
    end

    ascii_art[@start_y][@start_x] = 'S'
    ascii_art[@end_y][@end_x] = 'E'

    ascii_art.map! { |ascii_row| "|#{ascii_row.join}|" }
    ascii_art.unshift '+---[CODINGAME]---+'
    ascii_art.push '+-----------------+'

    ascii_art
  end

  def self.walk(fingerprint)
    @counter = {}
    @counter.default = 0

    @start_y = @position_y = 4
    @start_x = @position_x = 8

    fingerprint.delete(':').chars.each_slice(2) do |hexa|
      hexa.map { |h| h.to_i(16).to_s(2).rjust(4, '0') }.join.reverse.chars.each_slice(2) do |x, y|
        @position_y = y == '0' ? [@position_y - 1, 0].max : [@position_y + 1, ART_MAX_HEIGHT].min
        @position_x = x == '0' ? [@position_x - 1, 0].max : [@position_x + 1, ART_MAX_WIDTH].min

        counter_key = "#{@position_y}:#{@position_x}"
        @counter[counter_key] = (@counter[counter_key] + 1) % SYMBOLS.size
      end
    end

    @end_y = @position_y
    @end_x = @position_x
  end
  private_class_method :walk
end

results = Bishop.draw_art fingerprint

# puts "ASCII Art Image"
results.each do |result|
  puts result
end
