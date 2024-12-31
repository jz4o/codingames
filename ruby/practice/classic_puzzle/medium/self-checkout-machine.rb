# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

cash = gets.chomp
n = gets.to_i
input_rows = []
n.times do
  bill, given = gets.split
  bill = bill.to_f
  input_rows << [bill, given]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

require 'bigdecimal'

class CheckoutMachine
  MONEY_VALUES = %w[50 20 10 5 2 1 0.50 0.20 0.10 0.05 0.02 0.01].freeze
  CASH_SEPARATOR = '+'.freeze
  MONEY_SEPARATOR = 'X'.freeze
  JAM_MARK = 'J'.freeze

  def initialize(cash_string)
    @cashes = {}
    MONEY_VALUES.each do |money_value|
      @cashes[money_value] = { count: 0, is_jam: false }
    end

    input_money cash_string
  end

  def payment(total, cash_string)
    payment = calc_total_value cash_string
    change = (BigDecimal(payment.to_s) - BigDecimal(total.to_s)).to_f

    input_money cash_string
    output_money change
  end

  private

  def calc_total_value(cash_string)
    cash_string.split(CASH_SEPARATOR).sum do |money_string|
      count, value = money_string.split MONEY_SEPARATOR
      count.to_i * value.to_f
    end
  end

  def input_money(cash_string)
    cash_string.split(CASH_SEPARATOR).each do |money_string|
      count, value = money_string.split MONEY_SEPARATOR
      is_jam = !count.delete!(JAM_MARK).nil?
      count = count.to_i

      @cashes[value][:count] += count
      @cashes[value][:is_jam] |= is_jam
    end
  end

  def output_money(change)
    return '0' if change.zero?

    remain_change = BigDecimal(change.to_s)
    output_cash_strings = []
    MONEY_VALUES.each do |money_value|
      value = BigDecimal(money_value)
      next if remain_change < value

      cash = @cashes[money_value]
      output_count = [(remain_change / value).to_i, cash[:count]].min
      next if output_count.zero?

      return 'ERROR: JAM' if cash[:is_jam]

      cash[:count] -= output_count
      remain_change -= value * output_count

      output_cash_strings << [output_count, money_value].join(MONEY_SEPARATOR)
    end
    return 'ERROR: OUT OF MONEY' if remain_change.positive?

    output_cash_strings.join CASH_SEPARATOR
  end
end

checkout_machine = CheckoutMachine.new cash

results = []
input_rows.each do |bill, given|
  change = checkout_machine.payment bill, given
  results << change

  break if change.include? 'ERROR'
end

# puts "each customer change notation or ERROR"
results.each do |result|
  puts result
end
