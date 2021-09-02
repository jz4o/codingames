import java.util.*;
import java.io.*;
import java.math.*;

import java.util.regex.*;
import java.util.stream.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        ArrayList<String> transactions = new ArrayList<String>();
        for (int i = 0; i < N; i++) {
            String transaction = in.nextLine();

            transactions.add(transaction);
        }

        // Write an answer using System.out.println()
        // To debug: System.err.println("Debug messages...");

        double[] benfordLawPercentages = {0, 0.301, 0.176, 0.125, 0.097, 0.079, 0.067, 0.058, 0.051, 0.046};
        Pattern pattern = Pattern.compile("[1-9]");
        List<Integer> firstNumbers = transactions.stream()
                .map(transaction -> {
                    Matcher matcher = pattern.matcher(transaction);
                    matcher.find();

                    return Integer.parseInt(matcher.group());
                }).collect(Collectors.toList());

        boolean isFraudulent = IntStream.range(1, 10).anyMatch(i -> {
            double benfordLawPercentage = benfordLawPercentages[i];
            double percent = firstNumbers.stream().filter(n -> n == i).toArray().length / (double)N;

            return !((benfordLawPercentage - 0.1) <= percent && percent <= (benfordLawPercentage + 0.1));
        });

        // System.out.println("false");
        System.out.println(isFraudulent);
    }
}
