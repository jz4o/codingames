# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r opBowls
read -r myBowls
read -r num

# Write an action using echo
# To debug: echo "Debug messages..." >&2

op_bowls=($opBowls)
my_bowls=($myBowls)

readonly BOWLS_SIZE=7
readonly PLAYER_SIZE=2

seeds=${my_bowls[$num]}
my_bowls[$num]=0
index=$(( $num + 1 ))
while [ $seeds -gt 0 ]; do
    row_index=$(( (($index / $BOWLS_SIZE) % $PLAYER_SIZE - 1) * -1 ))
    column_index=$(( $index % $BOWLS_SIZE ))

    enemy_store_flag=0
    if [ $row_index -eq 0 ] && [ $column_index -eq $(( $BOWLS_SIZE - 1 )) ]; then
        enemy_store_flag=1
    fi
    if [ $enemy_store_flag -eq 1 ]; then
        let index++
        continue
    fi

    if [ $(( $row_index % $PLAYER_SIZE )) -eq 0 ]; then
        let op_bowls[$column_index]++
    else
        let my_bowls[$column_index]++
    fi
    let index++
    let seeds--
done

# echo "answer"
echo "${op_bowls[@]:0:$(( ${#op_bowls[@]} - 1 ))} [${op_bowls[$(( ${#op_bowls[@]} - 1 ))]}]"
echo "${my_bowls[@]:0:$(( ${#my_bowls[@]} - 1 ))} [${my_bowls[$(( ${#my_bowls[@]} - 1 ))]}]"
if [ $(( $index % $BOWLS_SIZE )) -eq 0 ]; then
    echo "REPLAY"
fi
