package main

import "fmt"
import "os"
import "bufio"

import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    // N: Number of elements which make up the association table.
    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    // Q: Number Q of file names to be analyzed.
    var Q int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&Q)

    extMimes := make(map[string]string)
    for i := 0; i < N; i++ {
        // EXT: file extension
        // MT: MIME type.
        var EXT, MT string
        scanner.Scan()
        fmt.Sscan(scanner.Text(),&EXT, &MT)

        extMimes[strings.ToLower(EXT)] = MT
    }
    var fnames []string
    for i := 0; i < Q; i++ {
        scanner.Scan()
        FNAME := scanner.Text() // One file name per line.

        fnames = append(fnames, strings.ToLower(FNAME))
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")

    var results []string
    for _, fname := range fnames {
        fnameElements := strings.Split(fname, ".")
        ext := fnameElements[len(fnameElements) - 1]

        mimeType := extMimes[ext]

        result := "UNKNOWN"
        if ext != fname && mimeType != "" {
            result = mimeType
        }

        results = append(results, result)
    }

    // For each of the Q filenames, display on a line the corresponding MIME type. If there is no corresponding type, then display UNKNOWN.
    // fmt.Println("UNKNOWN")
    for _, result := range results {
        fmt.Println(result)
    }
}

