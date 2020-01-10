read a
read -a b
for ((c=0;c<$a;c++));do
d=${b[$c]}
if [ $d -lt 0 ] && [ $d -ge ${e:--273} ];then
e=$d
elif [ $d -gt 0 ] && [ $d -le ${f:-5526} ];then
f=$d
elif [ $d -eq 0 ];then
e=0
f=0
fi
done
g=$((${e:-0}+${f:-0}))
if [ $a -eq 0 ];then
echo 0
elif [ -z "$f" ] || [ -z "$e" ];then
echo $f$e
elif [ $g -le 0 ];then
echo $f
elif [ $g -gt 0 ];then
echo $e
fi
