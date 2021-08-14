package main
import ."fmt"
func main(){
var a,b,c,d,e,f,z int
Scan(&z,&z,&z,&z,&a,&z,&z,&b)
var g string
h:=[]int{}
i:=[]int{}
for z=0;z<b;z++{Scan(&c,&d)
h=append(h,c)
i=append(i,d)}
for{Scan(&e,&f,&g)
q:=a
for z=0;z<len(h);z++{if h[z]==e{q=i[z]
break}}
t:="BLOCK"
if(q<f&&g=="LEFT")||(f<q&&g[0]=='R')||q==f{t="WAIT"}
Println(t)}}
