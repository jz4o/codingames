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
        int w = in.nextInt();
        int h = in.nextInt();
        int countX = in.nextInt();
        int countY = in.nextInt();
        ArrayList<Integer> widthMeasurements = new ArrayList<Integer>();
        widthMeasurements.add(0);
        for (int i = 0; i < countX; i++) {
            int x = in.nextInt();

            widthMeasurements.add(x);
        }
        widthMeasurements.add(w);
        ArrayList<Integer> heightMeasurements = new ArrayList<Integer>();
        heightMeasurements.add(0);
        for (int i = 0; i < countY; i++) {
            int y = in.nextInt();

            heightMeasurements.add(y);
        }
        heightMeasurements.add(h);

        // Write an answer using System.out.println()
        // To debug: System.err.println("Debug messages...");

        HashMap<Integer, Integer> widthCounts = new HashMap<Integer, Integer>();
        IntStream.range(0, widthMeasurements.size()).forEach(index -> {
            widthMeasurements.subList(0, index).forEach(widthMeasurement -> {
                int width = widthMeasurements.get(index) - widthMeasurement;
                widthCounts.put(width, widthCounts.getOrDefault(width, 0) + 1);
            });
        });

        HashMap<Integer, Integer> heightCounts = new HashMap<Integer, Integer>();
        IntStream.range(0, heightMeasurements.size()).forEach(index -> {
            heightMeasurements.subList(0, index).forEach(heightMeasurement -> {
                int height = heightMeasurements.get(index) - heightMeasurement;
                heightCounts.put(height, heightCounts.getOrDefault(height, 0) + 1);
            });
        });

        int result = widthCounts.keySet()
                .stream()
                .mapToInt(k -> widthCounts.getOrDefault(k, 0) * heightCounts.getOrDefault(k, 0))
                .sum();

        // System.out.println("0");
        System.out.println(result);
    }
}
