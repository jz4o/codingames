# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r width height
read -r count
grid=()
for (( i=0; i<$height; i++ )); do
    read -r raster
    grid=("${grid[@]}" `echo "$raster" | grep -o -E '.'`)
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

if [ $(( $count % 2 )) -eq 1 ]; then
    be_height_count_in_horizontal=()
    for (( i=0; i<$height; i++ )); do
        be_height_count_in_horizontal[$i]=0
    done
    for (( h=0; h<$height; h++ )); do
        for (( w=0; w<$width; w++ )); do
            if [ "${grid[$(( $h * $width + $w ))]}" = '#' ]; then
                let be_height_count_in_horizontal[$h]++
            fi
        done
    done

    # tumbling
    result=""
    for (( h=0; h<$width; h++ )); do
        for (( w=0; w<$height; w++ )); do
            if [ $h -lt $(( $width - ${be_height_count_in_horizontal[$w]} )) ]; then
                result="${result}."
            else
                result="${result}#"
            fi
        done
    done

    echo "`echo $result | grep -o -E ".{$height}"`"
else
    be_width_count_in_vertical=()
    for (( i=0; i<$height; i++ )); do
        be_width_count_in_vertical[$i]=0
    done
    for (( h=0; h<$height; h++ )); do
        for (( w=0; w<$width; w++ )); do
            if [ "${grid[$(( $h * $width + $w ))]}" = '#' ]; then
                let be_width_count_in_vertical[$h]++
            fi
        done
    done

    # tumbling
    result=""
    for (( h=0; h<$height; h++ )); do
        for (( w=0; w<$width; w++ )); do
            if [ $w -lt $(( $width - ${be_width_count_in_vertical[$h]} )) ]; then
                result="${result}."
            else
                result="${result}#"
            fi
        done
    done

    echo "`echo "$result" | grep -o -E ".{$width}"`"
fi

# echo "..."
# echo "write ###"
