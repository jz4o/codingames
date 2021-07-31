# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r n
numbers=()
for (( i=0; i<$n; i++ )); do
    read -r x

    numbers=("${numbers[@]}" $x)
done

# Write an answer using echo
# To debug: echo "Debug messages..." >&2

how_to_read() {
    number=$1

    if [ "${number:0:1}" = '-' ]; then
        echo "negative $(how_to_read ${number:1})"
        exit
    fi

    if [ ${#number} -ge 4 ]; then
        over_thousand_unit_names=('' 'thousand' 'million' 'billion' 'trillion' 'quadrillion' 'quintillion')

        number_size=${#number}
        unit_number_size=$(( $number_size % 3 ))
        if [ $unit_number_size -eq 0 ]; then
            unit_number_size=3
        fi
        mod_number_size=$(( $number_size - $unit_number_size ))

        unit_number=${number:0:$unit_number_size}
        mod_number=${number:unit_number_size}

        result=''
        result="$result$(how_to_read $unit_number) ${over_thousand_unit_names[$(( $mod_number_size / 3 ))]}"
        if [[ ! $mod_number =~ ^0+$ ]]; then
            result="$result $(how_to_read $mod_number)"
        fi

        echo "$result"
        exit
    fi

    result=''
    number=`echo "$number" | sed s/^0*//`
    if [ "$number" = '' ]; then
        number='0'
    fi
    if [ $number -ge 100 ]; then
        hundred_unit=$(( $number / 100 ))
        mod_unit=$(( $number % 100 ))

        if [ $hundred_unit -gt 0 ]; then
            result="$result$(how_to_read $hundred_unit) hundred"
        fi
        if [ $mod_unit -gt 0 ]; then
            result="$result $(how_to_read $mod_unit)"
        fi
    elif [ $number -ge 20 ]; then
        ten_unit_names=('' '' 'twenty' 'thirty' 'forty' 'fifty' 'sixty' 'seventy' 'eighty' 'ninety')
        ten_unit=$(( $number / 10 ))
        mod_unit=$(( $number % 10 ))

        if [ $ten_unit -gt 0 ]; then
            result="$result${ten_unit_names[$ten_unit]}"
        fi
        if [ $mod_unit -gt 0 ]; then
            result="$result-$(how_to_read $mod_unit)"
        fi
    else
        under_twenty_names=(
            'zero' 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine' 'ten'
            'eleven' 'twelve' 'thirteen' 'fourteen' 'fifteen' 'sixteen' 'seventeen' 'eighteen' 'nineteen'
        )

        result="${under_twenty_names[$number]}"
    fi

    echo "$result"
}

results=()
for number in ${numbers[@]}; do
    results=("${results[@]}" "$(how_to_read $number)")
done

# echo "cardinal"
for result in "${results[@]}"; do
    echo "$result"
done
