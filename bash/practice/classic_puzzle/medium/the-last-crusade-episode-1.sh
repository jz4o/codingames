# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# W: number of columns.
# H: number of rows.
read -r W H
panels=()
for (( i=0; i<$H; i++ )); do
    # LINE: represents a line in the grid and contains W integers. Each integer represents one room of a given type.
    read -r LINE
    panels=("${panels[@]}" $LINE)
done
# EX: the coordinate along the X axis of the exit (not useful for this first mission, but must be read).
read -r EX

# direction
top=0
left=1
right=2
bottom=3
none=4

# Key   : direction of entrance
# Value : direction of exit(index: type of panel)
declare -A panel_destination=()
panel_destination["TOP"]="${none}${bottom}${none}${bottom}${left}${right}${none}${bottom}${none}${bottom}${left}${right}${none}${none}"
panel_destination["LEFT"]="${none}${bottom}${right}${none}${none}${bottom}${right}${none}${bottom}${bottom}${none}${none}${none}${bottom}"
panel_destination["RIGHT"]="${none}${bottom}${left}${none}${bottom}${none}${left}${bottom}${bottom}${none}${none}${none}${bottom}${none}"

# game loop
while true; do
    read -r XI YI POS

    # Write an action using echo
    # To debug: echo "Debug messages..." >&2

    panel_type=${panels[$(( $YI * $W + $XI ))]}
    next_dest=${panel_destination[$POS]:$panel_type:1}

    case "$next_dest" in
        "$left")   let XI--;;
        "$right")  let XI++;;
        "$bottom") let YI++;;
    esac

    # One line containing the X Y coordinates of the room in which you believe Indy will be on the next turn.
    # echo "0 0"
    echo "$XI $YI"
done
