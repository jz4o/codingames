# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

expression = gets.chomp # the expression to calculate

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class MetricUnit
  attr_reader :value, :unit

  DIGIT_PRECISION = 5

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def convert_to_small_unit!
    convert_hash = {
      'km' => {
        small_unit: 'm',
        rate: 1000
      },
      'm' => {
        small_unit: 'dm',
        rate: 10
      },
      'dm' => {
        small_unit: 'cm',
        rate: 10
      },
      'cm' => {
        small_unit: 'mm',
        rate: 10
      },
      'mm' => {
        small_unit: 'um',
        rate: 1000
      }
    }

    @value = (@value * convert_hash[@unit][:rate]).round(DIGIT_PRECISION)
    @unit = convert_hash[@unit][:small_unit]
  end
end

units = %w[um mm cm dm m km]

left_value, left_unit, right_value, right_unit = expression.scan(/^([\d.]+)([a-z]+)\s\+\s([\d.]+)([a-z]+)/).flatten
left_value = left_value.to_f
right_value = right_value.to_f

left_metric = MetricUnit.new left_value, left_unit
right_metric = MetricUnit.new right_value, right_unit

big_unit_metric = units.index(left_metric.unit) < units.index(right_metric.unit) ? right_metric : left_metric
big_unit_metric.convert_to_small_unit! until left_metric.unit == right_metric.unit

result_value = (left_metric.value + right_metric.value).to_s.sub(/\.0+$/, '')

result = [result_value, left_metric.unit].join

# puts "1cm"
puts result
