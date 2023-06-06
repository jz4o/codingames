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
    let equality = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let numerals: Vec<char> = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".chars().collect();

    let (x, y, z): (&str, &str, &str) = Regex::new(r"[\dA-Z]+")
        .unwrap()
        .find_iter(&equality)
        .map(|m| m.as_str())
        .collect_tuple()
        .unwrap();

    let equality_chars: Vec<char>= equality.chars().collect();
    let max_numeral_index: usize = numerals.iter().rposition(|c| equality_chars.contains(c)).unwrap();
    let minimum_n: usize = max_numeral_index + 1;

    let result: usize = (minimum_n..numerals.len() + 1).find(|&i| {
        let nbase_x: usize = to_nbase_int(x.to_string(), i);
        let nbase_y: usize = to_nbase_int(y.to_string(), i);
        let nbase_z: usize = to_nbase_int(z.to_string(), i);

        nbase_x + nbase_y == nbase_z
    }).unwrap();

    // println!("answer");
    println!("{result}");
}

fn to_nbase_int(str: String, base: usize) -> usize {
    return str
        .chars()
        .rev()
        .enumerate()
        .map(|(i, digit)| digit.to_digit(base as u32).unwrap() as usize * base.pow(i as u32))
        .sum::<usize>();
}
