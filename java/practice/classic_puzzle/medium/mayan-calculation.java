import java.util.*;
import java.io.*;
import java.math.*;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    private static final int MAYAN_NUMBER_COUNT = 20;

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int L = in.nextInt();
        int H = in.nextInt();
        String[] asciiMayans = new String[MAYAN_NUMBER_COUNT];
        for (int i = 0; i < MAYAN_NUMBER_COUNT; i ++) {
            asciiMayans[i] = "";
        }
        for (int i = 0; i < H; i++) {
            String numeral = in.next();
            for (int j = 0; j < MAYAN_NUMBER_COUNT; j++) {
                asciiMayans[j] += numeral.substring(j * L, (j + 1) * L);
            }
        }

        HashMap<String, Integer> mayan2Int = new HashMap<String, Integer>();
        for (int i = 0; i < MAYAN_NUMBER_COUNT; i++) {
            mayan2Int.put(asciiMayans[i], i);
        }

        String tempStr = "";
        int S1 = in.nextInt();
        String[] mayan1 = new String[S1 / H];
        for (int i = 0; i < S1; i++) {
            String num1Line = in.next();

            tempStr += num1Line;
            if ((i + 1) % H == 0) {
                mayan1[i / H] = tempStr;
                tempStr = "";
            }
        }

        int S2 = in.nextInt();
        String[] mayan2 = new String[S2 / H];
        tempStr = "";
        for (int i = 0; i < S2; i++) {
            String num2Line = in.next();

            tempStr += num2Line;
            if ((i + 1) % H == 0) {
                mayan2[i / H] = tempStr;
                tempStr = "";
            }
        }

        String operation = in.next();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        long num1 = 0;
        for (int i = 0; i < mayan1.length; i++) {
            num1 += Math.pow(MAYAN_NUMBER_COUNT, mayan1.length - 1 - i) * mayan2Int.get(mayan1[i]);
        }

        long num2 = 0;
        for (int i = 0; i < mayan2.length; i++) {
            num2 += Math.pow(MAYAN_NUMBER_COUNT, mayan2.length - 1 - i) * mayan2Int.get(mayan2[i]);
        }

        long resultNum = 0;
        switch (operation) {
            case "+":
                resultNum = num1 + num2;
                break;
            case "-":
                resultNum = num1 - num2;
                break;
            case "*":
                resultNum = num1 * num2;
                break;
            case "/":
                resultNum = num1 / num2;
                break;
        }

        String result = "";
        do {
            long div = resultNum / MAYAN_NUMBER_COUNT;
            int mod = (int) (resultNum - MAYAN_NUMBER_COUNT * div);
            resultNum = div;

            String asciiMayan = String.join("\n", splitByN(asciiMayans[mod], L));
            result = asciiMayan + "\n" + result;
        } while (resultNum > 0);

        // System.out.println("result");
        System.out.println(result);
    }

    private static String[] splitByN(String str, int n) {
        ArrayList<String> result = new ArrayList<String>();
        Matcher m = Pattern.compile(".{1," + n + "}").matcher(str);
        while (m.find()) {
            result.add(m.group());
        }

        return result.toArray(new String[0]);
    }
}
