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
        int SIZE = in.nextInt();
        int N = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        ArrayList<String> names = new ArrayList<String>();
        for (int i = 0; i < N; i++) {
            String name = in.nextLine();

            names.add(name);
        }
        int T = in.nextInt();
        ThrowData[] throwDatas = new ThrowData[T];
        for (int i = 0; i < T; i++) {
            String throwName = in.next();
            int throwX = in.nextInt();
            int throwY = in.nextInt();

            throwDatas[i] = new ThrowData(throwName, throwX, throwY);
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        final int halfSize = SIZE / 2;
        HashMap<String, Score> scoreBoard = new HashMap<String, Score>();
        for (String name : names) {
            scoreBoard.put(name, new Score(name, 0));
        }

        for (ThrowData throwData : throwDatas) {
            int x = throwData.x;
            int y = throwData.y;

            double distanceWithCenter = Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2));
            double distanceWithEdge   = Math.sqrt(Math.pow(halfSize - Math.abs(x), 2) + Math.pow(halfSize - Math.abs(y), 2));

            boolean inSquareHorizontal = -halfSize <= x && x <= halfSize;
            boolean inSquareVertical   = -halfSize <= y && y <= halfSize;

            boolean inSquare  = inSquareHorizontal && inSquareVertical;
            boolean inCircle  = distanceWithCenter <= halfSize;
            boolean inDiamond = distanceWithCenter <= distanceWithEdge;

            Score score = scoreBoard.get(throwData.name);
            if (inDiamond) {
                score.point += 15;
            } else if (inCircle) {
                score.point += 10;
            } else if (inSquare) {
                score.point += 5;
            }
        }

        // sort by score point desc, names index asc
        Collections.sort(names, new Comparator<String>() {
            public int compare(String lName, String rName) {
                return scoreBoard.get(rName).point - scoreBoard.get(lName).point;
            };
        });

        // System.out.println("answer");
        for (String name : names) {
            scoreBoard.get(name).disp();
        }
    }

    private static class ThrowData {
        private String name;
        private int    x, y;

        private ThrowData(String name, int x, int y) {
            this.name = name;
            this.x    = x;
            this.y    = y;
        }
    }

    private static class Score {
        private String name;
        private int    point;

        private Score(String name, int point) {
            this.name  = name;
            this.point = point;
        }

        private void disp() {
            System.out.println(name + " " + point);
        }
    }
}
