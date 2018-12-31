# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# surfaceN: the number of points used to draw the surface of Mars.
read -r surfaceN
land_xs=()
land_ys=()
for (( i=0; i<$surfaceN; i++ )); do
  # landX: X coordinate of a surface point. (0 to 6999)
  # landY: Y coordinate of a surface point. By linking all the points together in a sequential fashion, you form the surface of Mars.
  read -r landX landY
  land_xs+=( landX )
  land_xs+=( landY )
done

# game loop
while true; do
  # hSpeed: the horizontal speed (in m/s), can be negative.
  # vSpeed: the vertical speed (in m/s), can be negative.
  # fuel: the quantity of remaining fuel in liters.
  # rotate: the rotation angle in degrees (-90 to 90).
  # power: the thrust power (0 to 4).
  read -r X Y hSpeed vSpeed fuel rotate power

  # Write an action using echo
  # To debug: echo "Debug messages..." >&2

  if [ $vSpeed -le -40 ]; then
    v_power=4
  else
    v_power=0
  fi

  # 2 integers: rotate power. rotate is the desired rotation angle (should be 0 for level 1), power is the desired thrust power (0 to 4).
  # echo "0 3"

  echo "0 $v_power"
done

