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
        int X = in.nextInt();
        int Y = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }

        String[][] map = new String[H + 2][W + 2];
        for (int i = 0; i < H; i++) {
            String R = in.nextLine();
            String[] chars = R.split("");
            for (int j = 0; j < chars.length; j++) {
                map[i + 1][j + 1] = chars[j];
            }
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        // for check variables
        ArrayList<String>    checkedMaths = new ArrayList<String>();
        ArrayList<Integer[]> beCheckMaths = new ArrayList<Integer[]>();
        ArrayList<Integer[]> exitMaths    = new ArrayList<Integer[]>();

        // check
        beCheckMaths.add(new Integer[]{Y + 1, X + 1});
        while (beCheckMaths.size() > 0) {
            Integer[] checkMath = beCheckMaths.remove(beCheckMaths.size() - 1);
            Integer y = checkMath[0];
            Integer x = checkMath[1];

            // already cheked math?
            if (checkedMaths.contains(y + " " + x)) {
                continue;
            }

            checkedMaths.add(y + " " + x);

            int[][] nearMaths = {
                {y, x - 1},
                {y - 1, x},
                {y, x + 1},
                {y + 1, x}
            };

            // check near maths
            for (int[] nearMath : nearMaths) {
                int ny = nearMath[0];
                int nx = nearMath[1];
                String math = map[ny][nx];

                if (math == null) {
                    exitMaths.add(new Integer[]{x - 1, y - 1});
                } else if (math.equals(".")) {
                    beCheckMaths.add(new Integer[]{ny, nx});
                }
            }
        }

        // sort (order by zero index number asc, one index number asc).
        Collections.sort(exitMaths, new Comparator<Integer[]>() {
            public int compare(Integer[] l, Integer[] r) {
                if (l[0] == null || r[0] == null) {
                    return 0;
                } else if (l[0] == r[0]) {
                    return l[1].compareTo(r[1]);
                }
                return l[0].compareTo(r[0]);
            }
        });

        // print result
        System.out.println(exitMaths.size());
        for (Integer[] exitMath : exitMaths) {
            System.out.println(exitMath[0] + " " + exitMath[1]);
        }
    }
}
