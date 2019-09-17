# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r W
read -r H

WIDTH=$(( $W + 2 ))
HEIGHT=$(( $H + 2 ))

map=""
map="`printf %${WIDTH}s | tr " " "1"`"
for (( i=0; i<$H; i++ )); do
    read -r -a myArray
    map="${map}1"
    for (( j=0; j<$W; j++ )); do
        v=${myArray[$((j))]}
        map="$map$v"
    done
    map="${map}1"
done
map="$map`printf %${WIDTH}s | tr " " "1"`"

# Write an action using echo
# To debug: echo "Debug messages..." >&2

for (( i=0; i<${#map}; i++ )); do
    if [ ${map:$(( $i - $WIDTH - 1 )):1} -ne 1 ]; then continue; fi
    if [ ${map:$(( $i - $WIDTH     )):1} -ne 1 ]; then continue; fi
    if [ ${map:$(( $i - $WIDTH + 1 )):1} -ne 1 ]; then continue; fi
    if [ ${map:$(( $i - 1          )):1} -ne 1 ]; then continue; fi
    if [ ${map:    $i                :1} -ne 0 ]; then continue; fi
    if [ ${map:$(( $i + 1          )):1} -ne 1 ]; then continue; fi
    if [ ${map:$(( $i + $WIDTH - 1 )):1} -ne 1 ]; then continue; fi
    if [ ${map:$(( $i + $WIDTH     )):1} -ne 1 ]; then continue; fi
    if [ ${map:$(( $i + $WIDTH + 1 )):1} -ne 1 ]; then continue; fi

    y=$(( $i / $WIDTH - 1 ))
    x=$(( $i % $WIDTH - 1 ))

    break
done

# echo "x y"
echo "$x $y"
