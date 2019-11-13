# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
read -r input

# Write an action using echo
# To debug: echo "Debug messages..." >&2

dot=0
minus=0
if [[ "$input" =~ \. ]]; then dot=1;   fi
if [[ "$input" =~ - ]];  then minus=1; fi
input=`echo "$input" | tr -d "."`
input=`echo "$input" | tr -d "-"`

input=($input)
if [ $minus -eq 1 ]; then
    # sort
    input=(`for v in "${input[@]}"; do echo "$v"; done | sort -n`)

    # to string
    input="${input[@]}"
    input=`echo "$input" | tr -d " "`

    # insert dot and minus
    if [ $dot -eq 1 ]; then
        input="${input:0:1}.${input:1}"
    fi
    input="-${input}"

    # check zero?
    if [[ "$input" =~ ^-0\.0+$ ]]; then
        input=0
    fi
else
    # sort
    input=(`for v in "${input[@]}"; do echo "$v"; done | sort -n`)

    # to string and delete space
    input="${input[@]}"
    input=`echo "$input" | tr -d " " | rev`

    # insert dot
    if [ $dot -eq 1 ]; then
        input="${input:0:$(( ${#input} - 1 ))}.${input:$(( ${#input} - 1 ))}"
    fi

    # check integer?
    if [[ "$input" =~ \.0$ ]]; then
        input="${input:0:$(( ${#input} - 2 ))}"
    fi
fi

# echo "greatest"
echo "$input"
