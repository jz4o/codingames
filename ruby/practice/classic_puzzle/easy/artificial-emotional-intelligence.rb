# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

name = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

AD_LIST = %w[
  Adaptable
  Adventurous
  Affectionate
  Courageous
  Creative
  Dependable
  Determined
  Diplomatic
  Giving
  Gregarious
  Hardworking
  Helpful
  Hilarious
  Honest
  Non-judgmental
  Observant
  Passionate
  Sensible
  Sensitive
  Sincere
].map(&:downcase)
GOOD_LIST = ['Love', 'Forgiveness', 'Friendship', 'Inspiration', 'Epic Transformations', 'Wins'].map(&:downcase)
BAD_LIST = ['Crime', 'Disappointment', 'Disasters', 'Illness', 'Injury', 'Investment Loss'].map(&:downcase)

VOWELS = 'aeiouy'.chars
CONSONANTS = 'bcdfghjklmnpqrstvwxz'.chars

lower_name = name.delete('^a-zA-Z').downcase

first_consonant, second_consonant, third_consonant = lower_name.chars & CONSONANTS
good_vowel, bad_vowel = lower_name.chars.filter { |char| VOWELS.include? char }

results =
  if [first_consonant, second_consonant, third_consonant, good_vowel, bad_vowel].all?
    first_ad = AD_LIST[CONSONANTS.index first_consonant]
    second_ad = AD_LIST[CONSONANTS.index second_consonant]
    third_ad = AD_LIST[CONSONANTS.index third_consonant]
    good = GOOD_LIST[VOWELS.index good_vowel]
    bad = BAD_LIST[VOWELS.index bad_vowel]

    [
      "It's so nice to meet you, my dear #{first_ad} #{name}.",
      "I sense you are both #{second_ad} and #{third_ad}.",
      "May our future together have much more #{good} than #{bad}."
    ]
  else
    ["Hello #{name}."]
  end

# puts "Hello Lisa."
results.each do |result|
  puts result
end
