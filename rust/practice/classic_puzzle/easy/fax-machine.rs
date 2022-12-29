use std::io;

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
    let w = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let h = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let t = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let word_counts: Vec<i32> = t.split_whitespace().map(|s| s.parse::<i32>().unwrap()).collect();
    let mut word: String = "".to_string();
    for (index, word_count) in word_counts.iter().enumerate() {
        word += &(if index % 2 == 0 {"*"} else {" "}).repeat(*word_count as usize);
    }

    let results = Regex::new(&format!(".{{{w}}}"))
        .unwrap()
        .find_iter(&word)
        .map(|matched| format!("|{}|", matched.as_str()))
        .collect::<Vec<String>>();

    // println!("|********|");
    // println!("|**      |");
    // println!("|    ****|");
    for result in results {
        println!("{result}");
    }
}
