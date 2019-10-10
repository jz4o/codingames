# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r r1
read -r r2

# Write an action using echo
# To debug: echo "Debug messages..." >&2

# echo "42"

until [ $r1 -eq $r2 ]; do
    if [ $r1 -lt $r2 ]; then
        expr=""
        for (( i=0; i<${#r1}; i++ )); do
            expr="$expr + ${r1:$i:1}"
        done
        r1=$(( "$r1 + $expr" ))
    else
        expr=""
        for (( i=0; i<${#r2}; i++ )); do
            expr="$expr + ${r2:$i:1}"
        done
        r2=$(( "$r2 + $expr" ))
    fi
done

echo $r1
