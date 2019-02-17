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
        int count = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }

        ArrayList<ArrayList<String>> results = new ArrayList<ArrayList<String>>();
        for (int i = 0; i < height; i++) {
            String raster = in.nextLine();

            List rasterList = Arrays.asList(raster.split(""));
            ArrayList<String> rasterRow = new ArrayList<String>(rasterList);
            results.add(rasterRow);
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        for (int i = 0; i < count; i++) {
            for (int resultRow = 0; resultRow < results.size(); resultRow++) {
                Collections.sort(results.get(resultRow));
            }
            results = anticlockwiseTurn90Degree(results);
        }

        // System.out.println("...");
        // System.out.println("write ###");
        for (ArrayList<String> result : results) {
            System.out.println(String.join("", result));
        }
    }

    /**
     * example.
     *
     * input
     *
     *    1  2  3  4  5
     *    6  7  8  9 10
     *   11 12 13 14 15
     *
     * output
     *
     *   5 10 15
     *   4  9 14
     *   3  8 13
     *   2  7 12
     *   1  6 11
     */
    private static ArrayList<ArrayList<String>> anticlockwiseTurn90Degree(final ArrayList<ArrayList<String>> array) {
        final int resultRowSize = array.get(0).size();
        final int resultColumnSize = array.size();

        ArrayList<ArrayList<String>> result = new ArrayList();
        for (int toRow = 0; toRow < resultRowSize; toRow++) {
            ArrayList<String> line = new ArrayList<String>();
            for (int fromRow = 0; fromRow < resultColumnSize; fromRow++) {
                line.add(array.get(fromRow).remove(resultRowSize - toRow - 1));
            }
            result.add(line);
        }

        return result;
    }
}
