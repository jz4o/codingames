# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
input_rows = []
n.times do
  a, x_a, y_a, b, x_b, y_b, c, x_c, y_c, d, x_d, y_d = gets.split
  x_a = x_a.to_i
  y_a = y_a.to_i
  x_b = x_b.to_i
  y_b = y_b.to_i
  x_c = x_c.to_i
  y_c = y_c.to_i
  x_d = x_d.to_i
  y_d = y_d.to_i

  input_rows << [a, x_a, y_a, b, x_b, y_b, c, x_c, y_c, d, x_d, y_d]
end
# n.times do
#
#   # Write an answer using puts
#   # To debug: STDERR.puts "Debug messages..."
#
#   puts "answer"
# end

Vertex = Struct.new :name, :x, :y
Line = Struct.new :inclination, :len

class Quadrilateral
  def self.type_text(vertex_info)
    a, x_a, y_a, b, x_b, y_b, c, x_c, y_c, d, x_d, y_d = vertex_info

    vertexes = [
      Vertex.new(a, x_a, y_a),
      Vertex.new(b, x_b, y_b),
      Vertex.new(c, x_c, y_c),
      Vertex.new(d, x_d, y_d)
    ]
    quadrilateral_type = type vertexes

    "#{[a, b, c, d].join} is a #{quadrilateral_type}."
  end

  def self.type(vertexes)
    vertex_pairs = [*vertexes, vertexes.first].each_cons(2).to_a

    lines = vertex_pairs.map do |a, b|
      left, right = a.x < b.x ? [a, b] : [b, a]
      y_diff = right.y - left.y
      x_diff = right.x - left.x

      inclination = x_diff.zero? ? Float::INFINITY : Rational(y_diff, x_diff)
      length = Math.sqrt(y_diff**2 + x_diff**2)

      Line.new inclination, length
    end

    is_parallelogram = lines.map(&:inclination).uniq.size == 2
    is_rhombus = lines.map(&:len).uniq.size == 1
    is_rectangle = rectangle? lines
    is_square = is_rhombus && is_rectangle

    return 'square' if is_square
    return 'rectangle' if is_rectangle
    return 'rhombus' if is_rhombus
    return 'parallelogram' if is_parallelogram

    'quadrilateral'
  end
  private_class_method :type

  def self.rectangle?(lines)
    uniq_inclinations = lines.map(&:inclination).uniq

    return false if uniq_inclinations.size != 2

    a, b = uniq_inclinations
    return [a, b].include? 0 if [a, b].include? Float::INFINITY

    a == -1 / b
  end
  private_class_method :rectangle?
end

results = input_rows.map do |input_row|
  Quadrilateral.type_text input_row
end

results.each do |result|
  puts result
end
