# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r MESSAGE

# Write an action using echo
# To debug: echo "Debug messages..." >&2

# convert decimal to 7 bit binary string
binary=''
for (( i=0; i<${#MESSAGE}; i++ )); do
    s=${MESSAGE:$i:1}
    ord=`printf "%d" "'$s"`
    b=`echo "obase=2; $ord" | bc`
    binary="$binary`printf "%07d" $b`"
done

# grouping same char and convert to array
matched_array=()
while [ ! "$binary" = "" ]; do
    # get continuous same character from beginning of binary string
    matched=`echo "$binary" | grep -o -E "^${binary:0:1}+"`

    matched_array=("${matched_array[@]}" "$matched")

    binary=${binary/$matched}
done

result=''
for matched in "${matched_array[@]}"; do
    value=`printf %0$(( 2 - ${matched:0:1} ))d`
    bit=${matched//1/0}

    result="$result$value $bit "
done

# echo "answer"
echo $result
