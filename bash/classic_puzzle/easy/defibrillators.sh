# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r LON
LON=`echo $LON | tr ',' '.'`
read -r LAT
LAT=`echo $LAT | tr ',' '.'`
read -r N
defibs=()
for (( i=0; i<$N; i++ )); do
  read -r DEFIB
  defibs+=( "$DEFIB" )
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

# echo "answer"

IFS=';'
distance=10000
for (( i=0; i<$N; i++ )); do
  read -r id name address phone longitude latitude <<< "${defibs[i]}"
  longitude=`echo $longitude | tr ',' '.'`
  latitude=`echo $latitude | tr ',' '.'`

  x=`bc -l <<< "($LON - $longitude) * c(($latitude + $LAT) / 2)"`
  y=`bc -l <<< "$LAT - $latitude"`
  d=`bc -l <<< "sqrt($x*$x + $y*$y) * 6371"`

  if [ `bc <<< "$d < $distance"` -eq 1 ] || [ -z "$near_defib_name" ]; then
    distance=$d
    near_defib_name=$name
  fi
done

echo $near_defib_name

