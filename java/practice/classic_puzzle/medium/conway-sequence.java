import java.util.*;
import java.io.*;
import java.math.*;
import java.util.stream.Collectors;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int R = in.nextInt();
        int L = in.nextInt();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        ArrayList<Integer> result = new ArrayList<Integer>();
        result.add(R);
        for (int i = 0; i < L - 1; i++) {
            ArrayList<Integer> temp = new ArrayList<Integer>(result);
            result.clear();

            while (temp.size() > 0) {
                int firstElement = temp.get(0);
                Integer anotherElement = null;
                for (int e : temp) {
                    if (firstElement != e) {
                        anotherElement = e;
                        break;
                    }
                }

                int deleteSize = anotherElement != null ? temp.indexOf(anotherElement) : temp.size();
                result.add(deleteSize);
                result.add(firstElement);

                for (int d = 0; d < deleteSize; d++) {
                    temp.remove(0);
                }
            }
        }

        // System.out.println("answer");
        System.out.println(result.stream().map(String::valueOf).collect(Collectors.joining(" ")));
    }
}
