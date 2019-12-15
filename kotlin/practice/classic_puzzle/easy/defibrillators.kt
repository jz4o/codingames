import java.util.*
import java.io.*
import java.math.*

import kotlin.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val LON = input.next()
    val LAT = input.next()
    val N = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    var defibs: Array<String?> = arrayOfNulls(N)
    for (i in 0 until N) {
        val DEFIB = input.nextLine()
        defibs[i] = DEFIB
    }

    // Write an action using println()
    // To debug: System.err.println("Debug messages...");

    val lon: Double = LON.replace(",", ".").toDouble()
    val lat: Double = LAT.replace(",", ".").toDouble()

    var defibMaps: Array<MutableMap<String, Any>?> = arrayOfNulls(N)
    for (i in 0..(defibs.size - 1)) {
        val defib = defibs[i]
        if (defib == null) {
            continue
        }

        val defibMapElements: List<String> = defib.split(";")
        var defibMap: MutableMap<String, Any> = mutableMapOf()
        defibMap.put("id"  ,      defibMapElements[0])
        defibMap.put("name",      defibMapElements[1])
        defibMap.put("address",   defibMapElements[2])
        defibMap.put("phone",     defibMapElements[3])
        defibMap.put("longitude", defibMapElements[4].replace(",", ".").toDouble())
        defibMap.put("latitude",  defibMapElements[5].replace(",", ".").toDouble())

        defibMaps[i] = defibMap
    }

    var nearDefib: MutableMap<String, Any> = defibMaps.get(0)!!
    var nearDistance: Double = 10000.0
    for (defibMap in defibMaps) {
        if (defibMap == null) {
            continue
        }
        val longitude: Double = defibMap.get("longitude").toString().toDouble()
        val latitude: Double  = defibMap.get("latitude").toString().toDouble()
        val x: Double = (lon - longitude) * cos((latitude + lat) / 2)
        val y: Double = lat - latitude
        val d: Double = sqrt(x * x + y * y)

        if (d < nearDistance) {
            nearDistance = d
            nearDefib = defibMap
        }
    }

    // println("answer")
    println(nearDefib.get("name") ?: "")
}
