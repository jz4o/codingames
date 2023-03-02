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
    let ip = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut temp_ip: String = ip.to_string();

    let mut ommit_vec: Vec<&str> = Regex::new("(0000(:0000)+)")
        .unwrap()
        .captures_iter(&temp_ip)
        .map(|capture| capture.get(0).unwrap().as_str())
        .collect();
    if !ommit_vec.is_empty() {
        ommit_vec.sort_by(|a, b| b.len().partial_cmp(&a.len()).unwrap());
        let longest_ommit: &str = ommit_vec.first().unwrap();

        temp_ip = temp_ip.replacen(longest_ommit, ":", 1).replace(":::", "::");
    }

    temp_ip = Regex::new("^0+").unwrap().replace_all(&temp_ip, "0").to_string();
    temp_ip = Regex::new(":0+").unwrap().replace_all(&temp_ip, ":0").to_string();
    temp_ip = Regex::new(":0([1-9a-f])").unwrap().replace_all(&temp_ip, ":$1").to_string();

    let result: String = temp_ip.to_string();

    // println!("output");
    println!("{result}");
}
