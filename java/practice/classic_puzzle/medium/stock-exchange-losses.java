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
        int[] inputs = new int[n];
        for (int i = 0; i < n; i++) {
            int v = in.nextInt();
            inputs[i] = v;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int maxValue = 0;
        int maxDiff  = 0;
        for (int index = 0; index < inputs.length; index++) {
            int input = inputs[index];
            if (index >= inputs.length - 1) {
                break;
            }
            if (maxValue >= input) {
                continue;
            }

            maxValue = input;

            int minValue = inputs[index + 1];
            for (int i = index + 1; i < inputs.length; i++) {
                if (minValue > inputs[i]) {
                    minValue = inputs[i];
                }
            }

            int diff = minValue - input;
            if (maxDiff > diff) {
                maxDiff = diff;
            }
        }

        // System.out.println("answer");
        System.out.println(maxDiff);
    }
}
