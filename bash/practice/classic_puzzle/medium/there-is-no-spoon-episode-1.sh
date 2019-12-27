# Don't let the machines win. You are humanity's last hope...

# width: the number of cells on the X axis
read -r width
# height: the number of cells on the Y axis
read -r height
map=""
for (( i=0; i<$height; i++ )); do
    # line: width characters, each either 0 or .
    read -r line
    map="$map$line"
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

results=()
for (( h=0; h<$height; h++ )); do
    for (( w=0; w<$width; w++ )); do
        if [ "${map:$(( $h * $width + $w )):1}" = '.' ]; then
            continue
        fi

        result="$w $h "

        for (( r=$(( $w + 1 )); r<=$width; r++ )); do
            right="${map:$(( $h * $width + $r )):1}"

            if [ "$right" = "" ] || [ $r -ge $width ]; then
                result="${result}-1 -1 "
                break
            elif [ "$right" = '0' ]; then
                result="$result$r $h "
                break
            else
                continue
            fi
        done

        for (( b=$(( $h + 1 )); b<=$height; b++ )); do
            below=${map:$(( $b * $width + $w )):1}

            if [ "$below" = "" ]; then
                result="${result}-1 -1 "
                break
            elif [ "$below" = '0' ]; then
                result="$result$w $b"
                break
            else
                continue
            fi
        done

        results=("${results[@]}" "$result")
    done
done

# Three coordinates: a node, its right neighbor, its bottom neighbor
# echo "0 0 1 0 0 1"
for result in "${results[@]}"; do
    echo "$result"
done
