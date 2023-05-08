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
    let n = parse_input!(input_line, i32);
    let mut cgscontents: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let cgscontent = input_line.trim_matches('\n').to_string();
        cgscontents.push(cgscontent);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut variables: HashMap<String, char> = HashMap::new();
    let mut replace_char: char = 'a';
    let mut characters: Vec<String> = Vec::new();

    let mut replaced_cgscontents: Vec<String> = Vec::new();
    for cgscontent in cgscontents.iter() {
        let mut replaced_cgscontent: String = cgscontent.to_string();

        // replace variable part
        for m in Regex::new(r"\$.+?\$").unwrap().find_iter(&replaced_cgscontent.to_string()) {
            let matched_variable: String = m.as_str().to_string();

            if !variables.contains_key(&matched_variable) {
                variables.insert(matched_variable.to_string(), replace_char);
                replace_char = (replace_char as u8 + 1) as char;
            }

            replaced_cgscontent = replaced_cgscontent.replace(&matched_variable.to_string(), &format!("${}$", variables[&matched_variable]));
        }

        // replace character part
        for m in Regex::new(r"'.+?'").unwrap().find_iter(&replaced_cgscontent.to_string()) {
            let matched_character: String = m.as_str().to_string();

            replaced_cgscontent = replaced_cgscontent.replace(&matched_character.to_string(), &format!("${}$", characters.len()));
            characters.push(matched_character);
        }

        replaced_cgscontent = replaced_cgscontent.replace(" ", "");
        replaced_cgscontents.push(replaced_cgscontent);
    }

    // restore character part
    let mut result: String = replaced_cgscontents.iter().join("");
    for (index, character) in characters.iter().enumerate() {
        result = result.replace(&format!("${index}$"), &character.to_string());
    }

    // println!("minified all CGS content");
    println!("{result}");
}
