package main
import(."fmt";."os";"bufio";."strings";."strconv")
func main(){a:=bufio.NewScanner(Stdin)
a.Scan()
b,_:=Atoi(a.Text())
c:=false
d:=false
e:=-273
f:=5526
a.Scan()
for _,g:=range Split(a.Text()," "){h,_:=Atoi(g)
if h==0{e=0;f=0}else if e<=h&&h<0{e=h;c=true}else if 0<h&&h<=f{f=h;d=true}}
i:=0;if c{i+=e};if d{i+=f}
j:=0;if b==0{}else if!c||!d{j=i}else if i<=0{j=f}else{j=e}
Println(j)}
