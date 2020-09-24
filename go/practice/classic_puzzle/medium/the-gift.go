package main

import "fmt"

import "math"
import "sort"
import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    var C int
    fmt.Scan(&C)

    var budgets []int
    for i := 0; i < N; i++ {
        var B int
        fmt.Scan(&B)

        budgets = append(budgets, B)
    }

    budgetsSum := 0
    for _, v := range budgets {
        budgetsSum += v
    }

    var results []string
    if budgetsSum < C {
        results = append(results, "IMPOSSIBLE")
    } else {
        lack := C
        sort.Sort(sort.IntSlice(budgets))
        for len(budgets) > 0 {
            average := lack / len(budgets)

            var firstBudget int
            firstBudget, budgets, _ = delete(budgets, 0)

            pay := int(math.Min(float64(firstBudget), float64(average)))

            lack -= pay
            results = append(results, strconv.Itoa(pay))
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("IMPOSSIBLE")// Write answer to stdout
    for _, v := range results {
        fmt.Println(v)
    }
}

func delete(slice []int, i int) (int, []int, error) {
    ret := slice[i]
    if len(slice) < i || len(slice) < i {
        return 0, nil, fmt.Errorf("Error")
    }
    ans := make([]int, len(slice))
    copy(ans, slice)

    ans = append(slice[:i], slice[(i+1):]...)

    return ret, ans, nil
}

