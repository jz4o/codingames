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
        String LON = in.next();
        double lon = Double.parseDouble(LON.replace(",", "."));
        String LAT = in.next();
        double lat = Double.parseDouble(LAT.replace(",", "."));
        int N = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        ArrayList<HashMap> defibs = new ArrayList<HashMap>();
        for (int i = 0; i < N; i++) {
            String DEFIB = in.nextLine();
            String[] defibElements = DEFIB.split(";");

            HashMap defib = new HashMap();
            defib.put("id",        defibElements[0]);
            defib.put("name",      defibElements[1]);
            defib.put("address",   defibElements[2]);
            defib.put("phone",     defibElements[3]);
            defib.put("longitude", Double.parseDouble(defibElements[4].replace(",", ".")));
            defib.put("latitude",  Double.parseDouble(defibElements[5].replace(",", ".")));

            defibs.add(defib);
        }

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        HashMap nearDefib = defibs.get(0);
        double distance = 10000;
        for (HashMap defib : defibs) {
            double longitude = (double) defib.get("longitude");
            double latitude = (double) defib.get("latitude");
            double x = (lon - longitude) * Math.cos((latitude + lat) / 2);
            double y = lat - latitude;
            double d = Math.sqrt(x * x + y * y);

            if (d < distance) {
                distance = d;
                nearDefib = defib;
            }
        }

        // System.out.println("answer");

        System.out.println(nearDefib.get("name"));
    }
}
