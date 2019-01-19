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
        int N = in.nextInt(); // Number of elements which make up the association table.
        int Q = in.nextInt(); // Number Q of file names to be analyzed.
        String[] exts = new String[N];
        String[] mts  = new String[N];
        for (int i = 0; i < N; i++) {
            String EXT = in.next(); // file extension
            String MT = in.next(); // MIME type.

            exts[i] = EXT.toLowerCase();
            mts[i]  = MT;
        }
        in.nextLine();
        String[] fnames = new String[Q];
        for (int i = 0; i < Q; i++) {
            String FNAME = in.nextLine(); // One file name per line.
            fnames[i] = FNAME;
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        String[] results = new String[Q];
        for (int i = 0; i < fnames.length; i++) {
            String fname = fnames[i];
            String ext = "";

            int dotIndex = fname.lastIndexOf('.');
            if (dotIndex >= 0) {
                ext = fname.substring(dotIndex + 1).toLowerCase();
            }

            int extIndex = Arrays.asList(exts).indexOf(ext);
            results[i] = extIndex < 0 ? "UNKNOWN" : mts[extIndex];
        }

        // For each of the Q filenames, display on a line the corresponding MIME type. If there is no corresponding type, then display UNKNOWN.
        // System.out.println("UNKNOWN");
        for (String result : results) {
            System.out.println(result);
        }
    }
}
