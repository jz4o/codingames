# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r n

# Write an action using echo
# To debug: echo "Debug messages..." >&2

is_prime() {
    num=$1

    for (( i=2; i<$num; i++ )); do
        if [ $(( $num % $i )) -eq 0 ]; then
            echo false
            return
        fi
    done

    echo true
}

prime_division() {
    num=$1

    divisions=()

    while [ $(( $num % 2 )) -eq 0 ]; do
        divisions=( ${divisions[@]} 2 )
        num=$(( $num / 2 ))
    done

    i=3
    while [ $num -ne 1 ]; do
        if [ $(( $num % $i )) -eq 0 ]; then
            divisions=( ${divisions[@]} $i )
            num=$(( $num / $i ))
        else
            let i+=2
        fi
    done

    echo "${divisions[@]}"
}

prime_flag=`is_prime $n`
if $prime_flag; then
    is_carmichael=false
else
    is_carmichael=true
fi

for prime_factor in `prime_division $n`; do
    if [ $(( ($n - 1) % ($prime_factor - 1) )) -ne 0 ]; then
        is_carmichael=false
        break
    fi
done

# echo "YES|NO"
if $is_carmichael; then
    echo 'YES'
else
    echo 'NO'
fi
