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
        int[][] map = new int[H + 1][W + 1];
        for (int i = 1; i <= H; i++) {
            for (int j = 1; j <= W; j++) {
                int food = in.nextInt();
                map[i][j] = food;
            }
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        for (int h = 1; h <= H; h++) {
            for (int w = 1; w <= W; w++) {
                int top  = map[h - 1][w];
                int left = map[h][w - 1];

                map[h][w] += Math.max(top, left);
            }
        }

        // System.out.println("answer");
        System.out.println(map[H][W]);
    }
}
