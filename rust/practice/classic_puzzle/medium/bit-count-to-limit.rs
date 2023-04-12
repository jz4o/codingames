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

    let binary_length: usize = to_nbase_str(n + 1, 2).len();

    let mut result: i64 = 0;
    for i in 1..binary_length as u32 + 1 {
        let div: i64 = (n + 1) as i64 / 2i64.pow(i);
        let mod_num: i64 = (n + 1) as i64 % 2i64.pow(i);

        result += div * 2i64.pow(i - 1) + *[mod_num - 2i64.pow(i - 1), 0].iter().max().unwrap()
    }

    // println!("Number of 1s");
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
