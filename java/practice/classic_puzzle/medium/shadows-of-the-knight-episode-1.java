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
        int W = in.nextInt(); // width of the building.
        int H = in.nextInt(); // height of the building.
        int N = in.nextInt(); // maximum number of turns before game over.
        int X0 = in.nextInt();
        int Y0 = in.nextInt();

        int bombMinHeight = H;
        int bombMaxHeight = 0;
        int bombMinWidth  = 0;
        int bombMaxWidth  = W;

        // game loop
        while (true) {
            String bombDir = in.next(); // the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)

            // Write an action using System.out.println()
            // To debug: System.err.println("Debug messages...");

            if (bombDir.contains("U")) {
                bombMinHeight = Y0;
                Y0 -= Math.ceil((Y0 - bombMaxHeight) / 2.0);
            } else if (bombDir.contains("D")) {
                bombMaxHeight = Y0;
                Y0 += Math.ceil((bombMinHeight - Y0) / 2.0);
            }

            if (bombDir.contains("R")) {
                bombMinWidth = X0;
                X0 += Math.ceil((bombMaxWidth - X0) / 2.0);
            } else if (bombDir.contains("L")) {
                bombMaxWidth = X0;
                X0 -= Math.ceil((X0 - bombMinWidth) / 2.0);
            }

            // the location of the next window Batman should jump to.
            // System.out.println("0 0");
            System.out.println(X0 + " " + Y0);
        }
    }
}
