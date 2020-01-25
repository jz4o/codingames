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
        int n = in.nextInt();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        boolean isCarmichael = !isPrime(n);
        for (int primeFactor : primeDivision(n)) {
            if ((n - 1) % (primeFactor - 1) != 0) {
                isCarmichael = false;
                break;
            }
        }

        // System.out.println("YES|NO");
        System.out.println(isCarmichael ? "YES" : "NO");
    }

    public static final int[] primeDivision(int num) {
        ArrayList<Integer> list = new ArrayList<Integer>();

        while (num % 2 == 0) {
            list.add(2);
            num /= 2;
        }

        int i = 3;
        while (num != 1) {
            if (num % i == 0) {
                list.add(i);
                num /= i;
            } else {
                i += 2;
            }
        }

        return list.stream().mapToInt(j -> j).toArray();
    }

    public static final boolean isPrime(final int num) {
        for (int i = 2; i < num; i++) {
            if (num % i == 0) {
                return false;
            }
        }

        return true;
    }
}
