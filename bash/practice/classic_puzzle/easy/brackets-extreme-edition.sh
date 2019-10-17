# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r expression

# Write an action using echo
# To debug: echo "Debug messages..." >&2

declare -A brackets
brackets["("]=")"
brackets["["]="]"
brackets["{"]="}"

expression=${expression//[^\(\)\{\}\[\]]/}
is_collect=TRUE
chars=""
for (( char_index=0; char_index<${#expression}; char_index++ )); do
    char=${expression:$char_index:1}

    if [ "${brackets[$char]}" != "" ]; then
        chars="$chars$char"
        continue
    fi

    if [ "$chars" != "" ]; then
        last_key=${chars:$(( ${#chars} - 1 ))}
        last_value=${brackets[$last_key]}
        chars="${chars:0:$(( ${#chars} - 1 ))}"

        if [ "$last_value" = "$char" ]; then
            continue
        fi
    fi

    is_collect=FALSE
    break
done

if [ "$chars" != "" ]; then
    is_collect=FALSE
fi

# echo "true/false"
echo "${is_collect,,}"
