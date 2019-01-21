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
        String expression = in.next();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        HashMap brackets = new HashMap();
        brackets.put("(", ")");
        brackets.put("[", "]");
        brackets.put("{", "}");

        expression = expression.replaceAll("[^\\(\\)\\{\\}\\[\\]]", "");

        boolean isCollect = true;
        ArrayList<String> chars = new ArrayList<String>();

        for (char c : expression.toCharArray()) {
            String s = String.valueOf(c);

            if (brackets.get(s) != null) {
                chars.add(s);
                continue;
            }

            if (!chars.isEmpty()) {
                String lastKey   = String.valueOf(chars.remove(chars.size() - 1));
                String lastValue = String.valueOf(brackets.get(lastKey));
                if (lastValue.equals(s)) {
                    continue;
                }
            }

            isCollect = false;
            break;
        }

        if (!chars.isEmpty()) {
            isCollect = false;
        }

        // System.out.println("true/false");
        System.out.println(isCollect);
    }
}
