# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r width height
grid=()
for (( i=0; i<$height; i++ )); do
    read -r line
    grid=("${grid[@]}" `echo "$line" | grep -o -E '.'`)
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

# count for sharp on each columns
sharp_count=()
for (( i=0; i<$width; i++ )); do
    sharp_count[$i]=0
done
for (( h=0; h<$height; h++ )); do
    for (( w=0; w<$width; w++ )); do
        if [ ${grid[$(( $h * $width + $w ))]} = '#' ]; then
            let sharp_count[$w]++
        fi
    done
done

# fall by gravity
for (( h=0; h<$height; h++ )); do
    for (( w=0; w<$width; w++ )); do
        grid_index=$(( $h * $width + $w ))
        if [ $h -lt $(( $height - ${sharp_count[$w]} )) ]; then
            grid[$grid_index]='.'
        else
            grid[$grid_index]='#'
        fi
    done
done

# echo "answer"
result="`echo "${grid[@]}" | tr -d ' ' | grep -o -E ".{${width}}"`"
echo "$result"
