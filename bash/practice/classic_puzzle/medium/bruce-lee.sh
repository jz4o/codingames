# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r ENCRYPT

# Write an action using echo
# To debug: echo "Debug messages..." >&2

invalid_flag=0
binaries=''
encrypts=($ENCRYPT)
for (( i=0; i<${#encrypts[@]}; i+=2 )); do
    binary="${encrypts[$i]}"
    count="${encrypts[$(( $i + 1 ))]}"

    if [[ ! "$binary" =~ ^0{1,2}$ ]] || [ "$count" = "" ]; then
        invalid_flag=1
        break
    fi

    if [ "$binary" = "0" ]; then
        binary_char="1"
    else
        binary_char="0"
    fi

    binaries="${binaries}`printf %${#count}s | sed "s/ /${binary_char}/g"`"
done

result=""
if [ $invalid_flag -eq 1 ] || [ $(( ${#binaries} % 7 )) -ne 0 ]; then
    result="INVALID"
else
    for binary in `echo "$binaries" | grep -o -E ".{7}"`; do
        hex=`printf %x $((2#${binary}))`
        char=`printf %b "\x$hex"`
        result="$result$char"
    done
fi

# echo "INVALID"
echo "$result"
