package main

import "fmt"

import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    var M int
    fmt.Scan(&M)

    voters := make(map[string]int)
    for i := 0; i < N; i++ {
        var personName string
        var nbVote int
        fmt.Scan(&personName, &nbVote)

        voters[personName] = nbVote
    }
    votes := make(map[string][]string)
    for i := 0; i < M; i++ {
        var voterName, voteValue string
        fmt.Scan(&voterName, &voteValue)

        if _, exist := votes[voterName]; !exist {
            votes[voterName] = []string{}
        }

        votes[voterName] = append(votes[voterName], voteValue)
    }

    yes := 0
    no := 0
    for voterName, votableCount := range voters {
        votesByVoter, exist := votes[voterName]
        if !exist || len(votesByVoter) > votableCount {
            continue
        }

        for _, vote := range votesByVoter {
            if vote == "Yes" {
                yes++
            } else if vote == "No" {
                no++
            }
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("output")// Write answer to stdout
    fmt.Println(strconv.Itoa(yes) + " " + strconv.Itoa(no))
}

