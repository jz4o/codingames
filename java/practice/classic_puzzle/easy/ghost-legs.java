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
        final int elementsSize = (W /3 + 1) * 2;
        String[][] map = new String[H][elementsSize];
        for (int i = 0; i < H; i++) {
            String line = in.nextLine();
            line = "  " + line;

            for (int j = 0; j < elementsSize / 2; j++) {
                // column between vertival bars
                map[i][j * 2] = String.valueOf(line.charAt(j * 3));

                // column vertical bar
                map[i][j * 2 + 1] = String.valueOf(line.charAt(j * 3 + 2));
            }
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String[] top = map[0];
        String[] bottom = map[map.length - 1];

        for (int i = map.length - 2; i > 0; i--) {
            for (int j = 0; j < elementsSize; j++) {
                if (map[i][j].equals("-")) {
                    String tmp = bottom[j - 1];
                    bottom[j - 1] = bottom[j + 1];
                    bottom[j + 1] = tmp;
                }
            }
        }

        // System.out.println("answer");
        for (int i = 1; i < elementsSize; i += 2) {
            System.out.println(top[i] + bottom[i]);
        }
    }
}
