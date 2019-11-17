# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r alignment
read -r N
texts=()
for (( i=0; i<$N; i++ )); do
    read -r text
    texts=("${texts[@]}" "$text")
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

max_width=0
for text in "${texts[@]}"; do
    length=${#text}
    if [ $length -gt $max_width ]; then
        max_width=$length
    fi
done

results=()
case "$alignment" in
    "LEFT" )
        for text in "${texts[@]}"; do
            results=("${results[@]}" "$text")
        done
        ;;
    "RIGHT" )
        for text in "${texts[@]}"; do
            results=("${results[@]}" "`printf %${max_width}s "$text"`")
        done
        ;;
    "CENTER" )
        for text in "${texts[@]}"; do
            results=("${results[@]}" "`printf %$(( (${max_width} - ${#text}) / 2 ))s`$text")
        done
        ;;
    "JUSTIFY" )
        for text in "${texts[@]}"; do
            if [ ${#text} -eq $max_width ]; then
                results=("${results[@]}" "$text")
                continue
            fi

            words=($text)
            text="${text// /}"

            space_size=$(( $max_width - ${#text} ))
            each_space_size=$(( $space_size / (${#words[@]} - 1) ))
            space_sizes=()
            for (( i=1; i<${#words[@]}; i++ )); do
                space_sizes=( "${space_sizes[@]}" $(( ($each_space_size * $i) - ($each_space_size * ($i - 1)) )) )
            done

            result=""
            for (( i=0; i<${#words[@]}; i++ )); do
                result="${result}${words[$i]}"
                if [ ! -v "${space_sizes[$i]}" ]; then
                    result="${result}`printf %${space_sizes[$i]}s`"
                fi
            done

            results=("${results[@]}" "$result")
        done
        ;;
esac

# echo "answer"
for result in "${results[@]}"; do
    echo "$result"
done
