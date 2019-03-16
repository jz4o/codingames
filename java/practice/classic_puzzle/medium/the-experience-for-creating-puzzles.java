import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    final static int EXP_OF_PUZZLE = 300;

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int level = in.nextInt();
        int xp = in.nextInt();
        int N = in.nextInt();

        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        BlitzProg blitzProg = new BlitzProg(level, EXP_OF_PUZZLE * N, xp);
        blitzProg.levelUp();

        // System.out.println("answer");
        System.out.println(blitzProg.getLevel());
        System.out.println(blitzProg.getRequireLevelUpExp());
    }
}

class BlitzProg {
    private int level;
    private int exp;
    private int requireLevelUpExp;

    public BlitzProg(int level, int exp, int requireLevelUpExp) {
        this.level             = level;
        this.exp               = exp;
        this.requireLevelUpExp = requireLevelUpExp;
    }

    public final int getLevel() {
        return level;
    }

    public final int getRequireLevelUpExp() {
        return requireLevelUpExp;
    }

    public final void levelUp() {
        // failure level up
        if (this.exp < this.requireLevelUpExp) {
            this.requireLevelUpExp -= exp;
            this.exp = 0;

            return;
        }

        // level up
        this.exp -= this.requireLevelUpExp;
        this.level++;
        this.requireLevelUpExp = getExpForLevelUp();

        // challenge next level up
        levelUp();
    }

    private final int getExpForLevelUp() {
        return (int) Math.floor(this.level * Math.sqrt(this.level) * 10);
    }
}
