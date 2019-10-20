# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N

# Write an action using echo
# To debug: echo "Debug messages..." >&2

width=$(( $N * 4 - 1 ))

upper_part=""
lower_part=""
for (( i=1; i<=$N; i++ )); do
    part=$(echo "`printf %$(( $i * 2 - 1 ))s | sed "s/ /\*/g"`")

    upper_left_space_part="`printf %$(( ($width - ${#part}) / 2 ))s`"
    upper_part="$upper_part$upper_left_space_part$part\n"

    lower_space_part="`printf %$(( ($N - $i + 1) * 2 - 1 ))s`"
    lower_line="$part$lower_space_part$part"
    lower_left_space_part="`printf %$(( ($width - ${#lower_line}) / 2 ))s`"
    lower_part="$lower_part$lower_left_space_part$lower_line\n"
done

upper_part=".${upper_part:1}"
lower_part="${lower_part:0:$(( ${#lower_part} - 2))}"

# echo "answer"
echo -e "$upper_part$lower_part"
