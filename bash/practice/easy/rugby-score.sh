# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N

# Write an action using echo
# To debug: echo "Debug messages..." >&2

combinations=()

TRY_POINT=5
TRANSFORM_POINT=2
PENA_DROP_POINT=3

possible_try_times=$(( $N / $TRY_POINT ))
for (( try_times=$possible_try_times; try_times>=0; try_times-- )); do
  try_points=$(( $TRY_POINT * $try_times ))

  possible_transformation_times=$(( ($N - $try_points) / $TRANSFORM_POINT ))
  if [ $possible_transformation_times -gt $try_times ]; then
    possible_transformation_times=$try_times
  fi

  for (( transformation_times=$possible_transformation_times; transformation_times>=0; transformation_times-- )); do
    transform_points=$(( $TRANSFORM_POINT * $transformation_times ))

    remining_points=$(( $N - $try_points - $transform_points ))
    if [ $(( $remining_points % $PENA_DROP_POINT )) -eq 0 ]; then
      penaltie_or_drop_times=$(( $remining_points / $PENA_DROP_POINT ))
      combinations=( "$try_times $transformation_times $penaltie_or_drop_times" "${combinations[@]}" )
    fi
  done
done

# echo "tries transformations penalties"

for (( i=0; i<${#combinations[*]}; i++ )); do
  echo ${combinations[$i]}
done

