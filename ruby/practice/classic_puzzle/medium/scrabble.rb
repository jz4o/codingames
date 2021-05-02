# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

POINTS = {
  'e' => 1,
  'a' => 1,
  'i' => 1,
  'o' => 1,
  'n' => 1,
  'r' => 1,
  't' => 1,
  'l' => 1,
  's' => 1,
  'u' => 1,
  'd' => 2,
  'g' => 2,
  'b' => 3,
  'c' => 3,
  'm' => 3,
  'p' => 3,
  'f' => 4,
  'h' => 4,
  'v' => 4,
  'w' => 4,
  'y' => 4,
  'k' => 5,
  'j' => 8,
  'x' => 8,
  'q' => 10,
  'z' => 10
}.freeze

@n = gets.to_i
words = []
@n.times do
  words << gets.chomp
end
@letters = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."
best_word = ''
max_point = 0
words.each do |word|
  made_flg = true
  point = 0
  can_chars = String.new(@letters)

  word.chars.each do |w|
    unless can_chars.slice! w
      made_flg = false
      point = 0
      break
    end
    point += POINTS[w]
  end

  if made_flg && max_point < point
    best_word = word
    max_point = point
  end
end

puts best_word
