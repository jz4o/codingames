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
        int W = in.nextInt();
        int H = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String[][] grid = new String[H][W];
        for (int i = 0; i < H; i++) {
            String ROW = in.nextLine();
            grid[i] = ROW.split("");
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int maxScore = 0;
        for (int rowIndex = 0; rowIndex < H - 1; rowIndex++) {
            for (int columnIndex = 0; columnIndex < W - 1; columnIndex++) {
                // check block can placed?
                if (grid[rowIndex][columnIndex].equals("#") ||
                    grid[rowIndex][columnIndex + 1].equals("#") ||
                    grid[rowIndex + 1][columnIndex].equals("#") ||
                    grid[rowIndex + 1][columnIndex + 1].equals("#")) {
                    continue;
                }

                // grid with block placed.
                String[][] cloneGrid = new String[H][W];
                for (int i = 0; i < H; i++) {
                    cloneGrid[i] = grid[i].clone();
                }
                cloneGrid[rowIndex][columnIndex]         = "#";
                cloneGrid[rowIndex][columnIndex + 1]     = "#";
                cloneGrid[rowIndex + 1][columnIndex]     = "#";
                cloneGrid[rowIndex + 1][columnIndex + 1] = "#";

                // count columns and rows that could be completed.
                int score = getCompletedRowOrColumnCount(cloneGrid);
                if (score > maxScore) {
                    maxScore = score;
                }
            }
        }

        // System.out.println("answer");
        System.out.println(maxScore);
    }

    public static final int getCompletedRowOrColumnCount(String[][] grid) {
        final int height = grid.length;
        final int width  = grid[0].length;
        int count = 0;

        // horizontal
        rowLoop:
        for (int rowIndex = 0; rowIndex < height; rowIndex++) {
            for (int columnIndex = 0; columnIndex < width; columnIndex++) {
                if (grid[rowIndex][columnIndex].equals(".")) {
                    continue rowLoop;
                }
            }
            count++;
        }

        // vertical
        columnLoop:
        for (int columnIndex = 0; columnIndex < width; columnIndex++) {
            for (int rowIndex = 0; rowIndex < height; rowIndex++) {
                if (grid[rowIndex][columnIndex].equals(".")) {
                    continue columnLoop;
                }
            }
            count++;
        }

        return count;
    }
}
