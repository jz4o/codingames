# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r size
read -r angle
map=""
for (( i=0; i<$size; i++ )); do
    read -r line
    map="$map${line// /}"
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

diagonal_size=$(( $size * 2 - 1 ))
rotate_count=$(( (($angle - 45) % 360) / 90 ))
reverse_flag=0
if [ $rotate_count -gt 1 ]; then
    reverse_flag=1
fi

results=()
for (( diagonal_row=1; diagonal_row<=$diagonal_size; diagonal_row++ )); do
    case $(( $rotate_count % 2 )) in
        0 )
            w=$(( $size - $diagonal_row ))
            h=$(( $w * -1 ))
            ;;
        1 )
            w=$(( $diagonal_size - $diagonal_row ))
            h=$(( $size - $diagonal_row ))
            ;;
    esac
    if [ $w -lt 0 ]; then w=0; elif [ $w -ge $size ]; then w=$(( $size - 1 )); fi
    if [ $h -lt 0 ]; then h=0; elif [ $h -ge $size ]; then h=$(( $size - 1 )); fi

    diagonal_line=()
    while [ $h -ge 0 ] && [ $h -lt $size ] && [ $w -ge 0 ] && [ $w -lt $size ]; do
        diagonal_line=("${diagonal_line[@]}" "${map:$(( $h * $size + $w )):1}")

        case $(( $rotate_count % 2 )) in
            0 )
                h=$(( $h + 1 ))
                w=$(( $w + 1 ))
                ;;
            1 )
                h=$(( $h + 1 ))
                w=$(( $w - 1 ))
                ;;
        esac
    done

    padding_size=$(( $size - $diagonal_row ))
    padding_size=${padding_size/-}
    padding=`printf %${padding_size}s | tr ' ' ':'`

    result="$padding`echo "${diagonal_line[@]}" | tr ' ' ':'`$padding"

    if [ $reverse_flag -eq 0 ]; then
        results=("${results[@]}" "$result")
    else
        results=("`echo "$result" | rev`" "${results[@]}")
    fi
done

# echo "answer"
for result in "${results[@]}"; do
    echo "${result//:/ }"
done
