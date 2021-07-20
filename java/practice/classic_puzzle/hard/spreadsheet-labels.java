import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    private final static String[] ALPHAS = new String[] {
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
        "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
        "U", "V", "W", "X", "Y", "Z"
    };

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        String[] labels = new String[n];
        for (int i = 0; i < n; i++) {
            String label = in.next();
            labels[i] = label;
        }

        ArrayList<String> result = new ArrayList<String>();
        for (String label : labels) {
            try {
                result.add(intLabelToAlphaLabel(Long.parseLong(label)));
            } catch (NumberFormatException e) {
                result.add(String.valueOf(alphaLabelToIntLabel(label)));
            }
        }

        System.out.println(String.join(" ", result));
    }

    private static String intLabelToAlphaLabel(long intLabel) {
        String result = "";
        while (intLabel > 0) {
            long i = intLabel % ALPHAS.length;
            intLabel = intLabel / ALPHAS.length;
            if (i == 0) {
                i = ALPHAS.length;
                intLabel--;
            }

            result = ALPHAS[(int)i - 1] + result;
        }

        return result;
    }

    private static final long alphaLabelToIntLabel(String alphaLabel) {
        long result = 0;

        final List alphasList = Arrays.asList(ALPHAS);

        String[] chars = alphaLabel.split("");
        int charsLength = chars.length;
        for (int i = 0; i < charsLength; i++) {
            double baseNumber = Math.pow(ALPHAS.length, i);
            int alphaIndex = alphasList.indexOf(chars[charsLength - 1 - i]) + 1;

            result += baseNumber * alphaIndex;
        }

        return result;
    }
}
