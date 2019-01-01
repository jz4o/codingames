STDOUT.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

land_xs = []
land_ys = []
@surface_n = gets.to_i # the number of points used to draw the surface of Mars.
@surface_n.times do
  # land_x: X coordinate of a surface point. (0 to 6999)
  # land_y: Y coordinate of a surface point.
  #         By linking all the points together in a sequential fashion, you form the surface of Mars.
  tmp = gets.split(' ').collect(&:to_i)

  land_xs << tmp[0]
  land_ys << tmp[1]
end

# game loop
loop do
  # h_speed: the horizontal speed (in m/s), can be negative.
  # v_speed: the vertical speed (in m/s), can be negative.
  # fuel: the quantity of remaining fuel in liters.
  # rotate: the rotation angle in degrees (-90 to 90).
  # power: the thrust power (0 to 4).
  _x, _y, _h_speed, v_speed, _fuel, _rotate, _power = gets.split(' ').collect(&:to_i)

  # Write an action using puts
  # To debug: STDERR.puts "Debug messages..."

  # 2 integers: rotate power. rotate is the desired rotation angle (should be 0 for level 1),
  #                           power is the desired thrust power (0 to 4).
  v_power = v_speed <= -40 ? 4 : 0
  puts "0 #{v_power}"
end
