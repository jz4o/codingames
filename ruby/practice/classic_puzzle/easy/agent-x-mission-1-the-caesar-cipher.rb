# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

ciphertext = gets.chomp
word = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

MIN_ASCII_CODE = 32
MAX_ASCII_CODE = 126
ASCII_CODE_SIZE = MAX_ASCII_CODE - MIN_ASCII_CODE + 1

DecryptResult = Struct.new :key, :message

decrypt_result = ASCII_CODE_SIZE.times.filter_map do |key|
  decrypted_text = ciphertext.chars.map do |c|
    (((c.ord - MIN_ASCII_CODE - key) % ASCII_CODE_SIZE) + MIN_ASCII_CODE).chr
  end.join
  next unless decrypted_text.split(/[\s,.?;:!]/).include? word

  DecryptResult.new key, decrypted_text
end.first

results = [
  decrypt_result.key,
  decrypt_result.message
]

# puts "key"
# puts "plaintext"
results.each do |result|
  puts result
end
