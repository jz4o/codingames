# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
line_rows = []
n.times do
  line = gets.chomp
  line_rows << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

results = line_rows.map do |line_row|
  next line_row unless line_row.gsub(/".*?"|\./, '').split.include? 'Hagrid'

  line_row.sub(/(".*?")/) do
    line = $1

    converted_line_words = line.scan(/["()!?,.\s]|[^"()!?,.\s]+/).map do |word|
      next word if word.include?("'") || word.include?('-')

      convert_words = {
        you: 'yeh',
        to: 'ter',
        and: "an'",
        me: 'meh'
      }
      key = word.downcase.to_sym
      if convert_words.key? key
        case_methods = word.chars.map { |c| c == c.downcase ? :downcase : :upcase }

        converted_word = convert_words[key]
        converted_word.chars.map.with_index { |c, i| c.method(case_methods[i] || case_methods.last).call }.join
      elsif word.size >= 3
        word[0] = "'" if word[0].downcase == 'h'
        word[-1] = "'" if 'ftdg'.include? word[-1].downcase

        word
      else
        word
      end
    end

    converted_line_words.join
  end
end

# puts "Yeh mus\' find a way ter transform these lines"
results.each do |result|
  puts result
end
