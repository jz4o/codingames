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
    let mut pis: Vec<i32> = Vec::new();
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let pi = parse_input!(input_line, i32);
        pis.push(pi);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    pis.sort();

    let mut result: i32 = 10000000;
    for index in 0..(pis.len() - 1) {
        let diff: i32 = pis[index + 1] - pis[index];
        if diff < result {
            result = diff;
        }
    }

    // println!("answer");
    println!("{result}");
}
