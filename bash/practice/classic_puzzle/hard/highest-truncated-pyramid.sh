# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N

part_count=1
top_step_count=1
bottom_step_count=1

while [ true ]; do
    if [ $part_count -lt $N ]; then
        let bottom_step_count++
        let part_count+=$bottom_step_count
    elif [ $N -lt $part_count ]; then
        let part_count-=$top_step_count
        let top_step_count++
    else
        break
    fi
done

for (( i = $top_step_count; i <= $bottom_step_count; i++ )); do
    echo "`printf %${i}s | tr " " "*"`"
done
