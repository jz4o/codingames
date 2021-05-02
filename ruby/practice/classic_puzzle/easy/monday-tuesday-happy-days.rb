# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@leap_year = gets.to_i
@source_day_of_week, @source_month, @source_day_of_month = gets.split
@source_day_of_month = @source_day_of_month.to_i
@target_month, @target_day_of_month = gets.split
@target_day_of_month = @target_day_of_month.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "day of week"

require 'date'

DAY_OF_WEEK = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].freeze

# year is 0001 if leap is 0
# Date.parse('0000/01/01').leap? => true
#
# year is 0000 if leap is 1
# Date.parse('0001/01/01').leap? => false
year = format('%04d', -@leap_year + 1)

target_date = Date.parse [year, @target_month, @target_day_of_month].join(' ')
source_date = Date.parse [year, @source_month, @source_day_of_month].join(' ')

days = target_date - source_date
source_day_of_week_index = DAY_OF_WEEK.index @source_day_of_week
target_day_of_week_index = (days + source_day_of_week_index) % DAY_OF_WEEK.length

puts DAY_OF_WEEK[target_day_of_week_index]
