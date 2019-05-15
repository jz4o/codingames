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
        String[] telephones = new String[N];
        for (int i = 0; i < N; i++) {
            String telephone = in.next();
            telephones[i] = telephone;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        HashMap<String, HashMap> numberHash = new HashMap<String, HashMap>();
        for (String telephone : telephones) {
            HashMap<String, HashMap> targetHash = numberHash;
            for (int i = 0; i < telephone.length(); i++) {
                String number = String.valueOf(telephone.charAt(i));
                if (targetHash.get(number) == null) {
                    targetHash.put(number, new HashMap<String, HashMap>());
                }
                targetHash = targetHash.get(number);
            }
        }

        int result = 0;
        for (char number : numberHash.toString().toCharArray()) {
            if (number == '=') {
                result++;
            }
        }

        // The number of elements (referencing a number) stored in the structure.
        // System.out.println("number");
        System.out.println(result);
    }
}
