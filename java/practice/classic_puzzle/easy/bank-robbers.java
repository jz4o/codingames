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
        int R = in.nextInt();
        int V = in.nextInt();

        int[] robbers = new int[R];
        for (int i = 0; i < R; i++) {
            robbers[i] = 0;
        }

        for (int i = 0; i < V; i++) {
            int C = in.nextInt();
            int N = in.nextInt();

            double vaultTime = Math.pow(10, N) * Math.pow(5, C - N);
            robbers[minValueIndex(robbers)] += vaultTime;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        // System.out.println("1");
        System.out.println(maxValue(robbers));
    }

    public static Integer maxValue(final int[] array) {
        if (array.length <= 0) {
            return null;
        }

        int result = array[0];
        for (int i = 0; i < array.length; i++) {
            int value = array[i];
            if (value > result) {
                result = value;
            }
        }

        return result;
    }

    public static Integer minValueIndex(final int[] array) {
        if (array.length <= 0) {
            return null;
        }

        int minValue = array[0];
        int result = 0;
        for (int i = 0; i < array.length; i++) {
            int value = array[i];
            if (value < minValue) {
                minValue = value;
                result = i;
            }
        }

        return result;
    }
}
