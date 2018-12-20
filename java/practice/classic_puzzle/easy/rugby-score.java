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

        final int TRY_POINT       = 5;
        final int TRANSFORM_POINT = 2;
        final int PENA_DROP_POINT = 3;

        String combinations = "";

        int possible_try_times = N / TRY_POINT;
        for (int try_times=possible_try_times; try_times>=0; try_times--) {
            int try_points = TRY_POINT * try_times;

            int possible_transformation_times = Math.min((N - try_points) / TRANSFORM_POINT, try_times);
            for (int transformation_times=possible_transformation_times; transformation_times>=0; transformation_times--) {
                int transform_points = TRANSFORM_POINT * transformation_times;

                int remining_points = N - try_points - transform_points;
                if (remining_points % PENA_DROP_POINT == 0) {
                    int penaltie_or_drop_times = remining_points / PENA_DROP_POINT;
                    combinations = try_times + " " + transformation_times + " " + penaltie_or_drop_times + "\n" + combinations;
                }
            }
        }

        // System.out.println("tries transformations penalties");

        System.out.println(combinations.trim());
    }
}
