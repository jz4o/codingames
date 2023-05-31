use std::io;

use itertools::Itertools;

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
    let alignment = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut texts: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let text = input_line.trim_matches('\n').to_string();
        texts.push(text);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let width: usize = texts.iter().map(|text| text.len()).max().unwrap();

    let results: Vec<String> = match alignment.as_str() {
        "LEFT" => texts,
        "RIGHT" => texts.iter().map(|text| align_right(text.to_string(), width)).collect(),
        "CENTER" => texts.iter().map(|text| align_center(text.to_string(), width).trim_end().to_string()).collect(),
        "JUSTIFY" => texts.iter().map(|text| align_justify(text.to_string(), width)).collect(),
        _ => Vec::new()
    };

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

fn align_right(value: String, length: usize) -> String {
    if length <= value.len() {
        return value;
    }

    let space_length: usize = length - value.len();
    let space: String = " ".repeat(space_length);

    return format!("{space}{value}");
}

fn align_center(value: String, length: usize) -> String {
    if length <= value.len() {
        return value;
    }

    let space_length: usize = length - value.len();
    let left_space: String = " ".repeat(space_length / 2);
    let right_space: String = " ".repeat(space_length - left_space.len());

    return format!("{left_space}{value}{right_space}");
}

fn align_justify(value: String, length: usize) -> String {
    if length <= value.len() {
        return value;
    }

    let words: Vec<&str> = value.split_whitespace().collect();
    let space_size: usize = length - words.join("").len();
    let each_space_size: usize = space_size / (words.len() - 1);
    let mut space_sizes: Vec<usize> = (1..words.len()).map(|i| (each_space_size * i) - (each_space_size * (i - 1))).collect();
    space_sizes.push(0);

    let result: String = words
        .iter()
        .zip(space_sizes)
        .map(|(word, space_size)| format!("{}{}", word, " ".repeat(space_size)))
        .join("");

    return result;
}
