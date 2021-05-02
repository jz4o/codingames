# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

module MonthBaseNumber
  MONTHS = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec].freeze
  NUMS   = [*'0'..'9', *'a'..'b'].freeze

  def self.base(digit)
    NUMS.size**digit
  end

  def self.to_i(month_base_text)
    month_base_text.scan(/.{3}/).reverse.map.with_index do |month, index|
      NUMS[MONTHS.index(month)].to_i(NUMS.size) * base(index)
    end.sum
  end

  def self.from_i(num)
    num.to_s(NUMS.size).chars.map do |char|
      MONTHS[NUMS.index(char)]
    end.join
  end
end

@n = gets.to_i
sum = (1..@n).sum { MonthBaseNumber.to_i gets.chomp }
puts MonthBaseNumber.from_i sum
