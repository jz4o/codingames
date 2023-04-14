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
    let encrypt = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let kind_of_first_sequence: [&str; 2] = ["0", "00"];

    let encrypts: Vec::<&str> = encrypt.split_whitespace().collect();

    let mut invalid_flag: bool = false;
    let mut binaries: String = "".to_string();
    if encrypts.len() % 2 != 0 {
        invalid_flag = true;
    } else {
        for i in (0..encrypts.len()).step_by(2) {
            let binary: &str = encrypts[i];
            let count: &str = encrypts[i + 1];

            if !kind_of_first_sequence.contains(&binary) {
                invalid_flag = true;
                break;
            }

            binaries += &(if binary == "0" { "1" } else { "0" }).repeat(count.len());
        }
    }

    let mut results: Vec<String> = Vec::new();
    if invalid_flag || binaries.len() % 7 != 0 {
        results.push("INVALID".to_string());
    } else {
        let result: String = Regex::new(".{7}")
            .unwrap()
            .find_iter(&binaries)
            .map(|binary| (to_nbase_int(binary.as_str().to_string(), 2) as u8 as char).to_string())
            .collect::<Vec<String>>()
            .join("");

        results.push(result);
    }

    // println!("INVALID");
    for result in results {
        println!("{result}");
    }
}

fn to_nbase_int(str: String, base: i32) -> i32 {
    return str
        .chars()
        .rev()
        .enumerate()
        .map(|(i, digit)| digit.to_digit(base as u32).unwrap() as i32 * base.pow(i as u32))
        .sum::<i32>();
}
