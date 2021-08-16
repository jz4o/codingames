import java.util.*
fun main(z:Array<String>){val i=Scanner(System.`in`)
var(a,b,c,d)=listOf(i.nextInt(),i.nextInt(),i.nextInt(),i.nextInt())
while(true)println((if(b<d){d--;"N"}else if(d<b){d++;"S"}else "")+(if(a<c){c--;"W"}else if(c<a){c++;"E"}else ""))}
