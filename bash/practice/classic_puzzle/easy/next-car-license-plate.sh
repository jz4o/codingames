# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r x
read -r n

# Write an action using echo
# To debug: echo "Debug messages..." >&2

declare -r ALPHAS="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

alpha_to_int() {
    arg_alpha="$1"

    result=0
    for (( i=0; i<${#arg_alpha}; i++ )); do
        a=${arg_alpha:$(( ${#arg_alpha} - 1 - $i )):1}
        alpha_index=`echo "$ALPHAS" | grep -o -E ".*${a}"`
        alpha_index=${#alpha_index}

        let result+=$(( (${#ALPHAS} ** $i) * $alpha_index ))
    done

    echo $result
}

int_to_alpha() {
    arg_int=$1

    result=""
    while [ $arg_int -gt 0 ]; do
        i=$(( $arg_int % ${#ALPHAS} ))

        if [ $i -eq 0 ]; then
            i=${#ALPHAS}
            let arg_int--
        fi

        if [ $arg_int -gt ${#ALPHAS} ]; then
            arg_int=$(( $arg_int / ${#ALPHAS} ))
        else
            arg_int=0
        fi
        result="${ALPHAS:$(( $i - 1 )):1}$result"
    done

    echo "$result"
}

x_elements=(`echo "$x" | tr '-' ' '`)
ab="${x_elements[0]}"
cde=`echo "${x_elements[1]}" | sed 's/0*\([0-9]*[0-9]$\)/\1/g'`
fg="${x_elements[2]}"

alpha="$ab$fg"
alpha_int=`alpha_to_int $alpha`
let cde+=$(( $n - 1 ))

carry=$(( $cde / 999 ))
cde=$(( $cde % 999 ))
let alpha_int+=$carry
alpha=`int_to_alpha $alpha_int`

ab=${alpha:0:2}
cde=`printf "%03d" $(( $cde + 1 ))`
fg=${alpha:2}

# echo "AA-000-AA"
echo "$ab-$cde-$fg"
