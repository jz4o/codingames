# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# @n = gets.chomp
read -r N

# Write an action using echo
# To debug: echo "Debug messages..." >&2

range_str() {
    begin=$1
    end=$2

    if [ $(( $end - $begin )) -ge 2 ]; then
        echo "$begin-$end"
    elif [ $(( $end - $begin )) -eq 1 ]; then
        echo "$begin,$end"
    else
        echo "$begin"
    fi
}

N=${N:1:-1}

IFS_ORIGIN=$IFS
IFS=","
N=($(for v in ${N[@]}; do echo "$v"; done | sort -n))
IFS=$IFS_ORIGIN

result=""
for n in ${N[@]}; do
    if [ "$t_begin" = "" ]; then
        t_begin=$n
        t_end=$n
    elif [ $(( $t_end + 1 )) -eq $n ]; then
        t_end=$n
    else
        result="$result,$(range_str $t_begin $t_end)"
        t_begin=$n
        t_end=$n
    fi
done
result="$result,$(range_str $t_begin $t_end)"

# echo "answer"
echo ${result:1}
