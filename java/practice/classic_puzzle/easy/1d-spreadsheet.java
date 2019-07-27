import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    private static ArrayList<HashMap<String, String>> cells;

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();
        cells = new ArrayList<HashMap<String, String>>();
        for (int i = 0; i < N; i++) {
            String operation = in.next();
            String arg1 = in.next();
            String arg2 = in.next();

            HashMap<String, String> cell = new HashMap<String, String>();
            cell.put("operation", operation);
            cell.put("arg1", arg1);
            cell.put("arg2", arg2);
            cells.add(cell);
        }
        for (int i = 0; i < N; i++) {

            // Write an action using System.out.println()
            // To debug: System.err.println("Debug messages...");

            // System.out.println("1");
            System.out.println(getCellValue(i));
        }
    }

    private static String getCellValue(final int cellIndex) {
        String result = cells.get(cellIndex).get("value");
        return result != null ? result : calc(cellIndex);
    }

    private static String getArgValue(final String arg) {
        if (arg.contains("$")) {
            return getCellValue(Integer.parseInt(arg.substring(1)));
        } else if (arg.equals("_")) {
            return "0";
        } else {
            return arg;
        }
    }

    private static String calc(final int cellIndex) {
        HashMap<String, String> cell = cells.get(cellIndex);
        int arg1 = Integer.parseInt(getArgValue(cell.get("arg1")));
        int arg2 = Integer.parseInt(getArgValue(cell.get("arg2")));
        int result = 0;
        switch(cell.get("operation")) {
            case "VALUE":
                result = arg1;
                break;
            case "ADD":
                result = arg1 + arg2;
                break;
            case "SUB":
                result = arg1 - arg2;
                break;
            case "MULT":
                result = arg1 * arg2;
                break;
        }
        cell.put("value", String.valueOf(result));

        return cell.get("value");
    }
}
