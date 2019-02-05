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
        int N = in.nextInt();
        String[] results = new String[N];
        for (int i = 0; i < N; i++) {
            String t = in.next();
            results[i] = t;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        Arrays.sort(results);

        // System.out.println("answer");
        System.out.println(results[0]);
    }
}
