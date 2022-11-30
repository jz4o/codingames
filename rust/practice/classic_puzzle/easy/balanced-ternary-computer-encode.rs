use std::io;

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

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    const BASE_NUM: i32 = 3;

    let reverse_base3_n: Vec<String> = to_nbase_str(n.abs(), BASE_NUM).chars().map(|c| c.to_string()).rev().collect();

    let mut reverse_results: Vec<i32> = Vec::new();
    for index in 0..reverse_base3_n.len() {
        let num: i32 = reverse_base3_n[index].parse::<i32>().unwrap();

        if reverse_results.len() <= index {
            reverse_results.push(0);
        }

        reverse_results[index] += num;
        if reverse_results[index] < BASE_NUM - 1 {
            continue;
        }

        reverse_results[index] -= BASE_NUM;

        let next_index: usize = index + 1;
        if reverse_results.len() <= next_index {
            reverse_results.push(0);
        }

        reverse_results[next_index] += 1;
    }

    if n < 0 {
        reverse_results = reverse_results.iter().map(|result| result * -1).collect();
    }

    let result: String = reverse_results.iter().rev().map(|&r| if r < 0 {"T".to_string()} else {r.to_string()}).collect::<Vec<String>>().join("");

    // println!("42");
    println!("{result}");
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
