# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

letter_case = gets.chomp
letter_fuzz = gets.to_i
number_fuzz = gets.to_i
other_fuzz = gets.chomp
template = gets.chomp
n = gets.to_i
candidates = []
n.times do
  candidate = gets.chomp
  candidates << candidate
end
# n.times do
#
#   # Write an answer using puts
#   # To debug: STDERR.puts "Debug messages..."
#
#   puts "true/false"
# end

template_elements = (letter_case == 'true' ? template : template.downcase).scan(/\d+|./)
results = candidates.map do |candidate|
  elements = (letter_case == 'true' ? candidate : candidate.downcase).scan(/\d+|./)
  next false unless template_elements.size == elements.size

  template_elements.zip(elements).all? do |template_element, element|
    case template_element
    when /[a-zA-Z]/
      /[a-zA-Z]/.match?(element) && (template_element.ord - element.ord).abs <= letter_fuzz
    when /\d+/
      /\d+/.match?(element) && (template_element.to_i - element.to_i).abs <= number_fuzz
    else
      !/\d+|[a-zA-Z]/.match?(element) && (other_fuzz == 'false' || template_element == element)
    end
  end
end

results.each do |result|
  puts result
end
