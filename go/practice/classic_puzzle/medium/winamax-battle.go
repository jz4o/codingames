package main

import "fmt"

import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    cardLanks := []string{"2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"}

    // n: the number of cards for player 1
    var n int
    fmt.Scan(&n)

    var deck1 []int
    for i := 0; i < n; i++ {
        // cardp1: the n cards of player 1
        var cardp1 string
        fmt.Scan(&cardp1)

        cardLank := cardp1[:len(cardp1) - 1]
        deck1 = append(deck1, indexOf(cardLanks, cardLank))
    }
    // m: the number of cards for player 2
    var m int
    fmt.Scan(&m)

    var deck2 []int
    for i := 0; i < m; i++ {
        // cardp2: the m cards of player 2
        var cardp2 string
        fmt.Scan(&cardp2)

        cardLank := cardp2[:len(cardp2) - 1]
        deck2 = append(deck2, indexOf(cardLanks, cardLank))
    }

    var result string
    turn := 0
    for len(deck1) > 0 && len(deck2) > 0 {
        turn++

        fightResult := fight(deck1, deck2, 0)
        if fightResult.winner == "" {
            deck1 = nil
            deck2 = nil

            break
        }

        var moveCards []int
        moveCards = append(moveCards, deck1[:(fightResult.index + 1)]...)
        moveCards = append(moveCards, deck2[:(fightResult.index + 1)]...)

        deck1 = deck1[(fightResult.index + 1):]
        deck2 = deck2[(fightResult.index + 1):]

        if fightResult.winner == "deck1" {
            deck1 = append(deck1, moveCards...)
        } else {
            deck2 = append(deck2, moveCards...)
        }
    }

    if len(deck1) > 0 {
        result = "1 " + strconv.Itoa(turn)
    } else if len(deck2) > 0 {
        result = "2 " + strconv.Itoa(turn)
    } else {
        result = "PAT"
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("PAT")// Write answer to stdout
    fmt.Println(result)
}

type FightResult struct {
    winner string
    index int
}

func fight(deck1 []int, deck2 []int, index int) FightResult {
    if len(deck1) <= index || len(deck2) <= index {
        return FightResult{"", -1}
    }

    deck1Card := deck1[index]
    deck2Card := deck2[index]

    if deck1Card == deck2Card {
        return fight(deck1, deck2, index + 4)
    }

    winner := "deck1"
    if deck1Card < deck2Card {
        winner = "deck2"
    }

    return FightResult{winner, index}
}

func indexOf(slice []string, target string) int {
    for i, v := range slice {
        if v == target {
            return i
        }
    }

    return -1
}

