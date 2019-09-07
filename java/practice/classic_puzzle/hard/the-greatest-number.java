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
        String input = in.nextLine();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String[] inputs = input.split(" ");
        ArrayList<String> inputsList = new ArrayList<String>(Arrays.asList(inputs));

        boolean minusFlag = inputsList.remove("-");
        boolean dotFlag   = inputsList.remove(".");

        String result = "";
        if (minusFlag) {
            Collections.sort(inputsList);
            result = String.join("", inputsList);
            if (dotFlag) {
                result = result.substring(0, 1) + "." + result.substring(1);
            }
            result = "-" + result;
            if (result.matches("^-0\\.0+$")) {
                result = "0";
            }
        } else {
            Collections.sort(inputsList);
            Collections.reverse(inputsList);
            result = String.join("", inputsList);
            if (dotFlag) {
                result = result.substring(0, result.length() - 1) + "." + result.substring(result.length() - 1);
            }
            if (result.endsWith(".0")) {
                result = result.substring(0, result.length() - 2);
            }
        }

        // System.out.println("greatest");
        System.out.println(result);
    }
}
