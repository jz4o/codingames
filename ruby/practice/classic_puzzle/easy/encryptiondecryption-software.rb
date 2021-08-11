# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

mode = gets.chomp # Either {{"encrypt"}} or {{"decrypt"}}
key = gets.chomp # has 26 words, 0 < [[Length of key]] < 500
message = gets.chomp # words, 0 < [[Length of message]] < 250

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def encrypt(message, key)
  alpha_to_key = ('A'..'Z').zip(key.split).to_h

  message.split.map { |word| word.chars.map { |char| alpha_to_key[char] }.join(' ') }.join('   ')
end

def decrypt(message, key)
  key_to_alpha = key.split.zip('A'..'Z').to_h

  message.split('   ').map { |word| word.split.map { |k| key_to_alpha[k] }.join }.join(' ')
end

result = mode == 'encrypt' ? encrypt(message, key) : decrypt(message, key)

# split letters by {{" "}} and words by {{"   "}} if mode = encrypt
# puts "encrypted/decrypted"
puts result
