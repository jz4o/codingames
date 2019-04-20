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
        int n = in.nextInt();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        long sum = 0;
        for (int i = 1; i <= n; i++) {
            sum += (n / i) * i;
        }

        // System.out.println("sum");
        System.out.println(sum);
    }
}
