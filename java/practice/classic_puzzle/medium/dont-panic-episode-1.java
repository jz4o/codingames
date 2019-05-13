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
        int nbFloors = in.nextInt(); // number of floors
        int width = in.nextInt(); // width of the area
        int nbRounds = in.nextInt(); // maximum number of rounds
        int exitFloor = in.nextInt(); // floor on which the exit is found
        int exitPos = in.nextInt(); // position of the exit on its floor
        int nbTotalClones = in.nextInt(); // number of generated clones
        int nbAdditionalElevators = in.nextInt(); // ignore (always zero)
        int nbElevators = in.nextInt(); // number of elevators

        Integer[] elevatorFloors = new Integer[nbElevators];
        int[] elevatorPositions = new int[nbElevators];
        for (int i = 0; i < nbElevators; i++) {
            int elevatorFloor = in.nextInt(); // floor on which this elevator is found
            int elevatorPos = in.nextInt(); // position of the elevator on its floor

            elevatorFloors[i] = elevatorFloor;
            elevatorPositions[i] = elevatorPos;
        }


        // game loop
        while (true) {
            int cloneFloor = in.nextInt(); // floor of the leading clone
            int clonePos = in.nextInt(); // position of the leading clone on its floor
            String direction = in.next(); // direction of the leading clone: LEFT or RIGHT

            // Write an action using System.out.println()
            // To debug: System.err.println("Debug messages...");

            int elevatorIndex = Arrays.asList(elevatorFloors).indexOf(cloneFloor);
            Integer elevatorPosition = null;
            if (elevatorIndex >= 0) {
                elevatorPosition = elevatorPositions[elevatorIndex];
            }
            int target = elevatorPosition != null ? elevatorPosition : exitPos;

            boolean isAlreadyFacingLeftTarget = target < clonePos && direction.equals("LEFT");
            boolean isAlreadyFacingRightTarget = clonePos < target && direction.equals("RIGHT");
            String result = "";
            if (isAlreadyFacingLeftTarget || isAlreadyFacingRightTarget || (target == clonePos)) {
                result = "WAIT";
            } else {
                result = "BLOCK";
            }

            // System.out.println("WAIT"); // action: WAIT or BLOCK
            System.out.println(result);
        }
    }
}
