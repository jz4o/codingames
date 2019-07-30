import java.util.*;
import java.io.*;
import java.math.*;

import java.util.stream.Collectors;
import java.util.Map.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    private static final int TARGET_SCORE    = 50;
    private static final int POSSIBLE_ROUNDS = 4;

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int result = 0;
        HashMap<String, Possibility> patterns = new HashMap<String, Possibility>();
        patterns.put(String.valueOf(n), new Possibility(new ArrayList<Integer>(Arrays.asList(n)), 1, n));

        while(patterns.size() > 0) {
            Entry<String, Possibility> entry = patterns.entrySet().stream().findFirst().get();
            String patternNumbers = entry.getKey();
            Possibility possibility = entry.getValue();
            patterns.remove(patternNumbers);

            // between 2 and 12 is 2 patterns for PN and N
            int[] pointNumbers = new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
            for (int i : pointNumbers) {
                ArrayList<Integer> numbers = new ArrayList<Integer>(possibility.getNumbers());
                numbers.add(i);
                Collections.sort(numbers);
                String newNumbers = numbers.stream().map(String::valueOf).collect(Collectors.joining(" "));

                if (patterns.get(newNumbers) != null) {
                    patterns.get(newNumbers).addCount(possibility.getCount());
                } else {
                    patterns.put(
                        newNumbers,
                        new Possibility(numbers, possibility.getCount(), possibility.getScore() + i)
                    );
                }
            }

            // delete pattern for over score or over rounds
            // add possible pattern to result
            for (Iterator<String> iterator = patterns.keySet().iterator(); iterator.hasNext();) {
                String key = iterator.next();
                Possibility iPossibility = patterns.get(key);
                if (iPossibility.getScore() > TARGET_SCORE || iPossibility.getNumbers().size() > POSSIBLE_ROUNDS + 1) {
                    iterator.remove();
                } else if (iPossibility.getScore() == TARGET_SCORE) {
                    result += iPossibility.getCount();
                    iterator.remove();
                }
            }
        }

        // System.out.println("answer");
        System.out.println(result);
    }

    public static class Possibility {
        private ArrayList<Integer> numbers;
        private int count;
        private int score;

        public Possibility(ArrayList<Integer> numbers, int count, int score) {
            this.numbers = numbers;
            this.count   = count;
            this.score   = score;
        }

        public ArrayList<Integer> getNumbers() {
            return numbers;
        }

        public int getCount() {
            return count;
        }

        public void addCount(final int i) {
            count += i;
        }

        public int getScore() {
            return score;
        }
    }
}
