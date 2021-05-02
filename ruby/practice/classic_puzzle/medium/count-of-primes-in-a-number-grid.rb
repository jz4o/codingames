# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@r, @c = gets.split.collect(&:to_i)
digit_map = []
@r.times do
  digit_map << gets.chomp.split
end

require 'prime'

def combination_digits(digits_row)
  result = []
  (2..digits_row.length).each do |i|
    digits_row.each_cons(i) do |digits|
      result << digits.join.to_i
    end
  end
  result
end

digits = []
digits << digit_map.flatten.map(&:to_i)
digits << digit_map.map { |row| combination_digits row }
digits << digit_map.transpose.map { |row| combination_digits row }
digits.flatten!.uniq!

puts digits.count(&:prime?)
