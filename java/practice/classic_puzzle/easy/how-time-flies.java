import java.util.*;
import java.io.*;
import java.math.*;
import java.text.SimpleDateFormat;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        String BEGIN = in.next();
        String END = in.next();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
        Date beginDate = null;
        Date endDate = null;
        try {
            beginDate = sdf.parse(BEGIN);
            endDate = sdf.parse(END);
        } catch (Exception e) {
            System.err.println(e);
        }

        int beginMonths = beginDate.getYear() * 12 + beginDate.getMonth() + 1;
        int endMonths = endDate.getYear() * 12 + endDate.getMonth() + 1;

        // calc for year
        int year = (endMonths - beginMonths) / 12;
        String formatedYear = "";
        if (year != 0) {
            formatedYear = year + " year";

            if (year > 1) {
                formatedYear += "s";
            }
        }

        // calc for month
        int month = (endMonths - beginMonths) % 12;
        if (endDate.getDate() < beginDate.getDate()) {
            month--;
        }
        String formatedMonth = "";
        if (month != 0) {
            formatedMonth = month + " month";

            if (month > 1) {
                formatedMonth += "s";
            }
        }

        // calc for day
        int days = (int) ((endDate.getTime() - beginDate.getTime()) / (1000 * 60 * 60 * 24));
        String formatedDays = "total " + days + " days";

        // System.out.println("YY day[s], MM month[s], total NN days");

        ArrayList<String> outputElements = new ArrayList<String>(Arrays.asList(formatedYear, formatedMonth, formatedDays));
        for (int i = 0; i < outputElements.size(); i++) {
            outputElements.remove("");
        }
        String result = String.join(", ", outputElements);

        System.out.println(result);
    }
}
