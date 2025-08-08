# Takuzu Solver (Easy mode)
# No row or column may contain a sequence of three or more repeating digits
# e.g. 1 1 0 is valid but 1 1 1 is invalid

n = gets.to_i
rows = []
n.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

replace_hash = {
  '.00' => '100',
  '0.0' => '010',
  '00.' => '001',
  '.11' => '011',
  '1.1' => '101',
  '11.' => '110'
}

while rows.join.include? '.'
  rows.map! do |row|
    replace_hash.each do |from, to|
      row.gsub! from, to
    end

    row
  end

  rows = rows.map(&:chars).transpose.map(&:join)
  rows.map! do |row|
    replace_hash.each do |from, to|
      row.gsub! from, to
    end

    row
  end
  rows = rows.map(&:chars).transpose.map(&:join)
end

results = rows

# puts "Completed board"
results.each do |result|
  puts result
end
