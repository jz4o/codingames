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
        int N1 = in.nextInt();
        int N2 = in.nextInt();
        String S1 = in.next();
        String S2 = in.next();
        int T = in.nextInt();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String[] s1MovePartArray = S1.substring(0, Math.min(T, S1.length())).split("");
        String[] s2MovePartArray = S2.substring(0, Math.min(T, S2.length())).split("");
        ArrayList<String> s1MovePart = new ArrayList<String>(Arrays.asList(s1MovePartArray));
        ArrayList<String> s2MovePart = new ArrayList<String>(Arrays.asList(s2MovePartArray));
        Collections.reverse(s1MovePart);

        while (s1MovePart.size() < T) { s1MovePart.add(0, ""); }
        while (s2MovePart.size() < T) { s2MovePart.add(""); }

        String sMovedPart = "";
        for (int i = 0; i < T; i++) {
            sMovedPart += s2MovePart.get(i);
            sMovedPart += s1MovePart.get(i);
        }

        String s1NotMovePart = new StringBuffer(S1.length() < T ? "" : S1.substring(T)).reverse().toString();
        String s2NotMovePart = S2.length() < T ? "" : S2.substring(T);

        // System.out.println("answer");
        System.out.println(s1NotMovePart + sMovedPart + s2NotMovePart);
    }
}
