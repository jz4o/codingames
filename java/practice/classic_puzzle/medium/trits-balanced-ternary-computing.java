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
        String lhs = in.nextLine();
        String op = in.nextLine();
        String rhs = in.nextLine();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int decimalLhs = balanceToDecimal(lhs);
        int decimalRhs = balanceToDecimal(rhs);
        if (op.equals("<<") || op.equals(">>")) {
            decimalRhs = (int) Math.pow(3, decimalRhs);
        }

        int decimalResult = 0;
        switch (op) {
        case "+":
            decimalResult = decimalLhs + decimalRhs;
            break;
        case "-":
            decimalResult = decimalLhs - decimalRhs;
            break;
        case "*":
        case "<<":
            decimalResult = decimalLhs * decimalRhs;
            break;
        case ">>":
            decimalResult = decimalLhs / decimalRhs;
            break;
        }

        // System.out.println("11T");
        System.out.println(decimalToBalance(decimalResult));
    }

    private static int balanceToDecimal(final String balance) {
        List<String> chars = Arrays.asList(balance.split(""));
        Collections.reverse(chars);

        int result = 0;
        for (int i = 0; i < chars.size(); i++) {
            String s = chars.get(i);
            int b = s.equals("T") ? -1 : Integer.parseInt(s);
            result += b * Math.pow(3, i);
        }

        return result;
    }

    private static String decimalToBalance(int decimal) {
        String result = "";
        while (decimal != 0) {
            int mod = decimal % 3;
            decimal = decimal / 3;

            if (mod == 2) {
                decimal++;
                result = "T" + result;
            } else {
                result = mod + result;
            }
        }

        return result.isEmpty() ? "0" : result;
    }
}
