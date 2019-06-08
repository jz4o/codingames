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
        String NUMBER = in.nextLine();
        ArrayList<Integer> numbers = new ArrayList<Integer>();
        for (String n : NUMBER.split(" ")) {
            numbers.add(Integer.parseInt(n));
        }
        final int nbanswer = 36;
        baseLoop:
        for (int base = 0; base < nbanswer; base++) {

            // Write an action using System.out.println()
            // To debug: System.err.println("Debug messages...");

            for (int i : numbers) {
                if (base <= i) {
                    continue baseLoop;
                }
            }

            String baseNumber = "";
            for (int i : numbers) {
                baseNumber += Integer.toString(i, base);
            }
            BigInteger m = new BigInteger(baseNumber, base);
            String decimalNumber = String.valueOf(m);

            for (int i = 1; i <= decimalNumber.length(); i++) {
                BigInteger decimal = new BigInteger(decimalNumber.substring(0, i));
                if (decimal.mod(new BigInteger(i + "")).intValue() != 0) {
                    continue baseLoop;
                }
            }

            // System.out.println("value");
            System.out.println(base);
        }
    }
}
