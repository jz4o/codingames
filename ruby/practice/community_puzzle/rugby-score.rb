# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."
combinations = []

TRY_POINT = 5
TRANSFORM_POINT = 2
PENA_DROP_POINT = 3

possible_try_times = @n / TRY_POINT
possible_try_times.downto(0).each do |try_times|
  try_points = TRY_POINT * try_times

  possible_transformation_times = [(@n - try_points) / TRANSFORM_POINT, try_times].min
  possible_transformation_times.downto(0).each do |transformation_times|
    transform_points = TRANSFORM_POINT * transformation_times

    remining_points = @n - try_points - transform_points
    if remining_points % PENA_DROP_POINT == 0
      penaltie_or_drop_times = remining_points / PENA_DROP_POINT
      combinations.unshift "#{try_times} #{transformation_times} #{penaltie_or_drop_times}"
    end
  end
end

puts combinations
