import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Don't let the machines win. You are humanity's last hope...
 **/
class Player {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int width = in.nextInt(); // the number of cells on the X axis
        int height = in.nextInt(); // the number of cells on the Y axis
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String[][] grid = new String[height][width];
        for (int i = 0; i < height; i++) {
            String line = in.nextLine(); // width characters, each either 0 or .

            grid[i] = line.split("");
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        ArrayList<String> results = new ArrayList<String>();
        for (int h = 0; h < height; h++) {
            for (int w = 0; w < width; w++) {
                if (grid[h][w].equals(".")) {
                    continue;
                }

                ArrayList<String> result = new ArrayList<String>();
                result.add(w + " " + h);

                // check right
                for (int r = w + 1; r <= width; r++) {
                    if (r >= width) {
                        result.add("-1 -1");
                        break;
                    } else if (grid[h][r].equals("0")) {
                        result.add(r + " " + h);
                        break;
                    } else {
                        continue;
                    }
                }

                // check bottom
                for (int b = h + 1; b <= height; b++) {
                    if (b >= height) {
                        result.add("-1 -1");
                        break;
                    } else if (grid[b][w].equals("0")) {
                        result.add(w + " " + b);
                        break;
                    } else {
                        continue;
                    }
                }

                results.add(String.join(" ", result));
            }
        }

        // Three coordinates: a node, its right neighbor, its bottom neighbor
        // System.out.println("0 0 1 0 0 1");
        for (String result : results) {
            System.out.println(result);
        }
    }
}
