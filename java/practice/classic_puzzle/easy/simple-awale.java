import java.util.*;
import java.util.stream.Collectors;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    final static int BOWLS_SIZE = 7;
    final static int PLAYER_SIZE = 2;
    final static int OP_BOWLS_INDEX = 0;
    final static int MY_BOWLS_INDEX = 1;

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        String opBowls = in.nextLine();
        String myBowls = in.nextLine();

        int[] opBowlsArray = Arrays.stream(opBowls.split(" "))
                                   .mapToInt(Integer::parseInt)
                                   .toArray();
        int[] myBowlsArray = Arrays.stream(myBowls.split(" "))
                                   .mapToInt(Integer::parseInt)
                                   .toArray();
        int num = in.nextInt();

        int[][] bowls = new int[PLAYER_SIZE][BOWLS_SIZE];
        for (int i = 0; i < BOWLS_SIZE; i++) {
            bowls[OP_BOWLS_INDEX][i] = opBowlsArray[i];
            bowls[MY_BOWLS_INDEX][i] = myBowlsArray[i];
        }

        int seeds = bowls[MY_BOWLS_INDEX][num];
        bowls[MY_BOWLS_INDEX][num] = 0;
        int index = num + 1;

        while (seeds > 0) {
            int rowIndex = -(((index / BOWLS_SIZE) % PLAYER_SIZE) - 1);
            int columnIndex = index % BOWLS_SIZE;

            boolean isEnemyStore = rowIndex == 0 && columnIndex == BOWLS_SIZE - 1;
            if (isEnemyStore) {
                index++;
                continue;
            }

            bowls[rowIndex][columnIndex] += 1;
            index++;
            seeds--;
        }

        String opBowlsResult = Arrays.stream(Arrays.copyOfRange(bowls[OP_BOWLS_INDEX], 0, bowls[OP_BOWLS_INDEX].length - 1))
                                     .mapToObj(String::valueOf)
                                     .collect(Collectors.joining(" "));
        int opReserve = bowls[OP_BOWLS_INDEX][bowls[OP_BOWLS_INDEX].length - 1];
        String myBowlsResult = Arrays.stream(Arrays.copyOfRange(bowls[MY_BOWLS_INDEX], 0, bowls[MY_BOWLS_INDEX].length - 1))
                                     .mapToObj(String::valueOf)
                                     .collect(Collectors.joining(" "));
        int myReserve = bowls[MY_BOWLS_INDEX][bowls[MY_BOWLS_INDEX].length - 1];

        System.out.println(opBowlsResult + " [" + opReserve + "]");
        System.out.println(myBowlsResult + " [" + myReserve + "]");
        if (index % BOWLS_SIZE == 0) {
            System.out.println("REPLAY");
        }
    }
}
