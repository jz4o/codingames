import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int rows = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        ArrayList<List<String>> grid = new ArrayList<List<String>>();
        for (int i = 0; i < rows; i++) {
            String row = in.nextLine();

            grid.add(Arrays.asList(row.split(" ")));
        }
        String message = in.nextLine();

        // Write an answer using System.out.println()
        // To debug: System.err.println("Debug messages...");

        HashMap<String, String> replaceMap = new HashMap<String, String>();
        IntStream.range(0, grid.size()).forEach(rowIndex -> {
            List<String> row = grid.get(rowIndex);

            IntStream.range(0, row.size()).forEach(columnIndex -> {
                String s = row.get(columnIndex);

                replaceMap.put(s, "" + rowIndex + columnIndex);
            });
        });

        String result = Stream.of(message.split(""))
                .map(s -> replaceMap.get(s))
                .collect(Collectors.joining());

        // System.out.println("encode message");
        System.out.println(result);
    }
}
