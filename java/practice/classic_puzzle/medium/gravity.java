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
        int width = in.nextInt();
        int height = in.nextInt();
        String[][] grid = new String[height][width];
        for (int i = 0; i < height; i++) {
            String line = in.next();
            grid[i] = line.split("");
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        // count for sharp on each columns
        int[] sharpCount = new int[width];
        for (int h = 0; h < height; h++) {
            for (int w = 0; w < width; w++) {
                if (grid[h][w].equals("#")) {
                    sharpCount[w]++;
                }
            }
        }

        // fall by gravity
        for (int h = 0; h < height; h++) {
            for (int w = 0; w < width; w++) {
                grid[h][w] = h < height - sharpCount[w] ? "." : "#";
            }
        }

        // System.out.println("answer");
        for (String[] line : grid) {
            System.out.println(String.join("", line));
        }
    }
}
