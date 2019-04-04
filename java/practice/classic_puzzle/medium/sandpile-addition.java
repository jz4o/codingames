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
        int n = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }

        int[][] grid = new int[n][n];
        for (int i = 0; i < n; i++) {
            String row = in.nextLine();
            String[] rowValues = row.split("");
            for (int j = 0; j < n; j++) {
                grid[i][j] += Integer.parseInt(rowValues[j]);
            }
        }
        for (int i = 0; i < n; i++) {
            String row = in.nextLine();
            String[] rowValues = row.split("");
            for (int j = 0; j < n; j++) {
                grid[i][j] += Integer.parseInt(rowValues[j]);
            }
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        final int border = 4;
        int checkCount = 0;
        int massCount = (int) Math.pow(n, 2);

        while (checkCount < massCount) {
            for (int rowIndex = 0; rowIndex < n; rowIndex++) {
                for (int columnIndex = 0; columnIndex < n; columnIndex++) {
                    if (grid[rowIndex][columnIndex] < border) {
                        checkCount++;
                        continue;
                    }

                    checkCount = 0;
                    grid[rowIndex][columnIndex] -= border;
                    if (rowIndex > 0)        { grid[rowIndex - 1][columnIndex]++; }
                    if (rowIndex < n - 1)    { grid[rowIndex + 1][columnIndex]++; }
                    if (columnIndex > 0)     { grid[rowIndex][columnIndex - 1]++; }
                    if (columnIndex < n - 1) { grid[rowIndex][columnIndex + 1]++; }
                }
            }
        }

        // System.out.println("answer");
        for (int[] line : grid) {
            for (int value : line) {
                System.out.print(value);
            }
            System.out.print("\n");
        }
    }
}
