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
    let s = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut temp_s: String = s.to_string();
    loop {
        if !is_encodable(temp_s.to_string()) {
            break;
        }

        temp_s = encode(temp_s.to_string()).unwrap();
    }

    let result: String = temp_s.to_string();

    // println!("answer");
    println!("{result}");
}

fn is_encodable(text: String) -> bool {
    let encoded_text: Option<String> = encode(text.to_string());

    return encoded_text.is_some() && encoded_text.unwrap() != text.to_string();
}

fn encode(text: String) -> Option<String> {
    if text.len() % 2 != 0 {
        return None;
    }

    let mut result: String = "".to_string();
    for i in (0..text.len()).step_by(2) {
        let count: usize = text.chars().nth(i).unwrap().to_string().parse::<usize>().unwrap();
        let value: String = text.chars().nth(i + 1).unwrap().to_string();

        result += &value.repeat(count);
    }

    return if is_decodable(result.to_string(), text.to_string()) { Some(result) } else { None };
}

fn is_decodable(encoded_text: String, original_text: String) -> bool {
    let mut temp_encoded_text: String = encoded_text.to_string();
    let mut result: String = "".to_string();
    while temp_encoded_text.len() > 0 {
        let c: char = temp_encoded_text.chars().nth(0).unwrap();
        let match_length: usize = Regex::new(&format!("{c}+")).unwrap().find(&temp_encoded_text).unwrap().as_str().len();

        temp_encoded_text = temp_encoded_text[match_length..].to_string();
        result += &format!("{match_length}{c}");
    }

    return result == original_text;
}
