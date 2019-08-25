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
        int n = in.nextInt();
        int k = in.nextInt();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        ArrayList<ArrayList<Integer>> results = new ArrayList<ArrayList<Integer>>();
        ArrayList<ArrayList<Integer>> temps = new ArrayList<ArrayList<Integer>>();
        for (int i = 1; i <= k; i++) {
            temps.add(new ArrayList<Integer>(Arrays.asList(i)));
        }

        while (temps.size() > 0) {
            ArrayList<Integer> temp = temps.remove(temps.size() - 1);
            int sum = 0;
            for (Integer i : temp) {
                sum += i;
            }

            if (sum == n) {
                results.add(temp);
            } else if (sum < n) {
                for (int i = 1; i <= k; i++) {
                    ArrayList<Integer> t = new ArrayList<Integer>(temp);
                    t.add(i);
                    temps.add(t);
                }
            }
        }

        // System.out.println("answer");
        for (int i = results.size() - 1; i >= 0; i--) {
            String result = results.get(i).stream()
                                          .map(String::valueOf)
                                          .collect(Collectors.joining(" "));
            System.out.println(result);
        }
    }
}
