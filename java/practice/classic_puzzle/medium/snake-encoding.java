import java.util.*;
import java.io.*;
import java.math.*;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();
        int X = in.nextInt();
        String[][] grid = new String[N][N];
        for (int i = 0; i < N; i++) {
            String LINE = in.next();
            grid[i] = LINE.split("");
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        // array to string
        String charString = "";
        grid = transpose(grid);
        for (int i = 0; i < N; i++) {
            if (i % 2 == 0) {
                Collections.reverse(Arrays.asList(grid[i]));
            }
            charString += String.join("", grid[i]);
        }

        // rotate
        final int charStringLength = charString.length();
        final int rotateBeginIndex = charStringLength - X;
        final int rotateEndIndex   = rotateBeginIndex + charStringLength;
        charString = (charString + charString).substring(rotateBeginIndex, rotateEndIndex);

        // string to array
        Matcher m = Pattern.compile(".{" + N + "}").matcher(charString);
        for (int i = 0; i < N; i++) {
            m.find();
            String matchedString = m.group();
            if (i % 2 == 0) {
                matchedString = new StringBuffer(matchedString).reverse().toString();
            }
            grid[i] = matchedString.split("");
        }
        grid = transpose(grid);

        // System.out.println("answer");
        for (String[] line : grid) {
            System.out.println(String.join("", line));
        }
    }

    /**
     * example.
     *
     * input
     *
     *    1  2  3  4  5
     *    6  7  8  9 10
     *   11 12 13 14 15
     *
     * output
     *
     *   1  6 11
     *   2  7 12
     *   3  8 13
     *   4  9 14
     *   5 10 15
     */
    private static String[][] transpose(final String[][] array) {
        final int arrayRowSize = array.length;
        final int arrayColumnSize = array[0].length;
        String[][] result = new String[arrayColumnSize][arrayRowSize];

        for (int rowIndex = 0; rowIndex < arrayRowSize; rowIndex++) {
            for (int columnIndex = 0; columnIndex < arrayColumnSize; columnIndex++) {
                result[columnIndex][rowIndex] = array[rowIndex][columnIndex];
            }
        }

        return result;
    }
}
