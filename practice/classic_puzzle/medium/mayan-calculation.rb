# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@ascii_mayans = []
@l, @h = gets.split(" ").collect {|x| x.to_i}
@h.times do |i|
  @ascii_mayans << gets.chomp.scan(/.{#{@l}}/)
end
@ascii_mayans = @ascii_mayans.transpose

mayans_1 = []
@s1 = gets.to_i
@s1.times do
  mayans_1 << gets.chomp
end

mayans_2 = []
@s2 = gets.to_i
@s2.times do
  mayans_2 << gets.chomp
end
@operation = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

def mayans_to_num(mayans)
  mayan_indexes = []
  mayans.each_slice(@h) do |mayan|
    mayan_indexes.unshift @ascii_mayans.index(mayan)
  end

  num = 0
  mayan_indexes.each_with_index do |mayan_index, index|
    radix = @ascii_mayans.length ** index
    num += radix * mayan_index
  end

  num
end

num1 = mayans_to_num mayans_1
num2 = mayans_to_num mayans_2

result = instance_eval "#{num1} #{@operation} #{num2}"
result.to_s(@ascii_mayans.length).each_char do |char|
  puts @ascii_mayans[char.to_i(@ascii_mayans.length)]
end
