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
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String B = in.nextLine();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        ArrayList<Integer> freeIndexes = new ArrayList<Integer>();
        for (int i = 0; i < N; i++) {
            freeIndexes.add(i);
        }

        ArrayList<Integer> goRightIndexes = new ArrayList<Integer>();
        ArrayList<Integer> goLeftIndexes  = new ArrayList<Integer>();
        String[] chars = B.split("");
        for (int i = 0; i < chars.length; i++) {
            if (chars[i].equals("!")) {
                goRightIndexes.add(i);
                goLeftIndexes.add(i);
            }
        }

        while (freeIndexes.size() > 1) {
            freeIndexes.removeAll(goRightIndexes);
            freeIndexes.removeAll(goLeftIndexes);

            for (int i = 0; i < goLeftIndexes.size(); i++) {
                goLeftIndexes.set(i, goLeftIndexes.get(i) - 1);
            }
            for (int i = 0; i < goRightIndexes.size(); i++) {
                goRightIndexes.set(i, goRightIndexes.get(i) + 1);
            }
        }

        // System.out.println("0");
        System.out.println(freeIndexes.get(0));
    }
}
