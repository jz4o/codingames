$stdout.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# n: the total number of nodes in the level, including the gateways
# l: the number of links
# e: the number of exit gateways
@n, @l, @e = gets.split.collect(&:to_i)
links = []
@l.times do
  # n1: N1 and N2 defines a link between these nodes
  links << gets.split.collect(&:to_i)
end
gateway_indices = []
@e.times do
  gateway_indices << gets.to_i # the index of a gateway node
end

# game loop
loop do
  sky_index = gets.to_i # The index of the node on which the Skynet agent is positioned this turn

  # Write an action using puts
  # To debug: STDERR.puts "Debug messages..."

  # Example: 0 1 are the indices of the nodes you wish to sever the link between
  emergency_link = nil
  proximity_link = nil
  gateway_indices.each do |gateway_index|
    emergency_link ||= links.find { |link| link.include?(gateway_index) && link.include?(sky_index) }
    proximity_link ||= links.find { |link| link.include?(gateway_index) }
  end
  target = emergency_link || proximity_link

  puts "#{target[0]} #{target[1]}"

  links.delete(target)
end
