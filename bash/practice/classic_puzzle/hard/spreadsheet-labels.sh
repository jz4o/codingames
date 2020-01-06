# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r n
read -r -a myArray
labels=()
for (( i=0; i<$n; i++ )); do
    label=${myArray[$((i))]}
    labels=("${labels[@]}" "$label")
done

alphas=({A..Z})
declare -A alpha_indexes=()
for (( i=0; i<${#alphas[@]}; i++ )); do
    alpha_indexes[${alphas[$i]}]=$i
done

int_label_to_alpha_label() {
    int_label=$1

    result=''
    while [ $int_label -gt 0 ]; do
        i=`echo "$int_label % ${#alphas[@]}" | bc`
        if [ $i -eq 0 ]; then
            i=${#alphas[@]}
            let int_label--
        fi

        if [ $int_label -gt ${#alphas[@]} ]; then
            int_label=`echo "$int_label / ${#alphas[@]}" | bc`
        else
            int_label=0
        fi

        result="${alphas[$(( $i - 1 ))]}$result"
    done

    echo "$result"
}

alpha_label_to_int_label() {
    alpha_label=$1

    result=0
    for (( i=0; i<${#alpha_label}; i++ )); do
        weight=$(( ${#alphas[@]} ** $i ))

        alpha="${alpha_label:$(( ${#alpha_label} - 1 -$i )):1}"
        index=$(( ${alpha_indexes[$alpha]} + 1 ))

        let result+=$(( $weight * $index ))
    done

    echo $result
}

results=()
for label in "${labels[@]}"; do
    if [[ "${label}" =~ ^[0-9]+$ ]]; then
        results=("${results[@]}" "`int_label_to_alpha_label $label`")
    else
        results=("${results[@]}" "`alpha_label_to_int_label $label`")
    fi
done

# echo implode(' ', $result);
echo "${results[@]}"
