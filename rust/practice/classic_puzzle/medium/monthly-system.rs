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
    let n = parse_input!(input_line, i32);
    let mut ms: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let m = input_line.trim_matches('\n').to_string();
        ms.push(m);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let month_base_number: i32 = ms
        .iter()
        .map(|m| MonthBaseNumber::to_i(m.to_string()))
        .sum();
    let result: String = MonthBaseNumber::from_i(month_base_number);

    // println!("answer");
    println!("{result}");
}

struct MonthBaseNumber {
}

impl MonthBaseNumber {
    fn to_i(month_base_number: String) -> i32 {
        let months: Vec<&str> = vec!["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

        let mut result: i32 = 0;

        let month_regex: Regex = Regex::new(".{3}").unwrap();
        let mut month_vec: Vec<&str> = month_regex
            .find_iter(&month_base_number)
            .map(|m| m.as_str())
            .collect();
        month_vec.reverse();

        for (index, month) in month_vec.iter().enumerate() {
            let base_number: usize = months.len().pow(index as u32);
            let digit: usize = months.iter().position(|m| m == month).unwrap();

            result += (digit * base_number) as i32;
        }

        return result;
    }

    fn from_i(num: i32) -> String {
        let months: Vec<&str> = vec!["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

        let result: String = to_nbase_str(num, months.len() as i32)
            .chars()
            .map(|c| months[to_nbase_int(c.to_string(), months.len() as i32) as usize])
            .collect::<Vec<&str>>()
            .join("");

        return result;
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
