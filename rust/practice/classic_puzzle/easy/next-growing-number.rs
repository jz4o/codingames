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
    let n = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut digits: Vec<i64> = (n.parse::<i64>().unwrap() + 1).to_string().chars().map(|c| c.to_string().parse::<i64>().unwrap()).collect();

    let mut increment_index: Option<usize> = None;
    for index in (0..digits.len() - 1) {
        if digits[index] > digits[index + 1] {
            increment_index = Some(index);
            break;
        }
    }

    let increment_number: i64 = digits[increment_index.unwrap()];
    for index in increment_index.unwrap() + 1..digits.len() {
        digits[index] = increment_number;
    }

    let result: String = digits.iter().map(|d| d.to_string()).collect::<Vec<String>>().join("");

    // println!("answer");
    println!("{result}");
}
