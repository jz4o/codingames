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
    let mut expressions: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let expression = input_line.trim_matches('\n').to_string();
        expressions.push(expression);
    }
    let mut results: Vec<String> = Vec::new();
    for i in 0..n as usize {

        // Write an answer using println!("message...");
        // To debug: eprintln!("Debug message...");

        let expression: &str = expressions[i].as_str();

        let bracket_chars: Vec<char> = Regex::new(r"[()\[\]{}<>]")
            .unwrap()
            .find_iter(expression)
            .map(|bracket| bracket.as_str().to_string())
            .collect::<Vec<String>>()
            .join("")
            .replace("(", ")")
            .replace("[", "]")
            .replace("{", "}")
            .replace("<", ">")
            .chars()
            .collect();

        let mut brackets: Vec<char> = Vec::new();
        for bracket_char in bracket_chars.iter() {
            if brackets.last().unwrap_or(&' ') == bracket_char {
                brackets.pop();
            } else {
                brackets.push(*bracket_char);
            }
        }

        let result: String = brackets.is_empty().to_string();

        // println!("true");
        results.push(result);
    }

    for result in results {
        println!("{result}");
    }
}
