import java.util.*;
import java.util.stream.Collectors;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        String phrase = in.nextLine();

        // Write an answer using System.out.println()
        // To debug: System.err.println("Debug messages...");

        List<Integer> sizeOfWords = Arrays.asList(phrase.split(" ")).stream().map(word -> word.length()).collect(Collectors.toList());
        List<String> phraseChars = Arrays.asList(phrase.split("")).stream().filter(c -> !c.trim().equals("")).collect(Collectors.toList());
        ArrayList<String> words = new ArrayList<String>();
        List<Integer> reversedSizeOfWords = new ArrayList<Integer>(sizeOfWords);
        Collections.reverse(reversedSizeOfWords);
        for (int sizeOfWord : reversedSizeOfWords) {
                String word = String.join("", phraseChars.subList(0, sizeOfWord));
                words.add(word);

                phraseChars = phraseChars.subList(sizeOfWord, phraseChars.size());
        }
        String tempPhrase = String.join(" ", words);

        // unshift every 4th alphabets
        tempPhrase = partUnshift(tempPhrase, getIndexes(tempPhrase, getAlphabetsEveryBy(4)));

        // shift every 3rd alphabets
        tempPhrase = partShift(tempPhrase, getIndexes(tempPhrase, getAlphabetsEveryBy(3)));

        // reverse every 2nd alphabets
        tempPhrase = partReverse(tempPhrase, getIndexes(tempPhrase, getAlphabetsEveryBy(2)));

        // System.out.println("answer");
        System.out.println(tempPhrase);
    }

    private static ArrayList<String> getAlphabetsEveryBy(int num) {
        List<String> alphabets = Arrays.asList("ABCDEFGHIJKLMNOPQRSTUVWXYZ".split(""));

        ArrayList<String> result = new ArrayList<String>();
        for (int index = 0; index < alphabets.size(); index++) {
                if ((index + 1) % num == 0) {
                        result.add(alphabets.get(index));
                }
        }

        return result;
    }

    private static ArrayList<Integer> getIndexes(String str, ArrayList<String> searchArray) {
        String[] chars = str.split("");
        ArrayList<Integer> result = new ArrayList<Integer>();
        for (int index = 0; index < chars.length; index++) {
                if (searchArray.contains(chars[index])) {
                        result.add(index);
                }
        }

        return result;
    }

    private static String partShift(String str, ArrayList<Integer> indexes) {
        String result = str;

        for (int index = 0; index < indexes.size() - 1; index++) {
                Integer indexInStr = indexes.get(index);
                Integer nextIndexInStr = indexes.get(index + 1);

                int left =  Math.min(indexInStr, nextIndexInStr);
                int right = Math.abs(indexInStr - nextIndexInStr) - 1;

                result = result.replaceFirst("(.{" + left + "})(.)(.{" + right + "})(.)", "$1$4$3$2");
        }

        return result;
    }

    private static String partUnshift(String str, ArrayList<Integer> indexes) {
        ArrayList<Integer> reversedIndexes = indexes;
        Collections.reverse(reversedIndexes);

        return partShift(str, reversedIndexes);
    }

    private static String partReverse(String str, ArrayList<Integer> indexes) {
        String result = str;

        while (indexes.size() >= 2) {
                Integer shiftIndex = indexes.remove(0);
                Integer popIndex = indexes.remove(indexes.size() - 1);

                int left =  Math.min(shiftIndex, popIndex);
                int right = Math.abs(shiftIndex - popIndex) - 1;

                result = result.replaceFirst("(.{" + left + "})(.)(.{" + right + "})(.)", "$1$4$3$2");
        }

        return result;
    }
}

