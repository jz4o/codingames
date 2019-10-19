# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
read -r XthenCOMMANDS
road_patterns=()
for (( i=0; i<$N; i++ )); do
    read -r RthenROADPATTERN
    road_patterns=("${road_patterns[@]}" "$RthenROADPATTERN")
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

XthenCOMMANDS=(${XthenCOMMANDS//;/ })
position=${XthenCOMMANDS[0]}
commands=""
for (( i=1; i<${#XthenCOMMANDS[@]}; i++ )); do
    XthenCOMMAND=${XthenCOMMANDS[$i]}

    time=${XthenCOMMAND:0:$(( ${#XthenCOMMAND} - 1 ))}
    comm=${XthenCOMMAND:$(( ${#XthenCOMMAND}  - 1))}

    commands="$commands`echo "$(printf %${time}s | sed "s/ /${comm}/g")"`"
done

results=()
command_index=0
for (( n=0; n<$N; n++ )); do
    IFS_ORIGIN="$IFS"
    IFS=";"
    road_pattern=(${road_patterns[$n]})
    IFS="$IFS_ORIGIN"

    count=${road_pattern[0]}
    pattern=${road_pattern[1]}

    for (( c=0; c<$count; c++ )); do
        case "${commands:$command_index:1}" in
            "L") let position-- ;;
            "R") let position++ ;;
        esac
        let command_index++

        result="${pattern:0:$(( $position - 1 ))}#${pattern:$position}"
        results=("${results[@]}" "$result")
    done
done

# echo "answer"
for result in "${results[@]}"; do
    echo "$result"
done
