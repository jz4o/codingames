use std::io;

use std::collections::HashMap;

use itertools::Itertools;

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
    let x = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let y = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut replace_hash: HashMap<char, char> = HashMap::new();
    let mut replace_vec: Vec<String> = Vec::new();
    for (xi, yi) in x.chars().zip(y.chars()) {
        if xi == yi {
            continue;
        }

        if !replace_hash.contains_key(&xi) {
            replace_vec.push(format!("{xi}->{yi}"));
        }
        replace_hash.insert(xi, yi);
    }

    let replaced_str: String = x
        .chars()
        .map(|xi|
            if replace_hash.contains_key(&xi) {
                replace_hash[&xi]
            } else {
                xi
            }
        )
        .join("");

    let results: Vec<String> = if x == y {
        vec!["NONE".to_string()]
    } else if replaced_str == y {
        replace_vec
    } else {
        vec!["CAN'T".to_string()]
    };

    // println!("anwser");
    for result in results {
        println!("{result}");
    }
}
