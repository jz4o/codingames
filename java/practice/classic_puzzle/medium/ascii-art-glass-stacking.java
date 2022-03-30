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

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        final String[] GLASS_PARTS = {
            " *** ",
            " * * ",
            " * * ",
            "*****"
        };

        int stage = 0;
        while (N >= stage + 1) {
            N -= ++stage;
        }

        final int WIDTH = stage * GLASS_PARTS[0].length() + stage - 1;

        String[] results = new String[GLASS_PARTS.length * stage];
        for (int step = 1; step <= stage; step++) {
            for (int glassStep = 0; glassStep < GLASS_PARTS.length; glassStep++) {
                String glassPart = GLASS_PARTS[glassStep];
                String[] glassParts = new String[step];
                for (int i = 0; i < step; i++) {
                    glassParts[i] = glassPart;
                }

                String result     = String.join(" ", glassParts);
                String leftSpace  = stringRepeat(" ", (WIDTH - result.length()) / 2);
                String rightSpace = stringRepeat(" ", WIDTH - result.length() - leftSpace.length());
                results[(step - 1) * GLASS_PARTS.length + glassStep] = leftSpace + result + rightSpace;
            }
        }

        // System.out.println("answer");
        System.out.println(String.join("\n", results));
    }

    public static String stringRepeat(final String string, final int count) {
        String result = "";
        for (int i = 0; i < count; i++) {
            result += string;
        }

        return result;
    }
}
