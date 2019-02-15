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
        int size = in.nextInt();
        int angle = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        ArrayList<ArrayList<String>> map = new ArrayList<ArrayList<String>>();
        for (int i = 0; i < size; i++) {
            String line = in.nextLine();
            map.add(new ArrayList<String>(Arrays.asList(line.split(" "))));
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        final int diagonalSize = size * 2 - 1;
        final int rotateCount = ((angle - 45) % 360) / 90;

        for (int i = 0; i < rotateCount; i++) {
            map = anticlockwiseTurn90Degree(map);
        }

        ArrayList<ArrayList<String>> diamondMap = new ArrayList<ArrayList<String>>();
        for (int time = 1; time <= diagonalSize; time++) {
            int start = Math.max(0, time - size);
            int popLineSize = Math.min(time, size * 2 - time);

            ArrayList<String> line = new ArrayList<String>();

            for (int s = 0; s < popLineSize; s++) {
                ArrayList<String> mapLine = map.get(start + s);
                line.add(mapLine.remove(mapLine.size() - 1));
            }
            diamondMap.add(line);
        }

        // System.out.println("answer");
        for (ArrayList<String> line : diamondMap) {
            System.out.println(centerString(String.join(" ", line), diagonalSize, " "));
        }
    }

    /**
     * example.
     *
     * input
     *
     *   1 2 3
     *   4 5 6
     *   7 8 9
     *
     * output
     *
     *   3 6 9
     *   2 5 8
     *   1 4 7
     */
    private static ArrayList<ArrayList<String>> anticlockwiseTurn90Degree(final ArrayList<ArrayList<String>> array) {
        final int size = array.size();

        ArrayList<ArrayList<String>> result = new ArrayList();
        for (int toRow = 0; toRow < size; toRow++) {
            ArrayList<String> line = new ArrayList<String>();
            for (int fromRow = 0; fromRow < size; fromRow++) {
                line.add(array.get(fromRow).remove(size - toRow - 1));
            }
            result.add(line);
        }

        return result;
    }

    /**
     * examples.
     *
     * centerString("abc", 5, " ")
     *     => " abc "
     *
     * centerString("abc", 4, " ")
     *     => "abc "
     *
     * centerString("abc", 2, " ")
     *     => "abc"
     */
    private static String centerString(final String str, final int size, final String pad) {
        String result = str;
        for (int c = 0; c < size - str.length(); c++) {
            if (c % 2 == 0) {
                result += pad;
            } else {
                result = pad + result;
            }
        }

        return result;
    }
}
