package main
import ."fmt"
func main(){
var a,b,c,d,e,f,g,h int
Scan(&a,&b,&c,&d,&e,&f,&g,&h)
j:=[]int{}
k:=[]int{}
for i:=0;i<h;i++{var l,m int
Scan(&l,&m)
j=append(j,l)
k=append(k,m)}
for{var n,o int
var p string
Scan(&n,&o,&p)
q:=e
for i:=0;i<len(j);i++{if j[i]==n{q=k[i]
break}}
t:="BLOCK"
if(q<o&&p=="LEFT")||(o<q&&p=="RIGHT")||q==o{t="WAIT"}
Println(t)}}
