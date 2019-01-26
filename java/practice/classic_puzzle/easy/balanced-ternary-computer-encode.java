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

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        final int BASE_NUM = 3;

        // convert int to digits int array
        String threeBaseNum = Integer.toString(Math.abs(N), BASE_NUM);
        int[] reverseDigits = new int[threeBaseNum.length()];
        for (int i = 0; i < threeBaseNum.length(); i++) {
            char digit = threeBaseNum.charAt(threeBaseNum.length() - 1 - i);
            reverseDigits[i] = Integer.parseInt(String.valueOf(digit));
        }

        // convert decimal to balanced ternary
        ArrayList<Integer> reverseResult = new ArrayList<Integer>();
        for (int index = 0; index < reverseDigits.length; index++) {
            if (reverseResult.size() <= index) {
                reverseResult.add(0);
            }

            reverseResult.set(index, reverseResult.get(index) + reverseDigits[index]);
            int target = reverseResult.get(index);

            if (BASE_NUM - 1 <= target) {
                reverseResult.set(index, reverseResult.get(index) - BASE_NUM);

                int nextIndex = index + 1;
                if (reverseResult.size() <= nextIndex) {
                    reverseResult.add(0);
                }
                reverseResult.set(nextIndex, reverseResult.get(nextIndex) + 1);
            }
        }

        // when negative, invert digits
        if (N < 0) {
            for (int i = 0; i < reverseResult.size(); i++) {
                reverseResult.set(i, -reverseResult.get(i));
            }
        }

        // System.out.println("42");
        Collections.reverse(reverseResult);
        for (int d : reverseResult) {
            System.out.print(d < 0 ? "T" : d);
        }
    }
}
