# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, t = gets.split.map(&:to_i)
cs = []
t.times do
  inputs = gets.split
  n.times do |j|
    c = inputs[j].to_i
    cs << c
  end
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

odd_numbers = (1..(n * 2)).step(2).to_a
even_numbers = (2..(n * 2)).step(2).to_a

guess_hash = (1..(n * 2)).to_h do |i|
  numbers = i.odd? ? even_numbers : odd_numbers
  [i, numbers.clone]
end

cs.each_slice(n)
  .each do |coin_pair|
    coin_pair.combination(2).each do |a, b|
      guess_hash[a].delete b
      guess_hash[b].delete a
    end
  end

pending_keys = guess_hash.keys
while pending_keys.any?
  fix_pairs = guess_hash.filter { |_k, v| v.one? }
  fix_pairs.each do |k, v|
    guess_hash[v.first] = [k]
    (guess_hash.keys - v).each { |dk| guess_hash[dk].delete k }
    (guess_hash.keys - [k]).each { |dk| guess_hash[dk].delete v.first }
  end

  pending_keys -= fix_pairs.keys
end

result = odd_numbers.map { |i| guess_hash[i] }.join ' '

# puts "2 4 6..."
puts result
