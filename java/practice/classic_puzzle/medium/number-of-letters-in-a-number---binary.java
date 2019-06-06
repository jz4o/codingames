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
        long start = in.nextLong();
        long n = in.nextLong();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        final int[] stringSizes = new int[] { "zero".length(), "one".length() };

        for (int i = 0; i < n; i++) {
            String binary = Long.toBinaryString(start);

            int result = 0;
            for (char c : binary.toCharArray()) {
                result += stringSizes[Integer.parseInt(c + "")];
            }

            if (start == result) {
                break;
            }

            start = result;
        }

        // System.out.println("42");
        System.out.println(start);
    }
}
