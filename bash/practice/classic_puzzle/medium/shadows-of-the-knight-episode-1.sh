# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# W: width of the building.
# H: height of the building.
read -r W H
# N: maximum number of turns before game over.
read -r N
read -r X0 Y0

bomb_min_height=$H
bomb_max_height=0
bomb_min_width=0
bomb_max_width=$W

# (0,0) => UpperLeft of building
# (0,1) => (Horizontal, Vertical)

function ceil_div() {
    div=$(( $1 / $2 ))
    if [ $1 -eq $(( $div * $2 )) ]; then
        echo $div
    else
        echo $(( $div + 1 ))
    fi
}

# game loop
while true; do
    # bombDir: the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)
    read -r bombDir

    # Write an action using echo
    # To debug: echo "Debug messages..." >&2

    if [[ "$bombDir" =~ "U" ]]; then
        bomb_min_height=$Y0
        let Y0-=`ceil_div $(( $Y0 - $bomb_max_height )) 2`
    elif [[ "$bombDir" =~ "D" ]]; then
        bomb_max_height=$Y0
        let Y0+=`ceil_div $(( $bomb_min_height - $Y0 )) 2`
    fi

    if [[ "$bombDir" =~ "R" ]]; then
        bomb_min_width=$X0
        let X0+=`ceil_div $(( $bomb_max_width - $X0 )) 2`
    elif [[ "$bombDir" =~ "L" ]]; then
        bomb_max_width=$X0
        let X0-=`ceil_div $(( $X0 - $bomb_min_width )) 2`
    fi

    # the location of the next window Batman should jump to.
    # echo "0 0"
    echo "$X0 $Y0"
done
