import java.util.*;
import java.io.*;
import java.math.*;

/**
 * The while loop represents the game.
 * Each iteration represents a turn of the game
 * where you are given inputs (the heights of the mountains)
 * and where you have to print an output (the index of the mountain to fire on)
 * The inputs you are given are automatically updated according to your last actions.
 **/
class Player {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);

        // game loop
        while (true) {
            int targetH  = 0;
            int targetId = 0;

            for (int i = 0; i < 8; i++) {
                int mountainH = in.nextInt(); // represents the height of one mountain.

                if (targetH < mountainH) {
                    targetH  = mountainH;
                    targetId = i;
                }
            }

            // Write an action using System.out.println()
            // To debug: System.err.println("Debug messages...");

            // System.out.println("4"); // The index of the mountain to fire on.

            System.out.println(targetId);
        }
    }
}
