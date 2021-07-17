package main

import "fmt"
import "os"
import "bufio"
import "strings"

import "math/big"
import "regexp"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var n int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&n)

    results := []string{}
    scanner.Scan()
    inputs := strings.Split(scanner.Text()," ")
    for i := 0; i < n; i++ {
        label := inputs[i]

        if regexp.MustCompile("^\\d+$").MatchString(label) {
            results = append(results, intLabelToAlphaLabel(label))
        } else {
            results = append(results, alphaLabelToIntLabel(label))
        }
    }

    fmt.Println(strings.Join(results, " "))
}

func intLabelToAlphaLabel(intLabel string) string {
    alphas := strings.Split("ABCDEFGHIJKLMNOPQRSTUVWXYZ", "")
    alphaBase := big.NewInt(int64(len(alphas)))

    bigInt := new(big.Int)

    bigIntLabel, _ := new(big.Int).SetString(intLabel, 10)

    result := ""
    for bigIntLabel.Cmp(big.NewInt(0)) == 1 {
        i := bigInt.Mod(bigIntLabel, alphaBase).Int64()
        bigIntLabel.Div(bigIntLabel, alphaBase)
        if i == 0 {
            i = int64(len(alphas))
            bigIntLabel.Sub(bigIntLabel, big.NewInt(1))
        }

        result = alphas[i - 1] + result
    }

    return result
}

func alphaLabelToIntLabel(alphaLabel string) string {
    alphas := strings.Split("ABCDEFGHIJKLMNOPQRSTUVWXYZ", "")
    alphaBase := big.NewInt(int64(len(alphas)))

    bigInt := new(big.Int)

    result := big.NewInt(0)
    for i, char := range reverse(strings.Split(alphaLabel, "")) {
        baseNumber := bigInt.Exp(alphaBase, big.NewInt(int64(i)), nil)
        alphaIndex := int64(indexOf(alphas, char) + 1)

        result.Add(result, bigInt.Mul(baseNumber, big.NewInt(alphaIndex)))
    }

    return result.String()
}

func reverse(slice []string) []string {
    result := []string{}
    for _, elm := range slice {
        result = append([]string{elm}, result...)
    }

    return result
}

func indexOf(slice []string, target string) int {
    for index, elm := range slice {
        if elm == target {
            return index
        }
    }

    return -1
}

