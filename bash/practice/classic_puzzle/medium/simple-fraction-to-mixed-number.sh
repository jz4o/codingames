# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
xys=()
for (( i=0; i<$N; i++ )); do
    read -r xY
    xys=("${xys[@]}" "$xY")
done

gcd() {
    x=$1
    y=$2

    tmp=$(( $x % $y ))
    while [ $tmp -ne 0 ]; do
        x=$y
        y=$tmp

        tmp=$(( $x % $y ))
    done

    echo $y
}

for (( i=0; i<$N; i++ )); do

    # Write an action using echo
    # To debug: echo "Debug messages..." >&2

    xy_elements=(${xys[$i]//\// })
    x=${xy_elements[0]}
    y=${xy_elements[1]}

    if [ $y -eq 0 ]; then
        echo "DIVISION BY ZERO"
        continue
    fi

    integer=$(( $x / $y ))
    x=$(( $x % $y ))

    integer_str=""
    if [ $integer -ne 0 ]; then
        integer_str="$integer_str$integer"
    fi

    rational_str=""
    if [ $x -ne 0 ]; then
        gcd=`gcd $x $y`
        x=$(( $x / $gcd ))
        y=$(( $y / $gcd ))

        if [ $integer -lt 0 ]; then
            minus_flg=1
        else
            minus_flg=0
        fi
        if [ $x -lt 0 ]; then
            minus_flg=$(( $minus_flg * -1 + 1 ))
            x=$(( $x * -1 ))
        fi
        if [ $y -le 0 ]; then
            minus_flg=$(( $minus_flg * -1 + 1 ))
            y=$(( $y * -1 ))
        fi

        if [ $minus_flg -eq 1 ]; then
            rational_str="${rational_str}-"
        fi

        rational_str="$rational_str${x}/$y"
    fi

    result=`echo "$integer_str $rational_str" | sed 's/^\s*//' | sed 's/\s*$//'`

    # echo "answer"
    if [ "$result" = "" ]; then
        echo "0"
    else
        echo "$result"
    fi
done
