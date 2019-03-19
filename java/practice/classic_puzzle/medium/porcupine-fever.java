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
        int Y = in.nextInt();
        long[][] cages = new long[N][3];
        for (int i = 0; i < N; i++) {
            int S = in.nextInt();
            int H = in.nextInt();
            int A = in.nextInt();
            cages[i] = new long[] {S, H, A};
        }

        int sick = 0;
        int survival = 2;

        for (int i = 0; i < Y; i++) {
            int aliveCount = 0;
            for (int c = 0; c < cages.length; c++) {
                int sickCount = (int) (cages[c][sick] * Math.pow(2, i));
                cages[c][survival] -= sickCount;
                long survivalCount = cages[c][survival];
                aliveCount += Math.max(survivalCount, 0);
            }

            System.out.println(aliveCount);

            if (aliveCount <= 0) {
                break;
            }
        }
    }
}
