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
        int allSum = 0;
        int [][] grid = new int[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                int c = in.nextInt();

                grid[i][j] = c;
                allSum += c;
            }
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int expectSum = 0;
        int maxIntInGrid = (int) Math.pow(n, 2);
        for (int i = 1; i <= maxIntInGrid; i++) {
            expectSum += i;
        }
        boolean isCheckAllSum = allSum == expectSum;
        boolean isCheckSums = isEqualsSums(grid);

        // System.out.println("answer");
        System.out.println(isCheckAllSum && isCheckSums ? "MAGIC" : "MUGGLE");
    }

    private static final boolean isEqualsSums(final int[][] array) {
        boolean result = true;
        int size = array.length;

        // counter
        int[] lineSums = new int[size];
        int[] columnSums = new int[size];
        for (int i = 0; i < size; i++) {
            lineSums[i] = 0;
            columnSums[i] = 0;
        }
        int leftTopToRightBottomSum = 0;
        int leftBottomToRightTopSum = 0;

        // count
        for (int h = 0; h < size; h++) {
            for (int w = 0; w < size; w++) {
                int value = array[h][w];
                lineSums[h] += value;
                columnSums[w] += value;
                if (h == w) { leftTopToRightBottomSum += value; }
                if (h + w + 1 == size) { leftBottomToRightTopSum += value; }
            }
        }

        // check
        result &= leftTopToRightBottomSum == leftBottomToRightTopSum;
        for (int i = 0; i < size; i++) {
            result &= leftTopToRightBottomSum == lineSums[i];
            result &= leftTopToRightBottomSum == columnSums[i];
        }

        return result;
    }
}
