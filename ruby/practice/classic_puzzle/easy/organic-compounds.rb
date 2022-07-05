# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
compounds = []
n.times do
  compound = gets.chomp
  compounds << compound
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Compound = Struct.new :can_union
Union = Struct.new :require_size

compound_grid = compounds.map do |compound_row|
  compound_row.scan(/.{3}/).map do |compound|
    if compound.match?(/CH\d/)
      inner_union = compound.scan(/\d/).first.to_i
      Compound.new 4 - inner_union
    else
      size = compound.scan(/\d/).first.to_i
      Union.new size
    end
  end
end
compound_grid.map! { |row| [Union.new(0), *row, Union.new(0)] }
compound_grid.unshift([Union.new(0)] * compound_grid.first.size)
compound_grid.push([Union.new(0)] * compound_grid.first.size)

compound_grid.each_with_index do |row, row_index|
  row.each_with_index do |compound, compound_index|
    next unless compound.is_a?(Compound)

    top_union = compound_grid[row_index.pred][compound_index]
    left_union = compound_grid[row_index][compound_index.pred]
    right_union = compound_grid[row_index][compound_index.next]
    bottom_union = compound_grid[row_index.next][compound_index]

    [top_union, left_union, right_union, bottom_union].each do |union|
      compound.can_union -= union.require_size if union.is_a?(Union)
    end
  end
end

compound_objects = compound_grid.flatten.filter { |compound| compound.is_a? Compound }
result = compound_objects.all? { |compound| compound.can_union.zero? } ? 'VALID' : 'INVALID'

# puts "answer"
puts result
