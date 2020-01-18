# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r leapYear
read -r sourceDayOfWeek sourceMonth sourceDayOfMonth
read -r targetMonth targetDayOfMonth

# Write an action using echo
# To debug: echo "Debug messages..." >&2

declare -r DAY_OF_WEEK=("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")

# year is 0001 if leap is 0 (0001 year is not leap year)
# year is 0000 if leap is 1 (0000 year is leap year)
year=`printf '%04d' $(( $leapYear * -1 + 1 ))`

target_date_str="$targetMonth $targetDayOfMonth $year"
source_date_str="$sourceMonth $sourceDayOfMonth $year"
diff_days=$(( (`date --date "$target_date_str" +%s` - `date --date "$source_date_str" +%s`) / 60 / 60 / 24 ))

source_day_of_week_index=`echo "${DAY_OF_WEEK[@]}" | grep -o -E ".*${sourceDayOfWeek}" | grep -o ' ' | wc -l`
target_day_of_week_index=$(( ($diff_days + $source_day_of_week_index) % ${#DAY_OF_WEEK[@]} ))

# echo "day of week"
echo "${DAY_OF_WEEK[$target_day_of_week_index]}"
