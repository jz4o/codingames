# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

t = gets.to_i
ns = []
t.times do
  n = gets.to_i
  ns << n
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Calculator
  @cache = {}

  def self.calc_partition_number(sum_number, max_number)
    return 1 if sum_number <= 1
    return 1 if max_number <= 1
    return calc_partition_number(sum_number, sum_number) if sum_number < max_number
    return @cache["#{sum_number}:#{max_number}"] if @cache["#{sum_number}:#{max_number}"]

    result = 1 + (2..max_number).sum do |number|
      (1..(sum_number / number)).sum { |n| calc_partition_number(sum_number - (number * n), number - 1) }
    end

    @cache["#{sum_number}:#{max_number}"] = result

    result
  end
end

results = ns.map do |n|
  Calculator.calc_partition_number n, n
end

# puts "partitions"
results.each do |result|
  puts result
end
