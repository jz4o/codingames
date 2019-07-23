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
        int H = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String[][] map = new String[H][H * 2];
        for (int i = 0; i < H; i++) {
            String S = in.nextLine();
            map[i] = S.split("");
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String leftPart = "/";
        String rightPart = "\\";
        String emptyPart = ".";

        boolean isStable = true;
        check:
        for (int height = 0; height < H; height++) {
            boolean isBottomRow = height == H - 1;
            for (int width = 0; width < H * 2; width++) {
                String card = map[height][width];

                if (card.equals(emptyPart)) {
                    continue;
                }

                String sideCard = null;
                String partnerPart = null;
                if (card.equals(rightPart)) {
                    sideCard = width == 0 ? null : map[height][width - 1];
                    partnerPart = leftPart;
                } else if (card.equals(leftPart)) {
                    sideCard = width == H * 2 - 1 ? null : map[height][width + 1];
                    partnerPart = rightPart;
                }

                boolean checkSideCard = sideCard != null && sideCard.equals(partnerPart);
                boolean checkUnderCard = isBottomRow || map[height + 1][width].equals(partnerPart);

                if (!checkSideCard || !checkUnderCard) {
                    isStable = false;
                    break check;
                }
            }
        }

        // System.out.println("UNSTABLE");
        System.out.println(isStable ? "STABLE" : "UNSTABLE");
    }
}
