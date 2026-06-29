# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

score = gets.to_i
darts = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

SINGLE_SEGMENTS = [*1..20, 25].freeze
DOUBLE_SEGMENTS = [*1..20, 25].freeze
TREBLE_SEGMENTS = [*1..20].freeze
MAX_SEGMENT_SINGLE = SINGLE_SEGMENTS.max
MAX_SEGMENT_DOUBLE = DOUBLE_SEGMENTS.max
MAX_SEGMENT_TREBLE = TREBLE_SEGMENTS.max

class Route
  attr_reader :score, :throws

  def initialize(score = 0, throws = [])
    @score = score
    @throws = throws
  end

  def add_throw(throw_text)
    @score +=
      if throw_text.include? 'D'
        throw_text[1..].to_i * 2
      elsif throw_text.include? 'T'
        throw_text[1..].to_i * 3
      else
        throw_text.to_i
      end

    @throws << throw_text
  end
end

routes_to_checks = ((1..[score / 2, MAX_SEGMENT_DOUBLE].min).to_a & DOUBLE_SEGMENTS).map do |double_segment|
  Route.new double_segment * 2, ["D#{double_segment}"]
end

checkout_routes = []
while route = routes_to_checks.pop
  checkout_routes << route and next if route.score == score && route.throws.count <= darts
  next if route.score >= score
  next if route.throws.count >= darts

  amount_score = score - route.score

  ((1..[amount_score, MAX_SEGMENT_SINGLE].min).to_a & SINGLE_SEGMENTS).each do |single_segment|
    new_route = Route.new route.score, [*route.throws]
    new_route.add_throw single_segment.to_s

    routes_to_checks << new_route
  end

  ((1..[amount_score / 2, MAX_SEGMENT_DOUBLE].min).to_a & DOUBLE_SEGMENTS).each do |double_segment|
    new_route = Route.new route.score, [*route.throws]
    new_route.add_throw "D#{double_segment}"

    routes_to_checks << new_route
  end

  ((1..[amount_score / 3, MAX_SEGMENT_TREBLE].min).to_a & TREBLE_SEGMENTS).each do |treble_segment|
    new_route = Route.new route.score, [*route.throws]
    new_route.add_throw "T#{treble_segment}"

    routes_to_checks << new_route
  end
end

result = checkout_routes.map(&:throws).uniq.count.to_s

# puts "answer"
puts result
