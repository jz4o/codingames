# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

module MonthBaseNumber
  MONTHS = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]
  NUMS   = [*'0'..'9', *'a'..'b']

  def self.base(digit)
    NUMS.size ** digit
  end

  def self.to_i(month_base_text)
    month_base_text.scan(/.{3}/).reverse.map.with_index { |month, index|
      NUMS[MONTHS.index(month)].to_i(NUMS.size) * base(index)
    }.sum
  end

  def self.from_i(num)
    num.to_s(NUMS.size).chars.map { |char|
      MONTHS[NUMS.index(char)]
    }.join
  end
end

@n = gets.to_i
sum = (1..@n).map { MonthBaseNumber.to_i gets.chomp }.sum
puts MonthBaseNumber.from_i sum

