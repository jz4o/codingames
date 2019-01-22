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
        String intext = in.nextLine();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        boolean requirePeriod = intext.substring(intext.length() - 1).equals(".");

        intext = intext.toLowerCase();

        intext = intext.replaceAll(",", ", ");
        intext = intext.replaceAll("\\s+",  " ");

        String[] sentences = intext.split("\\.", 0);
        intext = "";
        for (String sentence : sentences) {
            sentence = sentence.trim();

            if (sentence.length() <= 0) {
                continue;
            }

            String firstCharacter = String.valueOf(sentence.toUpperCase().charAt(0));
            String afterSecondCharacters = "";
            if (sentence.length() >= 2) {
                afterSecondCharacters = sentence.substring(1);
            }

            if (intext.length() > 0) {
                intext += ". ";
            }
            intext += firstCharacter + afterSecondCharacters;
        }

        intext = intext.replaceAll(" ,", ",");
        intext = intext.replaceAll(",+", ",");

        if (requirePeriod) {
            intext += ".";
        }

        // System.out.println("solution");
        System.out.println(intext);
    }
}
