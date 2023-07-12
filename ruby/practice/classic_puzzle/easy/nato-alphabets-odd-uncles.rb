# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a_word_spelled_out = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

YEAR_1908_ALPHABETS = %w[
  Authority Bills Capture Destroy Englishmen Fractious Galloping High Invariably Juggling Knights Loose
  Managing Never Owners Play Queen Remarks Support The Unless Vindictive When Xpeditiously Your Zigzag
].freeze
YEAR_1917_ALPHABETS = %w[
  Apples Butter Charlie Duff Edward Freddy George Harry Ink Johnnie King London
  Monkey Nuts Orange Pudding Queenie Robert Sugar Tommy Uncle Vinegar Willie Xerxes Yellow Zebra
].freeze
YEAR_1927_ALPHABETS = %w[
  Amsterdam Baltimore Casablanca Denmark Edison Florida Gallipoli Havana Italia Jerusalem Kilogramme Liverpool
  Madagascar New-York Oslo Paris Quebec Roma Santiago Tripoli Uppsala Valencia Washington Xanthippe Yokohama Zurich
].freeze
YEAR_1956_ALPHABETS = %w[
  Alfa Bravo Charlie Delta Echo Foxtrot Golf Hotel India Juliett Kilo Lima
  Mike November Oscar Papa Quebec Romeo Sierra Tango Uniform Victor Whiskey X-ray Yankee Zulu
].freeze
NATO_ALPHABETS = [YEAR_1908_ALPHABETS, YEAR_1917_ALPHABETS, YEAR_1927_ALPHABETS, YEAR_1956_ALPHABETS].transpose

ALPHABETS = ('A'..'Z').to_a

nato_indexes = a_word_spelled_out.split.map do |word|
  start_char_index = ALPHABETS.index word.chr
  target_nato_alphabets = NATO_ALPHABETS[start_char_index]

  target_nato_alphabets.filter_map.with_index { |nato_alphabet, index| index if nato_alphabet == word }
end

nato_index = nato_indexes.inject { |result, elm| result & elm }.first

result_chars = a_word_spelled_out.split.map do |word|
  start_char_index = ALPHABETS.index word.chr
  target_nato_alphabets = NATO_ALPHABETS[start_char_index]

  next_nato_index = nato_index.next % target_nato_alphabets.size

  target_nato_alphabets[next_nato_index]
end

result = result_chars.join ' '

# puts "answer"
puts result
