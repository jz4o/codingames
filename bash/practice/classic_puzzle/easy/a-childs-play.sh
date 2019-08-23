# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r w h
read -r n
map=""
for (( i=0; i<$h; i++ )); do
    read -r line
    map=$map$line
done

directions="NESW"
direction_index=0

robot_index=$(expr index $map 'O' - 1)
y=$(( $robot_index / $w ))
x=$(( $robot_index % $w ))
initial_y=$y
initial_x=$x

turn=0
while [ $turn -lt $n ]; do
    turn=$(( $turn + 1 ))

    # forward
    case ${directions:$direction_index:1} in
        'N') y=$(( $y - 1 ));;
        'E') x=$(( $x + 1 ));;
        'S') y=$(( $y + 1 ));;
        'W') x=$(( $x - 1 ));;
    esac

    # get ahead mass
    case ${directions:$direction_index:1} in
        'N') ahead_mass=${map:$(( ($y - 1) * $w + $x )):1};;
        'E') ahead_mass=${map:$(( $y * $w + $x + 1 )):1};;
        'S') ahead_mass=${map:$(( ($y + 1) * $w + $x )):1};;
        'W') ahead_mass=${map:$(( $y * $w + $x - 1 )):1};;
    esac

    # turn right if obstacle in ahead mass
    if [ "$ahead_mass" = '#' ]; then
        direction_index=$(( ($direction_index + 1) % ${#directions} ))
    fi

    # omit to loop turn
    if [ $x -eq $initial_x ] && [ $y -eq $initial_y ] && [ ${directions:$direction_index:1} = 'N' ]; then
        turn=$(( $n - ( $n % $turn ) ))
    fi
done

echo "$x $y"
