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
        int ROUNDS = in.nextInt();
        int CASH = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        for (int i = 0; i < ROUNDS; i++) {
            String PLAY = in.nextLine();

            int bet = (int) Math.ceil(CASH / 4.0);
            CASH -= bet;

            String[] playArray = PLAY.split(" ");
            int ball = Integer.parseInt(playArray[0]);
            String call = playArray[1];
            Integer number = null;
            if (playArray.length >= 3) {
                number = Integer.parseInt(playArray[2]);
            }

            boolean isWinWithPlain = call.equals("PLAIN") && ball == number;
            boolean isWinWithOdd = call.equals("ODD") && ball % 2 == 1;
            boolean isWinWithEven = call.equals("EVEN") && ball % 2 == 0 && ball > 0;

            if (isWinWithPlain) {
                CASH += bet * 36;
            } else if (isWinWithOdd || isWinWithEven) {
                CASH += bet * 2;
            }
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        // System.out.println("cash of the target after playing");
        System.out.println(CASH);
    }
}
