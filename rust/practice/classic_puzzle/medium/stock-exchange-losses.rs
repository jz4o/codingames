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
    let mut inputs = String::new();
    io::stdin().read_line(&mut inputs).unwrap();
    let mut vs: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let v = parse_input!(i, i32);
        vs.push(v);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut max_value: i32 = 0;
    let mut max_diff: i32 = 0;
    for (index, v) in vs[..vs.len() - 1].iter().enumerate() {
        if *v <= max_value {
            continue;
        }

        max_value = *v;

        let diff: i32 = vs[index + 1..].iter().min().unwrap() - v;
        max_diff = *[diff, max_diff].iter().min().unwrap();
    }

    let result: String = format!("{max_diff}");

    // println!("answer");
    println!("{result}");
}
