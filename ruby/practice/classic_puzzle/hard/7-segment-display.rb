# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
@c = gets.chomp
@s = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

SEGMENTS = [
  %i[t tl tr bl br b],
  %i[tr br],
  %i[t tr c bl b],
  %i[t tr c br b],
  %i[tl tr c br],
  %i[t tl c br b],
  %i[t tl c bl br b],
  %i[t tr br],
  %i[t tl tr c bl br b],
  %i[t tl tr c br b]
].freeze

def get_segment_char(num, pos)
  SEGMENTS[num].include?(pos) ? @c : ' '
end

answer = []
@n.digits.reverse_each do |digit|
  tl = get_segment_char(digit, :tl) * @s
  bl = get_segment_char(digit, :bl) * @s
  answer << " #{tl} #{bl} "

  t = get_segment_char digit, :t
  c = get_segment_char digit, :c
  b = get_segment_char digit, :b
  tcb = [t, c, b].join(' ' * @s)
  @s.times { answer << tcb }

  tr = get_segment_char(digit, :tr) * @s
  br = get_segment_char(digit, :br) * @s
  answer << " #{tr} #{br} "

  answer << ' ' * (@s * 2 + 3)
end
puts(answer.map(&:chars).transpose.map { |line| line.join.sub(/\s+$/, '') })
