import java.util.*;
import java.io.*;
import java.math.*;

import java.util.stream.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        ArrayList<String> numbers = new ArrayList<String>();
        for (int i = 0; i < n; i++) {
            String x = in.next();

            numbers.add(x);
        }

        // Write an answer using System.out.println()
        // To debug: System.err.println("Debug messages...");

        List<String> results = numbers.stream()
                .map(number -> howToRead(number))
                .collect(Collectors.toList());

        // System.out.println("cardinal");
        results.forEach(result -> {
            System.out.println(result);
        });
    }

    private static String howToRead(String numberStr) {
        if (numberStr.substring(0, 1).equals("-")) {
            return "negative " + howToRead(numberStr.substring(1));
        }

        if (numberStr.length() >= 4) {
            String[] overThousandUnitNames = {"", "thousand", "million", "billion", "trillion", "quadrillion", "quintillion"};

            int numberSize = numberStr.length();
            int unitNumberSize = numberSize % 3;
            if (unitNumberSize == 0) {
                unitNumberSize = 3;
            }
            int modNumberSize = numberSize - unitNumberSize;

            String unitNumber = numberStr.substring(0, unitNumberSize);
            String modNumber = numberStr.substring(unitNumberSize);

            String result = "";
            result += howToRead(unitNumber) + " " + overThousandUnitNames[modNumberSize / 3];
            if (!modNumber.matches("^0+$")) {
                result += " " + howToRead(modNumber);
            }

            return result;
        }

        String result = "";
        int number = Integer.parseInt(numberStr);
        if (number >= 100) {
            int hundredUnit = number / 100;
            int modUnit = number % 100;

            if (hundredUnit > 0) {
                result += howToRead(String.valueOf(hundredUnit)) + " hundred";
            }
            if (modUnit > 0) {
                result += " " + howToRead(String.valueOf(modUnit));
            }
        } else if (number >= 20) {
            String[] tenUnitNames = {"", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};
            int tenUnit = number / 10;
            int modUnit = number % 10;

            if (tenUnit > 0) {
                result += tenUnitNames[tenUnit];
            }
            if (modUnit > 0) {
                result += "-" + howToRead(String.valueOf(modUnit));
            }
        } else {
            String[] underTwentyNames = {
                "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
                "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
            };

            result = underTwentyNames[number];
        }

        return result.trim();
    }
}
