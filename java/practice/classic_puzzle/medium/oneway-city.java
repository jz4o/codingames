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
        int M = in.nextInt();
        int N = in.nextInt();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int shortDistance = Math.min(M, N) - 1;
        int longDistance  = Math.max(M, N) - 1;

        // one way city
        if (shortDistance <= 0) {
            System.out.println(1);
            return;
        }

        BigInteger moleCombination = new BigInteger("1");
        for (long i = longDistance + 1; i <= shortDistance + longDistance; i++) {
            moleCombination = moleCombination.multiply(new BigInteger(String.valueOf(i)));
        }
        BigInteger denoCombination = new BigInteger("1");
        for (long i = 1; i <= shortDistance; i++) {
            denoCombination = denoCombination.multiply(new BigInteger(String.valueOf(i)));
        }

        BigInteger movableCombination = moleCombination.divide(denoCombination);
        String significantDigits = String.valueOf(movableCombination);
        if (significantDigits.length() > 1000) {
            significantDigits = significantDigits.substring(0, 1000);
        }

        // System.out.println("answer");
        System.out.println(significantDigits);
    }
}
