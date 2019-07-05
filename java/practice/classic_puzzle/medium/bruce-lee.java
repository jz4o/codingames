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

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        String ENCRYPT = in.nextLine();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String binaries = "";
        String[] encryptStrings = ENCRYPT.split(" ");
        boolean isInvalid = encryptStrings.length % 2 != 0;
        for (int i = 0; i < encryptStrings.length; i += 2) {
            if (isInvalid) {
                break;
            }

            String binary = encryptStrings[i];
            int count = encryptStrings[i + 1].length();

            isInvalid = !binary.equals("0") && !binary.equals("00");

            binaries += (binary.equals("0") ? "1" : "0").repeat(count);
        }

        // System.out.println("INVALID");
        String result = "";
        if (isInvalid || binaries.length() % 7 != 0) {
            result = "INVALID";
        } else {
            Matcher matcher = Pattern.compile(".{7}").matcher(binaries);
            while (matcher.find()) {
                result += (char) Integer.parseInt(matcher.group(), 2);
            }
        }
        System.out.println(result);
    }
}
