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
        int[] pis = new int[N];
        for (int i = 0; i < N; i++) {
            int pi = in.nextInt();
            pis[i] = pi;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int diff = 10000000 - 0;
        Arrays.sort(pis);
        for (int i = 0; i < N - 1; i++) {
            int d = pis[i + 1] - pis[i];
            if (d < diff) {
                diff = d;
            }
        }

        // System.out.println("answer");
        System.out.println(diff);
    }
}
