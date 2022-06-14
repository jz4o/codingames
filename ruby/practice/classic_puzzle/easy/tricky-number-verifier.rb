# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

require 'date'

def calc_check_digit(lll, ddmmyy)
  [lll, ddmmyy].join.chars.zip('379584216'.chars).sum { |l, r| l.to_i * r.to_i } % 11
end

n = gets.to_i
numbers = []
n.times do
  number = gets.chomp
  numbers << number
end
n.times do
  # Write an answer using puts
  # To debug: STDERR.puts "Debug messages..."

  number = numbers.shift

  result = 'INVALID SYNTAX' unless number.match?(/^[1-9]\d{9}$/)

  lll, x, ddmmyy = number.scan(/(.{3})(.{1})(.{6})/).flatten

  unless result
    begin
      Date.strptime ddmmyy, '%d%m%y'
    rescue Date::Error
      result = 'INVALID DATE'
    end
  end

  unless result
    check_digit = calc_check_digit lll, ddmmyy
    result = 'OK' if check_digit == x.to_i
  end

  until result
    check_digit = calc_check_digit lll, ddmmyy
    result = [lll, check_digit, ddmmyy].join unless check_digit == 10

    lll = lll.to_i.next.to_s
  end

  # puts "answer"
  puts result
end
