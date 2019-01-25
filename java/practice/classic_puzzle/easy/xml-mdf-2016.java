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
        String sequence = in.nextLine();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        HashMap<String, ArrayList<Integer>> depths = new HashMap<String, ArrayList<Integer>>();
        int depth = 0;

        while (sequence.length() > 0) {
            String firstStr = sequence.substring(0, 1);
            sequence = sequence.substring(1);

            if (firstStr.equals("-")) {
                firstStr = sequence.substring(0, 1);
                sequence = sequence.substring(1);

                if (depths.get(firstStr) == null) {
                    depths.put(firstStr, new ArrayList<Integer>());
                }
                depths.get(firstStr).add(depth);
                depth--;
            } else {
                depth++;
            }
        }

        String maximumKey = null;
        Double maximumValue = null;
        for (Map.Entry<String, ArrayList<Integer>> entry : depths.entrySet()) {
            double sum = 0;
            for (int d : entry.getValue()) {
                sum += d == 0 ? 0 : 1.0 / d;
            }

            if (maximumValue == null || maximumValue < sum) {
                maximumKey = entry.getKey();
                maximumValue = sum;
            }
        }

        // System.out.println("answer");

        System.out.println(maximumKey);
    }
}
