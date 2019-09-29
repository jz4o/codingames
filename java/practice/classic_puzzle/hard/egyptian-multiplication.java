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
        int a = in.nextInt();
        int b = in.nextInt();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int high = Math.max(a, b);
        int low  = Math.min(a, b);

        ArrayList<String> results = new ArrayList<String>();

        // initial formula
        results.add(high + " * " + low);

        String addNumFormula = "";
        while (low != 0) {
            if (low % 2 == 0) {
                high *= 2;
                low  /= 2;
            } else {
                addNumFormula += " + " + high;
                low--;
            }

            // way formula
            results.add("= " + high + " * " + low + addNumFormula);
        }

        // answer
        results.add("= " + (a * b));

        // System.out.println("answer");
        for (String result : results) {
            System.out.println(result);
        }
    }
}
