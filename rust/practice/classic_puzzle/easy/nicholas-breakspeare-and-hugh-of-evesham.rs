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
    let mut numbers: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let x = input_line.trim().to_string();
        numbers.push(x);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let results: Vec<String> = numbers.iter().map(|number| how_to_read(number.to_string())).collect();

    // println!("cardinal");
    for result in results {
        println!("{result}");
    }
}

fn how_to_read(number: String) -> String {
    if number.starts_with("-") {
        return format!("negative {}", how_to_read(number[1..].to_string()));
    }

    if number.len() >= 4 {
        let over_thousand_unit_names: Vec<&str> = vec!["", "thousand", "million", "billion", "trillion", "quadrillion", "quintillion"];

        let number_size: usize = number.len();
        let mut unit_number_size: usize = number_size % 3;
        if unit_number_size == 0 {
            unit_number_size = 3;
        }
        let mod_number_size: usize = number_size - unit_number_size;

        let unit_number: &str = &number[..unit_number_size];
        let mod_number: &str = &number[unit_number_size..];

        let mut result: String = "".to_string();
        result += &format!("{} {}", how_to_read(unit_number.to_string()), over_thousand_unit_names[mod_number_size / 3]);
        if !Regex::new(r"^0+$").unwrap().is_match(mod_number) {
            result += &format!(" {}", how_to_read(mod_number.to_string()));
        }

        return result;
    }

    let number: usize = number.parse::<usize>().unwrap();

    let mut result: String = "".to_string();
    if 100 <= number {
        let hundred_unit: usize = number / 100;
        let mod_unit: usize = number % 100;

        if hundred_unit != 0 {
            result += &format!("{} hundred", how_to_read(hundred_unit.to_string()));
        }
        if mod_unit != 0 {
            result += &format!(" {}", how_to_read(mod_unit.to_string()));
        }
    } else if 20 <= number {
        let ten_unit_names: Vec<&str> = vec!["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"];

        let ten_unit: usize = number / 10;
        let mod_unit: usize = number % 10;

        if ten_unit != 0 {
            result += ten_unit_names[ten_unit];
        }
        if mod_unit != 0 {
            result += &format!("-{}", how_to_read(mod_unit.to_string()));
        }
    } else {
        let under_twenty_names: Vec<&str> = vec![
            "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
            "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
        ];

        result = under_twenty_names[number].to_string();
    }

    return result.trim().to_string();
}
