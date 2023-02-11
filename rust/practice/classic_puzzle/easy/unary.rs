use std::io;

use itertools::Itertools;
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
    let message = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut binary: String = message
        .chars()
        .map(|c| format!("{:0>7}", to_nbase_str(c as i32, 2)))
        .join("");

    let mut matched_vec: Vec<String> = Vec::new();
    while binary.len() > 0 {
        let b: char = binary.chars().nth(0).unwrap();
        let matched: &str = Regex::new(&format!("^{b}+")).unwrap().find(&binary).unwrap().as_str();

        matched_vec.push(matched.to_string());

        binary = binary.replacen(matched, "", 1);
    }

    let group_counts: Vec<usize> = matched_vec
        .iter()
        .map(|matched| [2 - matched.chars().nth(0).unwrap().to_string().parse::<usize>().unwrap(), matched.len()])
        .flatten()
        .collect();

    let result: String = group_counts.iter().map(|count| "0".repeat(*count)).join(" ");

    // println!("answer");
    println!("{result}");
}

fn to_nbase_str(digit: i32, base: i32) -> String {
    let mut result: String = "".to_string();

    let mut d: i32 = digit;
    while d > 0 {
        let mod_num: u32 = (d % base) as u32;

        result = std::char::from_digit(mod_num, base as u32).unwrap().to_string() + &result;
        d = d / base;
    }

    if result.len() == 0 {
        result = "0".to_string();
    }

    return result;
}
