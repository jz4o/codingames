# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

mode = gets.chomp
n = gets.to_i
string_frets = []
n.times do
  string, fret = gets.split.map(&:to_i)
  string_frets << [string, fret]
end
# n.times do
#
#   # Write an answer using puts
#   # To debug: STDERR.puts "Debug messages..."
#
#   puts "string1/fret1 string2/fret2..."
# end

class Converter
  NOTE_PATTERN = %w[C C# D D# E F F# G G# A A# B].freeze

  Instrument = Struct.new :strings, :fret_size
  UKULELE = Instrument.new %w[A4 E4 C4 G4], 15
  GUITAR = Instrument.new %w[E4 B3 G3 D3 A2 E2], 21

  def self.convert(from, string_num, from_fret)
    from_instrument, to_instrument = from == 'guitar' ? [GUITAR, UKULELE] : [UKULELE, GUITAR]

    from_string = from_instrument[:strings][string_num]
    from_note_num = calc_note_num from_string, from_fret

    converted_notes = to_instrument[:strings].filter_map.with_index do |to_string, to_string_index|
      to_note_num = calc_note_num to_string, 0
      to_fret = from_note_num - to_note_num
      next unless (0..to_instrument[:fret_size]).cover? to_fret

      "#{to_string_index}/#{to_fret}"
    end

    converted_notes.any? ? converted_notes.join(' ') : 'no match'
  end

  def self.calc_note_num(string, fret)
    note_code, note_num = string.chars
    note_num = note_num.to_i

    note_num * NOTE_PATTERN.size + NOTE_PATTERN.index(note_code) + fret
  end
  private_class_method :calc_note_num
end

results = string_frets.map do |string, fret|
  Converter.convert(mode, string, fret)
end

results.each do |result|
  puts result
end
