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
    let intext = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let is_require_period: bool = intext.ends_with(".");

    let mut temp_intext: String = intext;

    temp_intext = temp_intext.replace(",", ", ");
    temp_intext = Regex::new("\\s+").unwrap().replace_all(&temp_intext, " ").to_string();

    let mut temp_intext_vec: Vec<String> = Vec::new();
    for line in temp_intext.split(".") {
        if line.len() == 0 {
            continue;
        }

        temp_intext_vec.push(capitalize(line.trim().to_string()));
    }
    temp_intext = temp_intext_vec.join(". ");

    temp_intext = temp_intext.replace(" ,", ",");
    temp_intext = Regex::new(",+").unwrap().replace_all(&temp_intext, ",").to_string();

    if is_require_period {
        temp_intext += ".";
    }

    let result: String = temp_intext;

    // println!("solution");
    println!("{result}");
}

fn capitalize(text: String) -> String {
    if text.len() == 0 {
        return "".to_string();
    }

    let mut result: String = "".to_string();
    result += &text.to_uppercase().chars().nth(0).unwrap().to_string();
    result += &text.to_lowercase()[1..];

    return result;
}
