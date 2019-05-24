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
        int C = in.nextInt();
        int[] budgets = new int[N];
        for (int i = 0; i < N; i++) {
            int B = in.nextInt();
            budgets[i] = B;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int budgetsSum = 0;
        for (int budget : budgets) {
            budgetsSum += budget;
        }

        ArrayList<String> results = new ArrayList<String>();
        if (budgetsSum < C) {
            results.add("IMPOSSIBLE");
        } else {
            int lack = C;
            Arrays.sort(budgets);
            for (int i = 0; i < budgets.length; i++) {
                int average = lack / (budgets.length - i);
                int pay = Math.min(budgets[i], average);
                lack -= pay;
                results.add(String.valueOf(pay));
            }
        }

        // System.out.println("IMPOSSIBLE");
        for (String result : results) {
            System.out.println(result);
        }
    }
}
