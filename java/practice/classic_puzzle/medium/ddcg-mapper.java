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
        int L = in.nextInt();
        int N = in.nextInt();
        int[] patterns = new int[N];
        int[] tempos = new int[N];
        for (int i = 0; i < N; i++) {
            String pattern = in.next();
            int tempo = in.nextInt();

            pattern = pattern.replace("X", "1");

            patterns[i] = Integer.parseInt(pattern, 2);
            tempos[i] = tempo;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String[] results = new String[L];
        for (int i = 1; i <= L; i++) {
            int result = 0;
            for (int tempoIndex = 0; tempoIndex < tempos.length; tempoIndex++) {
                if (i % tempos[tempoIndex] == 0) {
                    result |= patterns[tempoIndex];
                }
            }

            int binaryResult = Integer.parseInt(Integer.toBinaryString(result));
            results[L - i] = String.format("%04d", binaryResult).replace("1", "X");
        }

        // System.out.println("answer");
        for (String result : results) {
            System.out.println(result);
        }
    }
}
