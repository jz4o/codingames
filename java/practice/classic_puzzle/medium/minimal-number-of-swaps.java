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
        String inputs = "";
        for (int i = 0; i < n; i++) {
            int x = in.nextInt();
            inputs += x;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int lIndex = -1;
        int rIndex = inputs.length();
        int turn = 0;
        while (lIndex < rIndex) {
            // next zero from left
            lIndex++;
            while (lIndex < inputs.length() && inputs.charAt(lIndex) != '0') {
                lIndex++;
            }

            // next one from right
            rIndex--;
            while (rIndex >= 0 && inputs.charAt(rIndex) != '1') {
                rIndex--;
            }

            turn++;
        }

        // System.out.println("answer");
        System.out.println(turn - 1);
    }
}
