# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
@position, *commands = gets.chomp.split(';')
@position = @position.to_i
@commands = commands.flat_map do |command|
  time = command[0..-2]
  comm = command[-1]
  (comm * time.to_i).chars
end

@n.times do |_n|
  count, pattern = gets.chomp.split(';')
  count.to_i.times do
    case @commands.shift
    when 'L' then @position -= 1
    when 'R' then @position += 1
    end

    output_pattern = pattern.dup
    output_pattern[@position - 1] = '#'
    puts output_pattern
  end
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"
