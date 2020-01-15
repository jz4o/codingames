# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
read -r B

# Write an action using echo
# To debug: echo "Debug messages..." >&2

longest_space_count=0
left_index_in_longest_space=0
right_index_in_longest_space=0
for (( i=0; i<=${#B}; i++ )); do
    if [ "${B:$i:1}" = 'U' ]; then
        if [ "$space_count" = '' ]; then
            space_count=0
            left_index_in_space=$i
        fi

        let space_count++
        right_index_in_space=$i
    else
        if [ ${space_count:-0} -gt $longest_space_count ]; then
            longest_space_count=$space_count
            left_index_in_longest_space=$left_index_in_space
            right_index_in_longest_space=$right_index_in_space
        fi

        unset space_count left_index_in_space right_index_in_space
    fi
done

# echo "0"
if [ $left_index_in_longest_space -eq 0 ]; then
    echo "$left_index_in_longest_space"
elif [ $right_index_in_longest_space -eq $(( ${#B} - 1 )) ]; then
    echo "$right_index_in_longest_space"
else
    echo $(( $left_index_in_longest_space + ( $longest_space_count / 2 ) ))
fi
