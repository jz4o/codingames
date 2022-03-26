# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

parent1, parent2 = gets.split
ratio = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

parent1_elements = parent1[..1].chars.product(parent1[2..].chars)
parent2_elements = parent2[..1].chars.product(parent2[2..].chars)

child = parent1_elements.product(parent2_elements).map { |combination| combination.flatten.sort.join }

child_counts = child.group_by(&:to_s).transform_values!(&:count)
child_counts.default = 0

ratios = ratio.split(':').map { |r| child_counts[r.chars.sort.join] }

gcd = ratios.inject(&:gcd)

result = ratios.map! { |r| r / gcd }.join(':')

# puts "Genotypic Ratio"
puts result
