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

    let mut result: i64 = 0;
    let mut side_length: i64 = n as i64;
    while side_length > 0 {
        let base: i64 = (n as i64).pow(2) - (side_length).pow(2) + 1;

        result += if side_length <= 1 {
            base
        } else {
            (0i64..4i64).map(|i| i * (side_length - 1) + base).sum()
        };

        side_length -= 2;
    }

    // println!("answer");
    println!("{result}");
}
