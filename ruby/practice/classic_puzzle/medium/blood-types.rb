# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
families = []
n.times do
  parent1, parent2, child = gets.split

  families << { parent1:, parent2:, child: }
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Blood
  attr_accessor :type, :rh

  def initialize(blood_string)
    self.type = blood_string[..-2]
    self.rh = blood_string[-1]
  end

  def type_elements
    type.length == 1 ? "#{type * 2}O".chars : type.chars
  end

  def common_format
    "#{type}#{rh}"
  end

  def self.common_format_type(type)
    type = type.chars.uniq.sort.join
    type[-1] == 'O' ? type[0] : type
  end
end

def predict_parent_blood_types(parent_blood, child_blood)
  candidate_rhs = (parent_blood.rh == '-' && child_blood.rh == '+' ? ['+'] : ['+', '-'])

  parent_type_elements = parent_blood.type_elements
  child_type_elements = child_blood.type_elements

  other_parent_blood_elements = parent_type_elements.filter_map do |blood_element|
    child_type_elements.join.sub(blood_element, '').chars if child_type_elements.include? blood_element
  end
  other_parent_blood_elements = other_parent_blood_elements.flatten.uniq

  blood_types = %w[AO BO OO AB]
  candidate_blood_types = other_parent_blood_elements.flat_map do |blood_element|
    blood_types.filter { |temp_blood_type| temp_blood_type.include? blood_element }
  end
  candidate_blood_types.map! { |blood_type| Blood.common_format_type blood_type }
  candidate_blood_types.uniq!

  candidate_blood_types.product(candidate_rhs).map(&:join).sort
end

def predict_child_blood_types(parent1_blood, parent2_blood)
  candidate_rhs = [parent1_blood.rh, parent2_blood.rh].all?('-') ? ['-'] : ['+', '-']

  candidate_types = parent1_blood.type_elements.product(parent2_blood.type_elements).map(&:join)
  candidate_types.map! { |type| Blood.common_format_type type }
  candidate_types.uniq!

  candidate_type_rhs = candidate_types.product(candidate_rhs).map(&:join)

  candidate_bloods = candidate_type_rhs.map { |type_rhs| Blood.new type_rhs }
  candidate_bloods.sort_by!(&:type)

  candidate_bloods.map(&:common_format)
end

results = []
families.each do |family|
  parent1 = family[:parent1]
  parent2 = family[:parent2]
  child = family[:child]

  parent1 = parent1 == '?' ? nil : Blood.new(parent1)
  parent2 = parent2 == '?' ? nil : Blood.new(parent2)
  child = child == '?' ? nil : Blood.new(child)

  predicted_blood_types =
    if child.nil?
      predict_child_blood_types(parent1, parent2)
    else
      predict_parent_blood_types([parent1, parent2].compact.first, child)
    end

  results << (predicted_blood_types.empty? ? 'impossible' : predicted_blood_types.join(' '))
end

# puts "answer"
results.each do |result|
  puts result
end
