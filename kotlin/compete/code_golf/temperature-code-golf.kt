import java.util.*
fun main(a:Array<String>){
val b=Scanner(System.`in`)
val c=(0..b.nextInt()-1).map{b.nextInt()}
val d=c.map{Math.abs(it)}.min()
println(if(d==null)0 else if(c.contains(d))d else-d)}
