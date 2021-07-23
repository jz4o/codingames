package main

import "fmt"
import "os"
import "bufio"

import "regexp"
import "sort"
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
    expr := scanner.Text()
    _ = expr // to avoid unused error

    incompleteExprs := []string{expr}
    exprs := []string{}

    for len(incompleteExprs) > 0 {
        incompleteExpr := incompleteExprs[0]
        incompleteExprs = incompleteExprs[1:]

        if !strings.Contains(incompleteExpr, "d") {
            exprs = append(exprs, incompleteExpr)
            continue
        }

        dice := regexp.MustCompile("d\\d").FindString(incompleteExpr)
        splitedIncompleteExpr := strings.SplitN(incompleteExpr, dice, 2)
        front, back := splitedIncompleteExpr[0], splitedIncompleteExpr[1]

        diceNumber, _ := strconv.Atoi(string(dice[1]))
        for i := 1; i <= diceNumber; i++ {
            incompleteExprs = append(incompleteExprs, front + strconv.Itoa(i) + back)
        }
    }

    answers := []int{}
    for _, expr := range exprs {
        answers = append(answers, calc(expr))
    }

    uniqAnswers := []int{}
    for _, answer := range answers {
        if !containsIntSlice(uniqAnswers, answer) {
            uniqAnswers = append(uniqAnswers, answer)
        }
    }
    sort.Sort(sort.IntSlice(uniqAnswers))

    results := []string{}
    for _, answer := range uniqAnswers {
        answerCount := countIntSlice(answers, answer)

        percentage := (float64)(answerCount) / (float64)(len(answers)) * 100
        formattedPercentage := fmt.Sprintf("%.2f", percentage)

        results = append(results, strconv.Itoa(answer) + " " + formattedPercentage)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, result := range results {
        fmt.Println(result)
    }
}

func calc(expr string) int {
    for strings.Contains(expr, "(") {
        bracketExpr := regexp.MustCompile("\\(.*?\\)").FindString(expr)
        answer := calc(bracketExpr[1:len(bracketExpr) - 1])

        expr = strings.ReplaceAll(expr, bracketExpr, strconv.Itoa(answer))
    }

    expr = strings.ReplaceAll(expr, "*", " * ")
    expr = strings.ReplaceAll(expr, "+", " + ")
    expr = strings.ReplaceAll(expr, "-", " - ")
    expr = strings.ReplaceAll(expr, ">", " > ")
    exprElements := strings.Split(expr, " ")

    asteriskIndexes := indexesStringSlice(exprElements, "*")
    sort.Sort(sort.Reverse(sort.IntSlice(asteriskIndexes)))
    for _, index := range asteriskIndexes {
        prevInt, _ := strconv.Atoi(exprElements[index - 1])
        nextInt, _ := strconv.Atoi(exprElements[index + 1])
        answer := prevInt * nextInt

        tempExprElements := []string{}
        tempExprElements = append(tempExprElements, exprElements[:index - 1]...)
        tempExprElements = append(tempExprElements, strconv.Itoa(answer))
        tempExprElements = append(tempExprElements, exprElements[index + 2:]...)
        exprElements = tempExprElements
    }

    plusIndexes := indexesStringSlice(exprElements, "+");
    sort.Sort(sort.Reverse(sort.IntSlice(plusIndexes)))
    for _, index := range plusIndexes {
        prevInt, _ := strconv.Atoi(exprElements[index - 1])
        nextInt, _ := strconv.Atoi(exprElements[index + 1])
        answer := prevInt + nextInt

        tempExprElements := []string{}
        tempExprElements = append(tempExprElements, exprElements[:index - 1]...)
        tempExprElements = append(tempExprElements, strconv.Itoa(answer))
        tempExprElements = append(tempExprElements, exprElements[index + 2:]...)
        exprElements = tempExprElements
    }

    minusIndexes := indexesStringSlice(exprElements, "-")
    sort.Sort(sort.Reverse(sort.IntSlice(minusIndexes)))
    for _, index := range minusIndexes {
        prevInt, _ := strconv.Atoi(exprElements[index - 1])
        nextInt, _ := strconv.Atoi(exprElements[index + 1])
        answer := prevInt - nextInt

        tempExprElements := []string{}
        tempExprElements = append(tempExprElements, exprElements[:index - 1]...)
        tempExprElements = append(tempExprElements, strconv.Itoa(answer))
        tempExprElements = append(tempExprElements, exprElements[index + 2:]...)
        exprElements = tempExprElements
    }

    gtIndexes := indexesStringSlice(exprElements, ">")
    sort.Sort(sort.Reverse(sort.IntSlice(gtIndexes)))
    for _, index := range gtIndexes {
        prevInt, _ := strconv.Atoi(exprElements[index - 1])
        nextInt, _ := strconv.Atoi(exprElements[index + 1])
        answer := 0
        if prevInt > nextInt {
            answer = 1
        }

        tempExprElements := []string{}
        tempExprElements = append(tempExprElements, exprElements[:index - 1]...)
        tempExprElements = append(tempExprElements, strconv.Itoa(answer))
        tempExprElements = append(tempExprElements, exprElements[index + 2:]...)
        exprElements = tempExprElements
    }

    result, _ := strconv.Atoi(exprElements[0])

    return result
}

func containsIntSlice(slice []int, target int) bool {
    for _, elm := range slice {
        if elm == target {
            return true
        }
    }

    return false
}

func countIntSlice(slice []int, target int) int {
    result := 0
    for _, elm := range slice {
        if elm == target {
            result++
        }
    }

    return result
}

func indexesStringSlice(slice []string, target string) []int {
    results := []int{}
    for index, elm := range slice {
        if elm == target {
            results = append(results, index)
        }
    }

    return results
}
