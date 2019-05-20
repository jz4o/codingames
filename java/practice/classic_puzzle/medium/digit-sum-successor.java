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
        long N = in.nextLong();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String NStr = String.valueOf(N);
        int[] digits = new int[NStr.length() + 1];
        digits[0] = 0;
        for (int i = 0; i < NStr.length(); i++) {
            digits[i + 1] = Integer.parseInt(String.valueOf(NStr.charAt(i)));
        }

        int decrementIndex = -1;
        for (int i = digits.length - 1; i > 0; i--) {
            if (digits[i] != 0) {
                decrementIndex = i;
                break;
            }
        }
        digits[decrementIndex]--;

        int incrementIndex = -1;
        for (int i = decrementIndex - 1; i >= 0; i--) {
            if (digits[i] != 9) {
                incrementIndex = i;
                break;
            }
        }
        digits[incrementIndex]++;

        int[] beSortDigits = Arrays.copyOfRange(digits, incrementIndex + 1, digits.length);
        Arrays.sort(beSortDigits);
        for (int i = 0; i < beSortDigits.length; i++) {
            digits[incrementIndex + 1 + i] = beSortDigits[i];
        }

        // System.out.println("11");
        String result = "";
        for (int digit : digits) {
            result += digit;
        }
        System.out.println(Long.parseLong(result));
    }
}
