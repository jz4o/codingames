# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@word = gets.chomp
@chars = gets.chomp

# hangman ascii
BEAM     = '+--+'.freeze
NO_HEAD  = '|'.freeze
HEAD     = '|  o'.freeze
NO_BODY  = '|'.freeze
BODY     = '|  |'.freeze
ONE_ARM  = '| /|'.freeze
BOTH_ARM = '| /|\\'.freeze
NO_LEG   = '|\\'.freeze
ONE_LEG  = '|\\/'.freeze
BOTH_LEG = '|\\/ \\'.freeze
HANGMAN_STATUS = [
  [BEAM, NO_HEAD, NO_BODY, NO_LEG],
  [BEAM, HEAD, NO_BODY, NO_LEG],
  [BEAM, HEAD, BODY, NO_LEG],
  [BEAM, HEAD, ONE_ARM, NO_LEG],
  [BEAM, HEAD, BOTH_ARM, NO_LEG],
  [BEAM, HEAD, BOTH_ARM, ONE_LEG],
  [BEAM, HEAD, BOTH_ARM, BOTH_LEG]
].freeze

# answer to guess
result = @word.chars.map do |char|
  @chars.include?(char.downcase) ? char : '_'
end.join

# counting errors of guess
lower_word = @word.downcase
errors = 0
@chars.split.each do |char|
  errors += 1 unless lower_word.delete! char
end

# answer
puts HANGMAN_STATUS[errors], result
