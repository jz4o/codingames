package main
import ."fmt"
func main(){var a,b,c,d,g int;Scan(&a,&b,&c,&d);e:=c;f:=d
for{Scan(&g);h:=""
if b<f{f--;h="N"}
if f<b{f++;h="S"}
if a<e{e--;h+="W"}
if e<a{e++;h+="E"}
Println(h)}}
