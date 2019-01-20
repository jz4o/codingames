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

        int mapW = W + 2;
        int mapH = H + 2;

        int[][] map = new int[mapH][mapW];

        // fill around of map with one
        for (int i = 0; i < mapH; i++) { map[i][0] = map[i][mapW - 1] = 1; }
        for (int i = 0; i < mapW; i++) { map[0][i] = map[mapH - 1][i] = 1; }

        // input value into map
        for (int i = 0; i < H; i++) {
            for (int j = 0; j < W; j++) {
                int v = in.nextInt();
                map[i + 1][j + 1] = v;
            }
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        Integer treasureLineIndex = null;
        Integer treasureMassIndex = null;

        treasureSearchLoop:
        for (int lineIndex = 1; lineIndex < mapH - 1; lineIndex++) {
            for (int massIndex = 1; massIndex < mapW - 1; massIndex++) {
                Integer[] aroundMasses = {
                    map[lineIndex - 1][massIndex - 1],   // upper left
                    map[lineIndex - 1][massIndex],       // up
                    map[lineIndex - 1][massIndex + 1],   // upper right
                    map[lineIndex][massIndex - 1],       // left
                    map[lineIndex][massIndex + 1],       // right
                    map[lineIndex + 1][massIndex - 1],   // bottom left
                    map[lineIndex + 1][massIndex],       // under
                    map[lineIndex + 1][massIndex + 1]    // bottom right
                };

                boolean isHereZero = map[lineIndex][massIndex] == 0;
                boolean isNotFoundZeroWithAround = !Arrays.asList(aroundMasses).contains(0);

                if (isHereZero && isNotFoundZeroWithAround) {
                    treasureLineIndex = lineIndex - 1;
                    treasureMassIndex = massIndex - 1;

                    break treasureSearchLoop;
                }
            }
        }

        // System.out.println("x y");
        System.out.println(treasureMassIndex + " " + treasureLineIndex);
    }
}
