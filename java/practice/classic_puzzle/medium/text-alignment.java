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
        String alignment = in.nextLine();
        int N = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }

        String[] texts = new String[N];
        for (int i = 0; i < N; i++) {
            String text = in.nextLine();

            texts[i] = text;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int maxWidth = 0;
        for (String text : texts) {
            int width = text.length();
            if (width > maxWidth) {
                maxWidth = width;
            }
        }

        ArrayList<String> results = new ArrayList<String>();
        switch (alignment) {
            case "LEFT":
                for (String text : texts) {
                    results.add(text);
                }
                break;
            case "RIGHT":
                for (String text : texts) {
                    results.add(String.format("%" + maxWidth + "s", text));
                }
                break;
            case "CENTER":
                for (String text : texts) {
                    results.add(stringRepeat(" ", (maxWidth - text.length()) / 2) + text);
                }
                break;
            case "JUSTIFY":
                for (String text : texts) {
                    if (text.length() == maxWidth) {
                        results.add(text);
                        continue;
                    }

                    String[] words = text.split(" ");
                    int spaceSize = maxWidth - text.replaceAll("\\s", "").length();
                    double eachSpaceSize = spaceSize / (words.length - 1) * 1.0;
                    int[] spaceSizes = new int[words.length];
                    for (int i = 1; i < words.length; i++) {
                        spaceSizes[i - 1] = (int) Math.floor(eachSpaceSize * i) - (int) Math.floor(eachSpaceSize * (i - 1));
                    }

                    String result = "";
                    for (int i = 0; i < words.length; i++) {
                        result += words[i];
                        result += stringRepeat(" ", spaceSizes[i]);
                    }
                    results.add(result);
                }
                break;
        }

        // System.out.println("answer");
        for (String result : results) {
            System.out.println(result);
        }
    }

    public static String stringRepeat(final String string, final int count) {
        String result = "";
        for (int i = 0; i < count; i++) {
            result += string;
        }

        return result;
    }
}
