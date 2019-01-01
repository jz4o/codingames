STDOUT.sync = true # DO NOT REMOVE
# Don't let the machines win. You are humanity's last hope...

lines = []

@width = gets.to_i  # the number of cells on the X axis
@height = gets.to_i # the number of cells on the Y axis
@height.times do
  lines << gets.chomp # width characters, each either 0 or .
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

@height.times do |h|
  @width.times do |w|
    next if lines[h][w].eql?('.')

    res = "#{w} #{h} "

    ((w + 1)..@width).each do |r|
      right = lines[h] && lines[h][r]
      if right.nil?
        res << '-1 -1 '
        break
      elsif right.eql? '0'
        res << "#{r} #{h} "
        break
      else
        next
      end
    end

    ((h + 1)..@height).each do |b|
      below = lines[b] && lines[b][w]
      if below.nil?
        res << '-1 -1'
        break
      elsif below.eql? '0'
        res << "#{w} #{b}"
        break
      else
        next
      end
    end

    puts res
  end
end

# Three coordinates: a node, its right neighbor, its bottom neighbor
