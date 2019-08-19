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
        int w = in.nextInt();
        int h = in.nextInt();
        long n = in.nextLong();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String[][] map = new String[h][w];
        for (int i = 0; i < h; i++) {
            String line = in.nextLine();

            map[i] = line.split("");
        }

        Robot robot = new Robot();
        for (int i = 0; i < h; i++) {
            List row = Arrays.asList(map[i]);
            if (row.contains("O")) {
                robot.setPlace(row.indexOf("O"), i);
                break;
            }
        }

        long turn = 0;
        while (turn < n) {
            turn++;

            robot.forward();
            int[] aheadMassIndexes = robot.aheadMassIndex();
            if (map[aheadMassIndexes[0]][aheadMassIndexes[1]].equals("#")) {
                robot.turnRight();
            }

            // omit to loop turn
            if (robot.isInitialPlace()) {
                turn = n - (n % turn);
            }
        }

        System.out.println(robot.place());
    }

    private static class Robot {
        private ArrayList<String> directions;
        private int initialX, initialY, x, y;

        private Robot() {
            directions = new ArrayList<String>();
            directions.add("N");
            directions.add("E");
            directions.add("S");
            directions.add("W");
        }

        private void setPlace(int x, int y) {
            this.initialX = this.x = x;
            this.initialY = this.y = y;
        }

        private String place() {
            return this.x + " " + this.y;
        }

        private boolean isInitialPlace() {
            return this.x == this.initialX && this.y == this.initialY && direction().equals("N");
        }

        private String direction() {
            return this.directions.get(0);
        }

        private void forward() {
            switch (direction()) {
                case "N":
                    this.y--;
                    break;
                case "E":
                    this.x++;
                    break;
                case "S":
                    this.y++;
                    break;
                case "W":
                    this.x--;
                    break;
            }
        }

        private int[] aheadMassIndex() {
            switch (direction()) {
                case "N":
                    return new int[] {this.y - 1, this.x};
                case "E":
                    return new int[] {this.y, this.x + 1};
                case "S":
                    return new int[] {this.y + 1, this.x};
                case "W":
                    return new int[] {this.y, this.x - 1};
                default:
                    return new int[] {this.y, this.x};
            }
        }

        private void turnRight() {
            String nowDirection = directions.remove(0);
            directions.add(nowDirection);
        }
    }
}
