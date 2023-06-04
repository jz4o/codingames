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
    let inputs = input_line.split(" ").collect::<Vec<_>>();
    let start = parse_input!(inputs[0], i64);
    let n = parse_input!(inputs[1], i64);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut result: usize = start as usize;
    for _ in 0..n {
        let temp: usize = format!("{:b}", result).replace("0", "zero").replace("1", "one").len();
        if result == temp {
            break;
        }

        result = temp;
    }

    // println!("42");
    println!("{result}");
}
