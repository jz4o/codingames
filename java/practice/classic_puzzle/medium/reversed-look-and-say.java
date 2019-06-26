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
        String s = in.nextLine();

        while (isEncodable(s)) {
            s = encode(s);
        }

        System.out.println(s);
    }

    private static boolean isEncodable(final String origin) {
        String encoded = encode(origin);
        return encoded != null && !origin.equals(encoded);
    }

    private static String encode(final String origin) {
        if (origin.length() % 2 == 1) {
            return null;
        }

        String encoded = "";
        String[] chars = origin.split("");
        for (int i = 0; i < chars.length; i+=2) {
            encoded += chars[i + 1].repeat(Integer.parseInt(chars[i]));
        }

        return isDecodable(encoded, origin) ? encoded : null;
    }

    private static boolean isDecodable(final String encoded, final String origin) {
        String decoded = "";
        String strTemp = encoded;

        while (!strTemp.isEmpty()) {
            char firstChar = strTemp.charAt(0);

            Pattern pattern = Pattern.compile(firstChar + "+");
            Matcher matcher = pattern.matcher(strTemp);
            matcher.find();
            String matchGroup = matcher.group();

            strTemp = strTemp.substring(matchGroup.length(), strTemp.length());

            decoded += "" + matchGroup.length() + firstChar;
        }

        return decoded.equals(origin);
    }
}
