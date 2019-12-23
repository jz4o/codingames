# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r Level
read -r Xp
read -r N

# Write an action using echo
# To debug: echo "Debug messages..." >&2

exp_of_puzzle=300

# reflect experience value
#
# @param Integer level       current level
# @param Integer exp         experience value
# @param Integer levelup_exp necessary experience value for level up
#
# @return String(level, exp)
#           level  level after reflect experience value
#           exp    necessary experience value for next level up
reflect_exp() {
    arg_level=$1
    arg_exp=$2
    arg_levelup_exp=$3

    if [ ! "$arg_levelup_exp" = "" ]; then
        let arg_exp-=$arg_levelup_exp
    else
        let arg_exp-=$( get_exp_for_levelup $arg_level )
    fi

    if [ $arg_exp -lt 0 ]; then
        echo "$arg_level $(( $arg_exp * -1 ))"
    else
        reflect_exp $(( $arg_level + 1 )) $arg_exp
    fi
}

get_exp_for_levelup() {
    arg_current_level=$1

    echo `echo "scale=10; $arg_current_level * sqrt($arg_current_level) * 10" | bc | sed s/\.[0-9]*$//`
}

# echo "answer"
results=($(reflect_exp $Level $(( $exp_of_puzzle * $N )) $Xp))
for result in ${results[@]}; do
    echo $result
done
