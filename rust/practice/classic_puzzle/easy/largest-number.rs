use std::io;

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
    let number = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let d = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let digits: Vec<i32> = number.to_string().chars().map(|c| c.to_string().parse::<i32>().unwrap()).collect();

    let mut result: i32 = 0;
    for size in ((digits.len() - 2)..(digits.len() + 1)).rev() {
        let combinations = digits.iter().combinations(size);

        let mut numbers: Vec<i32> = Vec::new();
        for combination in combinations {
            let number: i32 = combination.iter().map(|combi| combi.to_string()).join("").parse::<i32>().unwrap();
            if !numbers.contains(&number) && number % d == 0 {
                numbers.push(number);
            }
        }

        if numbers.len() > 0 {
            result = *numbers.iter().max().unwrap();
            break;
        }
    }

    // println!("answer");
    println!("{result}");
}
