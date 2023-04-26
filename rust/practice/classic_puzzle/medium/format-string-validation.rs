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
    let text = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let format = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut temp_format: String = format.to_string();

    temp_format = format.replace("\\", "\\\\");
    for special_char in "^*(){}[]$".chars() {
        temp_format = temp_format.replace(special_char, &format!("\\{special_char}"));
    }

    temp_format = temp_format.replace("?", ".");
    temp_format = temp_format.replace("~", ".*");

    let result: &str = if Regex::new(&temp_format).unwrap().is_match(&text) {
        "MATCH"
    } else {
        "FAIL"
    };

    // println!("MATCH OR FAIL");
    println!("{result}");
}
