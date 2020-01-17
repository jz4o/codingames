# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r BEGIN
read -r END

# Write an action using echo
# To debug: echo "Debug messages..." >&2

begin_date_elements=(${BEGIN//./ })
declare -A begin_date=()
begin_date['year']=${begin_date_elements[2]}
begin_date['month']=`expr ${begin_date_elements[1]} + 0`
begin_date['day']=`expr ${begin_date_elements[0]} + 0`

end_date_elements=(${END//./ })
declare -A end_date=()
end_date['year']=${end_date_elements[2]}
end_date['month']=`expr ${end_date_elements[1]} + 0`
end_date['day']=`expr ${end_date_elements[0]} + 0`

begin_months=$(( ${begin_date['year']} * 12 + ${begin_date['month']} ))
end_months=$(( ${end_date['year']} * 12 + ${end_date['month']} ))
year=$(( ($end_months - $begin_months) / 12 ))
month=$(( ($end_months - $begin_months) % 12 ))
if [ ${end_date['day']} -lt ${begin_date['day']} ]; then
    let month--
fi
begin_date_str="${begin_date['year']}/${begin_date['month']}/${begin_date['day']}"
end_date_str="${end_date['year']}/${end_date['month']}/${end_date['day']}"
days=$(( (`date --date "$end_date_str" +%s` - `date --date "$begin_date_str" +%s` ) / 60 / 60 / 24 ))

if [ $year -gt 0 ]; then
    formatted_year="$year year"
    if [ $year -gt 1 ]; then
        formatted_year="${formatted_year}s"
    fi
fi

if [ $month -gt 0 ]; then
    formatted_month="$month month"
    if [ $month -gt 1 ]; then
        formatted_month="${formatted_month}s"
    fi
fi

formatted_days="total $days days"

# echo "YY year[s], MM month[s], total NN days"
result="$formatted_days"
if [ ! "$formatted_month" = "" ]; then result="${formatted_month}, $result"; fi
if [ ! "$formatted_year" = "" ];  then result="${formatted_year}, $result";  fi
echo "$result"
