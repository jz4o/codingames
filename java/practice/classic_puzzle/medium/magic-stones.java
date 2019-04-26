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
        // HashMap<Level, Count>
        HashMap<Integer, Integer> stoneCounts = new HashMap<Integer, Integer>();
        for (int i = 0; i < N; i++) {
            int level = in.nextInt();
            if (!stoneCounts.containsKey(level)) {
                stoneCounts.put(level, 0);
            }

            stoneCounts.put(level, stoneCounts.get(level) + 1);
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int stoneCount = 0;
        while (!stoneCounts.isEmpty()) {
            // minimum level in stoneCounts
            int targetLevel         = (int) stoneCounts.keySet().toArray()[0];
            int targetNextLevel     = targetLevel + 1;
            int targetStoneCount    = stoneCounts.get(targetLevel);
            int nextLevelStoneCount = targetStoneCount / 2;
            targetStoneCount %= 2;

            stoneCount += targetStoneCount;
            stoneCounts.remove(targetLevel);

            if (nextLevelStoneCount != 0) {
                if (!stoneCounts.containsKey(targetNextLevel)) {
                    stoneCounts.put(targetNextLevel, 0);
                }
                stoneCounts.put(targetNextLevel, stoneCounts.get(targetNextLevel) + nextLevelStoneCount);
            }
        }

        // System.out.println("1");
        System.out.println(stoneCount);
    }
}
