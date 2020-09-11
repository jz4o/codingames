import java.util.*;
import java.io.*;
import java.math.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int leapYear = in.nextInt();
        String sourceDayOfWeek = in.next();
        String sourceMonth = in.next();
        int sourceDayOfMonth = in.nextInt();
        String targetMonth = in.next();
        int targetDayOfMonth = in.nextInt();

        // Write an answer using System.out.println()
        // To debug: System.err.println("Debug messages...");

        List<String> DAY_OF_WEEK = Arrays.asList("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday");

        // year is 0001 if leap is 0
        // LocalDate.parse("0000-01-01").isLeapYear() // => true
        //
        // year is 0000 if leap is 1
        // LocalDate.parse("0001-01-01").isLeapYear() // => false
        String year = String.format("%04d", leapYear * -1 + 1);

        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("uuuu MMM d");
        LocalDate targetDate = LocalDate.parse(year + " " + targetMonth + " " + targetDayOfMonth, pattern);
        LocalDate sourceDate = LocalDate.parse(year + " " + sourceMonth + " " + sourceDayOfMonth, pattern);

        int days = (int) ChronoUnit.DAYS.between(sourceDate, targetDate);
        int sourceDayOfWeekIndex = DAY_OF_WEEK.indexOf(sourceDayOfWeek);
        int targetDayOfWeekIndex = (days + sourceDayOfWeekIndex + (Math.abs(days) * DAY_OF_WEEK.size())) % DAY_OF_WEEK.size();

        // System.out.println("day of week");
        System.out.println(DAY_OF_WEEK.get(targetDayOfWeekIndex));
    }
}
