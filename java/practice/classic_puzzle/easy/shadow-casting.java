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
        int N = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        ArrayList<ArrayList<String>> grid = new ArrayList<ArrayList<String>>();
        for (int i = 0; i < N; i++) {
            String line = in.nextLine();

            String[] chars = line.equals("") ? new String[]{} : line.split("");
            grid.add(new ArrayList<String>(Arrays.asList(chars)));
        }

        int width = grid.stream().mapToInt(row -> row.size()).max().orElse(0) + 2;

        grid.forEach(row -> {
            while (row.size() < width) {
                row.add(" ");
            }
        });

        String[] array = new String[width];
        Arrays.fill(array, " ");
        grid.add(new ArrayList<String>(Arrays.asList(array)));
        grid.add(new ArrayList<String>(Arrays.asList(array)));

        IntStream.rangeClosed(0, N + 1).boxed().sorted(Comparator.reverseOrder()).forEach(rowIndex -> {
            IntStream.range(0, width).boxed().sorted(Comparator.reverseOrder()).forEach(columnIndex -> {
                if (!grid.get(rowIndex).get(columnIndex).equals(" ")) {
                    return;
                }

                if (rowIndex >= 2 && columnIndex >= 2 && !grid.get(rowIndex - 2).get(columnIndex - 2).equals(" ")) {
                    grid.get(rowIndex).set(columnIndex, "`");
                }

                if (rowIndex >= 1 && columnIndex >= 1 && !grid.get(rowIndex - 1).get(columnIndex - 1).equals(" ")) {
                    grid.get(rowIndex).set(columnIndex, "-");
                }
            });
        });

        grid.forEach(row -> {
            System.out.println(String.join("", row).stripTrailing());
        });
    }
}
