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

    let cube_count: i32 = n.pow(3);
    let invisible_cube_count: i32 = [n - 2, 0].iter().max().unwrap().pow(3);

    let result: String = (cube_count - invisible_cube_count).to_string();

    // println!("answer");
    println!("{result}");
}
