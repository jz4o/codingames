# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r intext

# Write an action using echo
# To debug: echo "Debug messages..." >&2

if [ "${intext:$(( ${#intext} - 1))}" = "." ]; then
    require_period=true
else
    require_period=false
fi

intext="${intext,,}"
intext="${intext//,/, }"

intext=`echo "$intext" | tr -s " "`

IFS_ORIGIN="$IFS"
IFS="."
intext_array=($intext)
IFS="$IFS_ORIGIN"

intext=`echo ${intext_array[0]^}`
for (( i=1; i<${#intext_array[@]}; i++ )); do
    text=`echo ${intext_array[$i]}`

    if [ "$text" = "" ]; then
        continue
    fi

    intext="${intext}. ${text^}"
done

intext="${intext// ,/,}"
intext=`echo "$intext" | tr -s ","`

if "${require_period}"; then
    intext="${intext}."
fi

# echo "solution"
echo "$intext"
