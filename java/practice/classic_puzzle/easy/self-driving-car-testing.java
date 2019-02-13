import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        // inputs
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String xthenCOMMANDS = in.nextLine();
        String[] rthenRoadPatterns = new String[N];
        for (int i = 0; i < N; i++) {
            String rthenROADPATTERN = in.nextLine();
            rthenRoadPatterns[i] = rthenROADPATTERN;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        // parse command
        String[] xthenCommandsArray = xthenCOMMANDS.split(";");
        int position = Integer.parseInt(xthenCommandsArray[0]);
        ArrayList<String> commands = new ArrayList<String>();
        for (int i = 1; i < xthenCommandsArray.length; i++) {
            String xthenCommand = xthenCommandsArray[i];
            int time = Integer.parseInt(xthenCommand.substring(0, xthenCommand.length() - 1));
            String command = xthenCommand.substring(xthenCommand.length() - 1);
            for (int t = 0; t < time; t++) {
                commands.add(command);
            }
        }

        // driving
        ArrayList<String> results = new ArrayList<String>();
        for (String rthenRoadPattern : rthenRoadPatterns) {
            int semicolonIndex = rthenRoadPattern.indexOf(";");
            int count = Integer.parseInt(rthenRoadPattern.substring(0, semicolonIndex));
            String pattern = rthenRoadPattern.substring(semicolonIndex + 1);

            for (int c = 0; c < count; c++) {
                switch(commands.remove(0)) {
                case "L":
                    position--;
                    break;
                case "R":
                    position++;
                    break;
                }

                String leftPart  = pattern.substring(0, position - 1);
                String rightPart = pattern.substring(position);

                results.add(leftPart + "#" + rightPart);
            }
        }

        // System.out.println("answer");
        for (String result : results) {
            System.out.println(result);
        }
    }
}
