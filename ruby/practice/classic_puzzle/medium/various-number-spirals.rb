# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
vert_pos, hor_pos = gets.split
order, direction = gets.split

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class NumberSpiral
  def self.create(size, vert_pos, hor_pos, order, direction)
    number_spiral = create_fixed_number_spiral(size)

    # starting point
    %w[br tr tl bl].index("#{vert_pos}#{hor_pos}").times do
      number_spiral = counter_clock number_spiral
    end

    # direction
    number_spiral = reverse_direction number_spiral if direction == 'cc'

    # order
    number_spiral = reverse_order number_spiral if order == '+'

    number_spiral
  end

  # create spiral by below condition
  #
  # conditions:
  #
  #   size: #{size}
  #   vert_pos: b
  #   hor_pos: r
  #   order: -
  #   direction: c
  #
  # exapmles:
  #
  #   5 4 3
  #   6 1 2
  #   7 8 9
  #
  #   10  9  8  7
  #   11  2  1  6
  #   12  3  4  5
  #   13 14 15 16
  def self.create_fixed_number_spiral(size)
    top_rows = []
    bottom_rows = []

    1.step(by: 2, to: (size / 2 * 2 + 1)) do |i|
      top_row_right_value = i**2 + i + 2
      top_row_left_value = top_row_right_value + i - 1
      top_row = (top_row_right_value..top_row_left_value).to_a.reverse

      bottom_row_right_value = i**2
      bottom_row_left_value = bottom_row_right_value - i + 1
      bottom_row = (bottom_row_left_value..bottom_row_right_value).to_a

      (1..(((size / 2 * 2 + 1) - i) / 2)).each do |j|
        inner_square_last_value = (i + (j - 1) * 2)**2
        outer_square_last_value = (i + (j * 2))**2

        bottom_row_left_value = outer_square_last_value - i - j * 3 + 1
        bottom_row_right_value = inner_square_last_value + j

        top_row_left_value = bottom_row_left_value - i
        top_row_right_value = bottom_row_right_value + i

        top_row.push top_row_right_value
        top_row.unshift top_row_left_value

        bottom_row.push bottom_row_right_value
        bottom_row.unshift bottom_row_left_value
      end

      top_rows.unshift top_row
      bottom_rows.push bottom_row
    end

    # remove trash row
    top_rows.shift

    number_spiral = top_rows + bottom_rows

    if size.even?
      number_spiral.pop
      number_spiral.each(&:shift)
      2.times { number_spiral = counter_clock number_spiral }
    end

    number_spiral
  end
  private_class_method :create_fixed_number_spiral

  def self.counter_clock(number_spiral)
    number_spiral.transpose.reverse
  end
  private_class_method :counter_clock

  def self.reverse_order(number_spiral)
    spiral_size = number_spiral.size

    numbers = number_spiral.flatten
    sum_number = numbers.minmax.sum

    numbers.map! { |number| sum_number - number }

    numbers.each_slice(spiral_size).to_a
  end
  private_class_method :reverse_order

  def self.reverse_direction(number_spiral)
    numbers = number_spiral.flatten
    is_start_tl_or_br = [numbers.first, numbers.last].include? numbers.max

    is_start_tl_or_br ? number_spiral.transpose : number_spiral.reverse.transpose.reverse
  end
  private_class_method :reverse_direction
end

number_spiral = NumberSpiral.create(n, vert_pos, hor_pos, order, direction)

results = number_spiral.map { |row| row.join("\t") }

# puts "spiral"
results.each do |result|
  puts result
end
