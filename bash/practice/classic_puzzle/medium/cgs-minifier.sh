# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

cgs_contents=()
read -r N
for (( i=0; i<$N; i++ )); do
    read -r CGSContent
    cgs_contents=("${cgs_contents[@]}" "$CGSContent")
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

declare -A variables
characters=()
replace_char_int=141 # A
for (( i=0; i<${#cgs_contents[@]}; i++ )); do
    # replace variable part
    for variable in `echo "${cgs_contents[$i]}" | grep -o -E '\\$[^\\$]+\\$'`; do
        if [ "${variables[$variable]}" = "" ]; then
            replace_char="$`printf "%b" "\\\\$replace_char_int"`$"
            variables[$variable]=$replace_char
            let replace_char_int++
        fi
        cgs_contents[$i]=${cgs_contents[$i]//$variable/${variables[$variable]}}
    done

    # replace character part
    for character in "`echo "${cgs_contents[$i]}" | grep -o -E "'.+'"`"; do
        cgs_contents[$i]=${cgs_contents[$i]//$character/\$${#characters[@]}}
        characters=("${characters[@]}" "$character")
    done

    cgs_contents[$i]=`echo ${cgs_contents[$i]} | tr -d " "`
done

# join lines
result=""
for cgs_content in "${cgs_contents[@]}"; do
    result="${result}${cgs_content}"
done

# restore character part
for (( i=0; i<${#characters[@]}; i++ )); do
    result="${result//\$$i/${characters[$i]}}"
done

# echo "minified all CGS content"
echo "$result"
