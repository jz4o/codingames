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

        int partCount       = 1;
        int topStepCount    = 1;
        int bottomStepCount = 1;

        while (true) {
            if (partCount < N) {
                bottomStepCount++;
                partCount += bottomStepCount;
            } else if (N < partCount) {
                partCount -= topStepCount;
                topStepCount++;
            } else {
                break;
            }
        }

        for (int stepCount = topStepCount; stepCount <= bottomStepCount; stepCount++) {
            System.out.println("*".repeat(stepCount));
        }
    }
}
