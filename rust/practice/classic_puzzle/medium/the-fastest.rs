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
    let mut ts: Vec<String> = vec![Default::default(); n as usize];
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let t = input_line.trim().to_string();

        ts[i] = t;
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let result: &String = ts.iter().min().unwrap();

    // println!("answer");
    println!("{}", result)
}
