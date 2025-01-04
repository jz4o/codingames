# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

delta = gets.to_i
gene = gets.chomp
n = gets.to_i
chrs = []
n.times do
  chr = gets.chomp
  chrs << chr
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

gene_chars = gene.chars

matches = chrs.flat_map.with_index do |chr, chr_index|
  (chr.length - gene.length + delta + 1).times.filter_map do |start_index|
    chr_chars = chr[start_index, gene.length].chars
    diff_count = gene_chars.zip(chr_chars).count { |g, c| g != c }

    [chr_index, start_index, diff_count].join ' ' if diff_count <= delta
  end
end

result = matches.any? ? matches.first : 'NONE'

# puts "line index delta"
puts result
