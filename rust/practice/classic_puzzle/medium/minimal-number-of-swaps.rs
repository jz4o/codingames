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

    let mut l_index: i32 = -1;
    let mut r_index: i32 = xs.len() as i32;
    let mut turn: i32 = 0;
    while l_index < r_index {
        l_index += 1;
        while l_index < xs.len() as i32 && xs[l_index as usize] != 0 {
            l_index += 1;
        }

        r_index -= 1;
        while r_index >= 0 && xs[r_index as usize] != 1 {
            r_index -= 1;
        }

        turn += 1;
    }

    let result: String = (turn - 1).to_string();

    // println!("answer");
    println!("{result}");
}
