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
        int n = in.nextInt(); // the number of relationships of influence
        HashMap<Integer, ArrayList<Integer>> relationMap = new HashMap<Integer, ArrayList<Integer>>();
        for (int i = 0; i < n; i++) {
            int x = in.nextInt(); // a relationship of influence between two people (x influences y)
            int y = in.nextInt();

            if (relationMap.get(x) == null) {
                relationMap.put(x, new ArrayList<Integer>());
            }
            relationMap.get(x).add(y);
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int deepLevel = 0;
        ArrayList<Integer> targets = new ArrayList<Integer>(relationMap.keySet());
        while (targets.size() > 0) {
            deepLevel++;
            ArrayList<Integer> temp = new ArrayList<Integer>();

            for (int target : targets) {
                ArrayList<Integer> values = relationMap.get(target);
                if (values == null) {
                    continue;
                }

                temp.addAll(values);
            }
            targets = temp;
        }

        // The number of people involved in the longest succession of influences
        // System.out.println("2");
        System.out.println(deepLevel);
    }
}
