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
    let n = parse_input!(input_line, i32);
    let mut lines: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut joined_lines: String = lines.join("\n");

    let mut choice_count = 0;
    for capture in Regex::new(r"\((.|\s)*?\)").unwrap().captures_iter(&joined_lines.to_string()) {
        let choice_text: &str = &capture[0];

        let choices: Vec<&str> = choice_text[1..choice_text.len() - 1].split("|").collect();
        let choiced: &str = &choices[choice_count % choices.len()];

        choice_count += 1;

        joined_lines = joined_lines.replacen(choice_text, choiced, 1);
    }

    let results = joined_lines.split("\n");

    // println!("42");
    for result in results {
        println!("{result}");
    }
}
