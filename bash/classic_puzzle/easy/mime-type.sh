# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# N: Number of elements which make up the association table.
read -r N
# Q: Number Q of file names to be analyzed.
read -r Q
declare -A ext_mimes=()
for (( i=0; i<$N; i++ )); do
  # EXT: file extension
  # MT: MIME type.
  read -r EXT MT
  ext_mimes["${EXT,,}"]=$MT
done

fnames=()
for (( i=0; i<$Q; i++ )); do
  # FNAME: One file name per line.
  read -r FNAME
  fnames+=( ${FNAME,,} )
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

mime_types=()
for fname in ${fnames[*]}; do
  ext=${fname##*.}
  if ! [ -n "$ext" ]; then
    ext=" "
  fi

  mime_type=${ext_mimes["$ext"]}
  if [ "$ext" = "$fname" ] || ! [ -n "$mime_type" ]; then
    mime_types+=( 'UNKNOWN' )
  else
    mime_types+=( $mime_type )
  fi
done

# For each of the Q filenames, display on a line the corresponding MIME type. If there is no corresponding type, then display UNKNOWN.
# echo "UNKNOWN"

for mime_type in ${mime_types[*]}; do
  echo $mime_type
done

