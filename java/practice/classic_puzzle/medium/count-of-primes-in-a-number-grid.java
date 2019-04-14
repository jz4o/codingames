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
        int R = in.nextInt();
        int C = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String[][] grid = new String[R][C];
        for (int i = 0; i < R; i++) {
            String row = in.nextLine();
            grid[i] = row.split(" ");
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        HashMap<Integer, Object> combinationNumbers = new HashMap<Integer, Object>();
        int longSide = Math.max(R, C);
        for (int targetIndex = 0; targetIndex < longSide; targetIndex++) {
            for (int getCount = 1; getCount <= longSide; getCount++) {
                for (int beginIndex = 0; beginIndex < longSide; beginIndex++) {
                    int endIndex = beginIndex + getCount - 1;

                    boolean canGetHorizontalCombination = targetIndex < R && endIndex < C;
                    boolean canGetVerticalCombination   = targetIndex < C && endIndex < R;

                    String horizontalCombinationNumber = "0";
                    String verticalCombinationNumber   = "0";
                    for (int addIndex = beginIndex; addIndex <= endIndex; addIndex++) {
                        if (canGetHorizontalCombination) {
                            horizontalCombinationNumber += grid[targetIndex][addIndex];
                        }
                        if (canGetVerticalCombination) {
                            verticalCombinationNumber += grid[addIndex][targetIndex];
                        }
                    }
                    combinationNumbers.put(Integer.parseInt(horizontalCombinationNumber), null);
                    combinationNumbers.put(Integer.parseInt(verticalCombinationNumber), null);
                }
            }
        }

        int result = 0;
        for (Integer number : combinationNumbers.keySet()) {
            if (isPrime(number)) {
                result++;
            }
        }

        // System.out.println("answer");
        System.out.println(result);
    }

    public static final boolean isPrime(final int num) {
        if (num < 2) {
            return false;
        }

        for (int i = 2; i < num; i++) {
            if (num % i == 0) {
                return false;
            }
        }

        return true;
    }
}
