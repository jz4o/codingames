import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    final static List<String> CARD_LANKS = Arrays.asList(new String[]{ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" });

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt(); // the number of cards for player 1
        ArrayList<String> deck1 = new ArrayList<String>();
        for (int i = 0; i < n; i++) {
            String cardp1 = in.next(); // the n cards of player 1
            deck1.add(cardp1.substring(0, cardp1.length() - 1));
        }
        int m = in.nextInt(); // the number of cards for player 2
        ArrayList<String> deck2 = new ArrayList<String>();
        for (int i = 0; i < m; i++) {
            String cardp2 = in.next(); // the m cards of player 2
            deck2.add(cardp2.substring(0, cardp2.length() - 1));
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String result;
        try {
            int turn = 0;
            while (deck1.size() > 0 && deck2.size() > 0) {
                turn++;

                // fight
                HashMap<String, Object> fightResult = fight(deck1, deck2, 0);
                ArrayList<String> winDeck = (ArrayList<String>)fightResult.get("deck");
                int index = (int) fightResult.get("index") + 1;

                // card transfer at loser to winner
                String[] acquisition1 = new String[index];
                String[] acquisition2 = new String[index];
                for (int i = 0; i < index; i++) {
                    acquisition1[i] = deck1.remove(0);
                    acquisition2[i] = deck2.remove(0);
                }
                winDeck.addAll(Arrays.asList(acquisition1));
                winDeck.addAll(Arrays.asList(acquisition2));
            }

            result = (deck1.size() < deck2.size() ? 2 : 1) + " " + turn;
        } catch (Exception e) {
            result = "PAT";
        }

        // System.out.println("PAT");
        System.out.println(result);
    }

    private static HashMap<String, Object> fight(ArrayList<String> deck1, ArrayList<String> deck2, int index) {
        int card1 = CARD_LANKS.indexOf(deck1.get(index));
        int card2 = CARD_LANKS.indexOf(deck2.get(index));

        // deck is empty
        if (card1 < 0 || card2 < 0) {
            new Exception();
        }

        // draw
        if (card1 == card2) {
            return fight(deck1, deck2, index + 4);
        }

        HashMap<String, Object> result = new HashMap<String, Object>();
        result.put("deck", card1 < card2 ? deck2 : deck1);
        result.put("index", index);

        return result;
    }
}
