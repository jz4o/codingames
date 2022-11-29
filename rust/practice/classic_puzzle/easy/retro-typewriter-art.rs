use std::io;

use std::collections::HashMap;
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
    let t = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let abbreviations: HashMap<String, String> = HashMap::from([
        ("sp".to_string(), " ".to_string()),
        ("bS".to_string(), "\\".to_string()),
        ("sQ".to_string(), "'".to_string()),
        ("nl".to_string(), "\n".to_string())
    ]);

    let mut temp_t: String = t.replace("nl", "1nl");

    let mut chars: Vec<String> = Vec::new();
    let regex: Regex = Regex::new(r"^(\d+)(.+?)$").unwrap();
    for chunk in temp_t.split_whitespace() {
        let matched = regex.captures(chunk).unwrap();
        let count: usize = matched.get(1).unwrap().as_str().parse::<usize>().unwrap();
        let chr: String = matched.get(2).unwrap().as_str().to_string();

        chars.extend(vec![abbreviations.get(&chr).unwrap_or(&chr).to_string();count]);
    }

    let result: String = chars.join("");

    // println!("answer");
    println!("{result}");
}
