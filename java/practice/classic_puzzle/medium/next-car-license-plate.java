import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    private final static String ALPHAS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        String x = in.nextLine();
        int n = in.nextInt();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String[] xElements = x.split("-");
        String ab = xElements[0];
        int cde = Integer.parseInt(xElements[1]);
        String fg = xElements[2];

        String alpha = ab + fg;
        int alphaInt = alphaToInt(alpha);
        cde = cde + n - 1;

        int carry = cde / 999;
        cde = cde % 999;
        alphaInt += carry;
        alpha = intToAlpha(alphaInt);

        ab = alpha.substring(0, 2);
        String cdeStr = String.format("%03d", cde + 1);
        fg = alpha.substring(alpha.length() - 2);

        // System.out.println("AA-000-AA");
        String result = String.join("-", ab, cdeStr, fg);
        System.out.println(result);
    }

    private static final int alphaToInt(final String alphaString) {
        int result = 0;

        String[] alphaElements = alphaString.split("");
        int alphaElementsSize = alphaElements.length;
        for (int i = 0; i < alphaElementsSize; i++) {
            String alpha = alphaElements[alphaElementsSize - 1 - i];
            int alphaIndex = ALPHAS.indexOf(alpha) + 1;
            result += Math.pow(ALPHAS.length(), i) * alphaIndex;
        }

        return result;
    }

    private static final String intToAlpha(int alphaInt) {
        String result = "";
        while (alphaInt > 0) {
            int i = alphaInt % ALPHAS.length();
            if (i == 0) {
                i = ALPHAS.length();
                alphaInt--;
            }
            alphaInt = alphaInt > ALPHAS.length() ? alphaInt / ALPHAS.length() : 0;

            result = ALPHAS.charAt(i - 1) + result;
        }

        return result;
    }
}
