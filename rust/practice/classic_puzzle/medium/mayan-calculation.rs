use std::io;

use itertools::Itertools;
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
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let l = parse_input!(inputs[0], i32);
    let h = parse_input!(inputs[1], i32);
    let mut numerals: Vec<String> = Vec::new();
    for i in 0..h as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let numeral = input_line.trim().to_string();
        numerals.push(numeral);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let s1 = parse_input!(input_line, i32);
    let mut num_1lines: Vec<String> = Vec::new();
    for i in 0..s1 as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let num_1line = input_line.trim().to_string();
        num_1lines.push(num_1line);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let s2 = parse_input!(input_line, i32);
    let mut num_2lines: Vec<String> = Vec::new();
    for i in 0..s2 as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let num_2line = input_line.trim().to_string();
        num_2lines.push(num_2line);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let operation = input_line.trim().to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const MAYAN_BASE: i64 = 20;

    let mut ascii_mayans: Vec<String> = (0..MAYAN_BASE).map(|_| "".to_string()).collect();
    for numeral in numerals.iter() {
        for (index, mayan) in Regex::new(&format!(".{{{l}}}")).unwrap().find_iter(numeral).enumerate() {
            ascii_mayans[index] += mayan.as_str();
        }
    }

    let mayan_1: String = num_1lines.iter().join("");
    let mayan_2: String = num_2lines.iter().join("");

    let mut mayan_to_int: HashMap<String, i64> = HashMap::new();
    for (mayan, num) in ascii_mayans.iter().zip(0..ascii_mayans.len() as i64) {
        mayan_to_int.insert(mayan.to_string(), num);
    }

    let mayan_length: i32 = h * l;

    let mayan_1_elements: Vec<String> = Regex::new(&format!(".{{{mayan_length}}}"))
        .unwrap()
        .find_iter(&mayan_1)
        .map(|m| m.as_str().to_string())
        .collect();
    let num1: i64 = mayan_1_elements
        .iter()
        .rev()
        .enumerate().map(|(index, mayan)| mayan_to_int[mayan] * MAYAN_BASE.pow(index as u32))
        .sum();

    let mayan_2_elements: Vec<String> = Regex::new(&format!(".{{{mayan_length}}}"))
        .unwrap()
        .find_iter(&mayan_2)
        .map(|m| m.as_str().to_string())
        .collect();
    let num2: i64 = mayan_2_elements
        .iter()
        .rev()
        .enumerate().map(|(index, mayan)| mayan_to_int[mayan] * MAYAN_BASE.pow(index as u32))
        .sum();

    let mut result_num: i64 = match operation.as_str() {
        "+" => num1 + num2,
        "-" => num1 - num2,
        "*" => num1 * num2,
        "/" => num1 / num2,
        _ => 0
    };

    let mut result_str: String = "".to_string();
    loop {
        let ascii_mayan: String = ascii_mayans[(result_num % MAYAN_BASE) as usize].to_string();
        result_str = format!("{ascii_mayan}{result_str}");
        result_num /= MAYAN_BASE as i64;

        if result_num <= 0 {
            break;
        }
    }

    let results: Vec<String> = Regex::new(&format!(".{{{l}}}"))
        .unwrap()
        .find_iter(&result_str)
        .map(|m| m.as_str().to_string())
        .collect();

    // println!("result");
    for result in results {
        println!("{result}");
    }
}
