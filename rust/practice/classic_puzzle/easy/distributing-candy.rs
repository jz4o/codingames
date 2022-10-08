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
    let n = parse_input!(inputs[0], i32);
    let m = parse_input!(inputs[1], i32);
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut xs: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let x = parse_input!(i, i32);
        xs.push(x);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    xs.sort();

    let mut diffs: Vec<i32> = Vec::new();
    for i in 0..xs.len() - m as usize + 1 {
        diffs.push(xs[i + m as usize - 1] - xs[i]);
    }

    let result: &i32 = diffs.iter().min().unwrap();

    // println!("answer");
    println!("{result}");
}
