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
        int n = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }

        List<String> cardList = new ArrayList<String>();
        for (int i = 0; i < n; i++) {
            String card = in.nextLine();
            cardList.add(card);
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        System.out.println(action(cardList));
    }

    public static String action(final List<String> cardList) {
        String results = "";
        for (int index=0; index<cardList.size(); index++) {
            String card = cardList.get(index).replace(" ", "");

            int sumNumbers = 0;
            for (int numIndex=0; numIndex<card.length(); numIndex++) {
                int number = Integer.parseInt(String.valueOf(card.charAt(numIndex)));

                if (numIndex % 2 == 0) {
                    number *= 2;
                    if (number >= 10) number -= 9;
                }

                sumNumbers += number;
            }

            results += (sumNumbers % 10 == 0 ? "YES" : "NO") + "\n";
        }

        return results.trim();
    }
}
