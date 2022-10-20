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
    let r_1 = parse_input!(input_line, i64);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let r_2 = parse_input!(input_line, i64);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut temp_r_1: i64 = r_1;
    let mut temp_r_2: i64 = r_2;

    while temp_r_1 != temp_r_2 {
        if temp_r_1 < temp_r_2 {
            temp_r_1 += sum_each_digits(temp_r_1);
        } else {
            temp_r_2 += sum_each_digits(temp_r_2);
        }
    }

    let result: i64 = temp_r_1;

    // println!("42");
    println!("{result}");
}

fn sum_each_digits(num: i64) -> i64 {
    let mut result: i64 = 0;
    for d in num.to_string().chars() {
        result += d.to_string().parse::<i64>().unwrap();
    }

    return result;
}
