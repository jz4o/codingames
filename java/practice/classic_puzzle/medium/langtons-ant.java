import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    static final String BLACK = "#";
    static final String WHITE = ".";

    public static void main(String args[]) {
        String[] directionStrings = {"N", "E", "S", "W"};
        ArrayList<String> directions = new ArrayList<String>(Arrays.asList(directionStrings));

        Scanner in = new Scanner(System.in);
        int W = in.nextInt();
        int H = in.nextInt();
        int x = in.nextInt();
        int y = in.nextInt();
        String direction = in.next();
        while (!directions.get(0).equals(direction)) {
            directions.add(directions.remove(0));
        }
        int T = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }

        String[][] map = new String[H][W];
        for (int i = 0; i < H; i++) {
            String C = in.nextLine();
            map[i] = C.split("");
        }
        for (int i = 0; i < T; i++) {

            // Write an action using System.out.println()
            // To debug: System.err.println("Debug messages...");

            if (map[y][x].equals(BLACK)) {
                // move first element to last
                directions.add(directions.remove(0));
                map[y][x] = WHITE;
            } else {
                // move last element to first
                directions.add(0, directions.remove(directions.size() - 1));
                map[y][x] = BLACK;
            }

            switch (directions.get(0)) {
                case "N":
                    y--;
                    break;
                case "E":
                    x++;
                    break;
                case "W":
                    x--;
                    break;
                case "S":
                    y++;
                    break;
            }
            // System.out.println("answer");
        }

        for (String[] row : map) {
            System.out.println(String.join("", row));
        }
    }
}
