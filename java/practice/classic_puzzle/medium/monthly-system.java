import java.util.*;
import java.io.*;
import java.math.*;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

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
        String[] Ms = new String[N];
        for (int i = 0; i < N; i++) {
            String M = in.nextLine();

            Ms[i] = M;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int sum = 0;
        for (int i = 0; i < N; i++) {
            sum += MonthBaseNumber.toI(Ms[i]);
        }
        String result = MonthBaseNumber.fromI(sum);

        // System.out.println("answer");
        System.out.println(result);
    }
}

abstract class MonthBaseNumber {
    private static final String[] MONTHS = {
        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    };
    private static final String[] NUMS = {
        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b"
    };

    private static final int base(final int digit) {
        return (int) Math.pow(NUMS.length, digit);
    }

    public static final int toI(final String monthBaseText) {
        int result = 0;

        final int MONTH_LENGTH = 3;
        final int digits = monthBaseText.length() / MONTH_LENGTH;

        Matcher matcher = Pattern.compile(".{" + MONTH_LENGTH + "}").matcher(monthBaseText);
        for (int i = digits - 1; i >= 0; i--) {
            matcher.find();
            String month = matcher.group();
            int monthIndex = Arrays.asList(MONTHS).indexOf(month);
            result += Integer.parseInt(NUMS[monthIndex], NUMS.length) * base(i);
        }

        return result;
    }

    public static final String fromI(final int num) {
        String result = "";

        String baseNum = Integer.toString(num, NUMS.length);
        for (int i = 0; i < baseNum.length(); i++) {
            String c = String.valueOf(baseNum.charAt(i));
            result += MONTHS[Arrays.asList(NUMS).indexOf(c)];
        }

        return result;
    }
}
