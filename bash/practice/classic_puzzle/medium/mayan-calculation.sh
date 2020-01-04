# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r L H
ascii_mayans=()
for (( i=0; i<$H; i++ )); do
    read -r numeral

    mayan_rows=(`echo "$numeral" | grep -o -E ".{${L}}"`)
    for (( j=0; j<${#mayan_rows[@]}; j++ )); do
        ascii_mayans[$j]="${ascii_mayans[$j]}${mayan_rows[$j]}"
    done
done
read -r S1
mayan1=()
for (( i=0; i<$S1; i++ )); do
    read -r num1Line

    mayan1[$(( $i / $H ))]="${mayan1[$(( $i / $H ))]}$num1Line"
done
read -r S2
mayan2=()
for (( i=0; i<$S2; i++ )); do
    read -r num2Line

    mayan2[$(( $i / $H ))]="${mayan2[$(( $i / $H ))]}$num2Line"
done
read -r operation

# Write an action using echo
# To debug: echo "Debug messages..." >&2

# mayan to int converter
declare -A mayan_2_int=()
for (( i=0; i<${#ascii_mayans[@]}; i++ )); do
    mayan_2_int[${ascii_mayans[$i]}]=$i
done

# convert mayan to int
num1=0
for (( i=0; i<${#mayan1[@]}; i++ )); do
    weight=$(( ${#ascii_mayans[@]} ** ( ${#mayan1[@]} - 1 - $i ) ))
    let num1+=$(( $weight * ${mayan_2_int[${mayan1[$i]}]} ))
done

num2=0
for (( i=0; i<${#mayan2[@]}; i++ )); do
    weight=$(( ${#ascii_mayans[@]} ** ( ${#mayan2[@]} - 1 - $i ) ))
    let num2+=$(( $weight * ${mayan_2_int[${mayan2[$i]}]} ))
done

# calculate
result_num=$(( $num1 $operation $num2 ))

# convert int to mayan
result=""
while [ $result_num -gt 0 ]; do
    div=$(( $result_num / ${#ascii_mayans[@]} ))
    mod=$(( $result_num % ${#ascii_mayans[@]} ))
    result_num=$div

    result="${ascii_mayans[$mod]}$result"
done

# echo "result"
echo "${result:-${ascii_mayans[0]}}" | grep -o -E ".{$L}"
