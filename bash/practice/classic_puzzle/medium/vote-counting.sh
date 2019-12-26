# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
read -r M
voters=()
for (( i=0; i<$N; i++ )); do
    read -r personName nbVote
    voters=("${voters[@]}" "${personName}:${nbVote}")
done
declare -A votes=()
declare -A vote_count=()
for (( i=0; i<$M; i++ )); do
    read -r voterName voteValue

    if [ "${votes[$voterName]}" = "" ]; then
        votes[$voterName]=""
        vote_count[$voterName]=0
    fi

    votes[$voterName]="${votes[$voterName]} $voteValue "
    let vote_count[$voterName]++
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

yes=0
no=0
for voter in "${voters[@]}"; do
    voter_element=(${voter//:/ })
    name="${voter_element[0]}"
    count="${voter_element[1]}"

    if [ "${votes[$name]}" = "" ] || [ ${vote_count[$name]} -gt $count ]; then
        continue
    fi

    let yes+=`echo "${votes[$name]}" | grep -o ' Yes ' | wc -l`
    let no+=` echo "${votes[$name]}" | grep -o ' No '  | wc -l`
done

# echo "output"
echo "$yes $no"
