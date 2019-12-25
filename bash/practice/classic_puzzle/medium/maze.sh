# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r W H
read -r X Y
map=""
map="$map`printf %$(( $W + 2 ))s`"
for (( i=0; i<$H; i++ )); do
    read -r R
    map="$map $R "
done
map="$map`printf %$(( $W + 2 ))s`"

# Write an action using echo
# To debug: echo "Debug messages..." >&2

checked_maths=" "
be_check_maths=("$(( $Y + 1 )) $(( $X + 1 ))")
exit_maths=()
for (( index=0; index<${#be_check_maths[@]}; index++ )); do
    check_math=(${be_check_maths[$index]})
    y="${check_math[0]}"
    x="${check_math[1]}"

    if [[ "$checked_maths" =~ " $y:$x " ]]; then
        continue
    fi
    checked_maths="$checked_maths $y:$x "

    near_maths=(
        "$y $(( $x - 1 ))" # left
        "$(( $y - 1 )) $x" # top
        "$y $(( $x + 1 ))" # right
        "$(( $y + 1 )) $x" # bottom
    )

    for near_math in "${near_maths[@]}"; do
        math_element=($near_math)
        ny=${math_element[0]}
        nx=${math_element[1]}

        math=${map:$(( $ny * ($W + 2) + $nx )):1}
        if [ "$math" = '.' ]; then
            be_check_maths=("${be_check_maths[@]}" "$ny $nx")
        elif [ "$math" = " " ]; then
            exit_maths=("${exit_maths[@]}" "`printf %02d $(( $x - 1 ))``printf %02d $(( $y - 1 ))`")
        fi
    done
done

# echo "answer"
exit_maths=(`for v in "${exit_maths[@]}"; do echo "$v"; done | sort`)
echo "${#exit_maths[@]}"
for exit_math in "${exit_maths[@]}"; do
    x=`echo "${exit_math:0:2}" | sed s/^0//`
    y=`echo "${exit_math:2:2}" | sed s/^0//`
    echo "$x $y"
done
