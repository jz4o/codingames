# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@begin = gets.chomp
@end = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "YY day[s], MM month[s], total NN days"

require 'date'

begin_date = Date.parse @begin
end_date = Date.parse @end

begin_months = begin_date.year * 12 + begin_date.month
end_months   = end_date.year   * 12 + end_date.month
year, month = (end_months - begin_months).divmod 12
month -= 1 if end_date.day < begin_date.day
days = (end_date - begin_date).to_i

formated_year = "#{year} year" unless year.zero?
formated_year << 's' if year > 1

formated_month = "#{month} month" unless month.zero?
formated_month << 's' if month > 1

formated_days = "total #{days} days"

puts [formated_year, formated_month, formated_days].compact.join(', ')
