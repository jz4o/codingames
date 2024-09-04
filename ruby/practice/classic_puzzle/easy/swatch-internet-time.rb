# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rawtime = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

require 'bigdecimal'

hh, mm, ss, utc_sign, utc_hh, utc_mm = rawtime.scan(/(\d{2}):(\d{2}):(\d{2})\sUTC([+-])(\d{2}):(\d{2})/).flatten

raw_seconds = hh.to_i * 3600 + mm.to_i * 60 + ss.to_i

utc_minutes = (utc_hh.to_i * 60 + utc_mm.to_i) * (utc_sign == '+' ? 1 : -1)
biel_diff_seconds = (60 - utc_minutes) * 60
biel_seconds = (raw_seconds + biel_diff_seconds) % (60 * 60 * 24)

beats = BigDecimal(biel_seconds) / BigDecimal('86.4')

result = format('@%.02f', beats.round(2))

# puts "answer"
puts result
