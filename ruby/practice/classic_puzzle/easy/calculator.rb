# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

class Calculator
  attr_reader :display

  DECIMAL_PLACES = 3

  def initialize
    @num1 = ''
    @operation = ''
    @num2 = ''
    @pressed_equal = false
    @display = ''
  end

  def press(key)
    case key
    when '0'..'9'
      initialize if @pressed_equal

      if @operation.empty?
        @num1 += key
        @display = @num1
      else
        @num2 += key
        @display = @num2
      end
    when '+', '-', 'x', '/'
      calc unless @num2.empty? || @pressed_equal

      @operation = key

      @num2 = ''
      @pressed_equal = false

      @display = @num1
    when '='
      @pressed_equal = true

      @display = calc
    when 'AC'
      initialize

      @display = '0'
    end
  end

  def calc
    num1 = @num1.to_f
    num2 = @num2.to_f
    operation = @operation.sub('x', '*').to_sym

    result = num1.method(operation).call(num2).round(DECIMAL_PLACES).to_s.sub(/\.0$/, '')

    @num1 = result
  end
end

n = gets.to_i
keys = []
n.times do
  key = gets.chomp
  keys << key
end
calculator = Calculator.new
n.times do
  # Write an answer using puts
  # To debug: STDERR.puts "Debug messages..."

  key = keys.shift
  calculator.press key

  result = calculator.display

  # puts "answer"
  puts result
end
