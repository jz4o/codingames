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
        int r1 = in.nextInt();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        boolean isSuccess = false;
        for (int i = r1 - 1; i > 0; i--) {
            int iSum = 0;
            for (char c : String.valueOf(i).toCharArray()) {
                iSum += Integer.parseInt(String.valueOf(c));
            }

            if (i + iSum == r1) {
                isSuccess = true;
                break;
            }
        }

        // System.out.println("YES|NO");
        System.out.println(isSuccess ? "YES" : "NO");
    }
}
