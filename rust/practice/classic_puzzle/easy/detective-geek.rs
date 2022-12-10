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
    let time = input_line.trim_matches('\n').to_string();
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let address = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let months: Vec<&str> = vec!["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"];

    let time_int: String = format!("{:0>4}", i32::from_str_radix(&time.replace("*", "0").replace("#", "1"), 2).unwrap().to_string());
    let formatted_time: String = time_int[..2].to_string() + ":" + &time_int[2..];

    let mut decrypted_address: String = "".to_string();
    for word in address.split_whitespace() {
        let mut month_chars: String = "".to_string();
        for month in Regex::new(".{3}").unwrap().find_iter(word) {
            let month_index: usize = months.iter().position(|m| m == &month.as_str()).unwrap();
            month_chars += &to_nbase_str(month_index as i32, months.len() as i32);
        }

        decrypted_address += &(to_nbase_int(month_chars.to_string(), months.len() as i32) as u8 as char).to_string();
    }

    let results: Vec<String> = vec![formatted_time, decrypted_address];

    // println!("answer");
    for result in results {
        println!("{result}");
    }
}

fn to_nbase_str(digit: i32, base: i32) -> String {
    let mut result: String = "".to_string();

    let mut d: i32 = digit;
    while d > 0 {
        let mod_num: u32 = (d % base) as u32;

        result = std::char::from_digit(mod_num, base as u32).unwrap().to_string() + &result;
        d = d / base;
    }

    if result.len() == 0 {
        result = "0".to_string();
    }

    return result;
}

fn to_nbase_int(str: String, base: i32) -> i32 {
    return str
        .chars()
        .rev()
        .enumerate()
        .map(|(i, digit)| digit.to_digit(base as u32).unwrap() as i32 * base.pow(i as u32))
        .sum::<i32>();
}
