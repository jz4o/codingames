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
        String n1 = in.nextLine();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        final int digitsSize = n1.length();
        ArrayList<String> answers = new ArrayList<String>();

        final String n1Format = "%0" + digitsSize + "d";

        while (!answers.contains(n1)) {
            answers.add(n1);

            String[] n1Chars = n1.split("");
            Arrays.sort(n1Chars);
            int rightInt = Integer.parseInt(String.join("", n1Chars));
            Collections.reverse(Arrays.asList(n1Chars));
            int leftInt = Integer.parseInt(String.join("", n1Chars));
            int answer = leftInt - rightInt;

            n1 = String.format(n1Format, answer);
        }

        // System.out.println("1 2 3 4");
        int index = answers.indexOf(n1);
        System.out.println(String.join(" ", answers.subList(index, answers.size())));
    }
}
