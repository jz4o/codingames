# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r word
read -r chars

# Write an action using echo
# To debug: echo "Debug messages..." >&2

# hangman ascii
beam='+--+'
no_head='|'
head='|  o'
no_body='|'
body='|  |'
one_arm='| /|'
both_arm='| /|\\'
no_leg='|\\'
one_leg='|\\/'
both_leg='|\\/ \\'
hangman_status=(
    "${beam}\n${no_head}\n${no_body}\n${no_leg}"
    "${beam}\n${head}\n${no_body}\n${no_leg}"
    "${beam}\n${head}\n${body}\n${no_leg}"
    "${beam}\n${head}\n${one_arm}\n${no_leg}"
    "${beam}\n${head}\n${both_arm}\n${no_leg}"
    "${beam}\n${head}\n${both_arm}\n${one_leg}"
    "${beam}\n${head}\n${both_arm}\n${both_leg}"
)

# answer to guess
result=''
for (( i=0; i<${#word}; i++ )); do
    char=${word:$i:1}
    if [[ "$chars" =~ "${char,,}" ]]; then
        result="$result$char"
    else
        result="${result}_"
    fi
done

# counting errors of guess
lower_word=${word,,}
errors=0
chars=($chars)
for char in "${chars[@]}"; do
    if [[ ! "$lower_word" =~ "$char" ]]; then
        let errors++
    fi
    lower_word=`echo "$lower_word" | tr -d "$char"`
done

# echo "answer"
echo -e "${hangman_status[$errors]}"
echo $result
