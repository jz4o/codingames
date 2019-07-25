# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
inputs = gets.split
labels = []
(0..(@n - 1)).each do |i|
  label = inputs[i]
  labels.push label
end

class String
  ALPHAS = ('A'..'Z').to_a.freeze

  def to_alpha_label
    result = ''
    int = to_i
    while int > 0 do
      i = int % ALPHAS.size
      if i == 0
        i = ALPHAS.size
        int -= 1
      end

      int = int > ALPHAS.size ? int / ALPHAS.size : 0
      result = ALPHAS[i - 1] + result
    end
    result
  end

  def to_int_label
    result = 0
    chars.reverse.each_with_index do |i, index|
      result += (ALPHAS.size**index) * (ALPHAS.index(i) + 1)
    end
    result
  end
end

results = []
labels.each do |label|
  results.push label.to_i.zero? ? label.to_int_label : label.to_alpha_label
end

puts results.join(' ')
