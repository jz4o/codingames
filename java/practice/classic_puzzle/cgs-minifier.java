import java.util.*;
import java.io.*;
import java.math.*;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
        String[] cgsContents = new String[N];
        for (int i = 0; i < N; i++) {
            String cgsContent = in.nextLine();
            cgsContents[i] = cgsContent;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        HashMap<String, Character> variables = new HashMap<String, Character>();
        ArrayList<String> characters = new ArrayList<String>();
        char replaceChar = 'a';

        Pattern variablePattern  = Pattern.compile("\\$.+?\\$");
        Pattern characterPattern = Pattern.compile("'.+'");

        for (int i = 0; i < cgsContents.length; i++) {
            String cgsContent = cgsContents[i];

            // replace variable part
            Matcher matcher = variablePattern.matcher(cgsContent);
            ArrayList<String> matchedVariables = new ArrayList<String>();
            while (matcher.find()) {
                matchedVariables.add(matcher.group());
            }

            for (String matchedVariable : matchedVariables) {
                if (!variables.containsKey(matchedVariable)) {
                    variables.put(matchedVariable, replaceChar);
                    replaceChar++;
                }
                cgsContent = cgsContent.replaceAll(
                    Pattern.quote(matchedVariable), "\\$" + variables.get(matchedVariable) + "\\$");
            }

            // replace character part
            matcher = characterPattern.matcher(cgsContent);
            matchedVariables = new ArrayList<String>();
            while (matcher.find()) {
                matchedVariables.add(matcher.group());
            }

            for (String matchedVariable : matchedVariables) {
                cgsContent = cgsContent.replaceAll(matchedVariable, "\\$" + characters.size());
                characters.add(matchedVariable);
            }

            cgsContents[i] = cgsContent.replaceAll(" ", "");
        }

        // restore character part
        String result = String.join("", cgsContents);
        for (int i = 0; i < characters.size(); i++) {
            result = result.replaceAll("\\$" + i, characters.get(i));
        }

        // System.out.println("minified all CGS content");
        System.out.println(result);
    }
}
