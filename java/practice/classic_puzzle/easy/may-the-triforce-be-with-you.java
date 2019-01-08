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

        final int WIDTH = N * 4 - 1;

        ArrayList<String> upperParts = new ArrayList<String>();
        ArrayList<String> lowerParts = new ArrayList<String>();
        for (int i=1; i<=N; i++) {
            String part = stringRepeat("*", i * 2 - 1);

            String upperLeftSpacePart = stringRepeat(" ", (WIDTH - part.length()) / 2);
            upperParts.add(upperLeftSpacePart + part);

            String spacePart = stringRepeat(" ", (N - i + 1) * 2 - 1);
            String lowerPart = part + spacePart + part;
            String lowerLeftSpacePart = stringRepeat(" ", (WIDTH - lowerPart.length()) / 2);
            lowerParts.add(lowerLeftSpacePart + lowerPart);
        }
        upperParts.set(0, "." + upperParts.get(0).substring(1));

        // System.out.println("answer");

        for (String upperPart : upperParts) {
            System.out.println(upperPart);
        }
        for (String lowerPart : lowerParts) {
            System.out.println(lowerPart);
        }
    }

    public static String stringRepeat(final String string, final int count) {
        String result = "";
        for (int i=0; i<count; i++) {
            result += string;
        }

        return result;
    }
}
