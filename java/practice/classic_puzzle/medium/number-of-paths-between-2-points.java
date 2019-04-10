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
        int M = in.nextInt();
        int N = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }

        int[][] grid = new int[M + 1][N + 1];

        // initialize wall row and column.
        for (int i = 0; i <= N; i++) { grid[0][i] = 1; }
        for (int i = 0; i <= M; i++) { grid[i][0] = 1; }

        // initialize map.
        for (int i = 0; i < M; i++) {
            String ROW = in.nextLine();
            String[] values = ROW.split("");

            for (int j = 0; j < values.length; j++) {
                grid[i + 1][j + 1] = Integer.parseInt(values[j]);
            }
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int[][] pathGrid = new int[M + 1][N + 1];
        // only one route of start position. and put wall for don't process start position
        grid[1][1] = pathGrid[1][1] = 1;
        for (int rowIndex = 1; rowIndex <= M; rowIndex++) {
            for (int columnIndex = 1; columnIndex <= N; columnIndex++) {
                if (grid[rowIndex][columnIndex] != 0) {
                    continue;
                }

                int topMassPaths = pathGrid[rowIndex - 1][columnIndex];
                int leftMassPaths = pathGrid[rowIndex][columnIndex - 1];
                pathGrid[rowIndex][columnIndex] = topMassPaths + leftMassPaths;
            }
        }

        // System.out.println("answer");
        System.out.println(pathGrid[M][N]);
    }
}
