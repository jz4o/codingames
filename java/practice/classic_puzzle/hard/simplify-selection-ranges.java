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
        String N = in.nextLine();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String[] ns = N.substring(1, N.length() - 1).split(",");
        ArrayList<Integer> numbers = new ArrayList<Integer>();
        for (String n : ns) {
            numbers.add(Integer.parseInt(n));
        }
        Collections.sort(numbers);

        ArrayList<String> results = new ArrayList<String>();
        ArrayList<Integer> temp = new ArrayList<Integer>();
        for (Integer number : numbers) {
            if (!temp.isEmpty() && (temp.get(temp.size() - 1) + 1) != number) {
                results.add(getRange(temp));
                temp.clear();
            }
            temp.add(number);
        }
        results.add(getRange(temp));

        // System.out.println("answer");
        System.out.println(String.join(",", results));
    }

    private static String getRange(final ArrayList<Integer> numbers) {
        if (numbers.size() >= 3) {
            return numbers.get(0) + "-" + numbers.get(numbers.size() - 1);
        } else {
            return numbers.stream().map(String::valueOf).collect(Collectors.joining(","));
        }
    }
}
