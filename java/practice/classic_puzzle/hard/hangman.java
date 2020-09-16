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
        String word = in.nextLine();
        String chars = in.nextLine();

        // Write an answer using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String BEAM     = "+--+";
        String NO_HEAD  = "|";
        String HEAD     = "|  o";
        String NO_BODY  = "|";
        String BODY     = "|  |";
        String ONE_ARM  = "| /|";
        String BOTH_ARM = "| /|\\";
        String NO_LEG   = "|\\";
        String ONE_LEG  = "|\\/";
        String BOTH_LEG = "|\\/ \\";
        List<List<String>> HANGMAN_STATUS = Arrays.asList(
            Arrays.asList(BEAM, NO_HEAD, NO_BODY,  NO_LEG),
            Arrays.asList(BEAM, HEAD,    NO_BODY,  NO_LEG),
            Arrays.asList(BEAM, HEAD,    BODY,     NO_LEG),
            Arrays.asList(BEAM, HEAD,    ONE_ARM,  NO_LEG),
            Arrays.asList(BEAM, HEAD,    BOTH_ARM, NO_LEG),
            Arrays.asList(BEAM, HEAD,    BOTH_ARM, ONE_LEG),
            Arrays.asList(BEAM, HEAD,    BOTH_ARM, BOTH_LEG)
        );

        // answer to guess
        String result = Arrays.stream(word.split("")).map(character -> {
            return chars.contains(character.toLowerCase()) ? character : "_";
        }).collect(Collectors.joining(""));

        // counting errors of guess
        String lowerWord = word.toLowerCase();
        int errors = 0;
        for (String character : chars.split(" ")) {
            if (lowerWord.contains(character)) {
                lowerWord = lowerWord.replace(character.toString(), "");
            } else {
                errors++;
            }
        }

        // System.out.println("answer");
        System.out.println(String.join("\n", HANGMAN_STATUS.get(errors)));
        System.out.println(result);
    }
}

