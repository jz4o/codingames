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
        int N = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String MESSAGE = in.nextLine();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        for (int i = 0; i < Math.abs(N); i++) {
            if (N > 0) {
                MESSAGE = decode(MESSAGE);
            } else {
                MESSAGE = encode(MESSAGE);
            }
        }

        // System.out.println("answer");
        System.out.println(MESSAGE);
    }

    public static String decode(String text) {
        String result = "";

        int turn = 1;
        int sum = turn;
        while (sum < text.length()) {
            sum += ++turn;
        }

        sum -= turn;
        while (turn > 0) {
            int sliceSize = text.length() - sum;
            if (turn % 2 == 1) {
                // slice from right
                result = text.substring(text.length() - sliceSize) + result;
                text = text.substring(0, text.length() - sliceSize);
            } else {
                // slice from left
                result = text.substring(0, sliceSize) + result;
                text = text.substring(sliceSize);
            }

            sum -= --turn;
        }

        return result;
    }

    public static String encode(String text) {
        String target = "";
        String result = "";

        int turn = 1;
        do {
            // slice from left
            boolean turnIsOverTextLength = turn >= text.length();
            int sliceSize = turnIsOverTextLength ? text.length() : turn;
            target = text.substring(0, sliceSize);
            if (turnIsOverTextLength) {
                text = "";
            } else {
                text = text.substring(turn);
            }

            // insert into left or right.
            if (turn % 2 == 1) {
                result += target;
            } else {
                result = target + result;
            }

            turn++;
        } while (text.length() > 0);

        return result;
    }
}
