# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

mother = gets.chomp
child = gets.chomp
num_of_possible_fathers = gets.to_i
a_possible_fathers = []
num_of_possible_fathers.times do
  a_possible_father = gets.chomp
  a_possible_fathers << a_possible_father
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

mother_chrom_pairs = mother.split(':', 2).last.strip.split
child_chrom_pairs = child.split(':', 2).last.strip.split

father_chrom_parts = mother_chrom_pairs.zip(child_chrom_pairs).map do |mother_chrom_pair, child_chrom_pair|
  father_chrom_part = child_chrom_pair.delete mother_chrom_pair
  father_chrom_part.empty? ? child_chrom_pair : father_chrom_part
end

father = a_possible_fathers.find do |a_possible_father|
  a_possible_father_chrom_pairs = a_possible_father.split(':', 2).last.strip.split
  a_possible_father_chrom_pairs.zip(father_chrom_parts).all? do |a_possible_father_chrom_pair, father_chrom_part|
    if father_chrom_part.size == 1
      a_possible_father_chrom_pair.include? father_chrom_part
    else
      father_chrom_part.delete(a_possible_father_chrom_pair).size < 2
    end
  end
end
father_name = father.split(':', 2).first

result = "#{father_name}, you are the father!"

# puts "what Maury Povich might say"
puts result
