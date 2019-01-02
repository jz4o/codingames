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
        long r1 = in.nextLong();
        long r2 = in.nextLong();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        while (r1 != r2) {
            if (r1 < r2) {
                r1 += sumDigits(r1);
            } else {
                r2 += sumDigits(r2);
            }
        }

        // System.out.println("42");

        System.out.println(r1);
    }

    public static long sumDigits(final long number) {
        long sum = 0;

        String strNumber = String.valueOf(number);
        for (int i=0; i<strNumber.length(); i++) {
            sum += Integer.parseInt(String.valueOf(strNumber.charAt(i)));
        }

        return sum;
    }
}

