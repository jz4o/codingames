# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class StunningNumber
  STUNNING_DIGITS = [0, 1, 2, 5, 8].freeze
  FLIPPABLE_DIGITS = [0, 1, 2, 5, 6, 8, 9].freeze
  NOT_FLIPPABLE_DIGITS = [3, 4, 7].freeze

  def initialize(number)
    @number = number.to_i
  end

  def stunning?
    @number.to_s == flip(@number)
  end

  def get_next_stunning_number(number = nil)
    temp_number = (number || @number).to_s
    length = temp_number.length
    front_length = (length / 2.0).ceil
    front = temp_number[...front_length]
    front_digits = [*front.to_i.next.digits, 0]

    not_flippable_index = front_digits.rindex { |d| NOT_FLIPPABLE_DIGITS.include? d }
    if not_flippable_index
      not_flippable_digit = front_digits[not_flippable_index]
      replaced_digit = FLIPPABLE_DIGITS.find { |d| not_flippable_digit < d }
      front_digits[not_flippable_index] = replaced_digit
      front_digits.fill(0, ...not_flippable_index) if 0 < not_flippable_index
    end

    front_digits.pop if front_digits.last.zero?

    result_front = front_digits.reverse.join
    back_length = length - front_length
    result_number = "#{result_front}#{flip result_front[...back_length]}"

    if result_number.length.odd?
      center_index = result_number.length / 2
      center_digit = result_number[center_index].to_i
      unless STUNNING_DIGITS.include? center_digit
        next_stunning_digit = STUNNING_DIGITS.find { |d| center_digit < d }
        return get_next_stunning_number result_number unless next_stunning_digit

        result_number[center_index] = next_stunning_digit.to_s
      end
    end

    StunningNumber.new result_number
  end

  def to_s
    @number.to_s
  end

  private

  def flip(number)
    number.to_s.tr('0123456789', '012XX59786').reverse
  end
end

stunning_number = StunningNumber.new n

results = [
  stunning_number.stunning?,
  stunning_number.get_next_stunning_number
]

# puts "true"
# puts "69"
results.each do |result|
  puts result
end
