import java.util.*;
import java.io.*;
import java.math.*;
import java.util.stream.Collectors;

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

        ArrayList<Integer> initialArray = new ArrayList<>();
        for (int i = 1; i <= N; i++) {
            initialArray.add(i);
        }
        final int centerIndex = initialArray.size() / 2;
        ArrayList<Integer> array = (ArrayList<Integer>) initialArray.clone();
        ArrayList<String> progressLog = new ArrayList<String>();

        for (int i = 0; i < N; i++) {
            ArrayList<Integer> frontHalf = new ArrayList<Integer>();
            ArrayList<Integer> backHalf  = new ArrayList<Integer>();
            for (int j = 0; j < array.size(); j++) {
                if (j < centerIndex) {
                    frontHalf.add(array.get(j));
                } else {
                    backHalf.add(array.get(j));
                }
            }

            array.clear();

            Collections.reverse(backHalf);
            for (int j = 0; j < Math.max(frontHalf.size(), backHalf.size()); j++) {
                if (j < backHalf.size()) {
                    array.add(backHalf.get(j));
                }

                if (j < frontHalf.size()) {
                    array.add(frontHalf.get(j));
                }
            }

            progressLog.add(array.stream().map(String::valueOf).collect(Collectors.joining(",")));
        }

        // System.out.println("IMPOSSIBLE");
        String result = array.equals(initialArray) ? String.join("\n", progressLog) : "IMPOSSIBLE";
        System.out.println(result);
    }
}
