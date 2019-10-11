# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r r1

# Write an action using echo
# To debug: echo "Debug messages..." >&2

is_success=false
for (( target=$r1; target>0; target-- )); do
    expr=""
    for (( i=0; i<${#target}; i++ )); do
        expr="$expr + ${target:$i:1}"
    done
    next_river=$(( "$target + $expr" ))
    
    if [ $next_river -eq $r1 ]; then
        is_success=true
        break
    fi
done

# echo "YES|NO"
if "$is_success"; then
    echo "YES"
else
    echo "NO"
fi
