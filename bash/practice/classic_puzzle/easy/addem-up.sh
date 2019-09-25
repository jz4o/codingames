# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
read -r -a myArray
for (( i=0; i<$N; i++ )); do
    x=${myArray[$((i))]}
    myArray[$i]=$x
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

totalCost=0

myArray=(`for v in "${myArray[@]}"; do echo "$v"; done | sort -n`)
myArray2=()

myArrayIndex=0
myArray2Index=0
for (( i=0; i<$(( $N - 1 )); i++ )); do
    if [ "${myArray[$myArrayIndex]}" = "" ]; then
        num1=${myArray2[$myArray2Index]}
        let myArray2Index++
    elif [ "${myArray2[$myArray2Index]}" = "" ]; then
        num1=${myArray[$myArrayIndex]}
        let myArrayIndex++
    elif [ ${myArray[$myArrayIndex]} -le ${myArray2[$myArray2Index]} ]; then
        num1=${myArray[$myArrayIndex]}
        let myArrayIndex++
    else
        num1=${myArray2[$myArray2Index]}
        let myArray2Index++
    fi

    if [ "${myArray[$myArrayIndex]}" = "" ]; then
        num2=${myArray2[$myArray2Index]}
        let myArray2Index++
    elif [ "${myArray2[$myArray2Index]}" = "" ]; then
        num2=${myArray[$myArrayIndex]}
        let myArrayIndex++
    elif [ ${myArray[$myArrayIndex]} -le ${myArray2[$myArray2Index]} ]; then
        num2=${myArray[$myArrayIndex]}
        let myArrayIndex++
    else
        num2=${myArray2[$myArray2Index]}
        let myArray2Index++
    fi

    cost=$(( $num1 + $num2 ))
    let totalCost+=$cost

    myArray2=(${myArray2[@]} $cost)
done

# echo "0"
echo $totalCost
