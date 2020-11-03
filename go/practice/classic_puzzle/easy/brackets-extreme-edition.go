package main

import "fmt"

import "regexp"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var expression string
    fmt.Scan(&expression)

    var brackets = map[string]string { "(": ")", "[": "]", "{": "}" }

    var bracketStack []string
    collectFlag := true

    rep := regexp.MustCompile("[^\\[\\]\\(\\)\\{\\}]")
    regexedExpression := rep.ReplaceAllString(expression, "")

    for _, bracketRune := range regexedExpression {
        bracket := (string)(bracketRune)

        // left parts of bracket
        if _, exist := brackets[bracket]; exist {
            bracketStack = append(bracketStack, bracket)
            continue
        }

        // right parts of bracket
        var lastBracket string
        if len(bracketStack) > 0 {
            lastIndex := len(bracketStack) - 1
            lastBracket = bracketStack[lastIndex]
            bracketStack = bracketStack[:lastIndex]
        }

        if brackets[lastBracket] != bracket {
            collectFlag = false
            break
        }
    }


    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("true/false")// Write answer to stdout
    fmt.Println(collectFlag && len(bracketStack) == 0)
}

