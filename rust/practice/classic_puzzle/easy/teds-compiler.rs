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
    let line = input_line.trim_matches('\n').to_string();

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut stack: i32 = 0;
    let mut prefix_size: usize = 0;
    for (step, c) in (1..line.len() + 1).zip(line.chars()) {
        stack += if c == '<' { 1 } else { -1 };

        if stack == 0 {
            prefix_size = step;
        }

        if stack < 0 {
            break;
        }
    }

    let result: usize = prefix_size;

    // println!("answer");
    println!("{result}");
}
