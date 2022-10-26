use std::io;

extern crate regex;
use regex::Regex;

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
    let n = parse_input!(input_line, i32);
    let mut transactions: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let transaction = input_line.trim_matches('\n').to_string();
        transactions.push(transaction);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let benford_law_percentages: [f64; 10] = [0.0, 0.301, 0.176, 0.125, 0.097, 0.079, 0.067, 0.058, 0.051, 0.046];

    let regex: Regex = Regex::new(r"\d").unwrap();
    let mut first_numbers: Vec<usize> = Vec::new();
    for transaction in transactions {
        let captures: regex::Captures = regex.captures(&transaction).unwrap();
        let first_number: usize = captures.get(0).unwrap().as_str().to_string().parse().unwrap();
        first_numbers.push(first_number);
    }

    let mut is_fraudulent: bool = false;
    for i in 1..10 as usize {
        let benford_law_percentage: f64 = benford_law_percentages[i];
        let percent: f64 = first_numbers.iter().filter(|&&first_number| first_number == i).count() as f64 / n as f64;

        if percent < benford_law_percentage - 0.1 || benford_law_percentage + 0.1 < percent {
            is_fraudulent = true;
            break;
        }
    }

    let result: bool = is_fraudulent;

    // println!("false");
    println!("{result}");
}
