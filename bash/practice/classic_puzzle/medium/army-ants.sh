# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N1 N2
read -r S1
read -r S2
read -r T

# Write an action using echo
# To debug: echo "Debug messages..." >&2

s1_move_part=`printf "%-${T}s" ${S1:0:$T} | rev`
s2_move_part=`printf "%-${T}s" ${S2:0:$T}`

s1_not_move_part=`echo "${S1:$T}" | rev`
s2_not_move_part="${S2:$T}"

s_moved_part=""
for (( i=0; i<$T; i++ )); do
    s_moved_part="$s_moved_part${s2_move_part:$i:1}${s1_move_part:$i:1}"
done

# echo "answer"
echo "$s1_not_move_part$s_moved_part$s2_not_move_part" | tr -d ' '
