read -r _ _ _ _ a _ _ b
declare -A c=()
for((d=0;d<$b;d++));do
read -r e f
c[$e]=$f
done
while true;do
read -r g h i
j=${c[$g]}
if [ "$j" = "" ];then
j=$a
fi
k=0
if [ $j -lt $h ] && [ $i = LEFT ];then
k=1
fi
if [ $j -gt $h ] && [[ $i =~ R ]];then
k=1
fi
if [ $k -eq 1 ] || [ $j -eq $h ];then
echo WAIT
else
echo BLOCK
fi
done
