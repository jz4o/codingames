import java.util.*;
import java.io.*;
import java.math.*;

import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        String line1 = in.next();
        String line2 = in.next();
        String line3 = in.next();
        String line4 = in.next();

        // Write an answer using System.out.println()
        // To debug: System.err.println("Debug messages...");

        List<String> lines = Arrays.asList(line1, line2, line3, line4);
        List<List<Integer>> square = lines.stream()
            .map(line -> {
                return Arrays.stream(line.split(""))
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());
            })
            .collect(Collectors.toList());

        MiniSudoku miniSudoku = new MiniSudoku(square);
        miniSudoku.whileOptimize();

        // System.out.println("answer");
        System.out.println(miniSudoku);
    }
}

class MiniSudoku {
    private List<List<Integer>> square;
    private int expectSum;
    private int squareSum;

    MiniSudoku(List<List<Integer>> square) {
        this.square = square;
        this.expectSum = IntStream.rangeClosed(1, square.size()).sum() * square.size();
        this.squareSum = square.stream()
            .mapToInt(line -> line.stream().mapToInt(i -> i).sum())
            .sum();
    }

    public void whileOptimize() {
        while (expectSum != squareSum) {
            optimize();
        }
    }

    public void optimize() {
        IntStream.range(0, square.size()).forEach(rowIndex -> {
            List<Integer> row = square.get(rowIndex);

            IntStream.range(0, row.size()).forEach(columnIndex -> {
                Integer column = row.get(columnIndex);

                if (column != 0) {
                    return;
                }

                List<Integer> verticalLine = square.stream()
                    .map(line -> line.get(columnIndex))
                    .collect(Collectors.toList());
                List<Integer> littleSquareRows = rowIndex < Math.floor(square.size() / 2) ? Arrays.asList(0, 1) : Arrays.asList(2, 3);
                List<Integer> littleSquareColumns = columnIndex < Math.floor(row.size() / 2) ? Arrays.asList(0, 1) : Arrays.asList(2, 3);
                ArrayList<Integer> littleSquare = new ArrayList<Integer>();
                littleSquareRows.stream().forEach(littleSquareRow -> {
                    littleSquareColumns.stream().forEach(littleSquareColumn -> {
                        littleSquare.add(square.get(littleSquareRow).get(littleSquareColumn));
                    });
                });

                List<Integer> candidate = Arrays.asList(1, 2, 3, 4).stream()
                    .filter(i -> row.indexOf(i) == -1)
                    .filter(i -> verticalLine.indexOf(i) == -1)
                    .filter(i -> littleSquare.indexOf(i) == -1)
                    .collect(Collectors.toList());

                if (candidate.size() == 1) {
                    Integer value = candidate.get(0);

                    square.get(rowIndex).set(columnIndex, value);
                    squareSum += value;
                }
            });
        });
    }

    public String toString() {
        return square.stream()
            .map(line -> {
                return line.stream()
                    .map(String::valueOf)
                    .collect(Collectors.joining(""));
            })
            .collect(Collectors.joining("\n"));
    }
}

