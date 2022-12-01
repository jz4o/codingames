use std::io;

use std::collections::HashSet;

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fn main() {
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let h = parse_input!(input_line, i32);
    let mut rows: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let row = input_line.trim_matches('\n').to_string();
        rows.push(row);
    }
    let mut results: Vec<String> = Vec::new();
    for i in 0..h as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let row: String = rows[i].to_string();

        let mut result: String = "".to_string();
        let row_elements: Vec<String> = row.split_whitespace().map(|s| s.to_string()).collect();
        for index in 0..row_elements.len() {
            let length: usize = row_elements[index].parse::<usize>().unwrap();

            result += &(if index % 2 == 0 {"."} else {"O"}).repeat(length);
        }

        results.push(result);

        // println!("answer");
    }

    if results.iter().map(|result| result.len()).collect::<HashSet<usize>>().len() != 1 {
        results = vec!["INVALID".to_string()];
    }

    for result in results {
        println!("{result}");
    }
}
