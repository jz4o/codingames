# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

TARGET_SCORE    = 50
POSSIBLE_ROUNDS = 4

result   = 0
patterns = {
  n.to_s => {
    numbers: [n],
    count: 1,
    score: n
  }
}

while patterns.any? do
  _pattern_numbers, pattern = patterns.shift

  # between 2 and 12 is 2 patterns for PN and N
  [1, *((2..12).to_a * 2)].each do |i|
    new_numbers = (pattern[:numbers] + [i]).sort.join(' ')
    if patterns.key? new_numbers
      patterns[new_numbers][:count] += pattern[:count]
    else
      patterns[new_numbers] = {
        numbers: pattern[:numbers] + [i],
        count: pattern[:count],
        score: pattern[:score] + i
      }
    end
  end

  # delete pattern for over score or over rounds
  patterns.delete_if { |_k, v| v[:score] > TARGET_SCORE || v[:numbers].size > POSSIBLE_ROUNDS + 1 }

  # add possible pattern to result
  possibilities = patterns.find_all { |_k, v| v[:score] == TARGET_SCORE }
  possibilities.each do |k, v|
    result += v[:count]
    patterns.delete k
  end
end

# puts "answer"
puts result
