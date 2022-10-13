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
    let n = parse_input!(input_line, i32); // the number of temperatures to analyse
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut ts: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let t = parse_input!(i, i32);
        ts.push(t);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let negative_ts: Vec<i32> = ts.iter().filter(|&t| t < &0).map(|&t| t as i32).collect();
    let positive_ts: Vec<i32> = ts.iter().filter(|&t| t > &0).map(|&t| t as i32).collect();

    let result: i32;
    if n == 0 || ts.contains(&0) {
        result = 0;
    } else if negative_ts.len() == 0 {
        result = *positive_ts.iter().min().unwrap();
    } else if positive_ts.len() == 0 {
        result = *negative_ts.iter().max().unwrap();
    } else {
        let closest_zero_negative: i32 = *negative_ts.iter().max().unwrap();
        let closest_zero_positive: i32 = *positive_ts.iter().min().unwrap();

        result = if closest_zero_negative + closest_zero_positive <= 0 {
            closest_zero_positive
        } else {
            closest_zero_negative
        };
    }

    // println!("result");
    println!("{result}");
}
