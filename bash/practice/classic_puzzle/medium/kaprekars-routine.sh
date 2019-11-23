# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r n1

# Write an action using echo
# To debug: echo "Debug messages..." >&2

digits_size=${#n1}
answers=()

while [[ ! " ${answers[@]} " =~ " $n1 " ]]; do
    answers=("${answers[@]}" "$n1")

    temp=`echo "$n1" | grep -o . | sort -n | tr -d '\n'`
    reverse_sort_n1=`echo "$temp" | rev | sed -e s/^0*//`
    sort_n1=`echo "$temp" | sed -e s/^0*//`
    if [ -z "$reverse_sort_n1" ]; then reverse_sort_n1=0; fi
    if [ -z "$sort_n1" ]; then sort_n1=0; fi

    answer=$(( $reverse_sort_n1 - $sort_n1 ))

    n1=`printf "%0${digits_size}d" "$answer"`
done

# echo "1 2 3 4"
echo `echo "${answers[@]}" | grep -Eo "${n1}\s?.*"`
