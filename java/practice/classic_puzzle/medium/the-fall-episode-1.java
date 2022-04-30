import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Player {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int W = in.nextInt(); // number of columns.
        int H = in.nextInt(); // number of rows.
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String[][] lines = new String[H][W];
        for (int i = 0; i < H; i++) {
            String LINE = in.nextLine(); // represents a line in the grid and contains W integers. Each integer represents one room of a given type.
            lines[i] = LINE.split(" ");
        }
        int EX = in.nextInt(); // the coordinate along the X axis of the exit (not useful for this first mission, but must be read).

        // direction
        final Integer top    = 0;
        final Integer left   = 1;
        final Integer right  = 2;
        final Integer bottom = 3;
        final Integer none   = null;

        // panel
        // key   : direction of entrance
        // value : array of direction of exit ( index of array is type of panel )
        HashMap<String, Integer[]> panelDestination = new HashMap<String, Integer[]>();
        panelDestination.put("TOP",   new Integer[]{ none, bottom, none,  bottom, left,   right,  none,  bottom, none,   bottom, left, right, none,   none   });
        panelDestination.put("LEFT",  new Integer[]{ none, bottom, right, none,   none,   bottom, right, none,   bottom, bottom, none, none,  none,   bottom });
        panelDestination.put("RIGHT", new Integer[]{ none, bottom, left,  none,   bottom, none,   left,  bottom, bottom, none,   none, none,  bottom, none   });

        // game loop
        while (true) {
            int XI = in.nextInt();
            int YI = in.nextInt();
            String POS = in.next();

            // Write an action using System.out.println()
            // To debug: System.err.println("Debug messages...");

            int panelType = Integer.parseInt(lines[YI][XI]);
            Integer nextDestination = panelDestination.get(POS)[panelType];

            if (nextDestination == left) {
                XI--;
            } else if (nextDestination == right) {
                XI++;
            } else if (nextDestination == bottom) {
                YI++;
            }

            // One line containing the X Y coordinates of the room in which you believe Indy will be on the next turn.
            // System.out.println("0 0");
            System.out.println(XI + " " + YI);
        }
    }
}
