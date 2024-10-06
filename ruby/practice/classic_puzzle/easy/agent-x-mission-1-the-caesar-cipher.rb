# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

ciphertext = gets.chomp
word = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

MIN_ASCII_CODE = 32
MAX_ASCII_CODE = 126
ASCII_CODE_SIZE = MAX_ASCII_CODE - MIN_ASCII_CODE + 1

keys = ASCII_CODE_SIZE.times.filter do |i|
  encrypted_word = word.chars.map { |c| (((c.ord - MIN_ASCII_CODE + i) % ASCII_CODE_SIZE) + MIN_ASCII_CODE).chr }.join
  ciphertext.include? encrypted_word
end

decrypted_texts = keys.map do |key|
  ciphertext.chars.map { |c| (((c.ord - MIN_ASCII_CODE - key) % ASCII_CODE_SIZE) + MIN_ASCII_CODE).chr }.join
end

decrypted_text = decrypted_texts.find do |decrypted|
  decrypted.split(/[\s,.?;:!]/).include? word
end
key = keys[decrypted_texts.index decrypted_text]

results = [
  key,
  decrypted_text
]

# puts "key"
# puts "plaintext"
results.each do |result|
  puts result
end
