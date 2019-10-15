# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r L
read -r H
read -r T

rows=()
IFS_BACK="$IFS"
IFS=
for (( i=0; i<$H; i++ )); do
    read -r ROW
    rows=("${rows[@]}" "$ROW")
done
IFS="$IFS_BACK"

# Write an action using echo
# To debug: echo "Debug messages..." >&2

ALPHAS='ABCDEFGHIJKLMNOPQRSTUVWXYZ?'
res=()
for (( i=0; i<$H; i++ )); do
    res[$i]=''
done

T=${T^^}
for (( i=0; i<${#T}; i++ )); do
    s=${T:$i:1}

    str_index=`expr index "$ALPHAS" "$s" - 1`
    if [ $str_index -lt 0 ]; then
        str_index=$(( ${#ALPHAS} - 1 ))
    fi
    for (( h=0; h<$H; h++ )); do
        res[$h]="${res[$h]}${rows[$h]:$(( $L * $str_index )):$L}"
    done
done

# echo "answer"
for r in "${res[@]}"; do
    echo "$r"
done
