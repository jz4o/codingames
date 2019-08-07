import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    private static final String HAPPY_NUMBER = "1";
    private static final String HAPPY_FACE   = ":)";
    private static final String UNHAPPY_FACE = ":(";

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String[] xs = new String[N];
        for (int i = 0; i < N; i++) {
            String x = in.nextLine();

            xs[i] = x;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String[] results = new String[N];
        for (int i = 0; i < N; i++) {
            String x = xs[i];
            String temp = x;
            ArrayList<String> exitNumbers = new ArrayList<String>();
            exitNumbers.add(HAPPY_NUMBER);
            while (!exitNumbers.contains(temp)) {
                exitNumbers.add(temp);
                int sum = 0;
                for (String digitStr : temp.split("")) {
                    int digit = Integer.parseInt(digitStr);
                    sum += digit * digit;
                }
                temp = String.valueOf(sum);
            }
            String resultFace = temp.equals(HAPPY_NUMBER) ? HAPPY_FACE : UNHAPPY_FACE;

            results[i] = x + " " + resultFace;
        }

        // System.out.println("23 :)");
        for (String result : results) {
            System.out.println(result);
        }
    }
}
