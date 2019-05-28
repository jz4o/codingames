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
        int N = in.nextInt();
        String startPattern = in.next();

        List<String> RDigits = Arrays.asList(String.format("%08d", Integer.parseInt(Integer.toBinaryString(R))).split(""));
        Collections.reverse(RDigits);

        startPattern = startPattern.replace("@", "1").replace(".", "0");

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        final int ruleLength = 8;
        HashMap<String, String> rule = new HashMap<String, String>();
        for (int i = 0; i < ruleLength; i++) {
            String key = String.format("%03d", Integer.parseInt(Integer.toBinaryString(i)));
            String value = String.valueOf(Integer.parseInt(RDigits.get(i)));

            rule.put(key, value);
        }

        ArrayList<String> results = new ArrayList<String>();
        for (int i = 0; i < N; i++) {
            results.add(startPattern.replace("1", "@").replace("0", "."));

            String result = "";
            String startPatternLeft = String.valueOf(startPattern.charAt(0));
            String startPatternRight = String.valueOf(startPattern.charAt(startPattern.length() - 1));
            startPattern = startPatternRight + startPattern + startPatternLeft;

            for (int j = 0; j < startPattern.length() - 2; j++) {
                String ruleKey = ""
                                + startPattern.charAt(j)
                                + startPattern.charAt(j + 1)
                                + startPattern.charAt(j + 2);
                result += rule.get(ruleKey);
            }

            startPattern = result;
        }

        // System.out.println(".....@.@.....");
        for (String result : results) {
            System.out.println(result);
        }
    }
}
