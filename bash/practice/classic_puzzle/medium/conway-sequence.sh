# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r R
read -r L

# Write an action using echo
# To debug: echo "Debug messages..." >&2

result=($R)
for (( n=0; n<$(( $L - 1 )); n++ )); do
    temp=(${result[@]})
    result=()
    temp_index=0
    while [ $temp_index -lt ${#temp[@]} ]; do
        first_element="${temp[$temp_index]}"
        for (( i=$(($temp_index + 1)); i<${#temp[@]}; i++ )); do
            if [ "${temp[$i]}" != "$first_element" ]; then
                delete_size=$(( $i - $temp_index))
                break
            fi
        done
        delete_size=${delete_size:=$((${#temp[@]} - $temp_index))}

        result=("${result[@]}" "$delete_size" "$first_element")

        let temp_index+=$delete_size
        unset delete_size
    done
done

# echo "answer"
echo "${result[@]}"
