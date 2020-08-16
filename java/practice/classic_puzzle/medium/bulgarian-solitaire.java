import java.util.*;
import java.util.stream.Collector;
import java.util.stream.Collectors;
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
        ArrayList<Integer> piles = new ArrayList<Integer>();
        for (int i = 0; i < N; i++) {
            int C = in.nextInt();

            piles.add(C);
        }

        // Write an answer using System.out.println()
        // To debug: System.err.println("Debug messages...");

        piles.removeIf(pile -> (pile == 0));

        int sameConfigurationIndex = 0;
        ArrayList<String> configurations = new ArrayList<String>();

        while (true) {
            Collections.sort(piles);
            configurations.add(
                piles.stream()
                    .map(String::valueOf)
                    .collect(Collectors.joining(" "))
            );

            int pilesSize = piles.size();
            piles = piles.stream()
                .map(pile -> pile - 1)
                .filter(pile -> pile != 0)
                .collect(Collectors.toCollection(ArrayList::new));
            piles.add(pilesSize);

            Collections.sort(piles);
            String configuration = piles.stream()
                .map(String::valueOf)
                .collect(Collectors.joining(" "));

            if (configurations.contains(configuration)) {
                sameConfigurationIndex = configurations.indexOf(configuration);
                break;
            }
        }

        // System.out.println("1");
        System.out.println(configurations.size() - sameConfigurationIndex);
    }
}
