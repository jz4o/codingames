import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt(); // the number of temperatures to analyse
        Integer closestZeroNegative = null;
        Integer closestZeroPositive = null;
        for (int i = 0; i < n; i++) {
            int t = in.nextInt(); // a temperature expressed as an integer ranging from -273 to 5526

            if (t == 0) {
                closestZeroNegative = t;
                closestZeroPositive = t;
            } else if (t < 0 && (closestZeroNegative != null ? closestZeroNegative : -273) <= t) {
                closestZeroNegative = t;
            } else if (0 < t && t <= (closestZeroPositive != null ? closestZeroPositive : 5526)) {
                closestZeroPositive = t;
            }
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        // System.out.println("result");

        int npBalance = 0;
        if (closestZeroNegative != null) npBalance += closestZeroNegative;
        if (closestZeroPositive != null) npBalance += closestZeroPositive;

        if (n == 0) {
            System.out.println(0);
        } else if (closestZeroPositive == null || closestZeroNegative == null) {
            System.out.println(npBalance);
        } else if (npBalance <= 0) {
            System.out.println(closestZeroPositive);
        } else {
            System.out.println(closestZeroNegative);
        }
    }
}
