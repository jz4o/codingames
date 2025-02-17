# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
ls = []
n.times do
  l = gets.chomp
  ls << l
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

folding_note = ls.map { |l| l.chars.zip }

methods = {
  rtl: lambda do |note|
    half_size = note.first.size / 2

    note.map do |note_row|
      front = note_row[...half_size]
      back = note_row[half_size..]

      back.reverse.zip(front).map { |b, f| b.reverse.concat(f).flatten }
    end
  end,
  btt: lambda do |note|
    methods[:rtl].call(note.transpose).transpose
  end,
  ltr: lambda do |note|
    methods[:rtl].call(note.map(&:reverse)).map(&:reverse)
  end,
  ttb: lambda do |note|
    methods[:btt].call(note.reverse).reverse
  end
}
method_names = %i[rtl btt ltr ttb]

((n**2).to_s(2).size - 1).times do |index|
  method_name = method_names[index % method_names.size]
  method = methods[method_name]

  folding_note = method.call folding_note
end

result = folding_note.flatten.join

# puts "decoded note"
puts result
