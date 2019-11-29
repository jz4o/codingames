# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
isbns=()
for (( i=0; i<$N; i++ )); do
    read -r ISBN
    isbns=("${isbns[@]}" "$ISBN")
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

modulus_10_weights=( 1 3 1 3 1 3 1 3 1 3 1 3 )
modulus_11_weights=( 10 9 8 7 6 5 4 3 2 1 )

invalids=()
for (( i=0; i<$N; i++ )); do
    isbn=${isbns[$i]}

    if [[ ! "$isbn" =~ ^[0-9]+X?$ ]]; then
        invalids=("${invalids[@]}" "$isbn")
        continue
    fi

    case "${#isbn}" in
        10 )
            modulus=11
            modulus_weights=(${modulus_11_weights[@]})
            ;;
        13 )
            if [ "${isbn:$(( ${#isbn} - 1 ))}" = 'X' ]; then
                invalids=("${invalids[@]}" "$isbn")
                continue
            fi
            modulus=10
            modulus_weights=(${modulus_10_weights[@]})
            ;;
        *)
            invalids=("${invalids[@]}" "$isbn")
            continue
            ;;
    esac

    sum=0
    for (( j=0; j<$(( ${#isbn} - 1 )); j++ )); do
        digit=${isbn:$j:1}
        let sum+=$(( $digit * ${modulus_weights[$j]} ))
    done

    check_sum=$(( ($modulus - ($sum % $modulus)) % $modulus ))
    check_digit=${isbn:$(( ${#isbn} - 1 ))}
    check_digit=${check_digit/X/10}
    if [ $check_digit -ne $check_sum ]; then
        invalids=("${invalids[@]}" "$isbn")
    fi
done

# echo "answer"
echo "${#invalids[@]} invalid:"
for invalid in "${invalids[@]}"; do
    echo "$invalid"
done
