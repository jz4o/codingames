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
        String text = in.nextLine();
        String format = in.nextLine();

        format = format.replace("\\", "\\\\");
        String[] specialStrings = new String[]{"^", "*", "(", ")", "[", "]", "{", "}", "$", "|"};
        for (String specialString : specialStrings) {
            format = format.replace(specialString, "\\" + specialString);
        }
        format = format.replace("?", ".");
        format = format.replace("~", ".*");

        System.out.println(text.matches(format) ? "MATCH" : "FAIL");
    }
}
