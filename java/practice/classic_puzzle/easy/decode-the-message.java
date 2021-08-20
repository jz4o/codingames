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
        long P = in.nextLong();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String C = in.nextLine();

        // Write an answer using System.out.println()
        // To debug: System.err.println("Debug messages...");

        // System.out.println("Good Luck :->");
        System.out.println(decode(P, C));
    }

    public static String decode(long encodedValue, String alphabet) {
        String result = "";
        long tempEncodedValue = encodedValue + 1;
        while (tempEncodedValue > 0) {
            int mod = (int)(tempEncodedValue % alphabet.length());
            tempEncodedValue = tempEncodedValue / alphabet.length();
            if (mod == 0) {
                mod = alphabet.length();
                tempEncodedValue--;
            }

            result += alphabet.substring(mod - 1, mod);
        }

        return result;
    }
}
