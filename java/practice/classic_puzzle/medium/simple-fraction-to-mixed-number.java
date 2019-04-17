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
        String[] xYs = new String[N];
        for (int i = 0; i < N; i++) {
            String xY = in.next();
            xYs[i] = xY;
        }
        for (int i = 0; i < N; i++) {

            // Write an action using System.out.println()
            // To debug: System.err.println("Debug messages...");

            String[] xYElements = xYs[i].split("/");
            int x = Integer.parseInt(xYElements[0]);
            int y = Integer.parseInt(xYElements[1]);

            if (y == 0) {
                System.out.println("DIVISION BY ZERO");
                continue;
            }

            int integer = x / y;
            x %= y;

            String integerStr = "";
            if (integer != 0) {
                integerStr += integer;
            }

            String rationalStr = "";
            if (x != 0) {
                int gcd = gcd(x, y);
                x /= gcd;
                y /= gcd;

                boolean minusFlg = integer < 0;
                if (x < 0) { minusFlg = !minusFlg; x = -x; }
                if (y < 0) { minusFlg = !minusFlg; y = -y; }
                rationalStr += minusFlg ? "-" : "";
                rationalStr += x + "/" + y;
            }

            String result = (integerStr + " " + rationalStr).trim();

            // System.out.println("answer");
            System.out.println(result.isEmpty() ? "0" : result);
        }
    }

    public static int gcd(int x, int y) {
        int tmp;
        while ((tmp = x % y) != 0) {
            x = y;
            y = tmp;
        }

        return y;
    }
}
