use std::io;

use regex::Regex;
use std::collections::HashMap;

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
    let mut isbns: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let isbn = input_line.trim_matches('\n').to_string();
        isbns.push(isbn);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let modulus_weights: HashMap<String, Vec<i32>> = HashMap::from([
        ("10".to_string(), vec![1, 3 ,1, 3, 1, 3, 1, 3, 1, 3, 1, 3]),
        ("11".to_string(), (1..11).rev().collect())
    ]);

    let mut invalids: Vec<String> = Vec::new();
    for isbn in isbns.iter() {
        if !Regex::new(r"^\d+X?$").unwrap().is_match(isbn) {
            invalids.push(isbn.to_string());
            continue;
        }

        let modulus;
        if isbn.len() == 10 {
            modulus = 11;
        } else if isbn.len() == 13 {
            if isbn.ends_with("X") {
                invalids.push(isbn.to_string());
                continue;
            }

            modulus = 10;
        } else {
            invalids.push(isbn.to_string());
            continue;
        }

        let mut sum_value: i32 = 0;
        for (index, digit) in isbn[0..isbn.len() - 1].chars().enumerate() {
            sum_value += modulus_weights[&modulus.to_string()][index] * digit.to_string().parse::<i32>().unwrap();
        }
        let check_sum: i32 = (modulus - (sum_value % modulus)) % modulus;
        if check_sum != isbn.chars().nth(isbn.len() - 1).unwrap().to_string().replace("X", "10").parse::<i32>().unwrap() {
            invalids.push(isbn.to_string());
        }
    }

    let mut results: Vec<String> = Vec::new();
    results.push(format!("{} invalid:", invalids.len()));
    results.extend(invalids);

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}
