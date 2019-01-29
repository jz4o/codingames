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
        ArrayList<HashMap<String, Integer>> strengths = new ArrayList<HashMap<String, Integer>>();
        for (int i = 0; i < N; i++) {
            int V = in.nextInt();
            int E = in.nextInt();

            HashMap hashMap = new HashMap();
            hashMap.put("v", V);
            hashMap.put("e", E);

            strengths.add(hashMap);
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        Integer minDiff = null;
        for (int leftIndex = 0; leftIndex < strengths.size(); leftIndex++) {
            for (int rightIndex = leftIndex + 1; rightIndex < strengths.size(); rightIndex++) {
                HashMap left = strengths.get(leftIndex);
                HashMap right = strengths.get(rightIndex);

                int vDiff = Math.abs((int) right.get("v") - (int) left.get("v"));
                int eDiff = Math.abs((int) right.get("e") - (int) left.get("e"));
                int diff = vDiff + eDiff;

                if (minDiff == null || (diff >= 0 && diff < minDiff)) {
                    minDiff = diff;
                }
            }
        }

        // System.out.println("42");
        System.out.println(minDiff);
    }
}
