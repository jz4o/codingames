use std::io;

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
    let expression = input_line.trim().to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let BRACKETS: HashMap<String, String> = HashMap::from([
        ("(".to_string(), ")".to_string()),
        ("[".to_string(), "]".to_string()),
        ("{".to_string(), "}".to_string())
    ]);

    let expression_brackets: Vec<String> = Regex::new(r"[()\[\]{}]").unwrap().captures_iter(&expression).map(|c| c.get(0).unwrap().as_str().to_string()).collect();

    let mut collect_flag: bool = true;
    let mut chars: Vec<String> = Vec::new();
    for bracket in expression_brackets {
        if BRACKETS.contains_key(&bracket) {
            chars.push(bracket);
            continue;
        }

        if chars.len() > 0 && BRACKETS.contains_key(&chars[chars.len() - 1]) && BRACKETS[&chars.pop().unwrap()] == bracket {
            continue;
        }

        collect_flag = false;
        break;
    }

    if chars.len() > 0 {
        collect_flag = false;
    }

    let result: String = collect_flag.to_string();

    // println!("true/false");
    println!("{result}");
}
