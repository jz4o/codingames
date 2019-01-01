# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@s = gets.chomp

class String
  def encodable?
    encode && self != encode
  end

  def encode
    return unless size.even?

    result = ''
    chars.each_slice(2) do |count, value|
      result += value * count.to_i
    end
    decodable?(result) ? result : nil
  end

  def encode!
    replace encode
  end

  private

  def decodable?(encoded_str)
    result = ''
    until encoded_str.empty?
      char = encoded_str.chr
      group = encoded_str.match(/\A#{char}+/).to_s
      encoded_str = encoded_str.delete_prefix group
      result += [group.size, char].join
    end
    result == self
  end
end

loop do
  break unless @s.encodable?

  @s.encode!
end

puts @s
