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
        String X = in.nextLine();
        String Y = in.nextLine();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        // create replace table
        LinkedHashMap<Character, Character> replaceMap = new LinkedHashMap<Character, Character>();
        for (int i = 0; i < X.length(); i++) {
            char x = X.charAt(i);
            char y = Y.charAt(i);

            if (x != y) {
                replaceMap.put(x, y);
            }
        }

        // do replace
        String replacedStr = "";
        for (char s : X.toCharArray()) {
            Character v = replaceMap.get(s);
            replacedStr += v != null ? v : s;
        }

        //check
        String result = "";
        if (X.equals(Y)) {
            result = "NONE";
        } else if (replacedStr.equals(Y)) {
            result = replaceMap.toString().replace("{", "")
                                          .replace("}", "")
                                          .replace("=", "->")
                                          .replace(", ", "\n");
        } else {
            result = "CAN'T";
        }

        // System.out.println("anwser");
        System.out.println(result);
    }
}
