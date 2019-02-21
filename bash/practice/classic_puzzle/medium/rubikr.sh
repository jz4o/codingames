# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N

# Write an action using echo
# To debug: echo "Debug messages..." >&2

cube_count=$(( N ** 3 ))
inside_edge_count=$(( N - 2 ))
if [ $inside_edge_count -gt 0 ]; then
    invisible_cube_count=$(( $inside_edge_count ** 3 ))
else
    invisible_cube_count=0
fi

# echo "answer"
echo $(( $cube_count - $invisible_cube_count ))
