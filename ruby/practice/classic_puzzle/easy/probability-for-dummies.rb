# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m = gets.to_i
n = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Probability
  ROULETTE_PATTERN = 38.0

  @probability_cache = {}

  def self.calc(m, n)
    return 1 if m == 1 && n == 1

    return 0 if m.zero?
    return 0 if n < m

    cache_key = "#{m},#{n}"
    return @probability_cache[cache_key] if @probability_cache.key? cache_key

    new_number_pattern_percent = calc(m - 1, n - 1) * ((ROULETTE_PATTERN - (m - 1)) / ROULETTE_PATTERN)
    exist_number_pattern_percent = calc(m, n - 1) * (m / ROULETTE_PATTERN)

    result = new_number_pattern_percent + exist_number_pattern_percent

    @probability_cache[cache_key] = result

    result
  end
end

float_result = (m..n).sum { |i| Probability.calc i, n }
result = "#{(float_result * 100).round}%"

# puts "probability"
puts result
