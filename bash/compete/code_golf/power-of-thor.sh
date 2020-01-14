read a b c d
while true;do
e=''
if [ $b -lt $d ];then
e=N
let d--
elif [ $b -gt $d ];then
e=S
let d++
fi
if [ $a -lt $c ];then
e+=W
let c--
elif [ $a -gt $c ];then
e+=E
let c++
fi
echo $e
done
