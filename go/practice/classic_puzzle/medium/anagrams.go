package main

import "fmt"
import "os"
import "bufio"

import "math"
import "regexp"
import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    scanner.Scan()
    phrase := scanner.Text()
    // _ = phrase // to avoid unused error

    sizeOfWords := []int{}
    for _, word := range strings.Split(phrase, " ") {
        sizeOfWords = append(sizeOfWords, len(word))
    }
    phraseChars := []string{}
    for _, c := range strings.Split(phrase, "") {
        if strings.TrimSpace(c) != "" {
            phraseChars = append(phraseChars, c)
        }
    }
    words := []string{}
    for _, sizeOfWord := range reverse(sizeOfWords) {
        word := strings.Join(phraseChars[0:sizeOfWord], "")
        words = append(words, word)

        phraseChars = phraseChars[sizeOfWord:]
    }
    tempPhrase := strings.Join(words, " ")

    tempPhrase = partUnshift(tempPhrase, getIndexes(tempPhrase, getAlphabetsEveryBy(4)))
    tempPhrase = partShift(tempPhrase, getIndexes(tempPhrase, getAlphabetsEveryBy(3)))
    tempPhrase = partReverse(tempPhrase, getIndexes(tempPhrase, getAlphabetsEveryBy(2)))

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(tempPhrase)
}

func getAlphabetsEveryBy(num int) []string {
    alphabets := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    result := []string{}
    for index := 0; index < len(alphabets); index++ {
        if (index + 1) % num == 0 {
            result = append(result, string(alphabets[index]))
        }
    }

    return result
}

func getIndexes(str string, searchSlice []string) []int {
    result := []int{}
    for index := 0; index < len(str); index++ {
        if contains(searchSlice, string(str[index])) {
            result = append(result, index)
        }
    }

    return result
}

func partShift(str string, indexes []int) string {
    result := str

    for index := 0; index < len(indexes) - 1; index++ {
        indexInStr := indexes[index]
        nextIndexInStr := indexes[index + 1]

        left := indexInStr
        if nextIndexInStr < left {
            left = nextIndexInStr
        }
        right := int(math.Abs(float64(indexInStr - nextIndexInStr))) - 1

        result = regexp.MustCompile("(.{" + strconv.Itoa(left) + "})(.)(.{" + strconv.Itoa(right) + "})(.)(.*)").ReplaceAllString(result, "$1$4$3$2$5")
    }

    return result
}

func partUnshift(str string, indexes []int) string {
    return partShift(str, reverse(indexes))
}

func partReverse(str string, indexes []int) string {
    result := str

    for len(indexes) >= 2 {
        shiftIndex := indexes[0]
        popIndex := indexes[len(indexes) - 1]
        indexes = indexes[1:len(indexes) - 1]

        left := shiftIndex
        if popIndex < left {
            left = popIndex
        }
        right := int(math.Abs(float64(shiftIndex - popIndex))) - 1

        result = regexp.MustCompile("(.{" + strconv.Itoa(left) + "})(.)(.{" + strconv.Itoa(right) + "})(.)(.*)").ReplaceAllString(result, "$1$4$3$2$5")
    }

    return result
}

func contains(slice []string, target string) bool {
    for _, elm := range slice {
        if elm == target {
            return true
        }
    }

    return false
}

func reverse(slice []int) []int {
    result := []int{}
    for _, elm := range slice {
        result = append([]int{elm}, result...)
    }

    return result
}

