use std::{io, cmp::Reverse};

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
    let r_1 = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut result: &str = "NO";
    for i in (1..(r_1 - 1)).rev() {
        if i + sum_each_digits(i) == r_1 {
            result = "YES";
            break;
        }
    }

    // println!("YES|NO");
    println!("{result}");
}

fn sum_each_digits(num: i32) -> i32 {
    let mut result: i32 = 0;
    for d in num.to_string().chars() {
        result += d.to_string().parse::<i32>().unwrap();
    }

    return result;
}
