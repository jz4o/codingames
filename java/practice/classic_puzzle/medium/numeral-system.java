import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    final static String NUMERAL_STRING = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        String equality = in.nextLine();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String[] xyz = equality.split("[\\+=]");
        final String x = xyz[0];
        final String y = xyz[1];
        final String z = xyz[2];

        int maxNumeralIndex = -1;
        for (String equalityChar : equality.split("")) {
            int numeralIndex = NUMERAL_STRING.indexOf(equalityChar);
            if (numeralIndex > maxNumeralIndex) {
                maxNumeralIndex = numeralIndex;
            }
        }
        maxNumeralIndex++;

        int result = -1;
        for (int i = maxNumeralIndex; i <= NUMERAL_STRING.length(); i++) {
            long numeralX = Long.parseLong(x, i);
            long numeralY = Long.parseLong(y, i);
            long numeralZ = Long.parseLong(z, i);
            if (numeralX + numeralY == numeralZ) {
                result = i;
                break;
            }
        }

        // System.out.println("answer");
        System.out.println(result);
    }
}
