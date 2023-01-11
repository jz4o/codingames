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
    let n = parse_input!(input_line, i32);
    let mut assignments: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let assignment = input_line.trim_matches('\n').to_string();
        assignments.push(assignment);
    }
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let x = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let capture_assignment_regex: Regex = Regex::new(r"([A-Z]+)\[([\-\d]+)\.\.([\-\d]+)\]\s=\s([\-\s\d]+)").unwrap();
    let mut assignment_hash: HashMap<String, HashMap<String, String>> = HashMap::new();
    for assignment in assignments.iter() {
        let captures: regex::Captures = capture_assignment_regex.captures(assignment).unwrap();

        let array_name: String = captures.get(1).unwrap().as_str().to_string();
        let range_begin: i32 = captures.get(2).unwrap().as_str().to_string().parse::<i32>().unwrap();
        let range_end: i32 = captures.get(3).unwrap().as_str().to_string().parse::<i32>().unwrap();
        let values: Vec<String> = captures.get(4).unwrap().as_str().split_whitespace().map(|s| s.to_string()).collect();

        if !assignment_hash.contains_key(&array_name) {
            assignment_hash.insert(array_name.to_string(), HashMap::new());
        }

        let mut target_hash: &mut HashMap<String, String> = assignment_hash.get_mut(&array_name).unwrap();
        for (index, value) in (range_begin..range_end + 1).zip(values) {
            target_hash.insert(index.to_string(), value);
        }
    }

    let capture_result_regex: Regex = Regex::new(r"([A-Z]+)\[([\-\d]+)\]").unwrap();
    let mut result: String = x.to_string();
    while capture_result_regex.captures(&result).is_some() {
        let captures: regex::Captures = capture_result_regex.captures(&result).unwrap();
        let array_name: String = captures.get(1).unwrap().as_str().to_string();
        let key: String = captures.get(2).unwrap().as_str().to_string();

        result = result.replace(&format!("{array_name}[{key}]"), &assignment_hash[&array_name][&key]);
    }

    // println!("0");
    println!("{result}");
}
