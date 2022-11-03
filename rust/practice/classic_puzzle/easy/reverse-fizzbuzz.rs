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
    let mut lines: Vec<String> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_matches('\n').to_string();
        lines.push(line);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let re = Regex::new(r"^\d+$").unwrap();
    let mut number_indexes: Vec<usize> = Vec::new();
    for index in 0..lines.len() {
        let line: &str = &lines[index];
        if re.is_match(line) {
            number_indexes.push(index);
        }
    }

    let base_number: i32 = if number_indexes.len() == 0 {
        1
    } else {
        lines[number_indexes[0]].parse::<i32>().unwrap() - number_indexes[0] as i32
    };

    let mut fizz_buzz_numbers: HashMap<String, Vec::<i32>> = HashMap::from([
        ("fizz".to_string(), Vec::new()),
        ("buzz".to_string(), Vec::new())
    ]);
    for index in 0..lines.len() {
        let line: &str = &lines[index];

        if line.contains("Fizz") {
            fizz_buzz_numbers.get_mut("fizz").unwrap().push(base_number + index as i32);
        }

        if line.contains("Buzz") {
            fizz_buzz_numbers.get_mut("buzz").unwrap().push(base_number + index as i32);
        }
    }

    let fizz: i32 = gcd_vec(fizz_buzz_numbers.get("fizz").unwrap().to_vec());
    let buzz: i32 = gcd_vec(fizz_buzz_numbers.get("buzz").unwrap().to_vec());

    let result: String = format!("{fizz} {buzz}");

    // println!("fizz buzz");
    println!("{result}");
}

fn gcd_vec(numbers: Vec<i32>) -> i32 {
    let mut result: i32 = numbers[0];
    for number in numbers {
        result = gcd(result, number);
    }

    return result;
}

fn gcd(mut a: i32, mut b: i32) -> i32 {
    let (min, max): (i32, i32) = if a <= b {
        (a, b)
    } else {
        (b, a)
    };

    if min == 0 {
        return max;
    }

    return gcd(min, max % min);
}
