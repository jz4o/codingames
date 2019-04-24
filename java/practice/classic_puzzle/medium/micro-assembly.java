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
        int a = in.nextInt();
        int b = in.nextInt();
        int c = in.nextInt();
        int d = in.nextInt();

        HashMap<String, Integer> values = new HashMap<String, Integer>();
        values.put("a", a);
        values.put("b", b);
        values.put("c", c);
        values.put("d", d);

        int n = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String[] instructions = new String[n];
        for (int i = 0; i < n; i++) {
            String instruction = in.nextLine();
            instructions[i] = instruction;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        for (int i = 0; i < n; i++) {
            String[] instructionArgs = instructions[i].split(" ");

            String operator = instructionArgs[0];
            String  arg1 = instructionArgs[1];
            Integer arg2 = 0;
            Integer arg3 = 0;

            arg2 = values.get(instructionArgs[2]);
            if (arg2 == null) {
                arg2 = Integer.parseInt(instructionArgs[2]);
            }

            arg3 = 0;
            if (instructionArgs.length >= 4) {
                arg3 = values.get(instructionArgs[3]);
                if (arg3 == null) {
                    arg3 = Integer.parseInt(instructionArgs[3]);
                }
            }

            // invert positive to negative for addition
            if (operator.equals("SUB")) {
                arg3 = -arg3;
            }

            // execute instruction
            if (operator.equals("JNE")) {
                if (arg2 != arg3) {
                    // minus 1 is for `for` increment
                    i = Integer.parseInt(arg1) - 1;
                    continue;
                }
            } else {
                values.put(arg1, arg2 + arg3);
            }
        }

        // System.out.println("a b c d");
        String result = "";
        result += values.get("a");
        result += " " + values.get("b");
        result += " " + values.get("c");
        result += " " + values.get("d");
        System.out.println(result);
    }
}
