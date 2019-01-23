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
        int N = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String[] isbns = new String[N];
        for (int i = 0; i < N; i++) {
            String ISBN = in.nextLine();
            isbns[i] = ISBN;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        HashMap modulusWeights = new HashMap();
        modulusWeights.put(10, new int[] {1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3});
        modulusWeights.put(11, new int[] {10, 9, 8, 7, 6, 5, 4, 3, 2, 1});

        ArrayList<String> invalids = new ArrayList<String>();
        for (int i = 0; i < N; i++) {
            String isbn = isbns[i];
            if (!isbn.matches("\\d+X?")) {
                invalids.add(isbn);
                continue;
            }

            int modulus = 0;
            switch (isbn.length()) {
                case 10:
                    modulus = 11;
                    break;

                case 13:
                    if (isbn.substring(isbn.length() - 1).equals("X")) {
                        invalids.add(isbn);
                        continue;
                    }

                    modulus = 10;
                    break;

                default:
                    invalids.add(isbn);
                    continue;
            }

            int sum = 0;
            for (int index = 0; index < isbn.length() - 1; index++) {
                int digit = Integer.parseInt(String.valueOf(isbn.charAt(index)));
                int[] modulusWeight = (int[]) modulusWeights.get(modulus);
                sum += digit * modulusWeight[index];
            }

            int checkSum = (modulus - (sum % modulus)) % modulus;
            String checkDigitString = isbn.substring(isbn.length() - 1);
            int checkDigit = checkDigitString.equals("X") ? 10 : Integer.parseInt(checkDigitString);
            if (checkSum != checkDigit) {
                invalids.add(isbn);
            }
        }

        // System.out.println("answer");

        System.out.println(invalids.size() + " invalid:");
        for (String invalid : invalids) {
            System.out.println(invalid);
        }
    }
}
