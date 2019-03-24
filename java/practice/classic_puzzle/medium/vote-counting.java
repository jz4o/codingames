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
        int N = in.nextInt();
        int M = in.nextInt();

        HashMap<String, Integer> voters = new HashMap<String, Integer>();
        for (int i = 0; i < N; i++) {
            String personName = in.next();
            int nbVote = in.nextInt();

            voters.put(personName, nbVote);
        }

        HashMap<String, HashMap<String, Integer>> votes = new HashMap<String, HashMap<String, Integer>>();
        for (int i = 0; i < M; i++) {
            String voterName = in.next();
            String voteValue = in.next();

            if (votes.get(voterName) == null) {
                HashMap<String, Integer> voteValues = new HashMap<String, Integer>();
                voteValues.put("Size", 0);
                voteValues.put("Yes", 0);
                voteValues.put("No", 0);
                votes.put(voterName, voteValues);
            }

            HashMap<String, Integer> voteValues = votes.get(voterName);

            int size = voteValues.get("Size");
            votes.get(voterName).put("Size", size + 1);

            // skip invalid vote
            if (voteValues.get(voteValue) == null) {
                continue;
            }

            Integer countOfYesOrNo = voteValues.get(voteValue);
            voteValues.put(voteValue, countOfYesOrNo + 1);
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        int yes = 0;
        int no  = 0;
        for (HashMap.Entry<String, Integer> entry : voters.entrySet()) {
            String voteName = entry.getKey();
            int voteCount = entry.getValue();
            HashMap<String, Integer> voteValues = votes.get(voteName);

            // skip `did not vote, or injustice vote person`
            if (voteValues == null || voteValues.get("Size") > voteCount) {
                continue;
            }

            yes += votes.get(voteName).get("Yes");
            no  += votes.get(voteName).get("No");
        }

        // System.out.println("output");
        System.out.println(yes + " " + no);
    }
}
