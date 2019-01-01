# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@message = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# 与えられた数値を7bitの2進数(String)に変換
binary = ''
@message.split('').each do |s|
  binary << s.ord.to_s(2).rjust(7, '0')
end

# 同じ文字をグルーピングして配列化
matched_array = []
until binary.empty? do
  # binary の先頭から、同じ文字が連続する部分を取得
  matched = binary.match(/#{binary[0]}+/)[0]

  matched_array << matched

  binary.sub!(matched, '')
end

res = ''
matched_array.each do |m|
  res << '0' * (2 - m[0].to_i)
  res << ' '
  res << m.tr('1', '0')
  res << ' '
end

puts res.chop
