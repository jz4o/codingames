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
    let a = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let b = parse_input!(input_line, i32);
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let m = parse_input!(input_line, i32);

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    // D[0] = 0
    let mut d: i32 = 0;

    let mut u: i32 = 0;
    let mut r: i32 = 0;
    let mut step: i32 = 0;
    loop {
        step += 1;

        d = (a * d + b) % m;

        match d % 4 {
            0 => u += 1,
            1 => u -= 1,
            2 => r -= 1,
            3 => r += 1,
            _ => ()
        }

        if u == 0 && r == 0 {
            break;
        }
    }

    let result: String = step.to_string();

    // println!("result");
    println!("{result}");
}
