import java.util.*;
import java.io.*;
import java.math.*;
import java.util.regex.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        String MESSAGE = in.nextLine();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        // string to 7bit binary.
        String binary = "";
        for (char c : MESSAGE.toCharArray()) {
            int binaryChar = Integer.parseInt(Integer.toBinaryString((int) c));
            binary += String.format("%07d", binaryChar);
        }

        // create grouping array from 7bit binary
        ArrayList<String> groupingArray = new ArrayList<String>();
        while (binary.length() > 0) {
            String target = binary.substring(0, 1);

            Matcher matcher = Pattern.compile("^" + target + "+").matcher(binary);
            matcher.find();

            String matched = matcher.group();
            groupingArray.add(matched);

            binary = binary.replaceFirst(matched, "");
        }

        // //  grouping array to unary
        String unary = "";
        for (String group : groupingArray) {
            unary += strRepeat("0", 2 - Integer.parseInt(group.substring(0, 1)));
            unary += " ";
            unary += strRepeat("0", group.length());
            unary += " ";
        }

        // System.out.println("answer");
        System.out.println(unary.trim());
    }

    public static String strRepeat(String str, int count) {
       return new String(new char[count]).replace("\0", str);
    }
}
