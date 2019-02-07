import java.util.*;
import java.util.stream.Collectors;
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
        ArrayList<Integer> inputs = new ArrayList<Integer>();
        for (int i = 0; i < N; i++) {
            int l = in.nextInt();
            inputs.add(l);
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        ArrayList<ArrayList<Integer>> lists = new ArrayList<ArrayList<Integer>>();
        for (int i : inputs) {
            for (ArrayList<Integer> list : lists) {
                int lastInt = list.get(list.size() - 1);
                if (list.size() >= 1 && lastInt == i - 1) {
                    list.add(i);
                }
            }

            lists.add(new ArrayList<Integer>(Arrays.asList(i)));
        }

        int maxSize = 0;
        ArrayList<Integer> result = new ArrayList<Integer>();
        for (ArrayList<Integer> list : lists) {
            if (list.size() >= maxSize) {
                maxSize = list.size();
                result = list;
            }
        }

        String output = result.stream().map(Object::toString).collect(Collectors.joining(" "));

        // System.out.println("1 2 3 4 5");
        System.out.println(output);
    }
}
