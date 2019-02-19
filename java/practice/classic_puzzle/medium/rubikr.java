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

        final int cubeCount = (int) Math.pow(N, 3);
        final int invisibleCubeCount = (int) Math.pow(Math.max(N - 2, 0), 3);

        // System.out.println("answer");
        System.out.println(cubeCount - invisibleCubeCount);
    }
}
