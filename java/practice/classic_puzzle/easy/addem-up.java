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
        ArrayList integers = new ArrayList<Integer>();
        for (int i = 0; i < N; i++) {
            int x = in.nextInt();
            integers.add(x);
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        Integer totalCost = 0;
        while (integers.size() >= 2) {
            Collections.sort(integers);

            int firstInt = (int) integers.remove(0);
            int secondInt = (int) integers.remove(0);

            int cost = firstInt + secondInt;
            totalCost += cost;

            integers.add(cost);
        }

        // System.out.println("0");
        System.out.println(totalCost);
    }
}
