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
        String[] words = new String[N];
        for (int i = 0; i < N; i++) {
            String W = in.nextLine();
            words[i] = W;
        }
        String LETTERS = in.nextLine();

        HashMap<String, Integer> points = new HashMap<String, Integer>();
        points.put("e", 1);
        points.put("a", 1);
        points.put("i", 1);
        points.put("o", 1);
        points.put("n", 1);
        points.put("r", 1);
        points.put("t", 1);
        points.put("l", 1);
        points.put("s", 1);
        points.put("u", 1);
        points.put("d", 2);
        points.put("g", 2);
        points.put("b", 3);
        points.put("c", 3);
        points.put("m", 3);
        points.put("p", 3);
        points.put("f", 4);
        points.put("h", 4);
        points.put("v", 4);
        points.put("w", 4);
        points.put("y", 4);
        points.put("k", 5);
        points.put("j", 8);
        points.put("x", 8);
        points.put("q", 10);
        points.put("z", 10);

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String bestWord = "";
        int maxPoint = 0;
        for (String word : words) {
            boolean madeFlg = true;
            int point = 0;
            String canChars = LETTERS;

            for (String w : word.split("")) {
                int wIndex = canChars.indexOf(w);
                if (wIndex < 0) {
                    madeFlg = false;
                    point = 0;
                    break;
                }

                point += points.get(w);

                String leftPart = canChars.substring(0, wIndex);
                String rightPart = canChars.substring(wIndex + 1);
                canChars = leftPart + rightPart;
            }

            if (madeFlg && maxPoint < point) {
                bestWord = word;
                maxPoint = point;
            }
        }

        // System.out.println("invalid word");
        System.out.println(bestWord);
    }
}
