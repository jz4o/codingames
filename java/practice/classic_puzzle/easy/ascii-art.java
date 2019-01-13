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
        int L = in.nextInt();
        int H = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String T = in.nextLine();
        String[] alphaRows = new String[H];
        for (int i = 0; i < H; i++) {
            String ROW = in.nextLine();
            alphaRows[i] = ROW;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String[] alphas = new String[26];
        for (char c = 'A'; c <= 'Z'; c++) {
            int index = c - 'A';
            alphas[index] = String.valueOf(c);
        }

        String[] results = new String[H];
        for (int i = 0; i < results.length; i++) {
            results[i] = "";
        }

        for (char c : T.toCharArray()) {
            String s = String.valueOf(c).toUpperCase();
            int index = Arrays.asList(alphas).indexOf(s);
            if (index < 0) {
                index = alphas.length;
            }

            for (int i = 0; i < H; i++) {
                int startIndex = L * index;
                results[i] += alphaRows[i].substring(startIndex, startIndex + L);
            }
        }

        // System.out.println("answer");

        for (String result : results) {
            System.out.println(result);
        }
    }
}
