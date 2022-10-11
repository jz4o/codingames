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
    let mut xs: Vec<i32> = Vec::new();
    for i in inputs.split_whitespace() {
        let x = parse_input!(i, i32);
        xs.push(x);
    }

    // Write an answer using println!("message...");
    // To debug: eprintln!("Debug message...");

    let mut total_cost: i32 = 0;
    while xs.len() >= 2 {
        xs.sort();

        let first_x: i32 = xs.remove(0);
        let second_x: i32 = xs.remove(0);

        let cost: i32 = first_x + second_x;

        total_cost += cost;

        xs.push(cost)
    }

    let result: i32 = total_cost;

    // println!("0");
    println!("{result}");
}
